"""Vim smoke/regression checks in temporary HOME and runtime directories."""
import json,os,shutil,subprocess,tempfile,unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
VIM=shutil.which('vim')
DEPS=Path(os.environ['DOTVIM_TEST_PLUGINS']).resolve() if os.environ.get('DOTVIM_TEST_PLUGINS') else None

class ConfigTests(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory(prefix='dot vim test ')
  self.base=Path(self.tmp.name).resolve();self.root=self.base/'configuration with spaces'
  shutil.copytree(ROOT,self.root,ignore=shutil.ignore_patterns('.git','__pycache__'))
  self.state=self.base/'state';self.home=self.base/'home';self.home.mkdir()
 def tearDown(self):self.tmp.cleanup()
 def run_vim(self,body,plugins=False,manager=False):
  if plugins or manager:
   if not DEPS:self.skipTest('Set DOTVIM_TEST_PLUGINS to pre-fetched official test repositories')
   (self.state/'autoload').mkdir(parents=True,exist_ok=True)
   shutil.copy2(DEPS/'vim-plug/plug.vim',self.state/'autoload/plug.vim')
   (self.state/'plugged').mkdir(exist_ok=True)
   for name in (['gruvbox','vim-airline','nerdtree','ctrlp.vim','vim-surround','vim-fugitive','vim-gitgutter'] if plugins else []):
    (self.state/'plugged'/name).symlink_to(DEPS/name,target_is_directory=True)
  # Data root comes from a per-checkout local override; no user config is loaded.
  (self.root/'local.vim').write_text('let g:dotvim_data_dir = '+json.dumps(str(self.state))+'\n')
  output=self.base/'errors.json';script=self.base/'assertions.vim'
  script.write_text(body+'\ncall writefile([json_encode(v:errors)], '+json.dumps(str(output))+')\nif !empty(v:errors) | cquit | endif\nqa!\n')
  env={**os.environ,'HOME':str(self.home),'XDG_CONFIG_HOME':str(self.home/'.config'),'DOTVIM_RESULT':str(self.base/'ran.txt')}
  result=subprocess.run([VIM,'-Nu',str(self.root/'vimrc'),'-U','NONE','-i','NONE','-n','-N','-es','-S',str(script)],cwd=self.base,env=env,capture_output=True,text=True,timeout=30)
  errors=json.loads(output.read_text()) if output.exists() else ['Vim did not finish assertions']
  self.assertEqual((result.returncode,errors),(0,[]),result.stdout+result.stderr+str(errors))
 def test_no_plugins_basic_editing(self):
  self.run_vim("call assert_equal('', v:errmsg)\ncall assert_equal(2, &laststatus)\ncall assert_equal(0, exists(':NERDTreeToggle'))\ncall assert_equal('', maparg('<Space>n', 'n'))\ncall assert_true(&hidden)\n")
 def test_reload_has_no_duplicate_autocmds_or_errors(self):
  self.run_vim("let first = execute('autocmd DotVimCursor')\nexecute 'source ' . fnameescape(g:dotvim_root . '/vimrc')\ncall assert_equal(first, execute('autocmd DotVimCursor'))\ncall assert_equal('', v:errmsg)\n")
 def test_language_options_are_local_and_reversible(self):
  self.run_vim("set filetype=yaml\ncall assert_equal(2, &shiftwidth)\ncall assert_equal(4, &g:shiftwidth)\nset filetype=python\ncall assert_equal(4, &shiftwidth)\nset filetype=go\ncall assert_false(&expandtab)\nset filetype=python\ncall assert_true(&expandtab)\nnew\ncall assert_equal(4, &shiftwidth)\n")
 def test_all_language_indentation_profiles(self):
  self.run_vim("for ft in ['scala','ruby','javascript','javascriptreact','typescript','typescriptreact','yaml','json']\nexecute 'set filetype=' . ft\ncall assert_equal([2,2,2,1], [&tabstop,&softtabstop,&shiftwidth,&expandtab], ft)\nendfor\nfor ft in ['vim','java','groovy','python','kotlin']\nexecute 'set filetype=' . ft\ncall assert_equal([4,4,4,1], [&tabstop,&softtabstop,&shiftwidth,&expandtab], ft)\nendfor\nfor ft in ['go','make']\nexecute 'set filetype=' . ft\ncall assert_equal([8,0,8,0], [&tabstop,&softtabstop,&shiftwidth,&expandtab], ft)\nendfor\n")
 def test_indent_reload_preserves_undo_without_duplicates(self):
  self.run_vim("set filetype=yaml\nlet before = b:undo_ftplugin\nexecute 'source ' . fnameescape(g:dotvim_root . '/after/ftplugin/yaml.vim')\ncall assert_equal(before, b:undo_ftplugin)\nexecute b:undo_ftplugin\ncall assert_equal([4,4,4,1], [&tabstop,&softtabstop,&shiftwidth,&expandtab])\n")
 def test_jsx_tsx_and_jenkins_detection(self):
  self.run_vim("edit Component.tsx\ncall assert_equal('typescriptreact', &filetype)\ncall assert_equal(2, &shiftwidth)\nedit Component.jsx\ncall assert_equal('javascriptreact', &filetype)\nedit Jenkinsfile\ncall assert_equal('groovy', &filetype)\n")
 def test_switch_buffers_does_not_save_modifications(self):
  self.run_vim("edit a.txt\ncall setline(1, 'unsaved')\nlet first = bufnr()\nedit b.txt\nbprevious\ncall assert_equal(first, bufnr())\ncall assert_true(&modified)\ncall assert_false(filereadable('a.txt'))\ncall assert_equal('', maparg('<Tab>', 'n'))\n")
 def test_run_handles_shell_metacharacters_in_filename(self):
  target=self.base/"space 'name'; touch INJECTED # %!.sh"
  target.write_text('#!/bin/sh\nprintf ok > "$DOTVIM_RESULT"\n')
  self.run_vim("execute 'edit ' . fnameescape("+json.dumps(str(target))+")\nset filetype=sh\ncall dotvim#run()\ncall assert_equal(['ok'], readfile($DOTVIM_RESULT))\ncall assert_false(filereadable('INJECTED'))\n")
 def test_run_rejects_unknown_shebang(self):
  target=self.base/'unsupported.sh';target.write_text('#!/usr/bin/env fish\necho not-run\n')
  self.run_vim("try\ncall dotvim#run_command("+json.dumps(str(target)) + ", 'sh')\ncall assert_report('unsupported interpreter was accepted')\ncatch /unsupported shell shebang/\nendtry\n")
 def test_manager_without_plugins_falls_back_cleanly(self):
  self.run_vim("call assert_equal('', v:errmsg)\ncall assert_equal('default', g:colors_name)\ncall assert_equal('', maparg('<Space>n', 'n'))\n",manager=True)
 def test_real_plugins_start_and_reload(self):
  self.run_vim("call assert_equal('', v:errmsg)\ncall assert_equal('gruvbox', g:colors_name)\ncall assert_equal('dark', g:airline_theme)\ncall assert_equal(2, exists(':NERDTreeToggle'))\ncall assert_equal(2, exists(':CtrlP'))\ncall assert_equal(2, exists(':Git'))\ncall assert_equal(7, len(g:plugs))\nexecute 'source ' . fnameescape(g:dotvim_root . '/vimrc')\ncall assert_equal('', v:errmsg)\n",plugins=True)

if __name__=='__main__':unittest.main()
