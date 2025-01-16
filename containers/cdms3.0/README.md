## Singularity version 3.0

The purpose is to access the public CDMS UMN data.

The container builds with the cdmsbats UMNDev branch, ROOT, and rclone.


<b>Building the Container</b>

Clone the [UMNdev](https://gitlab.com/supercdms/Reconstruction/cdmsbats/-/tree/UMNdev?ref_type=heads) branch of the cdmsbats reconstruction repository to the build directory

make sure the .config/rclone/rclone.conf directory is present

build the container
```bash
apptainer build cdms3.0.sif root5_Singularity.def
```

The definition file will copy the cdmsbats repository, and the rclone config files into the container

<b>NOTE: </b>

The container's rclone config directory will default to the build machine's config location. When using this container, be sure to reassign this directory to the one built into the container. Unfortunately, this will need to be done with every use.

```bash
export RCLONE_CONFIG=/.config/rclone/rclone.conf
```


More information about the s3 bucket: https://github.com/nsdf-fabric/nsdf-slac