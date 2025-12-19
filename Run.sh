#!/bin/bash

# Ensure the script is executable (itself)
chmod +X "$0"

# Navigate to the folder containing the shell script
cd "$(dirname "$0")" || { echo "Failure"; Exit 1;}

# Function to display the menu
show_menu() {
    echo "Select a scenario to run:"
    echo "1) Baseline"
    echo "2) wA_Baseline"
    echo "3) REF"
    echo "4) wA_REF"
    echo "5) APS"
    echo "6) wA_APS"
    echo "7) Generate Graphs"
    echo "8) Exit"
}

# Function to execute the selected script
run_script() {
    case $1 in
        1)
            screen -S Baseline -dm
            bash -c ./1-Baseline/RunBaseline_Mac_Server.sh  
            ;;
        2)
            screen -S wA_Baseline -dm
            bash -c ./2-wA_Baseline_scenario/Run-wA-Baseline_Mac_Server.sh
            ;;

        3)
            screen -S wA_REF -dm
            bash -c ./3-REF/RunREF_Mac_Server.sh
            ;;

        4)
            screen -S OptA -dm
            bash -c ./4-wA_REF/RunOptA_Mac_Server.sh
            ;;
        5)
            screen -S APS -dm
            bash -c ./5-APS/RunAPS_Mac_Server.sh
            ;;
        6)
            screen -S wA_APS -dm
            bash -c ./6-wA_APS/Run_wA_APS_Mac_Server.sh
            ;;

        7)
            bash ./Graphs.sh
            ;; 
        8)  
            echo "Exiting."
            exit 0
            ;;       

        *)
            echo "Invalid option, please select again."
            ;;
    esac
}

# Loop to keep the menu active until the user exits
while true; do
    show_menu
    read -p "Enter your choice [1-9]: " choice
    run_script $choice
done