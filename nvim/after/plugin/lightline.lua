-- lightline configurations
vim.cmd [[set noshowmode]]
vim.cmd [[
let g:lightline = {
       \ 'colorscheme': 'rosepine',
       \ 'active': {
       \   'left': [ ['mode', 'paste'],
       \             ['fugitive', 'readonly', 'filename', 'modified'] ],
       \   'right': [ [ 'lineinfo' ], ['percent'] ]
       \ },
       \ 'tabline': {
	   \  'left': [ ['buffers'] ],
	   \  'right': [ ['close'] ]
	   \ },
       \ 'component': {
       \   'readonly': '%{&filetype=="help"?"":&readonly?"\ue0a2":""}',
       \   'modified': '%{&filetype=="help"?"":&modified?"\ue0a0":&modifiable?"":"-"}',
       \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
       \ },
       \ 'component_visible_condition': {
       \   'readonly': '(&filetype!="help"&& &readonly)',
       \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
       \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
       \ },
	   \ 'component_expand': {
	   \ 'buffers': 'lightline#bufferline#buffers'
	   \ },
	   \ 'component_type': {
	   \ 'buffers': 'tabsel'
	   \ },
       \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
       \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
       \ }

let g:lightline.enable = {
			 \ 'statusline': 1,
			 \ 'tabline': 1
			 \ }
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
set showtabline=2
set formatoptions=
]]

