resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true

  # Очень важно! Ждем, пока создадутся ноды, иначе ArgoCD некуда будет устанавливаться
  depends_on = [aws_eks_node_group.danit]
}