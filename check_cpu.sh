#!/bin/bash

# Get CPU info
cpu_info=$(sysctl -n machdep.cpu.brand_string)

if echo "$cpu_info" | grep -qi "Intel"; then
  echo "$cpu_info"
else
  echo "$cpu_info"
fi
