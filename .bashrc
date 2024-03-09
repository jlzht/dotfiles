# .bashrc

export CARGO_HOME=$HOME/program/cargo
export RUSTUP_HOME=$HOME/program/rustup
export GRADLE_USER_HOME=$HOME/program/gradle

export HISTCONTROL=ignoredups
export HISTSIZE=2000
export HISTFILESIZE=2000
export EDITOR=nvim

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias rm='rm -vi'
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

. "$HOME/program/cargo/env"
