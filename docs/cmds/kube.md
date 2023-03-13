<img src="static/k8s.png" alt="drawing" width="40"/>

```bash
kubectl get gitrepositories -A
```

```bash
kubectl get kustomizations -A
```

```bash
kubectl get helmreleases -A
```

```bash
kubectl get events -o wide
```

```bash
kubectl get pods --all-namespaces -o wide
```

```bash
kubectl get pods --namespace <namespace_name> -o wide
```

```bash
kubectl describe pod <pode_name>
```

```bash
# Path a pvc for delete
kubectl patch pv db-backup -p '{"metadata":{"finalizers":null}}'
```

```bash
kubectl taint nodes --all node-role.kubernetes.io/master-
```

```bash
kubectl get svc -w -n jenkins
```

```bash
kubectl -n kube-system rollout restart daemonsets,deployments
```

```bash
kubectl delete all --all -n {namespace}
```

```bash
sudo systemctl restart kubelet
```

```bash
kubectl get storageclasses --all-namespaces
```

```bash
# Cert manager:  main ingress resource -> certificate -> certificaterequest -> order -> challenge -> challenge ingress
kubectl get cert -A
kubectl describe cert lets-certificate
kubectl get certificaterequest -A
kubectl get order
kubectl get challenge
```

```bash
# Display kubeconfig
kubectl config view
```

```bash
# Debuging
sudo journalctl -u kubelet -f
```

<img src="static/flux.png" alt="drawing" width="40"/>

```bash
# Check prerequisites
flux check --pre
```

```bash
# Install the latest version of Flux
flux install
```

```bash
# List GitRepository sources and their status
flux get sources git
```

```bash
flux get kustomizations --watch
```

```bash
flux get kustomizations 
```

```bash
kubectl describe kustomization flux-system -n flux-system
```

```bash
# Trigger a GitRepository source reconciliation
flux reconcile source git flux-system
```

```bash
# Trigger a git sync of the Kustomization's source and apply changes
flux reconcile kustomization webapp-dev --with-source
```

```bash
# Suspend a Kustomization reconciliation
flux suspend kustomization webapp-dev
```

```bash
# Export Kustomizations in YAML format
flux export kustomization --all > kustomizations.yaml
```

```bash
# Resume a Kustomization reconciliation
flux resume kustomization webapp-dev
```

```bash
# Delete a Kustomization
flux delete kustomization webapp-dev
```

```bash
# Delete a GitRepository source
flux delete source git webapp-latest
```

```bash
# Uninstall Flux and delete CRDs
flux uninstall
```

```bash
flux tree kustomization infrastructure
```

<img src="static/helm.png" alt="drawing" width="40"/>

```bash
# List all the releases
helm list --all --all-namespaces
```

```bash
# To uninstall a release
helm uninstall <release-name> -n <namespace>
```

