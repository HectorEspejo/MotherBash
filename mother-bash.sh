#!/bin/bash

# Function to gather and display system information
gather_info() {
    echo "Gathering system information..."

    # Display hostname and system time
    echo "Hostname and Time:"
    hostname
    date
    echo "--------------------------"

    # Operating system details
    echo "Operating System Details:"
    uname -a
    echo "--------------------------"

    # CPU details
    echo "CPU Details:"
    lscpu
    echo "--------------------------"

    # Memory information
    echo "Memory Information:"
    free -h
    echo "--------------------------"

    # Disk usage
    echo "Disk Usage:"
    df -h
    echo "--------------------------"

    # Network configuration
    echo "Network Configuration:"
    # Uncomment one of the following based on the availability on your system
    # ifconfig
    ip addr
    echo "--------------------------"

    # Running processes - Top 5 Memory usage
    echo "Top 5 Memory-Intensive Processes:"
    ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
    echo "--------------------------"

    # Running processes - Top 5 CPU usage
    echo "Top 5 CPU-Intensive Processes:"
    ps -eo %mem,%cpu,comm --sort=-%cpu | head -n 6
    echo "--------------------------"

    echo "Information gathering complete."

    echo "Made with love by Hector Espejo <3 (2024)"
}

# Capture the output of gather_info function
output=$(gather_info)

# Display the output
echo "$output"

# Ask the user if they want to save the output to a file
read -p "Do you want to save this information to a file? (Y/n) " answer

case $answer in
    [Yy]* )
        # If user answers Y or y, save the output to a file
        echo "$output" > sysInfo.txt
        echo "Information saved to sysInfo.txt"
        ;;
    * )
        # Otherwise, do nothing
        echo "Information not saved."
        ;;
esac
