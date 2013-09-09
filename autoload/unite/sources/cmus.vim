let s:unite_source = {
\   'name': 'cmus',
\ }

function! s:unite_source.gather_candidates(args, context)
  let paths = split(system('cmus-remote -C "save -l -"'), '\n')
  return map(paths, '{
  \   "word": v:val,
  \   "source": "cmus",
  \   "kind": "command",
  \   "action__command": "call system(\"cmus-remote -C ''player-play ".v:val."''\")",
  \ }')
endfunction

function! unite#sources#cmus#define()
  return s:unite_source
endfunction
