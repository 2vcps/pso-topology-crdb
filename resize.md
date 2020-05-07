kubectl get pvc -l app=cockroachdb -o name | xargs kubectl patch -p='{"spec": {"resources": {"requests": {"storage": "200Gi"}}}}'

kubectl rollout restart statefulset cockroachdb
