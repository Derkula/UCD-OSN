Singularity version 4.0 to include awscli.

The purpose is to access the public CDMS UMN data.

Building ROOT is omitted for the sake of saving time to test the s3 function.


<b>Building the Container</b>

Clone the [UMNdev](https://gitlab.com/supercdms/Reconstruction/cdmsbats/-/tree/UMNdev?ref_type=heads) branch of the cdmsbats reconstruction repository.

Ensure the .aws folder is present

build the container
```bash
apptainer build cdms4.0.sif root5_Singularity.def
```

The definition file will copy the cdmsbats repository, and the .aws config files into the container

More information about the s3 bucket: https://github.com/nsdf-fabric/nsdf-slac