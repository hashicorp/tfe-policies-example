terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "hashicorp-v2"

    workspaces {
      name = "tfe-policies-example"
    }
  }
}

variable "tfe_token" {}

variable "tfe_hostname" {
  description = "The domain where your TFE is hosted."
  default     = "app.terraform.io"
}

variable "tfe_organization" {
  description = "The TFE organization to apply your changes to."
  default     = "hashicorp-v2"
}

provider "tfe" {
  hostname = "${var.tfe_hostname}"
  token    = "${var.tfe_token}"
  version  = "~> 0.3"
}

resource "tfe_sentinel_policy" "passthrough" {
  name         = "passthrough"
  description  = "Just passing through! Always returns 'true'."
  organization = "${var.tfe_organization}"
  policy       = "${file("./passthrough.sentinel")}"
  enforce_mode = "advisory"
}

resource "tfe_policy_set" "global" {
  name         = "global"
  description  = "This set has been created for you to maintain previous behavior. Feel free to re-organize your policies as you see fit. For more information about policy sets, see Terraform Enterprise's [Sentinel documentation](https://www.terraform.io/docs/enterprise/sentinel/manage-policies.html)."
  organization = "${var.tfe_organization}"
  global       = true
  policy_ids   = ["${tfe_sentinel_policy.passthrough.id}"]
}
