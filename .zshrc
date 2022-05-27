# Prezto {{{
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
# }}}

# aliass {{{
alias ydl="youtube-dl"
alias ydln="ydl --external-downloader aria2c --external-downloader-args '-c -x 5 -k 2M'"
alias ydlnl="ydln --list-format"
alias ydlm="ydln --netrc --cookie ~/Downloads/youtube.com_cookies.txt"
alias ydlml="ydlm --list-format"
alias ydlnb="ydln -f \"bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]\""
alias ls="ls -FG"
alias lsl="ls -lFG"
alias lsa="ls -aFG"
alias lsla="ls -laFG"
alias vimz="vim ~/.zshrc"
alias setz="source ~/.zshrc"
alias sshs="ssh s1290132@sshgate.u-aizu.ac.jp"
alias sftps="sftp s1290132@sshgate.u-aizu.ac.jp"
alias cdat="cd ~/workspace/atcoder"
alias ls.="lsa | grep \"^\\.\" "
alias rmtex="rm -f *.dvi *.aux *.log *.nav *.out *.snm *.toc"
alias path="echo $PATH"
alias cd='(){cd $1 ; pwd ; echo "" ; ls}'
alias vim='nvim'
alias vimrc='cd; vim $HOME/.config/nvim/init.vim; cd -'
alias v.='nvim .'
alias npmlts='nvm install --lts'
alias memo='cd; nvim ~/memo/$(date "+%Y/%m/%d.md"); cd -'
alias swi='swift'
alias uvim='NODE_ENV=production electron $HOME/workspace/uivonim/build/main/main.js'
alias vimcoder='command vim -u NONE -i NONE -N -n'
alias cvim='./~/nvim-osx64/bin/nvim'
alias make='gmake'
alias python='python3'

alias tn='tab-name'

tab-name() {
  echo -ne "\e]1;$1\a"
}
# }}}

# functions {{{
function cl() {
  cd $1
  pwd
  echo ''
  ls
}
# }}}

#パスの設定 {{{
# }}}

#プロンプトとgit {{{
# fpath=(~/.zsh/completion $fpath)

# autoload -Uz compinit
# compinit -u

export CLICOLOR=1

echo hello.

# autoload -Uz compinit && compinit  # Gitの補完を有効化

# プロンプトの見た目を変更 {{{
setopt prompt_subst
function left-prompt {
  name_t='179m%}'                   # user name text clolr
  name_b='000m%}'                   # user name background color
  path_t='255m%}'                   # path text clolr
  path_b='031m%}'                   # path background color
  arrow_color='087m%}'                    # arrow color
  text_color='%{\e[38;5;'           # set text color
  back_color='%{\e[30;48;5;'        # set background color
  reset='%{\e[0m%}'                 # reset 多分文字や背景色の設定を戻すため
  sharp='\uE0B0'                    # triangle

  user_text="${back_color}${name_b}${text_color}${name_t}"
  user_background="${reset}${back_color}${path_b}${text_color}${name_b}${sharp}"
  user="${user_text}%n%#${user_background}"

  dir_text="${back_color}${path_b}${text_color}${path_t}"
  dir_background="${reset}${text_color}${path_b}${sharp}"
  dir="${dir_text}%~${dir_background}"

  task=`unfog status 2> /dev/null`

  echo "\n${user} ${dir}${reset}${task}\n${text_color}${arrow_color} ⇒ "
}

PROMPT=`left-prompt`
# }}}
# コマンドの実行ごとに改行 {{{
function precmd() {
    # Print a newline before the prompt, unless it's the
    # first prompt in the process.
    if [ -z "$NEW_LINE_BEFORE_PROMPT" ]; then
        NEW_LINE_BEFORE_PROMPT=1
    elif [ "$NEW_LINE_BEFORE_PROMPT" -eq 1 ]; then
				echo ""
    fi
}
# }}}
# git ブランチ名を色付きで表示させるメソッド {{{
function rprompt-git-current-branch {
  local branch_name st branch_status

  branch='\ue0a0'
  color='%{\e[38;5;' #  文字色を設定
  green='114m%}'
  red='001m%}'
  yellow='227m%}'
  blue='033m%}'
  reset='%{\e[0m%}'   # reset

  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    branch_status="${color}${green}${branch}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    branch_status="${color}${red}${branch}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    branch_status="${color}${red}${branch}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    branch_status="${color}${yellow}${branch}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    echo "${color}${red}${branch}!(no branch)${reset}"
    return
  fi

  echo "${branch_status}$branch_name${reset}"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する

# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'
# }}}
# }}}

# homebrew {{{
export PATH="/opt/homebrew/bin:$PATH"
# }}}
export PATH=$HOME/bin:$PATH
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/opt/homebrew/lib/ruby/gems/3.1.0/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
# export PATH="$HOME/nvim-osx64/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
