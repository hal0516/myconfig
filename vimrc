syntax on                       "支持语法高亮显示                                                                             
filetype plugin indent on       "启用根据文件类型自动缩进                          
"colorscheme darkblue            "修改配色                                         
                                                                                   
set autoindent                  "开始新行时自动处理缩进                            
set shiftwidth=2                "用于自动缩进的空格数                              
set expandtab                   "将制表符展开为空格，这对python尤其有用            
set tabstop=4                   "要计算的空格数                                    
set backspace=2                 "在多数终端上修正退格键BackSpace的行为             
"set paste                      "关闭自动注释                                      
set nu                          "显示代码行数                                      
set cul                         "启用下划线                                        
set mouse=a                     "启用鼠标                                          
set colorcolumn=80              "高亮显示第80列                                    
                                                                                   
"解决中文显示乱码                                                                  
"let &termencoding=&encoding                                                       
"set fileencodings=utf-8,gbk             
                                                                               
"键位映射                                                                       
"nnoremap <F9> :vsp .<CR><C-w>L<C-w>30<                                         
nnoremap <F10> :terminal<CR><C-w>J<C-w>5-                                       
                                                                                
"缩写配置                                                                       
abbreviate @cppstart@ #include <iostream><CR><CR>int main(int argc, char *argv[])<CR>{<CR><CR>return 0;<CR>}
                                                                                
"plug-vim插件管理                                                               
call plug#begin('~/.vim/plugged')                                               
Plug 'scrooloose/syntastic'                                                     
Plug 'valloric/youcompleteme'                                                   
Plug 'luochen1990/rainbow'                                                      
Plug 'majutsushi/tagbar'                                                        
Plug 'scrooloose/nerdtree'                                                      
call plug#end()                                                                 
                                                                                
"syntastic配置                                                                  
set statusline+=%#warningmsg#                                                    
set statusline+=%{SyntasticStatuslineFlag()}                                    
set statusline+=%*                                                              
let g:syntastic_always_populate_loc_list = 1                                    
let g:syntastic_auto_loc_list = 1                                               
let g:syntastic_check_on_open = 1                                               
let g:syntastic_check_on_wq = 0                                                 
                                                                                
"youcompleteme配置                                                              
let g:ycm_server_python_interpreter='/usr/bin/python3'                          
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'                     
set completeopt=longest,menu                            "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口let g:ycm_collect_identifiers_from_tags_files=1         "开启 YCM 基于标签引擎  
let g:ycm_min_num_of_chars_for_completion=2             "从第2个键入字符就开始罗列匹配项let g:ycm_cache_omnifunc=0                              "禁止缓存匹配项,每次都重新生成匹配项let g:ycm_seed_identifiers_with_syntax=1                "语法关键字补全                                                       
nnoremap <F6> :YcmCompleter FixIt<CR>       
                                                                                
"rainbow配置                                                                    
 " set to 0 if you want to enable it later via :RainbowToggle                   
let g:rainbow_active = 1                                                        
                                                                                
"tagbar配置                                                                     
nnoremap <F8> :TagbarToggle<CR>                                                 
                                                                                
"nerdtree配置                                                                   
nnoremap <F9> :NERDTreeToggle<CR>                                               
 " Exit Vim if NERDTree is the only window remaining in the only tab.           
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
 " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
