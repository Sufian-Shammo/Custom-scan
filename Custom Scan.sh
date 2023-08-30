#!/bin/bash

# Function to display the menu and prompt for tool selection
show_menu() {
    echo "Select a tool to use:"
    echo "1. Nmap"
    echo "2. Nikto"
    echo "3. WPScan"
    echo "0. Exit"
}

# Function to perform an Nmap scan
run_nmap() {
    read -p "Enter the IP address you want to scan with Nmap: " ip_address
    nmap -T4 -sV "$ip_address"
}

# Function to perform a Nikto scan
run_nikto() {
    read -p "Enter the URL you want to scan with Nikto: " url
    nikto -h "$url"
}

# Function to perform a WPScan scan
run_wpscan() {
    read -p "Enter the URL of the WordPress site you want to scan with WPScan: " url
    wpscan --url "$url"
}

# Main script
while true; do
    show_menu
    read -p "Enter your choice (0-3): " choice

    case "$choice" in
        0)
            echo "Exiting the script."
            break
            ;;
        1)
            run_nmap
            ;;
        2)
            run_nikto
            ;;
        3)
            run_wpscan
            ;;
        *)
            echo "Invalid choice. Please enter a valid option (0-3)."
            ;;
    esac
done
