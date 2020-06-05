echo "Make some TPC-C Data"
cockroach workload init tpcc --warehouses=100 'postgresql://root@crdb.dev.fsa.lab:26257?sslmode=disable'

