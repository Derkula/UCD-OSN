Information about the public CDMS UMN Data bucket is here: [nsdf-slac](https://github.com/nsdf-fabric/nsdf-slac)
### cdms.sif
Initial container built with ROOT
Using this container requires sourcing the environment variables from an external directiory. which normally is the UMNDev branch of the CDMSBATS repository on gitlab.

### cdms2.0.sif
Second build, with the UMNDev branch built into the container
Using this container allows sourcing environment variables from the container's internal directory.

This is the ideal container for running simple jobs on the OS Pool

### cdms3.0.sif 
Third build, with built in environment variables, and rclone installed
The purpose of this container is to pull data sets from the public UMN bucket, then process that data set.

<b>Not working.</b>
The config directories for rclone were not built properly, and cdms3.0.sif will need to be rebuilt in necessary

### cdms4.0.sif
Fourth build, with built in environment variables, and awscli installed.
This container is also meant to pull data sets from the public UMN bucket, and process that dataset. 

<b> Is working, partially </b>
When testing on a local machine, the container will access the bucket, and pull data. 
When testing on the OSPool access point, the container will access the bucket, not sure about pulling data.
When testing via condor_submit file, the container is unable to access the bucket
