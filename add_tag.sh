#!/bin/sh
# Usage: sh "Long Name" "slug-name"

LNAME="$1"
SNAME="$2"

# Create tag page file
TAG_PAGE="---
layout: blog_by_tag
tag: $SNAME
permalink: /tag/$SNAME/
---"
echo "$TAG_PAGE" > tag/$SNAME.html

# Append tag info to tags YAML file
CONFIG="
- slug: $SNAME
  name: $LNAME"
echo "$CONFIG" >> _data/tags.yml
