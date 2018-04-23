shopt -s expand_aliases
#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls).
#-------------------------------------------------------------
# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

alias vi='vim'

# git aliases
alias gA='git add'
alias gC='git checkout'
#alias gcom='git checkout master'
#alias gcop='git checkout gh-pages'
alias gS='git status'
alias gF='git fetch origin'
alias gD='git diff --no-ext-diff'
#alias gdiff='git diff master origin/master'
alias gP='git pull'
alias gc='git commit'
alias gPoH='git push origin HEAD'
alias gpom='git push origin master'
alias gpop='git push origin gh-pages'
alias gB='git branch'
alias gh='git --help'
alias glola='git log --graph --decorate --pretty=oneline --abbrev-commit --name-status'
alias gL='git log'


alias bb='cd  $BUILDDIR && bitbake'

alias MyScreen='screen -c $HOME/scripts/_screenrc/_screenrc_code -S Krish'
alias Tach='screen -D -R `screen -ls | grep Krish | cut -c -13`'

alias g='find . | xargs grep -rn '
alias gch='find . \( -name "*.c" -o -name "*.h" -o -name "*.fpl" -o -name "*.fplh" -o -name "*.cnp" \) | xargs grep -rn '
alias gh='find . -name "*.h" | xargs grep -rn '
alias gc='find . \( -name "*.c" -o -name "*.cc" -o -name "*.cpp" \) | xargs grep -rn '

alias Diff='diff -rbBwup '

alias Indent='find . -name "*.[ch]" | xargs dos2unix; find . -name "*.[ch]" | xargs indent -bad -bap -bl -bli0 -ce -ci4 -i4 -nbbo -ncdb -bfda -nhnl -nlp -nsc -nip -npcs -nut -kr; find . -name "*.*~" | xargs rm -f'
alias Junk='find . -name *.swp | xargs rm -f; find . -name *.*~ | xargs rm -f'

alias U='export BASE_DIR=$PWD && export CSCOPE_DB=$BASE_DIR/cscope.out'
alias Use='export BASE_DIR=$PWD && export CSCOPE_DB=$BASE_DIR/cscope.out'

alias CscopeInit='$HOME/scripts/cscope_init.sh'
alias CscopeBuild='$HOME/scripts/cscope_build.sh'
alias CDcnCscope='$HOME/scripts/cscope_dcn.sh'
alias Cgen='$HOME/scripts/cscope_ctag_gen.sh'
alias C='cscope -d'

alias BDir='cd $BASE_DIR'
alias CTar='$HOME/scripts/component_tar.sh'
alias cs_build='export CSCOPE_DB=$BASE_DIR/cscope.out && $HOME/scripts/cscope_init.sh'
alias Rsync='$HOME/scripts/rsync_patches.sh'

