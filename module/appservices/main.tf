
module "appservices" {
  source  = "../../module/appservices"
  

  
  resource_group_name    = var.resource_group_name
  vnetwork_name          = var.vnetwork_name
  location               = var.location
  vnet_address_space     = var.vnet_address_space
  create_network_watcher = var.create_network_watcher
  subnet_name           = var.subnet_name
  subnet_address_prefix   = var.subnet_address_prefix
      
 

  # App service plan setttings and supported arguments. Default name used by module
  # To specify custom name use `app_service_plan_name` with a valid name.  
  # for Service Plans, see https://azure.microsoft.com/en-us/pricing/details/app-service/windows/  
  # App Service Plan for `Free` or `Shared` Tiers `use_32_bit_worker_process` must be set to `true`.
  service_plan = var.service_plan

  # App Service settings and supported arguments
  # Backup, connection_string, auth_settings, Storage for mounts are optional configuration
  app_service_name       = var.app_service_name
  enable_client_affinity = var.enable_client_affinity

  # A `site_config` block to setup the application environment. 
  # Available built-in stacks (windows_fx_version) for web apps `az webapp list-runtimes`
  # Runtime stacks for Linux (linux_fx_version) based web apps `az webapp list-runtimes --linux`
site_config = var.site_config

  # (Optional) A key-value pair of Application Settings
  app_settings = var.app_settings

  # The Backup feature in Azure App Service easily create app backups manually or on a schedule.
  # You can configure the backups to be retained up to an indefinite amount of time.
  # Azure storage account and container in the same subscription as the app that you want to back up. 
  # This module creates a Storage Container to keep the all backup items. 
  # Backup items - App configuration , File content, Database connected to your app
  enable_backup        = var.enable_backup
  storage_account_name = var.storage_account_name
  backup_settings = var.backup_settings

  # Regional VNet integration configuration
  # Enables you to place the back end of app in a subnet in virtual network in the same region
  enable_vnet_integration = var.enable_vnet_integration
  

  # By default App Insight resource is created by this module. 
  # Specify valid resource Id to `application_insights_id` to use existing App Insight
  # Specifies the type of Application by setting up `application_insights_type` with valid string
  # Specifies the retention period in days using `retention_in_days`. Default 90.
  # By default the real client ip is masked in the logs, to enable set `disable_ip_masking` to `true` 
  app_insights_name = var.app_insights_name

  # Adding TAG's to your Azure resources 
  tags = var.tags
}