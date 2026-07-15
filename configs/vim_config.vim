" Trim trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Add command for writing files with `sudo`
command! W :execute ':silent W !sudo tee "%" > /dev/null' | :edit!

" Show line numbers in file
set number

" Open NERDTree plugin if no command line args are specified
autocmd VimEnter * if !argc() | NERDTree | endif

" Open NERDTree explorer on left hand side
let g:NERDTreeWinPos = "left"

" Ignore list of NERDTree nodes
let g:NERDTreeIgnore = ["^bazel-*","^\.git$","\.DS_Store","^\.vagrant","^\.bazelcache","^\.terraform","^node_modules$","^__pycache__$","tags"]

" Show hidden files in NERDTree explorer
let g:NERDTreeShowHidden = 1

" Set color scheme
"" Need to set fallback so gVim is used to color underlined words
"" (ex in the case of misspellings)
let g:gruvbox_guisp_fallback = 'fg'

colorscheme gruvbox

" Enable spellcheck
set spell spelllang=en_us

" Run prettier on save for JavaScript files
autocmd BufWritePre *.js,*.ts Prettier

" Run `terraform fmt` on save for Terraform files
autocmd BufWritePre *.tf TerraformFmt
