# Topology with Pure Service Orchestrator
Requires 
* k8s version with CSI Topology enabled.
* PSO 5.1.0 or newer

Walkthrough
1. Look at the new values.yaml for PSO Helm Chart also install PSO more info:

<https://github.com/purestorage/helm-charts/blob/master/pure-csi/values.yaml>

<https://github.com/purestorage/helm-charts/tree/master/pure-csi>

Remember you must have Labels for your FlashArrays and FlashBlades AND have the topology feature enabled in PSO before using this.
Example syntax use the helm chart for authoratative settings:
```
storagetopology:
  enable: true
  strictTopology: false
arrays:
  FlashArrays:
    - MgmtEndPoint: "1.2.3.4"
      APIToken: "a526a4c6-18b0-a8c9-1afa-3499293574bb"
      Labels:
        topology.purestorage.com/rack: "22"
        topology.purestorage.com/env: "prod"
        topology.purestorage.com/az: "west"
    - MgmtEndPoint: "1.2.3.5"
      APIToken: "b526a4c6-18b0-a8c9-1afa-3499293574bb"
      Labels:
        topology.purestorage.com/az: "east"
  FlashBlades:
    - MgmtEndPoint: "1.2.3.6"
      APIToken: "T-c4925090-c9bf-4033-8537-d24ee5669135"
      NfsEndPoint: "1.2.3.7"
      Labels:
        topology.purestorage.com/rack: "7b"
        topology.purestorage.com/env: "dev"
        topology.purestorage.com/az: "west"
```
2. Clone this demo repo
```
git clone git@github.com:2vcps/pso-topology-crdb.git
```
3. Label your compute nodes.
For Example:
```
kubectl label node demo-0 topology.purestorage.com/az=east
kubectl label node demo-1 topology.purestorage.com/az=west
kubectl label node demo-2 topology.purestorage.com/az=east
kubectl label node demo-3 topology.purestorage.com/az=east
kubectl label node demo-4 topology.purestorage.com/az=west
kubectl label node demo-5 topology.purestorage.com/az=west
```
4. Create the WaitForFirstConsumer Storage Class.
```
kubectl apply -f topology-sc.yaml
```
4. Edit your statefulset to use the nodeselector. This example is for CockroachDB. FA version is in the folder ./fa and FlashBlade is in ./fb
```
kubectl apply -f cockroach.yaml
# initialize the db
kubectl create -f https://raw.githubusercontent.com/cockroachdb/cockroach/master/cloud/kubernetes/cluster-init.yaml
```

Any questions? [@jon_2vcps](https://twitter.com/jon_2vcps) or file an issue.
