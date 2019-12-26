#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/2018/exercise03/hls/tut3A/matrix_multiplier/solution3/.autopilot/db/a.g.bc ${1+"$@"}
