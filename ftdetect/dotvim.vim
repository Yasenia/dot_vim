" *.sc is intentionally NOT forced to Scala (also used by SuperCollider).
augroup DotVimFiletypes
  autocmd!
  autocmd BufRead,BufNewFile Jenkinsfile,Jenkinsfile.* setfiletype groovy
augroup END
