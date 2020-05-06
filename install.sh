install_dir=~/.github/uuid-scheme
git_repo=git@github.com:cglacet/uuid-scheme.git

raw_git_url="https://raw.githubusercontent.com/cglacet/install-scripts/master/osx/git-clone.sh?$(date +%s)"
/bin/bash -c "$(curl -fsSL $raw_git_url)" bash $install_dir $git_repo

cp -r $install_dir/automator/*.workflow ~/Library/Services
ln -s $install_dir/uuidopen.app ~/Applications/uuidopen.app