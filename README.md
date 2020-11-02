# Provision a GKE Cluster with Spinnaker
Using GCP we deploy a Kubernetes Cluster


## Install and configure GCloud

First, install the [Google Cloud CLI](https://cloud.google.com/sdk/docs/quickstarts) 
and initialize it.

```shell
$ gcloud init
```

Once you've initialized gcloud (signed in, selected project), add your account 
to the Application Default Credentials (ADC). This will allow Terraform to access
these credentials to provision resources on GCloud.

```shell
$ gcloud auth application-default login
```

## Initialize Terraform workspace and provision GKE Cluster

Configure the provider and initialize it with the values provided in the `terraform.tfvars` file.

```shell
$ terraform init
```

Then, provision your GKE cluster by running `terraform apply`.

```shell
$ terraform apply
```

## Configure kubectl

Configure kubetcl by running the following command:

```shell
$ gcloud container clusters get-credentials $(terraform output kubernetes_cluster_name) --region $(terraform output region)
```
## Install nginx-ingress

Install nginx-ingress:
```shell
$ helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
$ helm install my-release ingress-nginx/ingress-nginx
```

## Install  cert-manager
Install cert-manager via helm:
```shell
$ helm repo add jetstack https://charts.jetstack.io
$ kubectl create ns cert-manager
$ helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --version v1.0.4 \
  --set installCRDs=true
  ```

