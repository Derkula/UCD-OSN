## Container information
Information about the public CDMS UMN Data bucket is here: [nsdf-slac](https://github.com/nsdf-fabric/nsdf-slac)

The individual build instructions for each version is over simplified, but detailed instructions to build the containers can be found here: [UMNdev](https://gitlab.com/supercdms/Reconstruction/cdmsbats/-/tree/UMNdev?ref_type=heads)

For all builds, you will need to clone the UMNdev branch into the build directory

The definition file is equipped with cdms environment variable setup, but is currently omitted while these variables are prone to change depending on the condor job's purpose 

<h3> cdms.sif </h3>
Initial container built with ROOT
Using this container requires sourcing the environment variables from an external directiory. which normally is the UMNDev branch of the CDMSBATS repository on gitlab.

<h3> cdms2.0.sif </h3>
Second build, with the UMNDev branch built into the container
Using this container allows sourcing environment variables from the container's internal directory.

This is the ideal container for running simple jobs on the OS Pool.

<h3> **cdms3.0.sif** </h3> 
Third build, with ROOT, cdmsbats (UMNDev branch), and rclone installed

The purpose of this container is to pull data sets from the public UMN bucket, then process that data set.

<b>Used for the following jobs:</b>
- [rclone_single](https://github.com/Derkula/UCD-OSN/tree/main/workflow/rclone_single)
- [mult_run](https://github.com/Derkula/UCD-OSN/tree/main/workflow/mult_run)

<b>NOTE: </b>

the rclone config directory defaults to the config for the machine the container was built on. When using this container, be sure to re-assign the config directory to the one built into the container.

- Examples of this are done in the jobs listed above

<h3> cdms4.0.sif </h3>
Fourth build, with ROOT, cdmsbats (UMNDev branch), and awscli installed.

This container is also meant to pull data sets from the public UMN bucket, and process that dataset, but is not functioning properly while inside the OSG condor environment.

This container is not used for anything, but will be kept here in case it can be used for another project.

