#!/bin/bash

# Get CPU info
cpu_info=$(sysctl -n machdep.cpu.brand_string)

if echo "$cpu_info" | grep -qi "Intel"; then
  echo "Use \"$cpu_info\" setting"
    echo "  Overwrite zshrc"
  cp ~/.zshrc ~/.zshrc.bak
  cp ./.zshrc ~/.zshrc
  echo "  Overwrite vimrc"
  cp ~/.vimrc ~/.vimrc.bak
  cp ./.vimrc ~/.vimrc
elif echo "$cpu_info" | grep -qi "M1"; then
  echo "Use \"$cpu_info\" setting"
  echo "  Overwrite zshrc"
  cp ~/.zshrc ~/.zshrc.bak
  cp ./.zshrc_m1 ~/.zshrc
  echo "  Overwrite vimrc"
  cp ~/.vimrc ~/.vimrc.bak
  cp ./.vimrc ~/.vimrc
  echo "Done"
else
  echo "error: Device Unknown"
fi
