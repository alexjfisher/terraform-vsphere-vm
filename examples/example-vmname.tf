// Single VM deployment with literal name
module "example-server-single" {
  source        = "Terraform-VMWare-Modules/vm/vsphere"
  version       = "Latest X.X.X"
  vmtemp        = "TemplateName"
  instances     = 1
  vmname        = "liternalvmname"
  vmrp          = "esxi/Resources"
  network = {
    "Name of the Port Group in vSphere" = ["10.13.113.2"]
  }
  dc        = "Datacenter"
  datastore = "Data Store name(use datastore_cluster for datastore cluster)"
}

# Vmname Output -> liternalvmname

// Example of multiple VM deployment with complex naming standard
# Define Environment Variable to switch between Environments
variable "env" {
  default = "dev"
}
module "example-server-multi" {
source        = "Terraform-VMWare-Modules/vm/vsphere"
  version       = "Latest X.X.X"
  vmtemp        = "TemplateName"
  instances     = 2
  vmname        = "advancevm"
  vmnameformat = "%03d${var.env}"
  vmrp          = "esxi/Resources"
  network = {
    "Name of the Port Group in vSphere" = ["10.13.113.2", ""]
  }
  dc        = "Datacenter"
  datastore = "Data Store name(use datastore_cluster for datastore cluster)"
}

# Vmname Output -> advancevm001dev, advancevm002dev