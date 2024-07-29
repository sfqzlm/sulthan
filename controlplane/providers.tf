terraform {
  required_providers {

    kind = {
      source = "tehcyx/kind"
      version = "0.5.1"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.14.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.31.0"
    }
  }
}

provider "kind" {
  # Configuration options
}

provider "helm" {
  kubernetes {
    host                   = kind_cluster.controlplane.endpoint 
    client_certificate     = kind_cluster.controlplane.client_certificate
    client_key             = kind_cluster.controlplane.client_key
    cluster_ca_certificate = kind_cluster.controlplane.cluster_ca_certificate
  }
}

provider "kubernetes" {
    host                   = kind_cluster.controlplane.endpoint 
    client_certificate     = kind_cluster.controlplane.client_certificate
    client_key             = kind_cluster.controlplane.client_key
    cluster_ca_certificate = kind_cluster.controlplane.cluster_ca_certificate
}