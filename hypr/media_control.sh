#!/bin/bash

CMD=$1

if pgrep mpd >/dev/null; then
  case "$CMD" in
  play-pause) mpc toggle ;;
  next) mpc next ;;
  previous) mpc prev ;;
  esac
else
  case "$CMD" in
  play-pause) playerctl play-pause ;;
  next) playerctl next ;;
  previous) playerctl previous ;;
  esac
fi
