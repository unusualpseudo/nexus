# Configuring CoreDNS prior to flux

## Installing helmrelease manualy

```sh
yq .spec.values helmrelease.yaml \
  | helm template -n kube-system coredns coredns/coredns -f - \
  | kubectl -n kube-system apply -f -
```

You may need to add the cordedns helm repository

```sh
helm repo add coredns https://coredns.github.io/helm
```

## Add flux missing annotations manualy

```sh
  kubectl -n kube-system patch serviceaccount coredns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-namespace": "kube-system"}}}'
  kubectl -n kube-system patch serviceaccount coredns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-name": "coredns"}}}'
  kubectl -n kube-system patch serviceaccount coredns --type=merge -p '{"metadata": {"labels": {"app.kubernetes.io/managed-by": "Helm"}}}'
  kubectl -n kube-system patch clusterrole coredns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-namespace": "kube-system"}}}'
  kubectl -n kube-system patch clusterrole coredns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-name": "coredns"}}}'
  kubectl -n kube-system patch clusterrole coredns --type=merge -p '{"metadata": {"labels": {"app.kubernetes.io/managed-by": "Helm"}}}'
  kubectl -n kube-system patch clusterrolebinding coredns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-namespace": "kube-system"}}}'
  kubectl -n kube-system patch clusterrolebinding coredns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-name": "coredns"}}}'
  kubectl -n kube-system patch clusterrolebinding coredns --type=merge -p '{"metadata": {"labels": {"app.kubernetes.io/managed-by": "Helm"}}}'
  kubectl -n kube-system patch deployment coredns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-namespace": "kube-system"}}}'
  kubectl -n kube-system patch deployment coredns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-name": "coredns"}}}'
  kubectl -n kube-system patch deployment coredns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-namespace": "kube-system"}}}'
  kubectl -n kube-system patch service kube-dns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-namespace": "kube-system"}}}'
  kubectl -n kube-system patch service kube-dns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-name": "coredns"}}}'
  kubectl -n kube-system patch service kube-dns --type=merge -p '{"metadata": {"labels": {"app.kubernetes.io/managed-by": "Helm"}}}'
  kubectl -n kube-system patch service kube-dns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-name": "coredns"}}}'
  kubectl -n kube-system patch service kube-dns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-namespace": "kube-system"}}}'
  kubectl -n kube-system patch service coredns-metrics --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-namespace": "kube-system"}}}'
  kubectl -n kube-system patch service coredns-metrics --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-name": "coredns"}}}'
  kubectl -n kube-system patch service coredns-metrics --type=merge -p '{"metadata": {"labels": {"app.kubernetes.io/managed-by": "Helm"}}}'
  kubectl -n kube-system patch configmap coredns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-namespace": "kube-system"}}}'
  kubectl -n kube-system patch configmap coredns --type=merge -p '{"metadata": {"annotations": {"meta.helm.sh/release-name": "coredns"}}}'
  kubectl -n kube-system patch configmap coredns --type=merge -p '{"metadata": {"labels": {"app.kubernetes.io/managed-by": "Helm"}}}'
```

[Reference](https://github.com/haraldkoch/kochhaus-home/tree/main/kubernetes/apps/kube-system/coredns/app)
