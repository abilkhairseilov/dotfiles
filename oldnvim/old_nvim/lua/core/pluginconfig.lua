vim.cmd [[colorscheme dracula]]
vim.cmd [[
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
]]
-- telescope configurations
require("telescope").load_extension "file_browser"
local builtin = require("telescope.builtin")
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

vim.api.nvim_set_keymap("n", "<space>ff", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {noremap = true})

-- lightline configurations
vim.cmd [[set noshowmode]]
vim.cmd [[
let g:lightline = { 
       \ 'colorscheme': 'wombat',
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

-- tmuxline.vim
vim.cmd [[
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'c'    : ['#(whoami)', '#(uptime | cut -d " " -f 1,2,3)'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'x'    : '#(date)',
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H' }
]]

vim.cmd [[ 
set number
]]

-- vim-startify configuration
vim.cmd [[
let g:startify_fortune_use_unicode = 1
let g:startify_session_remove_lines = ['comp']
let g:startify_session_number = 15
let g:startify_session_sort = 1
let g:startify_custom_header = [
			\ ' ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓',
			\ ' ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒',
			\ '▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░',
			\ '▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ',
			\ '▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒',
			\ '░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░',
			\ '░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░',
     	\ '   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ',
			\ '         ░    ░  ░    ░ ░        ░   ░         ░   ',
			\ '                                ░                  ',
			\ ]
let g:startify_center = 50
]]

-- dashboard-nvim


local M = {}



function M.setup()

  vim.cmd(

    [[

        let g:dashboard_default_executive ='telescope'

        let g:dashboard_custom_footer = ['']

        let g:dashboard_custom_header =<< EOF

		 ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
     ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
	  ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
    ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ 
    ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
    ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
    ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
       ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   
	           ░    ░  ░    ░ ░        ░   ░         ░   
                                    ░                  
EOF

        let g:dashboard_custom_shortcut = {'last_session': '<Leader> z l', 'find_history': '<Leader> f x','find_file': '<Leader> f f', 'new_file': '<Leader> f n', 'change_colorscheme' : '<Leader> z c', 'find_word': '<Leader> f g', 'book_marks': '<Leader> f m', }

    ]],

    false

  )

end



return M
