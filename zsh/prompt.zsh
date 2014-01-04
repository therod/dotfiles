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
    echo ""
  else
    if [[ $st == "nothing to commit, working directory clean" ]]
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

project_name () {
  name=$(pwd | awk -F'Development/' '{print $2}' | awk -F/ '{print $1}')
  echo $name
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

  typeset -A attcode
  attcode[none]=00
  attcode[bold]=01
  attcode[faint]=02
  attcode[standout]=03
  attcode[underline]=04
  attcode[blink]=05
  attcode[reverse]=07
  attcode[conceal]=08
  attcode[normal]=22
  attcode[no-standout]=23
  attcode[no-underline]=24
  attcode[no-blink]=25
  attcode[no-reverse]=27
  attcode[no-conceal]=28

  local -A pc
  pc[divider]='black'
  pc[default]='default'
  pc[date]='cyan'
  pc[time]='Blue'
  pc[host]='Green'
  pc[user]='cyan'
  pc[punc]='yellow'
  pc[line]='magenta'
  pc[hist]='green'
  pc[path]='Cyan'
  pc[shortpath]='default'
  pc[rc]='red'
  pc[scm_branch]='green'
  pc[scm_commitid]='Yellow'
  pc[scm_status_dirty]='Red'
  pc[scm_status_staged]='Green'
  pc[scm_time_short]='green'
  pc[scm_time_medium]='yellow'
  pc[scm_time_long]='red'
  pc[scm_time_uncommitted]='Magenta'
  pc[#]='Yellow'
  for cn in ${(k)pc}; do
    pc[${cn}]=$(colorword $pc[$cn])
  done
  pc[reset]=$(colorword . . 00)

  PROMPT="$pc[divider]\$(repeat \$COLUMNS printf '-')$pc[reset]"
  PROMPT+="$pc[host]%m$pc[reset]"
  PROMPT+=":$pc[shortpath]%1~$pc[reset]"
  PROMPT+="$(git_dirty)$reset_color"
  PROMPT+="$(need_push)$reset_color"
  PROMPT+=" $pc[#]\$$pc[reset] "

  export PROMPT RPROMPT
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
