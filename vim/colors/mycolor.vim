" Vim color scheme
"
" Name:         mycolor.vim
" Maintainer:   w.maeda <lobin.z0x50@gmail.com> 
" Last Change:  30 Oct 2013
" License:      public domain
" Version:      1.0

set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif

let g:colors_name = "blackboard"

if has("gui_running")
  "GUI Colors
  highlight Normal guifg=White   guibg=#0B1022
  highlight Cursor guifg=Black   guibg=Yellow
  highlight CursorLine guifg=NONE guibg=#28262E term=underline cterm=underline
  highlight CursorIM   guifg=NONE guibg=Purple
  highlight LineNr guibg=#2e2e2e guifg=#707070
  highlight Folded guifg=White

  highlight SpecialKey guifg=#494949 guibg=#212223 ctermfg=1

  "General Colors
  highlight Comment guifg=#f04500
  highlight Constant guifg=#DAFE3E
  highlight Keyword guifg=#0808cd
  highlight String guifg=#10E43D
  highlight Type guifg=#94A7D1
  highlight Identifier guifg=#ffd0db gui=NONE
  highlight Function guifg=#add8e6 gui=NONE
  highlight clear Search
  highlight Search guibg=#0060a0
  highlight PreProc guifg=#A0A0A9

  "Ruby Colors
  highlight link rubyClass Keyword
  highlight link rubyDefine Keyword
  highlight link rubyConstant Type
  highlight link rubySymbol Constant
  highlight link rubyStringDelimiter rubyString
  highlight link rubyInclude Keyword
  highlight link rubyAttribute Keyword
  highlight link rubyInstanceVariable Normal

  "Rails Colors
  highlight link railsMethod Type
end

