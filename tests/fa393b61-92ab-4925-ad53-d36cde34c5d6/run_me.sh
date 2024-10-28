#!/bin/bash

# Error handler
set -e

# Environment
# Pre-instructions
export PYTHONPATH=code/263259/HH_project/:code/263259/HH_project/single_cell_models/:$PYTHONPATH; pip install numpy==1.21.0

# PIP list
pip3 list

# Start Watchdog
watchmedo shell-command --command='echo "${watch_src_path} ${watch_dest_path}" >> watchdog_log.txt' --patterns="*" --ignore-patterns='watchdog_log.txt' --ignore-directories --recursive /QPoABt/ & WATCHDOG_PID=$!;

# RUN
python3 code/263259/HH_project/network_simulations/ntwk_sim_demo.py --CONFIG 'HH_RS--HH_FS--CONFIG1' --tstop 5000 -f code/263259/HH_project/network_simulations/data/example.npy

# Stop Watchdog
kill -s 9 "${WATCHDOG_PID}";

