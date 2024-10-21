# Bash alias for correct kitty ssh behaviour
if [ "$TERM" = "xterm-kitty" ]; then
  alias ssh="kitty +kitten ssh"
fi

# Customize Powerlevel10k prompt options
export POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
export POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
export POWERLEVEL9K_PROMPT_ON_NEWLINE=true
export POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_unique"
export POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=2
export POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="┌"
export POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX="│ "
export POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="└|> "

# Directory customization
export POWERLEVEL9K_DIR_SHOW_WRITABLE=true
export POWERLEVEL9K_DIR_MAX_LENGTH=3
export POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40

# Time prompt customization
export POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S}"

# Status customization
export POWERLEVEL9K_STATUS_VERBOSE=false
export POWERLEVEL9K_STATUS_OK=true
