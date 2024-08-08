output "generated_pet_name" {
  value = random_pet.test.id
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.default.name
}
