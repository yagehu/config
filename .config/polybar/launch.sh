#!/usr/bin/env bash

killall -q polybar

echo "---" >> /tmp/polybar.log
polybar -r float >> /tmp/polybar.log 2>&1 & disown
