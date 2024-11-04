# Requires figlet and lolcat
zmodload zsh/system

FONT="block"
COUNTER_PATH="$HOME/.session-counter"
LOCK_TIMEOUT_SECONDS=0.2 

function handleCounter() {
  if [[ ! -f "$COUNTER_PATH" ]]; then
    echo 1 > "$COUNTER_PATH"
    count=1
  elif sysopen -w -u fd "$COUNTER_PATH"; then
    count=$(<"$COUNTER_PATH")
    ((count++))
    echo "$count" > "$COUNTER_PATH"
    exec {fd}<&-
  else
    echo "Error: failed to read counter at $COUNTER_PATH"
  fi 

  echo "$count"
}

function ordinalSuffix() {
  case "$1" in
    1) echo "1st"
    ;;
    2) echo "2nd"
    ;;
    3) echo "3rd"
    ;;
    *) echo "${1}th"
    ;;
  esac
}

function showOrdinalNumber() {
  # Pass the last character to get the ordinal ending
  ordinalSuffix "${1: -1}"
}

function formatWelcomeMessage() {
  figlet -f "$FONT" "$1" | lolcat
}

count=$(handleCounter)
if [[ $count -gt 1 ]]; then
  welcomeMsg="Welcome back!"
else
  welcomeMsg="Welcome"
fi

ordinalCount=$(showOrdinalNumber "$count")
formatWelcomeMessage "$welcomeMsg"
echo -e "\t$ordinalCount session"
