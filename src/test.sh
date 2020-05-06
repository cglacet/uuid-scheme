source add_uuid.sh
rm first_file_to_have_an_auto_uuid.txt
touch first_file_to_have_an_auto_uuid.txt
w=$(set_file_uuid first_file_to_have_an_auto_uuid.txt)
echo "Test on file $w"

# No idea what, but sleeping a bit is needed (maybe the OS needs some time to re-index new files ?)
# 5 seconds seems more than enough (2 was almost always enough)
sleep_duration=5
echo "Waiting a bit, sleeping for ${sleep_duration}s"
sleep $sleep_duration

x=$(get_file_uuid first_file_to_have_an_auto_uuid.txt)
if file_has_uuid first_file_to_have_an_auto_uuid.txt; then echo "OK"; else echo "ERROR"; fi
if file_has_valid_uuid first_file_to_have_an_auto_uuid.txt; then echo "OK"; else echo "ERROR"; fi
y=$(set_file_uuid first_file_to_have_an_auto_uuid.txt)
z=$(get_file_uuid first_file_to_have_an_auto_uuid.txt)
if [ "$w" != "$x" ]; then echo "ERROR"; else echo "OK"; fi
if [ "$x" != "$y" ]; then echo "ERROR"; else echo "OK"; fi
if [ "$y" != "$z" ]; then echo "ERROR"; else echo "OK"; fi