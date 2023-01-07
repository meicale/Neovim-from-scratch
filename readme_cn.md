# Neovim from scratch
## 描述
主要是依据lvim，kickstrat 和 from scratch系列，配置相关的快捷键按法和基础。
目标：
1. 和vscode 覆盖大部分快捷键。和chrome上覆盖快捷键
2. 和tmux以及zsh中端的兼容，减少快捷键的冲突
## 功能
### 1. 移动与跳转
<!-- ##### 文件内移动 -->
0. buildin: mark，jumplist，修改，选中，复制，搜索，#,* 等
1. quickscope，行内快速提示f，t 键
2. hop，实现跨分屏（split）的基于单词的定位和跳转
3. leap，基于2chars搜索的定位和调转
4. harpoon, 文件之间的快捷跳转
5. trouble 和qfl，错误信息和出错代码之间的快捷跳转
6. lsp，代码定义，引用，之间的快捷跳转
7. gitsigns， 代码修改之间以及代码历史之间的快捷跳转

### 2. 功能联动
0. 编辑器和文件管理，nvim-tree，使用类似的快捷键进行文件的操作，同时能够对相应的buffer进行修改。
1. 编辑器和quickfixlist，location list，telescope，例如1.5 trouble，bqf，quickfixlist-reflector，后两者有一定的冲突
2. 编辑器和terminal
3. 编辑器和tmux

### 3. 基础配置
1. lsp, pyright, lua, 
2. treesitter， 高亮，选中，基于语法树的选中，text object等
3. test，neotest，方便地进行测试，并反馈结果，根据结果可以快速的定位出错的位置，需要complier的支持
4. debug， dap，与neotest 类似，需要使用对应的支持的工具，比如，complier等。
3. 三方formate，lint，diagnos，编译器等

### 使用log
1. 输入法切换偶尔会出现问题，需要直接调整到需要的输入法，而且能够正常的配置，否则自己不会进行修正，估计是进入了错误的状态。
2. mason 作为包管理器的时候需要添加unzip的工具，这个在有些安装环境中是没有的，需要手动安装。此外，感觉是利用了系统自带的apt或者pip等安装工具，需要注意这些同居对应的联网情况，是代理连外网，还是使用的本地镜像。
3. fugitive, quickscope 等纯vim 插件可以不用使用单独的lua文件方位是否存在，该函数返回为false，但是实际上插件可用，推荐都去掉。
4. neovim 插件会导致在edtor窗口ctrl+w和ctrl+k快捷键失效，需要排查neovim中插件是否有覆盖
