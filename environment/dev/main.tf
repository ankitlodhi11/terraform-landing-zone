module "tinku" {
  source = "../../modules/Resourec_Group"
  rgs    = var.rgs
}

module "kiran_lodhi" {
  source = "../../modules/storage_account"
  stg    = var.stg
  depends_on = [module.tinku]
}
module "virtualnetwork" {
  source = "../../modules/virtual_network"
  vnets  = var.vnets
  depends_on = [module.tinku]
}

module "subnet" {
  source = "../../modules/subnet"
  subnets = var.subnets
  depends_on = [module.virtualnetwork]
}