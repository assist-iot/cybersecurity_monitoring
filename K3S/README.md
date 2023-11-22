### K3S DEPLOYMENT FOR SIEM AND SOAR
Services and deployments manifests for deploying SIEM and SOAR services in a K3S enviroment.

Further work we will create a helm package for the mentioned services.

### HELM
Helm is a packet manager for Kubernetes.

https://helm.sh/

To use helm we need a Kubernetes cluster and had helm installed.

```
k3s
```
Install helm

```
$ sudo snap install helm --classic
```

Add the repository of the helm charts on local to let the deployment ready and available.

```
$ helm repo add bitnami https://charts.bitnami.com/bitnami
```
Make a repo search.
```
$ helm search repo bitnami |more
```
```
NAME                                            CHART VERSION   APP VERSION     DESCRIPTION
bitnami/bitnami-common                          0.0.9           0.0.9           DEPRECATED Chart with custom templates used in ...
bitnami/airflow                                 11.1.11         2.2.2           Apache Airflow is a platform to programmaticall...
bitnami/apache                                  8.10.1          2.4.51          Chart for Apache HTTP Server
bitnami/argo-cd                                 2.0.17          2.2.0           Declarative, GitOps continuous delivery tool fo...
bitnami/argo-workflows                          0.1.11          3.2.5           Argo Workflows is meant to orchestrate Kubernet...
bitnami/aspnet-core                             2.0.3           3.1.22          ASP.NET Core is an open-source framework create...
bitnami/cassandra                               9.0.9           4.0.1           Apache Cassandra is a free and open-source dist...
bitnami/cert-manager                            0.1.28          1.6.1           Cert Manager is a Kubernetes add-on to automate...
bitnami/common                                  1.10.3          1.10.0          A Library Helm Chart for grouping common logic ...
bitnami/concourse                               0.1.15          7.6.0           Concourse is a pipeline-based continuous thing-...
bitnami/consul                                  10.1.8          1.11.1          Highly available and distributed service discov...
bitnami/contour                                 7.0.7           1.19.1          Contour Ingress controller for Kubernetes
bitnami/contour-operator                        0.2.2           1.19.1          The Contour Operator extends the Kubernetes API...

```
Listing helm repos

```
$ helm repo list
```

```
NAME    URL
bitnami https://charts.bitnami.com/bitnami
```
