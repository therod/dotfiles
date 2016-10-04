autoload colors && colors

autoload -U zgitinit
zgitinit

coloratom() {
	local off=$1 atom=$2
	if [[ $atom[1] == [[:upper:]] ]]; then
		off=$(( $off + 60 ))
	fi
	echo $(( $off + $colorcode[${(L)atom}] ))
}
colorword() {
	local fg=$1 bg=$2 att=$3
	local -a s

	if [ -n "$fg" ]; then
		s+=$(coloratom 30 $fg)
	fi
	if [ -n "$bg" ]; then
		s+=$(coloratom 40 $bg)
	fi
	if [ -n "$att" ]; then
		s+=$attcode[$att]
	fi

	echo "%{"$'\e['${(j:;:)s}m"%}"
}

git_branch() {
  echo $(/usr/bin/env git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  st=$(/usr/bin/env git status 2>/dev/null | tail -n 1)
  if [[ $st == "" ]]
  then
    echo "(%{$fg[red]%}$(git_prompt_info)%{$reset_color%}%{$fg[green]%} +%{$reset_color%})"
  else
    if [[ $st == "nothing to commit, working tree clean" ]]
    then
      echo "(%{$fg[green]%}$(git_prompt_info)%{$reset_color%})"
    else
      echo "(%{$fg[red]%}$(git_prompt_info)%{$reset_color%})"
    fi
  fi
}

git_prompt_info () {
 ref=$(/usr/bin/env git symbolic-ref HEAD 2>/dev/null) || return
  echo "${ref#refs/heads/}"
}

project_name_color () {
 name=$(project_name)
  echo "%{\e[0;35m%}${name}%{\e[0m%}"
}

unpushed () {
  /usr/bin/env git cherry -v origin/$(git_branch) 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " %{$fg_bold[magenta]%}push it!%{$reset_color%} "
  fi
}

set_prompt () {
  typeset -A colorcode
  colorcode[black]=0
  colorcode[red]=1
  colorcode[green]=2
  colorcode[yellow]=3
  colorcode[blue]=4
  colorcode[magenta]=5
  colorcode[cyan]=6
  colorcode[white]=7
  colorcode[default]=9
  colorcode[k]=$colorcode[black]
  colorcode[r]=$colorcode[red]
  colorcode[g]=$colorcode[green]
  colorcode[y]=$colorcode[yellow]
  colorcode[b]=$colorcode[blue]
  colorcode[m]=$colorcode[magenta]
  colorcode[c]=$colorcode[cyan]
  colorcode[w]=$colorcode[white]
  colorcode[.]=$colorcode[default]

  local -A pc
  pc[divider]='black'
  pc[default]='default'
  pc[host]='Black'
  pc[shortpath]='default'
  pc[#]='Red'
  for cn in ${(k)pc}; do
    pc[${cn}]=$(colorword $pc[$cn])
  done
  pc[reset]=$(colorword . . 00)

  PROMPT="%{$reset_color%}"
  PROMPT+="$pc[host]%m%{$reset_color%} "
  PROMPT+="$pc[shortpath]%~%{$reset_color%} "
  PROMPT+="$(git_dirty)%{$reset_color%}"
  PROMPT+="$(need_push)%{$reset_color%}"
  PROMPT+="$pc[#]>%{$reset_color%} "

  export PROMPT RPROMPT
}

precmd() {
  title ${PWD##*/}
  set_prompt
}

update_terminal_cwd ()
{
    local SEARCH=' ';
    local REPLACE='%20';
    local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}";
    printf '\e]7;%s\a' "$PWD_URL"
}
