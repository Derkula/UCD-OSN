#!/bin/bash/

#export CDMSBATSDIR=/ospool/uc-shared/public/UCDenver_Roberts/UMNdev_cdmsbats/cdmsbats
#export BATNOISE_TEMPLATES=$HOME/Repositories/UMNdev_cdmsbats/cdmsbats_config/PulseTemplates
#export BATROOT_DETSTATUS=$HOME/Repositories/UMNdev_cdmsbats/cdmsbats_config/UserSettings/BatRootSettings/detector_status
export RCLONE_CONFIG=/.config/rclone/rclone.conf
export BATROOT_PROC=$CDMSBATSDIR/UserSettings/BatRootSettings/processing
export BATROOT_CONST=$CDMSBATSDIR/UserSettings/BatRootSettings/analysis

export CDMS_BATCOMMON=$CDMSBATSDIR/BatCommon
export BATROOT_RAWDATA=$_CONDOR_SCRATCH_DIR
#export BATROOT_RAWDATA=cdmsbats_work/raw/mid-gz/07180909_2316

#export BATROOT_NOISEFILES=cdmsbats_work/noise
export BATROOT_NOISEFILES=$_CONDOR_SCRATCH_DIR
export BATROOT_RQDATA=$_CONDOR_SCRATCH_DIR
export BATCALIB_RQDATA=cdmsbats_work/rq
export BATCALIB_RRQDATA=cdmsbats_work/rrq
export BATROOT_AUXFILES=cdmsbats_work/aux
export BATROOT_GPIBFILES=cdmsbats_work/gpib

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CDMSBATSDIR/BUILD/lib
export PATH=$PATH:$CDMSBATSDIR/BUILD/bin


printf "Envoiroment Source Complete"
