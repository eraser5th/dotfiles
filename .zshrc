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
alias ls="ls -FG"
alias lsl="ls -lFG"
alias lsa="ls -aFG"
alias lsla="ls -laFG"
alias vimz="vim ~/.zshrc"
alias setz="source ~/.zshrc"
alias rmtex="rm -f *.dvi *.aux *.log *.nav *.out *.snm *.toc"
alias path="echo $PATH"
alias cd='(){cd $1 ; pwd ; echo "" ; ls}'
alias vim='nvim'
alias memo='cd; nvim ~/memo/$(date "+%Y/%m/%d.md"); cd -'
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

eval "$(starship init zsh)"
