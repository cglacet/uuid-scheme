#######################################################
# Install with :
#   source ~/github/uuid/src/generate_uuid_url.sh
#######################################################
source ~/github/uuid/src/add_uuid.sh

function uuid_url(){
    uuid=$(set_file_uuid "$1")
    echo "uuid://$uuid"
}

function uuid_markdown_url(){
    url=$(uuid_url "$1")
    filename="${1##*/}"
    echo "[Lien vers $filename]($url)"
}