kubectl -n fb-cockroach delete -f cockroach.yaml
kubectl -n fb-cockroach delete pvc --all
kubectl -n fb-cockroach delete -f https://raw.githubusercontent.com/cockroachdb/cockroach/master/cloud/kubernetes/cluster-init.yaml