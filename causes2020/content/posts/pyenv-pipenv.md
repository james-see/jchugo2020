---
title: "Use Pyenv and Pipenv"
date: 2020-11-15T10:10:10-05:00
showDate: true
tags: ["pyenv", "tips", "python", "pipenv"]
images:
  - /img/pyenv.png
---

My Python workflow is constantly changing as new tools emerge to make things faster and easier. In this post, I want to share my current workflow as of November 2020.

My current step zero workflow for any project or even a [fresh OS](https://github.com/jamesacampbell/fresh-mac) relies on [Pyenv](https://github.com/pyenv/pyenv) and Pipenv, and here is how:

### Installing Pyenv

```@bash
brew install pyenv
```

Once `pyenv` is installed, you can run the bare command and list all of the options.

The main two are `pyenv install` and `pyenv local`. 

I start out on a new machine with the following:

`pyenv install 3.8.5` which is only needed once to install the version.

Then I run `pyenv global 3.8.5` which sets the global python default as `3.8.5`.

To view all installed versions, you do `pyenv versions` like so:

```@bash
$ pyenv versions
  system
  3.6.8
  3.7.7
  3.7.8
  3.8.1
  3.8.2
* 3.8.5 (set by /Users/jamescampbell/.pyenv/version)
  3.9.0b5
```

### Using Pyenv Local

For any new project in my projects folder:

1. `mkdir ~/projects/new-project`
2. `cd ~/projects/new-project`
3. `pyenv local 3.8.5` which creates a new dot file `.python-version`

_That is great_, you may say, it is very similar to [rbenv](https://github.com/rbenv/rbenv), [nvm](https://github.com/nvm-sh/nvm), [jenv](https://www.jenv.be/), and others--- but how do I manage pypi packages for each version? 

**The answer** is to handle it per project and with [pipenv](https://pipenv.pypa.io/en/latest/).

[Full Documentation](https://github.com/pyenv/pyenv) of Pyenv.

### Installing Pipenv

Pipenv is a virtual environment and package manager all in one. It was created by [Ken Reitz](https://kenreitz.org/), the guy who is famous for Requests, so you know it is top quality and makes sense.
To install, `pip install pipenv` for the project and pyenv version of Python you are working on.

### How To Use Pipenv

You use `pipenv install` to replace the bare `pip` command to install all packages. This creates a lockfile, `Piplock` and keeps it up to date along with a `Pipfile` that is very similar to package.json or a config.json file if coming from javascript. You want to make sure the Piplock dotfile is gitignore-d properly, just like the package.lock file from  javascript projects.

To use the environment, it is very similar to `venv`, you execute `pipenv shell` which will activate your virtual environment that has everything installed and locked in. When you are done you simply run `exit` to get out of the virtual environment.

As an alternative to the `pipenv install` for individual packages, you can also point it to a requirements.txt file via `pipenv install -r /path/to/requirements.txt`. 

[Full Documentation](https://pipenv.pypa.io/en/latest/basics/)

### Common Use Case

I will step you through a common use case:

1. Create a new project folder
2. Change directory into the folder
3. Run `pyenv local 3.8.5` or whatever version you want to use
4. Run `pipenv install requests, beautifulsoup4` or whatever packages you need
5. Run `pipenv shell`
6. Write your python code and iterate from there using version control, etc. like normal
7. When you are done, exit the virtual environment via `exit`

As you can see, the ultra-combo of having python version control locked down for my global as well as my local project environment as well as having package versioning at the project level along with a virtual environment specific project saves me tons of time and just works. 

Having a Pipfile and a requirements.txt file at the root of my project along with the `.python-version` dotfile ensures that all of my Python code stays organizes and is guaranteed to work and be repeatable and explorable by others.







