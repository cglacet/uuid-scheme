# Add UUID to a file

Using metadata.

## OpenMeta tests

### Documentation

```bash
$ openmeta
openmeta version 0.1 by Tom Andersen code.google.com/p/openmeta/

Usage: openmeta [options] -p PATH[s]

Note that commas are to be used nowhere - tag lists use quotes for two word tags in output

example (list tags and ratings):  openmeta -p PATH
example (list tags and ratings multiple):  openmeta -p PATH PATH
example (list tags): openmeta -t -p PATH[s]
example (add tags): openmeta -a foo bar -p PATH[s]
example (add tags with spaces): openmeta -a "three word tag" "foo bar" -p PATH[s]
example (set tags):  openmeta -s foo bar -p PATH[s]
example (clear all tags):  openmeta -s -p PATH[s]
example (set managed):  openmeta -m Y -p PATH[s]
example (set rating 0 - 5 stars):  openmeta -r 3.5 -p PATH[s]
example (print rating):  openmeta -r -p PATH[s]
example (clear rating):  openmeta -r 0.0 -p PATH[s]
example (lousy rating):  openmeta -r 0.1 -p PATH[s]
```

### First tests

The commands I ran are: 

```bash
$ openmeta -a uuid "dd62cf1a-601d-485c-92cd-f33c5998d654" -p add_metadata_to_this_python_file.py
uuid dd62cf1a-601d-485c-92cd-f33c5998d654 add_metadata_to_this_python_file.py
$ mdfind "dd62cf1a-601d-485c-92cd-f33c5998d654"
/Users/cglacet/Tests/OpenMetaTest/add_metadata_to_this_python_file.py
```

That seems to work, again: 

```bash
$ mdfind "dd62cf1a-601d-485c-92cd-f33c5998d654"

/Users/cglacet/Library/Application Support/Code/Backups/1588703199445/file/a62a236595510c23ea98226e26cd6525
/Users/cglacet/Tests/OpenMetaTest/add_metadata_to_this_python_file.py
```

Woops.


## Using `xattr` directly 

OpenMeta uses `xattr` anyway, so let's try to work with it directly, see how it works:

### First tests

Same as before:

```bash 
$ xattr -w com.apple.metadata:uuid "dd62cf1a-601d-485c-92cd-f33c5998d654" add_metadata_to_this_python_file.py
$ mdfind 'uuid=dd62cf1a-601d-485c-92cd-f33c5998d654'
/Users/cglacet/Tests/uuid/add_metadata_to_this_python_file.py
```

This time the current file is not found, nice. 

Let's play with that a little bit: 


```bash 
❯ cd 
$ mdfind 'uuid=dd62cf1a-601d-485c-92cd-f33c5998d654'
/Users/cglacet/Tests/uuid/add_metadata_to_this_python_file.py
```

Still fine. Now add a second uuid, say to the current file (named *README.md* on my machine,
it's will also be known as *6bb31b00-635d-4baa-a672-9c4f3236eb18*):

```bash
$ xattr -w com.apple.metadata:uuid 6bb31b00-635d-4baa-a672-9c4f3236eb18 README.md
$ mdfind 'uuid=6bb31b00-635d-4baa-a672-9c4f3236eb18'
/Users/cglacet/Tests/uuid/README.md
```

Now let's try to find all files with an UUID on my system:

```bash
$ mdfind 'uuid=*'
/Users/cglacet/Tests/uuid/README.md
/Users/cglacet/Tests/uuid/add_metadata_to_this_python_file.py
```

Everything is still working as expected. Lets implement a script to automate things.

### Script

Let's create the script, and of course, add a uuid to it:
```bash
$ touch add_uuid.sh
$ xattr -w com.apple.metadata:uuid 26de1c1f-8602-43f9-ae52-9bd3bcce3c01 add_uuid.sh
$ code add_uuid.sh
```

Let's now try the script, the most important thing is **NEVER REMOVE AN UUID**, so lets try this first
and make sure we don't miss: 

```bash
$ sh test.sh
Test on file 7EA187A8-987D-41FC-8E7A-D434E2A17EA9
Waiting a bit, sleeping for 5s
OK
OK
OK
OK
OK
```

# Clickable links to open files 


[That sound possible](https://stackoverflow.com/questions/10597144/how-to-register-an-application-to-a-uri-scheme-in-mac-os-x)