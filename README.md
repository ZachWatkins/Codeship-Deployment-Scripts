# Continuous-Deployment-Scripts
I use these scripts to continuously deploy WordPress plugins and themes from Github to Codeship

The Gruntfile creates a Github Release for the repository and is executed after the repo is successfully uploaded to a website via Git Push.

The shell script runs on the CD service (Codeship in this case) to set up, build, push, and release the repository.
