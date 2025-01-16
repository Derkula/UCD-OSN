#!/bin/bash/

export RCLONE_CONFIG=/.config/rclone/rclone.conf
export BATROOT_PROC=$CDMSBATSDIR/UserSettings/BatRootSettings/processing
export BATROOT_CONST=$CDMSBATSDIR/UserSettings/BatRootSettings/analysis

export CDMS_BATCOMMON=$CDMSBATSDIR/BatCommon
export BATROOT_RAWDATA=$_CONDOR_SCRATCH_DIR

export BATROOT_NOISEFILES=$_CONDOR_SCRATCH_DIR
export BATROOT_RQDATA=$_CONDOR_SCRATCH_DIR
export BATCALIB_RQDATA=cdmsbats_work/rq
export BATCALIB_RRQDATA=cdmsbats_work/rrq
export BATROOT_AUXFILES=cdmsbats_work/aux
export BATROOT_GPIBFILES=cdmsbats_work/gpib

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CDMSBATSDIR/BUILD/lib
export PATH=$PATH:$CDMSBATSDIR/BUILD/bin


