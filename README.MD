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

# Secrets
Securely stores a piece of information in the cluster, such as a database password

<table>
  <tr>
    <th>kubectl</th>
    <th>create</th>
    <th>secret</th>
    <th>generic</th>
    <th>secret_name</th>
    <th>--from-literal</th>
    <th>key=value</th>
  </tr>
  <tr>
    <td/>
    <td>Imperative command to create a new object</td>
    <td>Type of object we are going to create</td>
    <td>Type of secret</td>
    <td>Name of secret for later reference in pod config</td>
    <td>We are going to add the secret information into this command, as opposed to from file.</td>
    <td>Key-Value pair of the secret information</td>
  </tr>
</table>

Example:
<table><tr><td>kubectl create secret generic pgpassword --from-literal PGPASSWORD=my_password</td></tr></table>

# LoadBalancer Service
Use Ingress Service instead. New way of network traffic control
Only ONE Load Balancer

# Ingress Service (nginx type)
Community led project: http://github.com/kubernetes/ingress-nginx
* Installation instructions on: https://kubernetes.github.io/ingress-nginx/deploy/
* Setup changes depending on your environment
* It's a controller not a router!!
* It watches for changes to the ingress and updates the 'thing' that handles traffic!
* you use this instead of setting it up on your own because the ingress service will make sure that one connection remains on the same POD (session of users!!)

NOT Kubernetes-ingress: a project led by nginx company: http://github.com/nginxinc/kubernetes-ingress

## Optional info on Ingress Nginx
Just in case you wanted to understand ingress-nginx a bit better, check out this article by Hongli Lai - https://www.joyfulbikeshedding.com/blog/2018-03-26-studying-the-kubernetes-ingress-system.html.  Hongli is an absolute genius, he co-created Phusion Passenger, an extremely popular webserver that integrates with Nginx.