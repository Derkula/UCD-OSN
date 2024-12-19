Singularity version 2.0 for built in cdmsbats environment with ROOT.


<b>Building the Container</b>

Clone the [UMNdev](https://gitlab.com/supercdms/Reconstruction/cdmsbats/-/tree/UMNdev?ref_type=heads) branch of the cdmsbats reconstruction repository.

build the container
```bash
apptainer build cdms2.0.sif root5_Singularity.def
```

The definition file will copy the cdmsbats repository into the repository.
