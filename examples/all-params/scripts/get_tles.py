# Usage: python3 get_tles.py /path/to/tle_dir/ n
# Parameters:
#  /path/to/tle_dir/: directory containing only TLE files
#  n: 1 or 2, indicating the first or second half of the TLEs
# Output:
#  Prints a list of TLEs

import math
import os
import sys

tle_dir = ''
n = 0

if len(sys.argv)==2:
  tle_dir = sys.argv[1]
  if tle_dir[-1] != '/':
    tle_dir += '/'

else:
  print("Usage: python3 get_tles.py /path/to/tle_dir/")
  exit()

tles = os.listdir(tle_dir)
tles.sort()
ids = []
for i in range(0,len(tles)):
  ids.append(tles[i][0:-4])

outstr = ''
for e in ids:
  outstr += (e+' ')
print(outstr)
