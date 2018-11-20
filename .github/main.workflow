workflow "Sentinel" {
  resolves = ["sentinel-fmt","sentinel-test"]
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
