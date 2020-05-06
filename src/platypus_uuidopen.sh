source ~/github/uuid/src/open_file.sh
# Platypus sends the whole url as argument:
echo "UUID='${@##uuid://}'"
#uuidopenfile ${@##uuid://}