zk() {
  if [[ -z $1 ]]; then
    zk-search
  else
    local args="$@"
    nvim -c ":set autochdir" "$ZETTELKASTEN/$(date +"%Y%m%d%H%M") $args.md"
  fi
}

zk-tags-raw() {
  rg -o "#[\w\-_]{3,}" -t md -N --no-filename "$ZETTELKASTEN" |
    rg -v "^#(notes-|import-)" | \
    awk ' { tot[$0]++ } END { for (i in tot) print tot[i], "\t", i } ' | \
    gsort -r --numeric-sort
}

# can't get rg to work here for some reason..
# https://github.com/junegunn/fzf/issues/1846 for why no preview (can't nest!)
zk-tags() {
  zk-tags-raw | fzf \
    --bind "ctrl-o:execute-silent[tmux send-keys -t \{left\} Escape :read Space ! Space echo Space && \
            tmux send-keys -t \{left\} -l '\"\\'{2}'\"' && \
            tmux send-keys -t \{left\} Enter]" \
    --bind "ctrl-y:execute-silent(echo {2} | pbcopy),enter:execute[ggrep -F -i {2} *.md -l | fzf --ansi --height 100% --preview-window=top:0% --preview 'bat --language md --style plain \{}']"
}
alias zkt="zk-tags"

zk-search() {
  cd $ZETTELKASTEN

  fzf --ansi --height 100% --preview 'ruby ~/.bin/zettelkasten-search -f {} {q} | bat --language md --style=plain --color always' \
    --bind "ctrl-o:execute-silent:tmux send-keys -t \{left\} Escape :read Space ! Space echo Space && \
            tmux send-keys -t \{left\} -l \"\[\[{}\]\]\" && \
            tmux send-keys -t \{left\} Enter" \
    --bind "enter:execute-silent[ \
            tmux send-keys -t \{left\} Escape :e Space && \
            tmux send-keys -t \{left\} -l {} && \
            tmux send-keys -t \{left\} Enter \
            ]" \
    --bind "change:reload:ruby ~/.bin/zettelkasten-search '{q}'" \
    --bind "enter:execute:nvim {}" --phony --preview-window=top:65%
}
alias zks=zk-search

zkf() {
  cd $ZETTELKASTEN
  rg --files -t md | fzf --ansi --height 100% --preview "bat --language md --style plain {}" --preview-window=top:65%
}

zk-uniq() {
  rg --files -t md | rg -o "\A\d+" | sort | uniq -c | sort
}
