#!/bin/zsh

journalctl -o short-full -n 1 | cut -b 36-
