# powerlevel10k instant prompt

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
 
export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions'
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export ANDROID_SDK_ROOT='/opt/android-sdk'
export ANDROID_HOME='/opt/android-sdk'
# Android SDK
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOTtools/bin/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/
PATH=$ANDROID_SDK_ROOT/emulator:$PATH

export PATH=/usr/lib/jvm/java-8-openjdk/bin:$PATH
export PATH=~/Coding/SHELL:"$PATH"
export PATH=~/semester/COAL/"course material"/tools/:"$PATH"
export PATH="$PATH":/home/awais/anaconda3/bin
export PATH=$HOME/.config/nvcode/utils/bin:$PATH
export PATH="$PATH:/home/awais/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"

export EDITOR='nvim'
export VISUAL=$EDITOR
export PAGER='less'
export UPDATE_INTERVAL=15

#CUSTOM Settings#

bindkey '^F' autosuggest-accept
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
HISTSIZE=3000
SAVEHIST=$HISTSIZE
autoload colors && colors
ZLE_RPROMPT_INDENT=0  
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
setopt histignorealldups sharehistory
eval "$(fasd --init auto)"


#ALIASES
alias icat="kitty +kitten icat"
# alias icat="icat -w 50"
alias ...="cd ../.."
alias kconf="nvim ~/.config/kitty/kitty.conf"
alias md="mkdir"
alias lifeos="cd ~/LifeOS"
alias p="python3"
alias lnvim="cd /home/awais/.local/share/nvim"
alias nvimplug="nvim /home/awais/.config/nvim/lua/plugins.lua"
alias nvimlsp="cd /home/awais/.config/nvim/lua/lsp"
alias cdd="cd ~"
alias coa="conda activate base"
alias cod="conda deactivate"
alias rekde="kquitapp5 plasmashell && kstart5 plasmashell"
alias ydm="youtube-dl --extract-audio"
alias yd="youtube-dl"
alias bashconfig="nvim ~/.bashrc"
alias zshconfig="nvim ~/.zshrc"
alias alaconfig="nvim ~/.config/alacritty/alacritty.yml"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias szsh="source ~/.zshrc"
alias ..="cd .."
alias vi="nvim"
alias ls="lsd --group-dirs last"
alias l="ls -la --blocks inode,permission,user,size,date,name" 
alias ll="ls -l --blocks inode,permission,user,size,date,name"
alias l1="ls -1"
alias lr="lsd -R"
alias li="ls -i"
alias la="ls -a"
alias cat="bat"
alias lt="ls --tree --depth=1"
alias ltt="ls --tree"
alias tmux="tmux -2"
alias g="g++ -o"
alias dvim="cd ~/.config/nvim"
alias work="cd ~/Coding"
alias lesss="less * | lolcat"
alias neofetch="neofetch --backend kitty --source ~/Pictures/icons/arcclogo.png"
alias a='fasd -a | cat'        # any
alias s='fasd -si | cat'       # show / search / select
alias d='fasd -d | cat'        # directory
alias f='fasd -f | cat'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias jj='fasd_cd -d -i' # cd with interactive selection
alias v='fasd -f -e nvim'
# alias v='fasd -f -t -e vim -b viminfo'
alias fzf="fzf --height=40% --layout=reverse"
unalias z
# alias v='f -t -e vim -b viminfo'

# >>> conda initialize >>>

__conda_setup="$('/home/awais/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/home/awais/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/home/awais/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="/home/awais/anaconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nv


# - - - - - - - - - - - - - - - - - - - -
# Zinit Configuration
# - - - - - - - - - - - - - - - - - - - -

__ZINIT="${ZDOTDIR:-$HOME}/.zinit/bin/zinit.zsh"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p $HOME/.zinit
    command git clone https://github.com/zdharma/zinit $HOME/.zinit/bin && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%F" || \
        print -P "%F{160}▓▒░ The clone has failed.%F"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit installer's chunk

# THEME

zinit ice depth=1; zinit light romkatv/powerlevel10k


# PLUGINS    

# SSH-AGENT
# zinit light bobsoppe/zsh-ssh-agent

# AUTOSUGGESTIONS, TRIGGER PRECMD HOOK UPON LOAD
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
zinit ice wait"0a" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# HISTORY SUBSTRING SEARCHING
zinit ice wait"0b" lucid atload'bindkey "$terminfo[kcuu1]" history-substring-search-up; bindkey "$terminfo[kcud1]" history-substring-search-down'
zinit light zsh-users/zsh-history-substring-search
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# TAB COMPLETIONS
zinit ice wait"0b" lucid blockf
zinit light zsh-users/zsh-completions
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '-- %d --'
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' extra-opts --preview=$extract'ps --pid=$in[(w)1] -o cmd --no-headers -w -w' --preview-window=down:3:wrap
zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# FZF
zinit ice from"gh-r" as"command"
zinit light junegunn/fzf

# BIND MULTIPLE WIDGETS USING FZF
zinit ice lucid wait'0c' multisrc"shell/{completion,key-bindings}.zsh" id-as"junegunn/fzf_completions" pick"/dev/null"
zinit light junegunn/fzf

# FZF-TAB
zinit ice wait"1" lucid
zinit light Aloxaf/fzf-tab

# ALIASES 
# zinit ice from'gh-r' as'program'
# zinit light sei40kr/fast-alias-tips-bin
# zinit light sei40kr/zsh-fast-alias-tips

# SYNTAX HIGHLIGHTING
zinit ice wait"0c" lucid atinit"zpcompinit;zpcdreplay"
zinit light zdharma/fast-syntax-highlighting

# NVM
# zinit light lukechilds/zsh-nvm
# zinit ice wait"1" lucid
# export NVM_AUTO_USE= false

# BAT
zinit ice from"gh-r" as"program" mv"bat* -> bat" pick"bat/bat" atload"alias cat=bat"
zinit light sharkdp/bat
# BAT-EXTRAS
zinit ice wait"1" as"program" pick"src/batgrep.sh" lucid
zinit ice wait"1" as"program" pick"src/batdiff.sh" lucid
zinit light eth-p/bat-extras
alias rg=batgrep.sh
alias bd=batdiff.sh
alias man=batman.sh

# RIPGREP
zinit ice from"gh-r" as"program" mv"ripgrep* -> ripgrep" pick"ripgrep/rg"
zinit light BurntSushi/ripgrep

# FORGIT
zinit ice wait lucid
zinit load 'wfxr/forgit'

# LAZYGIT
zinit ice lucid wait"0" as"program" from"gh-r" mv"lazygit* -> lazygit" atload"alias lg='lazygit'"
zinit light 'jesseduffield/lazygit'

# RANGER
zinit ice depth'1' as"program" pick"ranger.py"
zinit light ranger/ranger

# FD
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

# GH-CLI
zinit ice lucid wait"0" as"program" from"gh-r" pick"usr/bin/gh"
zinit light "cli/cli"

# BIT
zinit ice lucid wait"0" as"program" from"gh-r" pick"bit"
zinit light "chriswalz/bit"

# ZSH MANYDOTS MAGIC
# zinit autoload'#manydots-magic' for knu/zsh-manydots-magic
# zinit light "b4b4r07/enhancd"

# zinit ice wait'0' lucid atload"unalias d"
# zinit snippet OMZ::plugins/fasd/fasd.plugin.zsh
# binding fzf and fasd
zinit light "wookayin/fzf-fasd"
# pip autocompletion
eval "`pip completion --zsh`"
compctl -K _pip_completion pip3

# kitty terminal autocompletion
autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH=$HOME/.config/nvcode/utils/bin:$PATH
