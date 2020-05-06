install_dir=~/.github/uuid-scheme
git_repo=git@github.com:cglacet/uuid-scheme.git

raw_git_url="https://raw.githubusercontent.com/cglacet/install-scripts/master/osx/git-clone.sh?$(date +%s)"
/bin/bash -c "$(curl -fsSL $raw_git_url)" anything $install_dir $git_repo
