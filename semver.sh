#!/bin/bash

version="$1"
major=$(echo "$version" | cut -c1-1)
minor=$(echo "$version" | cut -c3-3)
patch=$(echo "$version" | cut -c5-5)


if [ "$2" == "major" ]; 
then
    major=$(($major + 1))
elif [ "$2" == "minor" ]; 
then
    minor=$(($minor + 1))
elif  [ "$2" == "patch" ];
then   
    patch=$(($patch + 1))
else
    echo "Please provide a version to update"
fi

version=$(echo $major-$minor-$patch)

echo "version=$version"
