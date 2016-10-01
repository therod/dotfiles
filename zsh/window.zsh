# Sets the window title nicely no matter where you are
function title() {
  PROMPT_COMMAND="" && printf '\e]1;%s\a' "$1"
}
