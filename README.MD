# Cluster IP Service
ClusterIP service can't be reached from outside (differs from NodePort service)

To expose to outside we will use a Ingress Service

# Extra info
Combine k8s files with the "---" between the configuration in ONE file

# Persistent Volume VS Persistent Volume Claim  VS Volume (docker)
## Volume (Docker / Kubernetes)
* (Docker / Kubernetes) Volume will exist inside the POD --> so when POD dies our Volume will be gone too!!
## Persistent Volume Claim
Billboard Advertising what can be asked

Possible access modes:
* ReadWriteOnce: Can be used by a single node
* ReadOnlyMany: Multiple nodes can read from this
* ReadWriteMany: Can be read and written to by many nodes

## Persistent Volume
What kubernetes will provide to you based on your <b>Claim</b>
Statically provisioned
OR
Dynamically provisioned (only created when asked)
* A Persistent Volume will exists outside the POD
* Make sure data is persisted somewhere. So that in case of a crash of the pod everything can be restored. Like a shared file system.
* <b>An object that allows a container to store data at the pod level</b>
* <b>Not exactly</b> the same thing as a (Docker) Volume !!!
* Connecting two PODS to the same persistent volume is due for disaster.

### Storage classes
Tell kubernetes which provider to use for your storage (Google cloud, AWS, Azure, ...)