workflow "Sentinel" {
  resolves = "sentinel-test"
  on = "pull_request"
}

action "sentinel-test" {
  uses = "thrashr888/sentinel-github-actions/test@v0.3"
  secrets = ["GITHUB_TOKEN"]
  env = {
    STL_ACTION_WORKING_DIR = "."
  }
}
