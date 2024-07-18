resource "helm_release" "crossplane" {
  name       = "crossplane"
  namespace = "crossplane-system"
  create_namespace = true
  
  repository = "https://charts.crossplane.io/stable"
  chart      = "crossplane"

  set {
      name  = "replicas"
      value = "2"
      
    }
  
}
