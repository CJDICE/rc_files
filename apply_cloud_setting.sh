#!/bin/bash

# Get CPU info
cpu_info=$(sysctl -n machdep.cpu.brand_string)

if echo "$cpu_info" | grep -qi "Intel"; then
  echo "$cpu_info"
else
  echo "Use $cpu_info setting"
  mv ~/.zshrc ~/.zshrc.bak
  cp ./zshrc_m1 ~/.zshrc
fi
