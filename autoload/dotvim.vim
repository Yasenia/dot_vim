" Shared filetype indentation and restoration; repeated loading is harmless.
function! dotvim#indent(width, spaces) abort
  let &l:expandtab = a:spaces
  let &l:tabstop = a:width
  let &l:softtabstop = a:spaces ? a:width : 0
  let &l:shiftwidth = a:width
  let l:undo = 'setlocal expandtab< tabstop< softtabstop< shiftwidth<'
  let l:previous = get(b:, 'undo_ftplugin', '')
  if stridx(l:previous, l:undo) < 0
    let b:undo_ftplugin = empty(l:previous) ? l:undo : l:previous . ' | ' . l:undo
  endif
endfunction

function! dotvim#run_command(path, filetype) abort
  if empty(a:path)
    throw 'dot_vim: save the file with a name first'
  endif
  if a:filetype ==# 'python'
    let l:program = 'python3'
  elseif a:filetype ==# 'sh'
    let l:first = get(readfile(a:path, '', 1), 0, '')
    " Honor only these common shell shebangs; never eval an arbitrary shebang.
    if l:first =~# '^#!\s*\%(/usr/bin/env\s\+\|/\%(usr/\)\?bin/\)bash\s*$'
      let l:program = 'bash'
    elseif l:first =~# '^#!\s*\%(/usr/bin/env\s\+\|/\%(usr/\)\?bin/\)zsh\s*$'
      let l:program = 'zsh'
    elseif l:first =~# '^#!\s*\%(/usr/bin/env\s\+\|/\%(usr/\)\?bin/\)sh\s*$' || l:first !~# '^#!'
      let l:program = 'sh'
    else
      throw 'dot_vim: unsupported shell shebang; run it explicitly'
    endif
  else
    throw 'dot_vim: Run supports only shell and Python files'
  endif
  if !executable(l:program)
    throw 'dot_vim: executable missing: ' . l:program
  endif
  return shellescape(exepath(l:program)) . ' ' . shellescape(a:path)
endfunction

function! dotvim#run() abort
  if &buftype !=# '' || empty(expand('%:p'))
    echoerr 'dot_vim: Run requires a named file buffer'
    return
  endif
  " Explicit Run saves only the current file. Buffer navigation never writes.
  update
  let l:command = dotvim#run_command(expand('%:p'), &filetype)
  execute '!' . escape(l:command, '!%#')
endfunction
