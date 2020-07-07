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

alias CscopeComponent='${BASH_CONFIG}/scripts/cscope_component.sh'
alias CscopeBuild='$BASH_CONFIG/scripts/cscope_build.sh'
alias CscopeProject='$BASH_CONFIG/scripts/cscope_project.sh'

alias CTar='$BASH_CONFIG/scripts/component_tar.sh'
alias cs_build='export CSCOPE_DB=$BASE_DIR/cscope.out && $BASH_CONFIG/scripts/cscope_init.sh'

alias Cgen='${BASH_CONFIG}/scripts/cscope_component.sh ${BASE_DIR}'

export MY_NOTES_BASE=$HOME/data/git/opensource/MyNotes

source ${BASH_CONFIG}/scripts/persistDB.sh

declare -A MyScreenMap
MyScreenMap[Krish]="screen -c ${BASH_CONFIG}/scripts/_screenrc/_screenrc_krish -S Krish"
MyScreenMap[Notes]="screen -c ${BASH_CONFIG}/scripts/_screenrc/_screenrc_my_notes -S MyNotes"

Satch() {
  if [ "Krish" != "$1" ]; then
    cd /data/users/knatesan/_screenrc_logs
  fi

  screen_name=`screen -ls | grep $1 | cut -c -13`

  if [ -z "$screen_name" ]; then
    new_screen=${MyScreenMap[$1]}
    $new_screen
  else
    screen -D -R $screen_name
  fi
}

SList() {
  for screens in "${!MyScreenMap[@]}"; do
    echo $screens
  done |
  sort -n
}

declare -A MyFolderMap
MyFolderMap[git]="${HOME}/data/git/opensource/MyNotes/dev_tools/git"

ChDir() {
  folder=${MyFolderMap[$1]}
  echo "Arg:" $1 "Value: " ${folder}
  cd ${folder}
}

ChDirList() {
  for folder in "${!MyFolderMap[@]}"; do
    echo $folder
  done
}

log() {
  now=`date +%d%h%Y-%T`
  script $1_${now}.log
}

gWT() {
  ${BASH_CONFIG}/scripts/git-new-workdir $1 $2 $3
}

# alias rm='$BASH_CONFIG/scripts/rm_cmd.sh'
# alias rmP='$BASH_CONFIG/scripts/rm_permanent.sh'

c() {
  flag=0
  alt_work=""
  work_dir=""
  alt_work_dir=""
  del_flag=0

  if [ $# -ge 2 ]; then
    alt_work=work_dir_$2
  fi

  if [ $# -eq 3 ]; then
    if [ "-d" == $3 ]; then
      del_flag=1
    else
     return
   fi
  fi

  persistDB_get $1
  if [[ 0 == $? ]]
  then
    echo "Found"
    IFS=' ' read -r -a array <<< "$persistDB_return"
    key=${array[0]}
    echo "Key: $key"

    if [[ 3 == ${#array[@]} ]]
    then
      repo_name=${array[1]}
      recipe_name=${array[2]}

      echo "Respo Name: $repo_name"
      echo "Recipe Name: $recipe_name"

      work_dir="$PROJECT_REPOS/${recipe_name[$key]}"

      if [[ $alt_work ]]
      then
        IFS='/' read -ra array <<< "$PROJECT_REPOS"
        project_name=${array[-1]}
        alt_work_dir="$HOME/data/AlternateWS/$alt_work/$project_name/${recipe_name[$key]}"
      fi
    elif [[ 2 == ${#array[@]} ]]
    then
      folder=${array[1]}
      IFS='/' read -ra array <<< "$folder"

      work_dir=$HOME/$folder
      if [[ $alt_work ]]
      then
        alt_work_dir="$HOME/data/AlternateWS/$alt_work/buildspace/${array[-1]}"
      fi
      flag=1
    fi
  else
    echo "Not Found"
    return
  fi

  echo "Work: $work_dir"
  echo "AltWork: $alt_work"
  echo "AltWorkDir: $alt_work_dir"

  if [ $alt_work ]; then
    if [ ! -d "$alt_work_dir" ]; then
      if [ $flag -eq 1 ]; then
        mkdir -p $alt_work_dir
      else
        $BASH_CONFIG/scripts/git-new-workdir $work_dir $alt_work_dir
      fi
    fi
    if [[ 0 == $del_flag ]]
    then
      cd $alt_work_dir
      Use
      Cgen
    else
      rm -rf $alt_work_dir
    fi
  else
    if [ -d "$work_dir" ]; then
      cd $work_dir
      Use
      Cgen
    fi
  fi
}
