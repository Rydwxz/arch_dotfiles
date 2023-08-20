#!/bin/zsh

new_journal=$(journalctl -o cat -n 1)
old_journal=$(cat ./dyn_msg/journal.dat)

if [[ "$new_journal" != "$old_journal" ]]; then
    echo "$new_journal" | cat > ./dyn/msg/journal.dat
fi

echo "$new_journal"
