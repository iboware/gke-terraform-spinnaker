#provider "helm" {
#  version        = "~> 0.9"
#  install_tiller = true
#  
#  kubernetes {
#    host                   = google_container_cluster.primary.endpoint
#    client_certificate     = base64decode(google_container_cluster.primary.master_auth.0.client_certificate)
#    client_key             = base64decode(google_container_cluster.primary.master_auth.0.client_key)
#    cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
#  }
#}