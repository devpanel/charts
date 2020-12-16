# DevPanel Helm Charts

This is the official Helm Charts repository for installing DevPanel on Kubernetes.

## Setup

```bash
$ helm repo add devpanel http://charts.devpanel.com;
$ helm repo update

# Helm 3
$ helm repo add devpanel https://charts.devpanel.com
$ helm install devpanel/basic-hpa --generate-name
```

## License

<!-- Keep full URL links to repo files because this README syncs from master to main.  -->
[Apache 2.0 License](https://github.com/devpanel/charts/blob/main/LICENSE).
