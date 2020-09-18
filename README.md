# Continuous-Deployment-Scripts
I use these scripts to continuously deploy WordPress plugins and themes from Github to Codeship. The Gruntfile creates a Github Release for the repository and is executed after the repo is successfully uploaded to a website via Git Push. The shell script runs on the CD service (Codeship in this case) to set up, build, push, and release the repository.

## Environmental Variables Required
1. `RELEASE_KEY` - Your Github release key.
2. `FOLDERNAME` - The folder name of the repository's parent folder as it shows on your server.
3. `DIRECTORY` - The directory beneath your root WordPress directory where the repository will be moved. Example: `wp-content/plugins`
4. `PRODUCTION_1, PRODUCTION_2, PRODUCTION_3, PRODUCTION_4` - The Git Push URL for your web server's repository.
