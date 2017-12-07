#      ___           ___           ___     
#     /\  \         /\  \         /\__\    
#     \:\  \       /::\  \       /:/  /    
#      \:\  \     /:/\ \  \     /:/__/     
#       \:\  \   _\:\~\ \  \   /::\  \ ___ 
# _______\:\__\ /\ \:\ \ \__\ /:/\:\  /\__\
# \::::::::/__/ \:\ \:\ \/__/ \/__\:\/:/  /
#  \:\~~\~~      \:\ \:\__\        \::/  / 
#   \:\  \        \:\/:/  /        /:/  /  
#    \:\__\        \::/  /        /:/  /   
#     \/__/         \/__/         \/__/    

PATH=${PATH}:~/bin:~/scripts:~/.cargo/bin

# alias
source ~/.alias

#####################
##      Prompt     ##
#####################

PROMPT='%F{1}%~%F{15} ─ '
# launcher
if [[ -n ${LAUNCHER} ]]
then
    PROMPT='%F{1}run%F{15} ~ '
    bindkey -s "^M" " & \n"
    return
fi

autoload -U colors zsh-mime-setup select-word-style
colors          # colors
zsh-mime-setup  # run everything as if it's an executable
select-word-style bash # ctrl+w on words


####################
##  Key bindings  ##
####################

# Lookup in /etc/termcap or /etc/terminfo else, you can get the right keycode
# by typing ^v and then type the key or key combination you want to use.
# "man zshzle" for the list of available actions

bindkey -e                      # emacs keybindings
bindkey '\e[1;5C' forward-word            # C-Right
bindkey '\e[1;5D' backward-word           # C-Left
bindkey '\e[2~'   overwrite-mode          # Insert
bindkey '\e[3~'   delete-char             # Del
bindkey '\e[5~'   history-search-backward # PgUp
bindkey '\e[6~'   history-search-forward  # PgDn
bindkey '^A'      beginning-of-line       # Home
bindkey '^D'      delete-char             # Del
bindkey '^E'      end-of-line             # End
bindkey '^R'      history-incremental-pattern-search-backward 


####################
##   Completion   ##
####################

autoload -U compinit
compinit
zmodload -i zsh/complist
# hash everything before completion
setopt hash_list_all
# complete aliases
setopt completealiases
# when completing from the middle of the word, move the cursor to the end
setopt always_to_end
# allow completion from within a word/phrase
setopt complete_in_word
# spelling correction for commands
setopt correct
# complete as much of a completion until it gets ambiguous
setopt list_ambiguous

# completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
# cache path
zstyle ':completion:*' cache-path ~/.zsh/cache
# ignore case
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# menu if number of items > 2
zstyle ':completion:*' menu select=2
# show colors for the list
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# list of completors to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
# because I don't care about others
users=(tbottom root)
zstyle ':completion:*' users $users

#generic completion with --help
compdef _gnu_generic gcc
compdef _gnu_generic gdb


#####################
##      Pushd      ##
#####################

# make cd push old dir in dir stack
setopt auto_pushd
# no duplicates in dir stack
setopt pushd_ignore_dups
# no dir stack after pushd or popd
setopt pushd_silent
# `pushd` = `pushd $HOME`
setopt pushd_to_home


#####################
##     History     ##
#####################

# where to store the zsh history
HISTFILE=~/.zsh_history
# history size
HISTSIZE=500
SAVEHIST=500
# append
setopt append_history
# no duplicate
setopt hist_ignore_all_dups
# ignore space prefixed commands
unsetopt hist_ignore_space
#trim blanks
setopt hist_reduce_blanks
# show before executing history commands
setopt hist_verify
# add commands as they are typed, don't wait until shell exit
setopt inc_append_history 
# share history between sessions
setopt share_history
# !keyword
setopt bang_hist


#####################
##     Various     ##
#####################

# if command is a path, cd into it
setopt auto_cd
# self explicit
setopt auto_remove_slash
# resolve symlinks
setopt chase_links
# try to correct spelling of commands
setopt correct
# activate complex pattern globbing
setopt extended_glob
# include dotfiles in globs
setopt glob_dots
# print return value if non-zero
setopt print_exit_value
# no bell on error
unsetopt beep
# no lower priority on background jobs
unsetopt bg_nice
# must use >| to truncate existing files
unsetopt clobber
# no bell on error in history
unsetopt hist_beep
# no hup signal at shell exit
unsetopt hup
# do not exit on end-of-file
unsetopt ignore_eof
# no bell or ambiguous completion
unsetopt list_beep
# ask for confirmation for `rm *` or `rm path/*`
unsetopt rm_star_silent

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
