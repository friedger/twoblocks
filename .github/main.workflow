workflow "Build and test" {
  on = "push"
  resolves = ["Build", "Test"]
}

action "Install" {
  uses = "docker://node:10"
  args = "yarn install"
  env = {
    CI = "true"
  }
}

action "Build" {
  uses = "docker://node:10"
  needs = ["Install"]
  args = "yarn build"
  env = {
    CI = "true"
  }
}

action "Test" {
  uses = "docker://node:10"
  needs = ["Install"]
  args = "yarn test"
  env = {
    CI = "true"
  }
}
