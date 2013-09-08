let s:unite_source = {
\   'name': 'cmus',
\ }

function! s:unite_source.gather_candidates(args, context)
  let paths = system('cmus-remote -C "save -l -"')
  let music_list = map(split(paths, '\n'), '[fnamemodify(v:val, ":r"), fnamemodify(v:val, ":p")]')

  return map(music_list, '{
  \   "word": v:val[0],
  \   "source": "cmus",
  \   "kind": "command",
  \   "action__command": "call system(\"cmus-remote -C ''player-play ".v:val[1]."''\")",
  \ }')
endfunction

function! unite#sources#cmus#define()
  return s:unite_source
endfunction
