#!/bin/bash

update="$2"
version="$1"
major=$(echo "$version" | cut -d '-' -f 1)
minor=$(echo "$version" | cut -d '-' -f 2)
patch=$(echo "$version" | cut -d '-' -f 3)


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

if (( "$patch" > "10" ));
then
    minor=$(($minor + 1))
    patch=$(($patch * 0))
fi
if (( "$minor" > "10" ));
then
    major=$(($major + 1))
    minor=$(($minor * 0))
    patch=$(($patch * 0))
fi

version=$(echo $major-$minor-$patch)

echo "version=$version"
