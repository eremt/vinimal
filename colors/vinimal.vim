" viminal
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "vinimal"
let g:has_italics = 0
if (has('gui_running') || has('unix') && system('tput sitm') == "\e[3m")
  let g:has_italics = 1
endif

let s:palette = {
      \ 'bg-normal': [234, '#1c1c1c'],
      \ 'bg-faded' : [235, '#262626'],
      \ 'bg-bright': [235, '#262626'],
      \ 'fg-normal': [244, '#808080'],
      \ 'fg-faded' : [240, '#585858'],
      \ 'fg-bright': [248, '#a8a8a8'],
      \ 'red'      : [196, '#ffff00'],
      \ 'yellow'   : [220, '#ffd700'],
      \ 'green'    : [118, '#87ff00'],
      \ 'blue'     : [117, '#87d7ff'],
      \ 'white'    : [255, '#ffffff'],
  \}

function! s:Clear (group)
  execute 'highlight! clear ' . a:group
  execute 'highlight ' . a:group . ' NONE'
endfunction

function! s:Set(group, fg, bg, style)
  call s:Clear(a:group)

  let [l:ctermfg, l:guifg] = s:palette[a:fg]
  let [l:ctermbg, l:guibg] = s:palette[a:bg]

  let l:style = g:has_italics || a:style != 'italic' ? a:style : 'NONE'

  let l:hi_expr = 'highlight ' . a:group
  let l:hi_expr .= ' cterm=' . l:style
  let l:hi_expr .= ' ctermfg=' . l:ctermfg
  let l:hi_expr .= ' ctermbg=' . l:ctermbg
  let l:hi_expr .= ' gui=' . l:style
  let l:hi_expr .= ' guifg=' . l:guifg
  let l:hi_expr .= ' guibg=' . l:guibg

  execute l:hi_expr
endfunction

function! s:Clone(from, to)
  call s:Clear(a:from)
  execute 'highlight link ' . a:from . ' ' . a:to
endfunction

call s:Set('Normal',          'fg-bright', 'bg-normal', 'NONE')
call s:Set('Constant',        'fg-bright', 'bg-normal', 'NONE')
call s:Set('String',          'fg-bright', 'bg-normal', 'NONE')
call s:Set('MatchParen',      'fg-bright', 'bg-normal', 'NONE')
call s:Set('PreProc',         'fg-bright', 'bg-normal', 'NONE')
call s:Set('SpecialKey',      'fg-bright', 'bg-normal', 'NONE')
call s:Set('SpecialChar',     'fg-bright', 'bg-normal', 'NONE')
call s:Set('Underlined',      'fg-bright', 'bg-normal', 'NONE')
call s:Set('Title',           'fg-bright', 'bg-normal', 'NONE')

call s:Set('Identifier',      'fg-normal', 'bg-normal', 'NONE')
call s:Set('Special',         'fg-normal', 'bg-normal', 'NONE')
call s:Set('Statement',       'fg-normal', 'bg-normal', 'NONE')
call s:Set('Type',            'fg-normal', 'bg-normal', 'NONE')

call s:Set('Search',          'white',     'bg-normal', 'NONE')
call s:Set('IncSearch',       'bg-normal', 'fg-faded',  'NONE')
call s:Set('Comment',         'fg-faded',  'bg-normal', 'NONE')
call s:Set('Todo',            'blue',      'bg-normal', 'NONE')

call s:Set('DiagnosticError', 'red',       'bg-normal', 'NONE')
call s:Set('DiagnosticWarn',  'yellow',    'bg-normal', 'NONE')
call s:Set('DiagnosticInfo',  'blue',      'bg-normal', 'NONE')
call s:Set('DiagnosticHint',  'green',     'bg-normal', 'NONE')

call s:Set('Pmenu',           'fg-bright', 'bg-bright', 'NONE')
call s:Set('PmenuSel',        'fg-bright', 'bg-bright', 'bold')
call s:Set('Folded',          'fg-faded',  'bg-normal', 'inverse')

call s:Set('diffAdded',       'green',     'bg-normal', 'NONE')
call s:Set('diffRemoved',     'red',       'bg-normal', 'NONE')
call s:Set('diffChanged',     'yellow',    'bg-normal', 'NONE')
call s:Set('diffLine',        'fg-faded',  'bg-normal', 'NONE')
call s:Set('diffNewFile',     'fg-faded',  'bg-normal', 'NONE')
call s:Set('diffOldFile',     'fg-faded',  'bg-normal', 'NONE')
call s:Set('diffIndexLine',   'fg-faded',  'bg-normal', 'NONE')
call s:Set('diffFile',        'fg-faded',  'bg-normal', 'NONE')

call s:Set('EndOfBuffer',     'fg-faded',  'bg-normal', 'bold')
