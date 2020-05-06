################################################
# Install with :
#   source ~/github/uuid/src/open_file.sh
#
# You could also make use of duti to set default
# application for each file type 
# (https://github.com/moretensio~n/duti): 
#   brew install duti
# 
# More options here: 
#   https://apple.stackexchange.com/q/49532
#
# Idea from :
#   https://stackoverflow.com/a/16306231/1720199 
################################################
source ~/github/uuid/src/add_uuid.sh

function uuidopenfile(){
    open "$(uuidfile $1)"
}

function uuidfile(){
    mdfind "uuid=$1"
}