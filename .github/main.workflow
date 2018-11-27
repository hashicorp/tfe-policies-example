workflow "Sentinel" {
  resolves = ["sentinel-test", "terraform-fmt"]
  on = "pull_request"
}

action "sentinel-test" {
  uses = "thrashr888/sentinel-github-actions/test@v0.4"
  secrets = ["GITHUB_TOKEN"]
  env = {
    STL_ACTION_WORKING_DIR = "."
  }
}


action "terraform-fmt" {
  uses = "hashicorp/terraform-github-actions/fmt@v0.1"
  secrets = ["GITHUB_TOKEN"]
  env = {
    TF_ACTION_WORKING_DIR = "."
  }
}
