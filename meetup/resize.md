kubectl get pvc -l app=cockroachdb -o name | xargs kubectl patch -p='{"spec": {"resources": {"requests": {"storage": "2000Gi"}}}}'

kubectl rollout restart statefulset cockroachdb
