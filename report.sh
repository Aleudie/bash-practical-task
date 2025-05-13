#!/bin/bash

: "${1?"USAGE: [string:output_file]"}"

OUTPUT="$1"

echo "" > "$OUTPUT"
{
    echo "Date & Time: $(date)"
    echo "Username: $USER"
    echo "Hostname: $(hostname)"
    echo "External IP Address: $(curl -s icanhazip.com)"
    echo "System Uptime: $(uptime)"
    echo "Disk Used: $(df -h | grep '/$' | awk '{print $3}')"
    echo "Disk Free: $(df -h | grep '/$' | awk '{print $4}')"
} >> "$OUTPUT"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    {
        echo "Linux Distribution: $(lsb_release -d | awk -F'\t' '{print $2}')"
        echo "Internal IP Address: $(hostname -I | awk '{print $1}')"
        echo "RAM Total in GB: $(free -h | grep "Mem:" | awk '{print $2}')"
        echo "RAM Free in GB: $(free -h | grep "Mem:" | awk '{print $4}')"
        echo "CPU Cores: $(nproc)"
        echo "CPU Frequency in GHz: $( < /proc/cpuinfo grep "MHz" | head -n 1 | awk '{print $4/1000}') GHz"
    } >> "$OUTPUT"

elif [[ "$OSTYPE" == "darwin"* ]]; then
    {
        echo "macOS Version: $(sw_vers -productName) $(sw_vers -productVersion)"
        echo "Internal IP Address: $(ipconfig getifaddr en0)"
        echo "RAM Total in GB: $(sysctl -n hw.memsize | awk '{print $1/1024/1024/1024}') GB"
        echo "RAM Free in GB: $(vm_stat | grep "Pages free" | awk '{print $3/1024/1024/1024*4096}') GB"
        echo "CPU Cores: $(sysctl -n hw.physicalcpu)"
        echo "CPU Frequency in GHz: $(sysctl -n hw.cpufrequency | awk '{print $1/1000000000}') GHz"
    } >> "$OUTPUT"
fi