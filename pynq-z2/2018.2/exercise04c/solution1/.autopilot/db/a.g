#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/carlos/Desktop/REPO/github/cpantel/TheZynqBook/pynq-z2/2018.2/exercise04c/solution1/.autopilot/db/a.g.bc ${1+"$@"}
