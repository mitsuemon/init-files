" Author:      Matteo Guarda
" Webpage:     https://github.com/matgua/one-light.vim
" License:     MIT
" Description: A port of the Atom's One Light Theme for Vim and NeoVim.

highlight clear
set background=dark
set termguicolors

if exists('syntax_on')
  syntax reset
endif

" Colorscheme name.
let g:colors_name = 'one-light'

" Color variables. {{{

let g:one_light_variant = get(g:, 'one_light_variant', 'default')

if g:one_light_variant ==# 'default'
  let s:black = '#fafafa'
elseif g:one_light_variant ==# 'breeze'
  let s:black = 'eff0f1'
endif

let s:red     = '#ca1243'
let s:orange  = '#d75f00'
let s:green   = '#50a14f'
let s:yellow  = '#c18401'
let s:blue    = '#4078f2'
let s:magenta = '#a626a4'
let s:cyan    = '#0184bc'
let s:white   = '#383a42'
let s:comment = '#696c77'
let s:pale    = '#a0a1a7'

let g:indentLine_color_gui    = '#a0a1a7'
let g:limelight_conceal_guifg = '#a0a1a7'

" You can't assign a variable as an argument for the 'highlight' command, so
" this trick fix that.
function! s:HL(group, gbg, gfg, tbg, tfg, attr)
  let l:attr = a:attr

  if !empty(a:gbg)
    exec 'highlight ' . a:group . ' guibg=' . a:gbg
  endif
  if !empty(a:gfg)
      exec 'highlight ' . a:group . ' guifg=' . a:gfg
  endif
  if !empty(a:tbg)
    exec 'highlight ' . a:group . ' ctermbg=' . a:tbg
  endif
  if !empty(a:tfg)
      exec 'highlight ' . a:group . ' ctermfg=' . a:tfg
  endif
  if !empty(a:attr)
    exec 'highlight ' . a:group . ' gui=' . l:attr . ' cterm=' . l:attr
  endif
endfun

" }}}

" Highlight groups. {{{

call s:HL('Normal',                     s:black,   s:white,   'none', 07,     '')
call s:HL('NonText',                    s:black,   s:black,   'none', 00,     '')
call s:HL('Constant',                   s:black,   s:yellow,  'none', 03,     '')
call s:HL('Error',                      s:black,   s:red,     'none', 01,     '')
call s:HL('Identifier',                 s:black,   s:orange,  'none', 01,     'bold')
call s:HL('Ignore',                     s:comment, s:black,   08,     00,     '')
call s:HL('PreProc',                    s:black,   s:yellow,  'none', 03,     '')
call s:HL('Special',                    s:black,   s:cyan,    'none', 06,     '')
call s:HL('Statement',                  s:black,   s:red,     'none', 01,     '')
call s:HL('String',                     s:black,   s:green,   'none', 02,     '')
call s:HL('Number',                     s:black,   s:yellow,  'none', 03,     '')
call s:HL('Todo',                       s:green,   s:black,   02,     00,     '')
call s:HL('Type',                       s:black,   s:yellow,  'none', 03,     '')
call s:HL('Underlined',                 s:black,   s:red,     'none', 01,     'underline')
call s:HL('TermCursorNC',               s:magenta, s:black,   05,     00,     '')
call s:HL('Title',                      s:black,   s:blue,    'none', 04,     '')
call s:HL('helpLeadBlank',              s:black,   s:white,   'none', 07,     '')
call s:HL('helpNormal',                 s:black,   s:white,   'none', 07,     '')
call s:HL('VisualNOS',                  s:black,   s:red,     'none', 01,     '')
call s:HL('FoldColumn',                 s:black,   s:white,   'none', 07,     '')
call s:HL('SpecialKey',                 s:black,   s:comment, 'none', 08,     '')
call s:HL('DiffAdd',                    s:black,   s:green,   'none', 02,     '')
call s:HL('DiffChange',                 s:black,   s:comment, 'none', 08,     '')
call s:HL('DiffDelete',                 s:black,   s:red,     'none', 01,     '')
call s:HL('DiffText',                   s:black,   s:blue,    'none', 04,     '')
call s:HL('Directory',                  s:black,   s:blue,    'none', 04,     '')
call s:HL('ColorColumn',                s:pale,    'none',    13,     'none', '')
call s:HL('signColumn',                 s:black,   s:blue,    'none', 04,     '')
call s:HL('ErrorMsg',                   s:black,   s:comment, 'none', 08,     '')
call s:HL('ModeMsg',                    s:black,   s:green,   'none', 02,     '')
call s:HL('MoreMsg',                    s:black,   s:green,   'none', 02,     '')
call s:HL('Question',                   s:black,   s:blue,    'none', 04,     '')
call s:HL('WarningMsg',                 s:black,   s:red,     00,     01,     '')
call s:HL('Cursor',                     s:black,   s:comment, 'none', 08,     '')
call s:HL('Structure',                  s:black,   s:magenta, 'none', 05,     '')
call s:HL('CursorColumn',               s:comment, s:white,   08,     07,     '')
call s:HL('ModeMsg',                    s:black,   s:white,   'none', 07,     '')
call s:HL('SpellBad',                   s:black,   s:red,     'none', 01,     'underline')
call s:HL('SpellCap',                   s:black,   s:blue,    'none', 04,     'underline')
call s:HL('SpellLocal',                 s:black,   s:magenta, 'none', 05,     'underline')
call s:HL('SpellRare',                  s:black,   s:cyan,    'none', 06,     'underline')
call s:HL('Boolean',                    s:black,   s:magenta, 'none', 05,     '')
call s:HL('Character',                  s:black,   s:red,     'none', 01,     '')
call s:HL('Conditional',                s:black,   s:magenta, 'none', 05,     '')
call s:HL('Define',                     s:black,   s:magenta, 'none', 05,     '')
call s:HL('Delimiter',                  s:black,   s:magenta, 'none', 05,     '')
call s:HL('Float',                      s:black,   s:magenta, 'none', 05,     '')
call s:HL('Include',                    s:black,   s:blue,    'none', 04,     '')
call s:HL('Keyword',                    s:black,   s:magenta, 'none', 05,     '')
call s:HL('Label',                      s:black,   s:yellow,  'none', 03,     '')
call s:HL('Operator',                   s:black,   s:white,   'none', 07,     '')
call s:HL('Repeat',                     s:black,   s:yellow,  'none', 03,     '')
call s:HL('SpecialChar',                s:black,   s:magenta, 'none', 05,     '')
call s:HL('Tag',                        s:black,   s:yellow,  'none', 03,     '')
call s:HL('Typedef',                    s:black,   s:yellow,  'none', 03,     '')
call s:HL('vimUserCommand',             s:black,   s:orange,  'none', 01,     'bold')
call s:HL('vimNotation',                s:black,   s:blue,    'none', 04,     '')
call s:HL('vimMapModKey',               s:black,   s:blue,    'none', 04,     '')
call s:HL('vimBracket',                 s:black,   s:white,   'none', 07,     '')
call s:HL('vimCommentString',           s:black,   s:comment, 'none', 08,     '')
call s:HL('htmlLink',                   s:black,   s:red,     'none', 01,     'underline')
call s:HL('htmlBold',                   s:black,   s:yellow,  'none', 03,     'bold')
call s:HL('htmlItalic',                 s:black,   s:magenta, 'none', 05,     '')
call s:HL('htmlEndTag',                 s:black,   s:white,   'none', 07,     '')
call s:HL('htmlTag',                    s:black,   s:white,   'none', 07,     '')
call s:HL('htmlTagName',                s:black,   s:orange,  'none', 01,     'bold')
call s:HL('htmlH1',                     s:black,   s:white,   'none', 07,     '')
call s:HL('cssMultiColumnAttr',         s:black,   s:green,   'none', 02,     '')
call s:HL('cssBraces',                  s:black,   s:white,   'none', 07,     '')
call s:HL('cssValueLength',             s:black,   s:white,   'none', 07,     '')
call s:HL('cssUnitDecorators',          s:black,   s:white,   'none', 07,     '')
call s:HL('cssValueNumber',             s:black,   s:white,   'none', 07,     '')
call s:HL('cssNoise',                   s:black,   s:comment, 'none', 08,     '')
call s:HL('cssTagName',                 s:black,   s:red,     'none', 01,     '')
call s:HL('cssFunctionName',            s:black,   s:blue,    'none', 04,     '')
call s:HL('scssSelectorChar',           s:black,   s:white,   'none', 07,     '')
call s:HL('scssAttribute',              s:black,   s:white,   'none', 07,     '')
call s:HL('sassidChar',                 s:black,   s:red,     'none', 01,     '')
call s:HL('sassClassChar',              s:black,   s:magenta, 'none', 05,     '')
call s:HL('sassInclude',                s:black,   s:magenta, 'none', 05,     '')
call s:HL('sassMixing',                 s:black,   s:magenta, 'none', 05,     '')
call s:HL('sassMixinName',              s:black,   s:blue,    'none', 04,     '')
call s:HL('javaScript',                 s:black,   s:white,   'none', 07,     '')
call s:HL('javaScriptBraces',           s:black,   s:white,   'none', 07,     '')
call s:HL('javaScriptNumber',           s:black,   s:magenta, 'none', 05,     '')
call s:HL('markdownH1',                 s:black,   s:white,   'none', 07,     '')
call s:HL('markdownAutomaticLink',      s:black,   s:green,   'none', 02,     'underline')
call s:HL('markdownError',              s:black,   s:white,   'none', 07,     '')
call s:HL('markdownCode',               s:black,   s:yellow,  'none', 03,     '')
call s:HL('markdownCodeBlock',          s:black,   s:yellow,  'none', 03,     '')
call s:HL('markdownCodeDelimiter',      s:black,   s:magenta, 'none', 05,     '')
call s:HL('markdownItalic',             '',        '',        '',     '',     'italic')
call s:HL('markdownBold',               '',        '',        '',     '',     'bold')
call s:HL('xdefaultsValue',             s:black,   s:white,   'none', 07,     '')
call s:HL('rubyInclude',                s:black,   s:blue,    'none', 04,     '')
call s:HL('rubyDefine',                 s:black,   s:magenta, 'none', 05,     '')
call s:HL('rubyFunction',               s:black,   s:blue,    'none', 04,     '')
call s:HL('rubyStringDelimiter',        s:black,   s:green,   'none', 02,     '')
call s:HL('rubyInteger',                s:black,   s:yellow,  'none', 03,     '')
call s:HL('rubyAttribute',              s:black,   s:blue,    'none', 04,     '')
call s:HL('rubyConstant',               s:black,   s:yellow,  'none', 03,     '')
call s:HL('rubyInterpolation',          s:black,   s:green,   'none', 02,     '')
call s:HL('rubyInterpolationDelimiter', s:black,   s:yellow,  'none', 03,     '')
call s:HL('rubyRegexp',                 s:black,   s:cyan,    'none', 06,     '')
call s:HL('rubySymbol',                 s:black,   s:green,   'none', 02,     '')
call s:HL('rubyTodo',                   s:black,   s:comment, 'none', 08,     '')
call s:HL('rubyRegexpAnchor',           s:black,   s:white,   'none', 07,     '')
call s:HL('pythonOperator',             s:black,   s:magenta, 'none', 05,     '')
call s:HL('pythonFunction',             s:black,   s:blue,    'none', 04,     '')
call s:HL('pythonRepeat',               s:black,   s:magenta, 'none', 05,     '')
call s:HL('pythonStatement',            s:black,   s:orange,  'none', 01,     'bold')
call s:HL('pythonBuiltIn',              s:black,   s:blue,    'none', 04,     '')
call s:HL('phpMemberSelector',          s:black,   s:white,   'none', 07,     '')
call s:HL('phpComparison',              s:black,   s:white,   'none', 07,     '')
call s:HL('phpParent',                  s:black,   s:white,   'none', 07,     '')
call s:HL('cOperator',                  s:black,   s:cyan,    'none', 06,     '')
call s:HL('cPreCondit',                 s:black,   s:magenta, 'none', 05,     '')
call s:HL('SignifySignAdd',             s:black,   s:green,   'none', 02,     '')
call s:HL('SignifySignChange',          s:black,   s:blue,    'none', 04,     '')
call s:HL('SignifySignDelete',          s:black,   s:red,     'none', 01,     '')

call s:HL('EndOfBuffer',           s:black,  s:black,   'none', 00,     '')
call s:HL('HighlightedyankRegion', s:pale,   'none',    13,     'none', '')
call s:HL('BarraVuota',            s:black,  s:black,   'none', '',     '')
call s:HL('GitGutterAdd',          s:black,  s:comment, 'none', 08,     '')
call s:HL('GitGutterChange',       s:black,  s:comment, 'none', 08,     '')
call s:HL('GitGutterDelete',       s:black,  s:comment, 'none', 08,     '')
call s:HL('GitGutterChangeDelete', s:black,  s:comment, 'none', 08,     '')
call s:HL('GitGutterDeleteLine',   s:black,  s:comment, 'none', 08,     '')
call s:HL('StatusLine',            s:black,  s:comment, 'none', 00,     'none')
call s:HL('StatusLineNC',          s:black,  s:comment, 'none', 08,     'none')
call s:HL('Comment',               s:black,  s:comment, 'none', 08,     'italic')
call s:HL('TabLine',               s:black,  s:pale,    'none', 13,     'none')
call s:HL('TabLineFill',           s:black,  s:black,   'none', 'none', '')
call s:HL('TabLineSel',            s:black,  s:orange,  'none', 01,     'bold')
call s:HL('VertSplit',             s:black,  s:black,   'none', 00,     'none')
call s:HL('LineNr',                s:black,  s:pale,    'none', 13,     '')
call s:HL('CursorLine',            'none',   'none',    'none', 'none', 'none')
call s:HL('CursorLineNr',          s:black,  s:pale,    'none', 13,     '')
call s:HL('Visual',                s:pale,   'none',    13,     'none', '')
call s:HL('Pmenu',                 s:black,  s:pale,    'none', 13,     '')
call s:HL('PmenuSbar',             s:black,  s:black,   'none', '',     '')
call s:HL('PmenuSel',              s:black,  s:orange,  'none', 01,     'bold')
call s:HL('PmenuThumb',            s:black,  s:black,   'none', '',     '')
call s:HL('Folded',                s:black,  s:comment, 'none', 08,     'bold')
call s:HL('IncSearch',             s:black,  s:orange,  'none', 09,     '')
call s:HL('Search',                s:yellow, s:black,   03,     'none', '')
call s:HL('MatchParen',            s:pale,   'none',    13,     'none', '')
call s:HL('NERDTreeDirSlash',      s:black,  s:blue,    'none', 04,     '')
call s:HL('NERDTreeExecFile',      s:black,  s:white,   'none', 07,     '')
call s:HL('ALEErrorSign',          s:black,  s:orange,  'none', 01,     'bold')
call s:HL('ALEWarningSign',        s:black,  s:orange,  'none', 01,     'bold')
call s:HL('ALEError',              s:black,  s:orange,  'none', 01,     'bold')
call s:HL('ALEWarning',            s:black,  s:orange,  'none', 01,     'bold')
call s:HL('WildMenu',              s:black,  s:orange,  'none', 01,     'bold')
call s:HL('Whitespace',            s:black,  s:comment, 'none', 08,     '')
call s:HL('CleverFChar',           s:yellow, s:black,   03,     00,     '')

" Links.
highlight link vimMap               vimUserCommand
highlight link vimLet               vimUserCommand
highlight link vimCommand           vimUserCommand
highlight link vimFTCmd             vimUserCommand
highlight link vimAutoCmd           vimUserCommand
highlight link vimNotFunc           vimUserCommand
highlight link htmlH2               htmlH1
highlight link htmlH3               htmlH1
highlight link htmlH4               htmlH1
highlight link htmlH5               htmlH1
highlight link htmlH6               htmlH1
highlight link cssFontAttr          cssMultiColumnAttr
highlight link cssFlexibleBoxAttr   cssMultiColumnAttr
highlight link cssAttrComma         cssBraces
highlight link cssValueLength       cssValueNumber
highlight link scssDefinition       cssNoise
highlight link markdownH2           markdownH1
highlight link markdownH3           markdownH1
highlight link markdownH4           markdownH1
highlight link markdownH5           markdownH1
highlight link markdownH6           markdownH1
highlight link markdownUrl          markdownAutomaticLink
highlight link rubyRegexpQuantifier rubyRegexpAnchor

" }}}

" FZF colors. {{{

  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Comment'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Normal'],
    \ 'fg+':     ['fg', 'Identifier', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'Normal', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Normal'],
    \ 'info':    ['fg', 'EndOfBuffer'],
    \ 'border':  ['fg', 'Identifier'],
    \ 'prompt':  ['fg', 'Identifier'],
    \ 'pointer': ['fg', 'Identifier'],
    \ 'marker':  ['fg', 'Normal'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

" }}}
