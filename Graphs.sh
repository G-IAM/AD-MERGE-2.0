#!/bin/bash

chmod +x "$0"
cd "$(dirname "$0")" || { echo "Failure"; exit 1;}

# Activate virtual environment
echo "Activating virtual environment..."
source .MERGE/bin/activate

# Display message indicating the start of graph generation
echo "--> Generating Graphs"

# Define the path to your Python script and run it
PYTHON_FILE="AD-MERGE2.0-paper-plots.py"
python3 "$PYTHON_FILE"

# Display message indicating completion of graph generation
echo "Graph generation complete!"

