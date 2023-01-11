#!/bin/bash

update="$2"
version="$1"
major=$(echo "$version" | cut -d '-' -f 1)
minor=$(echo "$version" | cut -d '-' -f 2)
patch=$(echo "$version" | cut -d '-' -f 3)


if [[ "$@" == *"help"* ]];
then
    echo "
The correct arguments are the <version.number> and <major>, <minor>, <patch>

major : for updating the major version

minor : for updating the minor version

patch : for updating the patch version

-help or --help : for viewing the help document for the file

which are passed in like ./semver.sh <version.number> <update.type>
"
else
    if [ "$update" == "major" ]; 
    then
        major=$(($major + 1))
        minor=$(($minor * 0))
        patch=$(($patch * 0))
    elif [ "$update" == "minor" ]; 
    then
        minor=$(($minor + 1))
        patch=$(($patch * 0))
    elif  [ "$update" == "patch" ];
    then   
        patch=$(($patch + 1))
    else
        echo "Please provide a version to update"
    fi
    if (( "$patch" > "9" ));
    then
        minor=$(($minor + 1))
        patch=$(($patch * 0))
    fi
    if (( "$minor" > "9" ));
    then
        major=$(($major + 1))
        minor=$(($minor * 0))
        patch=$(($patch * 0))
    fi
    version=$(echo $major-$minor-$patch)

    echo "version=$version"
fi
