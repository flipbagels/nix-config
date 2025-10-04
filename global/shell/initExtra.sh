# Bash alias for correct kitty ssh behaviour
if [ "$TERM" = "xterm-kitty" ]; then
  alias ssh="kitty +kitten ssh"
fi
