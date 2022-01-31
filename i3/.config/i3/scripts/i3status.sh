#!/bin/sh
i3status | while :
do
  DND_PAUSED=$(dunstctl is-paused)
  if [ "$DND_PAUSED" = "true" ]; then DND_INDICATOR="🔕 "; else DND_INDICATOR=""; fi
  read default_status
  echo "$DND_INDICATOR$default_status" || exit 1
done
