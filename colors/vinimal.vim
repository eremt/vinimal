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
      \ 'bg-faded' : [233, '#121212'],
      \ 'bg-normal': [234, '#1c1c1c'],
      \ 'bg-bright': [235, '#262626'],
      \ 'fg-faded' : [240, '#585858'],
      \ 'fg-normal': [245, '#8a8a8a'],
      \ 'fg-bright': [248, '#a8a8a8'],
      \ 'red'      : [160, '#d70000'],
      \ 'yellow'   : [208, '#ff8700'],
      \ 'green'    : [106, '#87af00'],
      \ 'blue'     : [111, '#87d7ff'],
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
call s:Set('IncSearch',       'white',     'fg-normal', 'NONE')
call s:Set('Comment',         'fg-faded',  'bg-normal', 'NONE')
call s:Set('Todo',            'blue',      'bg-normal', 'NONE')
call s:Set('Visual',          'fg-bright', 'bg-bright', 'NONE')

call s:Set('DiagnosticError', 'red',       'bg-normal', 'NONE')
call s:Set('DiagnosticWarn',  'yellow',    'bg-normal', 'NONE')
call s:Set('DiagnosticInfo',  'blue',      'bg-normal', 'NONE')
call s:Set('DiagnosticHint',  'green',     'bg-normal', 'NONE')

call s:Set('Pmenu',           'fg-bright', 'bg-bright', 'NONE')
call s:Set('PmenuSel',        'fg-bright', 'bg-bright', 'bold')
call s:Set('Folded',          'fg-faded',  'bg-normal', 'NONE')
call s:Set('SignColumn',      'fg-bright', 'bg-normal', 'NONE')
call s:Set('VertSplit',       'fg-bright', 'bg-faded',  'NONE')
call s:Set('StatusLine',      'fg-bright', 'bg-faded',  'NONE')
call s:Set('StatusLineNC',    'fg-normal', 'bg-faded',  'NONE')
call s:Set('TabLine',         'fg-faded',  'bg-normal', 'NONE')
call s:Set('TabLineFill',     'fg-faded',  'bg-normal', 'NONE')
call s:Set('TabLineSel',      'fg-bright', 'bg-normal', 'NONE')

call s:Set('DiffAdd',         'green',     'bg-normal', 'NONE')
call s:Set('DiffDelete',      'fg-faded',  'bg-normal', 'NONE')
call s:Set('DiffChange',      'fg-faded',  'bg-normal', 'NONE')
call s:Set('DiffText',        'green',     'bg-normal', 'NONE')

call s:Set('LineNr',          'fg-faded',  'bg-normal', 'NONE')
call s:Set('EndOfBuffer',     'fg-faded',  'bg-normal', 'NONE')

call s:Clone('StatusLineTerm', 'StatusLine')
call s:Clone('StatusLineTermNC', 'StatusLineNC')
