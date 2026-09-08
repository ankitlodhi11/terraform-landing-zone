module "resource_group" {
  source = "../../modules/Resource_Group"
  rgs    = var.rgs
}

module "storage_account " {
  source = "../../modules/storage_account"
  stg    = var.stg
  depends_on = [module.resource_group]
}
module "virtualnetwork" {
  source = "../../modules/virtual_network"
  vnets  = var.vnets
  depends_on = [module.resource_group]
}

# module "subnet" {
#   source = "../../modules/subnet"
#   subnets = var.subnets
#   depends_on = [module.virtualnetwork]
# }