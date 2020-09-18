# Get around shallow update restriction in Codeship.
if [ -f ${HOME}/clone/.git/shallow ]; then git fetch --unshallow; fi

# Add Git config data.
git config --global user.name "codeship-repo-name"
git config --global user.email "watkinza@gmail.com"
git config --global github.token RELEASE_KEY

# Move repo files to a folder heirarchy like wp-content/plugins/plugin-name/.
mkdir $FOLDERNAME
shopt -s extglob
mv !($FOLDERNAME) $FOLDERNAME
# Move repo files whose name begins with a period since this is not done by the previous lines.
mv .sass-lint.yml $FOLDERNAME/.sass-lint.yml
# Apply build-specific ignore file to remove development-only files from deployment.
rm .gitignore
mv .codeshipignore $FOLDERNAME/.gitignore
# Move named folder into a structure identical to the root directory of a WordPress server.
mkdir -p $DIRECTORY
mv $FOLDERNAME $DIRECTORY
cd $DIRECTORY/$FOLDERNAME/

# Add servers.
git remote add servers $PRODUCTION_1
git remote set-url --add --push servers $PRODUCTION_1
git remote set-url --add --push servers $PRODUCTION_2
git remote set-url --add --push servers $PRODUCTION_3

# Build.
npm install
grunt

# Release.
grunt release

# Deploy.
git add --all :/
git commit -m "DEPLOYMENT"
git push servers HEAD:refs/heads/master --force

# Cache node_modules for next build.
cd ../../../
mv $DIRECTORY/$FOLDERNAME/node_modules node_modules
