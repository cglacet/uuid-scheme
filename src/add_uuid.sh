##############################################
# Install with :
#   source ~/github/uuid/src/add_uuid.sh
##############################################
function set_file_uuid(){
    # This is very critical, we need to be ultra cautious not to remove exising uuid
    # That's why I used `file_has_uuid` instead of `file_has_valid_uuid`.
    #
    # TODO: It could make sens to ask for permission if there is a non-valid UUID 
    # attached to a file: 
    if ! file_has_uuid "$1"; then
        id=$(generate_uuid)
        xattr -w com.apple.metadata:uuid $id "$1"
        echo $id
        return 0
    else
        echo $(get_file_uuid "$1")
        return 1
    fi
}

function generate_uuid(){
    uuidgen
    # DESCRIPTION
    #     The uuidgen command generates a Universally Unique IDentifier (UUID), a 128-bit value guaranteed to be
    #     unique over both space and time.
    #     The following options are available:
    #     -hdr      Emit CoreFoundation CFUUID-based source code for using the uuid in a header.
    # RETURN VALUE
    #     The UUID is printed to standard output as a hyphen-punctuated ASCII string of the form:
    #     EEF45689-BBE5-4FB6-9E80-41B78F6578E2 (in printf(3) format "%08X-%04X-%04X-%04X-%012X"), unless the -hdr
    #     option is given, in which case a fragment of source code is output.    
}

function get_file_uuid(){
    mdls -n uuid "$1" | cut -d'=' -f2 | xargs
}

function file_has_uuid(){
    ! is_uuid_null $(get_file_uuid "$1")
}

function file_has_valid_uuid(){
    is_uuid $(get_file_uuid "$1")
}

function is_uuid(){
    test ${#1} = '36'
}

function is_uuid_null(){
    test $1 = '(null)'
}