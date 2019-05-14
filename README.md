# Move assinged pull request to column

> ✨ GitHub action to automagically move assigned pull request to a column.


## How to use

To use this action we need the project name and the name of the column for the new pull requests will go into. The project and column names will be used to get a column ID for automation.

In your project create a new workflow file `.github/main.workflow`:
```
workflow "✨ Move assigned pull request to column" {
  resolves = ["Move assigned pull request to column"]
  on = "pull_requests"
}

action "Move assigned pull request to column" {
  uses = "alex-page/move-assigned-pulls-column@master"
  args = [ "🎒 Backlog", "In progress"]
  secrets = ["GITHUB_TOKEN"]
}
```

> Note: Replace `🎒 Backlog` with your project name and `In progress` with your project column.


## Private repositories

In some cases you may want to do add this functionality for a private repository or one you do not have admin rights to. You will likely get an error like:
```shell
GraphqlError: Resource not accessible by integration
```

When this happens you will need to provide a [personal access token](https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line). To do this you will need to create a new secret called `GH_PAT` with your secret. You will then need to change the `.github/main.workflow` secrets to include that token:
```
secrets = ["GH_PAT"]
```


## Release history

- v0.0.4 - Add optional personal access token for private repos
- v0.0.3 - Add missing labels for action release
- v0.0.2 - End in a neutral state for unsupported pull request action
- v0.0.1 - First release
