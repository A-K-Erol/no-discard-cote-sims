#!/bin/bash
# Usage: ./generate_constellation_state_pie_charts.sh
#
# generate_constellation_state_pie_charts.sh
# A bash script that generates state pie charts
#
# Written by Bradley Denby
# Other contributors: None
#
# See the top-level LICENSE file for the license.

if [ ! -d "../p3-env" ]
then
  cd ../
  ./setup_py_venv.sh
  cd ./all-params/
fi
# source ../p3-env/bin/activate
python3 generate_constellation_state_pie_chart.py \
 ../../examples/all-params/spire-configuration/num-steps.dat \
 ../../examples/all-params/spire-logs/ adacs ./state-pie-charts/
python3 generate_constellation_state_pie_chart.py \
 ../../examples/all-params/spire-configuration/num-steps.dat \
 ../../examples/all-params/spire-logs/ camera ./state-pie-charts/
python3 generate_constellation_state_pie_chart.py \
 ../../examples/all-params/spire-configuration/num-steps.dat \
 ../../examples/all-params/spire-logs/ computer ./state-pie-charts/
python3 generate_constellation_state_pie_chart.py \
 ../../examples/all-params/spire-configuration/num-steps.dat \
 ../../examples/all-params/spire-logs/ rx ./state-pie-charts/
python3 generate_constellation_state_pie_chart.py \
 ../../examples/all-params/spire-configuration/num-steps.dat \
 ../../examples/all-params/spire-logs/ tx ./state-pie-charts/
# deactivate
pdftk ./state-pie-charts/*.pdf cat output \
 ./state-pie-charts/state-pie-charts.pdf
