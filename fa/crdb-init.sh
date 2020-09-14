kubectl -n fa-cockroach create -f https://raw.githubusercontent.com/cockroachdb/cockroach/master/cloud/kubernetes/cluster-init.yaml
echo "Start the DB"
#sleep 60
#echo "Make some TPC-C Data"
#cockroach workload init tpcc --warehouses=1000 'postgresql://root@crdb.fsa.lab:26257?sslmode=disable'


# kubectl delete -f https://raw.githubusercontent.com/cockroachdb/cockroach/master/cloud/kubernetes/cluster-init.yaml
