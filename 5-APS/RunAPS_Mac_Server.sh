#!/bin/bash

# Ensure the script is executable (itself)
chmod +x "$0"
# Navigate to the folder containing the shell script
cd "$(dirname "$0")" || { echo "Failure"; Exit 1;}

# Function to display the timer
display_timer() {
  start_time=$1
  while ps -p $gams_pid > /dev/null; do
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))

    # Convert to hours, minutes, and seconds
    hours=$((elapsed_time / 3600))
    minutes=$(( (elapsed_time % 3600) / 60 ))
    seconds=$((elapsed_time % 60))

    # Display the timer
    echo -ne "Elapsed time: $hours hours, $minutes minutes, $seconds seconds\r"
    sleep 1
  done
}

# Display message indicating the start of GAMS run
echo "--> GAMS run started"

# Capture the start time
start_time=$(date +%s)

# Run GAMS in the background and get its process ID (PID)
nohup gams main_APS.gms o=output_APS.lst s=restart.g00 action=CE gdx=GDX_APS > Terminal-Run-AD-MERGE.txt 2>&1 &
gams_pid=$!

# Start the timer in the background while the GAMS process runs
display_timer $start_time &

# Wait for GAMS to finish
wait $gams_pid

# Capture the end time
end_time=$(date +%s)

# Calculate the total elapsed time
elapsed_time=$((end_time - start_time))
hours=$((elapsed_time / 3600))
minutes=$(( (elapsed_time % 3600) / 60 ))
seconds=$((elapsed_time % 60))

# Check if the GAMS run was successful
if [ $? -eq 0 ]; then
  # If successful, print success message and total elapsed time
  echo -e "\nAPS run successful!"
  echo "Total elapsed time: $hours hours, $minutes minutes, $seconds seconds"

  # Sleep for 60 seconds
  sleep 20

  # Activate virtual environment
  echo "Activating virtual environment..."
  source ./../MERGE/bin/activate

  # Display message indicating the start of graph generation
  echo "--> Generating Graphs"

  # Define the path to your Python script and run it
  PYTHON_FILE="../AD-MERGE2.0-paper-plots.py"
  python3 "$PYTHON_FILE"

  # Display message indicating completion of graph generation
  echo "Graph generation complete!"

else
  # If failed, print failure message
  echo "GAMS run failed!"
fi
