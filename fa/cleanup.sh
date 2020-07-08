kubectl -n fa-cockroach delete -f cockroach.yaml
kubectl -n fa-cockroach delete pvc --all
kubectl -n fa-cockroach delete -f https://raw.githubusercontent.com/cockroachdb/cockroach/master/cloud/kubernetes/cluster-init.yaml