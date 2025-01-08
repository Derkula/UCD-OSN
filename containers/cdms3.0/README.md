Singularity version 3.0 to include rclone and ROOT.

The purpose is to access the public CDMS UMN data.


<b>Building the Container</b>

Clone the [UMNdev](https://gitlab.com/supercdms/Reconstruction/cdmsbats/-/tree/UMNdev?ref_type=heads) branch of the cdmsbats reconstruction repository.

make sure the .config/rclone/rclone.conf directory is present

build the container
```bash
apptainer build cdms3.0.sif root5_Singularity.def
```

The definition file will copy the cdmsbats repository, and the rclone config files into the container

More information about the s3 bucket: https://github.com/nsdf-fabric/nsdf-slac