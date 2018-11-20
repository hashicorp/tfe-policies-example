workflow "Sentinel" {
  resolves = ["sentinel-fmt","sentinel-test", "terraform-fmt"]
  on = "pull_request"
}

action "sentinel-fmt" {
  uses = "thrashr888/sentinel-github-actions/fmt@v0.4"
  secrets = ["GITHUB_TOKEN"]
  env = {
    STL_ACTION_WORKING_DIR = "."
  }
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
  needs = "filter-to-pr-open-synced"
  secrets = ["GITHUB_TOKEN"]
  env = {
    TF_ACTION_WORKING_DIR = "."
  }
}
