#!/bin/bash
# Usage: ./setup_sample_configuration_files.sh
#
# setup_sample_configuration_files.sh
# A bash script that sets up sample configuration files
#
# Written by Bradley Denby
# Other contributors: None
#
# See the top-level LICENSE file for the license.
tles=$(python3 get_tles.py ./spire-config/tles)

cd ../../../scripts/gen-config/
for tle in $tles
do
  python3 generate_orbit_spaced_sat_files.py 1 \
 ../../examples/all-params/scripts/spire-config/$tle.tle \
 ../../examples/all-params/spire-configuration/
done

python3 generate_date_time_file.py ../../examples/all-params/spire-configuration/ \
 ../../examples/all-params/spire-configuration/
python3 generate_time_step_file.py 0 0 0 1000000 \
 ../../examples/all-params/spire-configuration/
python3 generate_num_steps_file.py 3.0 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/spire-configuration/time-step.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_solar_array_sat_files.py 24 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/scripts/spire-config/solar-array.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_capacitor_sat_files.py 24 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/scripts/spire-config/capacitor.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_adacs_sm_sat_files.py 24 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/scripts/spire-config/adacs-sm-sat.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_camera_sm_sat_files.py 24 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/scripts/spire-config/camera-sm-sat.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_computer_sm_sat_files.py 24 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/scripts/spire-config/computer-sm-sat.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_rx_sm_sat_files.py 24 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/scripts/spire-config/rx-sm-sat.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_tx_sm_sat_files.py 24 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/scripts/spire-config/tx-sm-sat.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_rx_sat_files.py 24 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/scripts/spire-config/rx-sat.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_tx_sat_files.py 24 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/scripts/spire-config/tx-sat.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_sensor_sat_files.py 24 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/scripts/spire-config/sensor.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_program_sat_files.py 24 \
 ../../examples/all-params/scripts/spire-config/starlink-1082-4493800000.tle \
 ../../examples/all-params/scripts/spire-config/program.dat \
 ../../examples/all-params/spire-configuration/
 #####
cp ../../examples/all-params/scripts/spire-config/constellation-0000000001.json \
 ../../examples/all-params/spire-configuration/
 #####
python3 generate_gnd_files.py 24 1 \
 ../../examples/all-params/scripts/spire-config/spire-gd.csv \
 ../../examples/all-params/spire-configuration/
python3 generate_rx_gnd_files.py \
 ../../examples/all-params/spire-configuration/ \
 ../../examples/all-params/scripts/spire-config/rx-gnd.dat \
 ../../examples/all-params/spire-configuration/
python3 generate_tx_gnd_files.py \
 ../../examples/all-params/spire-configuration/ \
 ../../examples/all-params/scripts/spire-config/tx-gnd.dat \
 ../../examples/all-params/spire-configurationspire-configuration/





















