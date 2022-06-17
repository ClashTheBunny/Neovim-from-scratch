local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment').toggle()<CR>", opts)
keymap("v", "<leader>/", ":lua require(\"Comment.api\").gc(vim.fn.visualmode())<cr>", opts)

keymap("n", "<leader>cc", "<Plug>(comment_toggle_current_linewise)", opts)
keymap("v", "<leader>cc", "<Plug>(comment_toggle_linewise_visual)", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>nt", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>nf", ":NvimTreeFindFile<cr>", opts)

-- Telescope
keymap("n", "<leader>fd", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<C-g>", "<cmd>Telescope live_grep<cr>", opts)

-- Vimux testing
keymap("n", "<leader>rb", "<cmd>wall <bar> TestFile<cr>", opts)
keymap("n", "<leader>rf", "<cmd>wall <bar> TestNearest<cr>", opts)
keymap("n", "<leader>rl", "<cmd>wall <bar> TestLast<cr>", opts)

-- Misc
keymap("n", "<leader>nh", "<cmd>nohlsearch<cr>", opts)
keymap("n", "<leader>t", ":Format<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>be", ":BufExplorer<cr>", opts)

keymap("n", "<C-k>", "<Plug>unimpairedMoveUp",opts)
keymap("n", "<C-j>", "<Plug>unimpairedMoveDown",opts)
keymap("x", "<C-k>", "<Plug>unimpairedMoveSelectionUp",opts)
keymap("x", "<C-j>", "<Plug>unimpairedMoveSelectionDown",opts)
keymap("n", "<LocalLeader>gh", ":GitHubURL<CR>", opts)

vim.api.nvim_exec(
[[
" vnoremap * :<C-u>call <SID>VSetSearch()<CR>/<CR>
map <silent> <leader>an :ALENextWrap<CR>
map <silent> <leader>ap :ALEPreviousWrap<CR>
map <silent> <leader>aj :ALENextWrap<CR>
map <silent> <leader>ak :ALEPreviousWrap<CR>
map <silent> <leader>al :ALELint<CR>
map <silent> <leader>af :ALEFix<CR>
map <silent> <leader>ai :ALEInfo<CR>
" map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
" map <silent> <LocalLeader>nr :NERDTree<CR>
" map <silent> <LocalLeader>nf :NERDTreeFind<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" map <silent> <leader>ff :SmartFuzzy<CR>
" map <silent> <leader>fg :GFiles<CR>
" map <silent> <leader>fb :Buffers<CR>
map <silent> <leader>ft :Tags<CR>
map <silent> <C-p> :Files<CR>
map <LocalLeader>aw :Ack '<C-R><C-W>'
nmap <silent> ]h :GitGutterNextHunk<CR>
nmap <silent> [h :GitGutterPrevHunk<CR>
" map <silent> <LocalLeader>cc :TComment<CR>
" map <silent> <LocalLeader>uc :TComment<CR>
map <silent> <LocalLeader>vl :wa<CR>:VimuxRunLastCommand<CR>
map <silent> <LocalLeader>vi :wa<CR>:VimuxInspectRunner<CR>
map <silent> <LocalLeader>vk :wa<CR>:VimuxInterruptRunner<CR>
map <silent> <LocalLeader>vx :wa<CR>:VimuxClosePanes<CR>
map <silent> <LocalLeader>vp :VimuxPromptCommand<CR>
vmap <silent> <LocalLeader>vs "vy :call VimuxRunCommand(@v)<CR>
nmap <silent> <LocalLeader>vs vip<LocalLeader>vs<CR>
map <silent> <LocalLeader>ds :call VimuxRunCommand('clear; grep -E "^ *describe[ \(]\|^ *context[ \(]\|^ *it[ \(]\|^ *specify[ \(]\|^ *example[ \(]" ' . bufname("%"))<CR>
map <silent> <LocalLeader>rt :!ctags -R --exclude=".git\|.svn\|log\|tmp\|db\|pkg" --extras=+f --langmap=Lisp:+.clj<CR>
map <silent> <LocalLeader>cj :!clj %<CR>
map <silent> <LocalLeader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>pd :e product_diff.diff<CR>:%!svn diff<CR>:setlocal buftype=nowrite<CR>
map <silent> <LocalLeader>nh :nohls<CR>
map <silent> <LocalLeader>bd :bufdo :bd<CR>
cnoremap <Tab> <C-L><C-D>
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> Y y$
map <silent> <LocalLeader>ws /\s\+$<CR>
map <silent> <LocalLeader>pp :set paste!<CR>
xnoremap <expr> p 'pgv"'.v:register.'y'
imap <C-L> <SPACE>=><SPACE>
nnoremap <silent> <Leader>gw :GitGrepWord<CR>
nnoremap <silent> <Leader>cw :Trim<CR>
" inoremap <expr> <c-j> (pumvisible()?"\<C-n>":"\<c-j>")
" inoremap <expr> <c-k> (pumvisible()?"\<C-p>":"\<c-k>")
  ]], false)
