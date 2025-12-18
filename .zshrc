# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# SEE: https://qiita.com/jesus_isao/items/f440d5980832f3628567
# for history
## メモリに保存される履歴の件数
HISTSIZE=100000

## 履歴ファイルに保存される履歴の件数
SAVEHIST=100000

## 重複を記録しない
setopt hist_ignore_dups

## 開始と終了を記録
setopt EXTENDED_HISTORY

#
# alias
#
## AWS
alias awshogep='AWS_PROFILE=hoge-prd'

alias awschogep='aws configure sso --profile hoge-prd'


## general
alias p='history -100000 | peco'
alias bu='brew upgrade'
alias mu='mise upgrade'
alias tfp='terraform plan'
alias tfm='terraform fmt -diff -recursive'
alias aliaslist='cat ~/.zshrc | grep "alias"'

## git
alias gr='cd ~/ghq/$(ghq list | fzf)'
alias gb='git checkout $(git branch | fzf)'
alias gbr='git fetch && git for-each-ref --sort=-committerdate --count=5 --format="%(committerdate:iso8601) %(refname:short)" refs/remotes/ \
| fzf \
| awk '\''{print $4}'\'' \
| cut -d '\''/'\'' -f2- \
| xargs -r git checkout'
alias gc='git checkout -'
alias gcm='git checkout main'
alias gp='git pull'
alias gcb='git checkout -b'
alias glo='git log --oneline'
alias gresv='git restore --staged vendor'

## docker
alias dl='docker logs $(docker ps | fzf | xargs echo | cut -f 1 -d " ")'
alias dcu='docker compose up'
alias dcd='docker compose down'
