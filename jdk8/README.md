# GitHub Action for the Maven CLI

The [origin project](https://github.com/LucaFeger/action-maven-cli) creates a Maven action with only JDK 8. While a [fork](https://github.com/xlui/action-maven-cli) exists that deals with different versions of the JDK, the action does not work when specifying lifecycles for a JDK that is not the default. This fork fixes those issues.

The GitHub Action for [Maven](https://maven.apache.org/) wraps the Maven CLI to enable Maven commands to be run. This can be used to run every Maven Command.

The supported JDKs are:

- JDK 8
- JDK 11
- JDK 13

## Usage

Copy and paste the following to your YAML file that defines the workflow – something like `.github/workflows/maven.yml`.

```yml
# This is a basic workflow to help you get started with Actions

name: CI

# Controls when the action will run. Triggers the workflow on push or pull request 
# events but only for the master branch
on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
    # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
    - uses: actions/checkout@v2

    # Runs a set of commands using the runners shell
    - name: Run maven script
      uses: guillonapa/action-maven-cli/jdk8@master
      with:
        lifecycle: 'clean package test'
```

To use a specific JDK, you can set the value of `uses` under the last `jobs.build.steps.name`.

For JDK 8:

```yml
uses: guillonapa/action-maven-cli/jdk8@master
```

For JDK 11:

```yml
uses: guillonapa/action-maven-cli/jdk11@master
```

For JDK 13:

```yml
uses: guillonapa/action-maven-cli/jdk13@master
```

Using the default action will default to JDK 11.

```yml
uses: guillonapa/action-maven-cli@master
```

The string passed in `jobs.build.steps.name.with.lifecycle` will be used as the argument to the maven command:

```shell
$ sh -c "mvn $1"
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE.md).
