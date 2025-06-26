#!/bin/bash

# Prompt for post details
read -p "Enter post title: " title
read -p "Enter post description: " description
read -p "Enter author's name: " author

# Generate slug from title
slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -e 's/[^a-z0-9]/-/g' -e 's/--\+/-/g' -e 's/-\+$//' -e 's/^-\+//')

# Get current date
current_date=$(date +%Y-%m-%d)

# Helper to escape single quotes and backslashes for insertion into single-quoted JS strings
escape_js_string() {
    local str="$1"
    str="${str//\'/\\\\\'}"
    echo "$str"
}

# Set up paths
post_dir="gorlog/p/$slug"
template_file="gorlog/template.html"
post_file="$post_dir/index.html"
config_file="gorlog/config.js"

# Create post directory
if [ -d "$post_dir" ]; then
    echo "Post directory '$post_dir' already exists. Aborting."
    exit 1
fi
mkdir -p "$post_dir"

# Copy template to post directory
cp "$template_file" "$post_file"

# Replace placeholders in the new post's index.html
# Using a different sed delimiter to avoid issues with slashes in description
sed -i "s|{{title}}|$title|g" "$post_file"
sed -i "s|{{author}}|$author|g" "$post_file"
sed -i "s|{{desc}}|$description|g" "$post_file"
sed -i "s|{{published_time}}|$current_date|g" "$post_file"

# Add post to config.js
# This is a bit brittle, we'll use a temporary file to be safe.
tmp_config=$(mktemp)
# Escape single quotes and backslashes in title, description, and author for JS
js_title=$(escape_js_string "$title")
js_desc=$(escape_js_string "$description")
js_author=$(escape_js_string "$author")

new_post_entry="    {\n        'title': '$js_title',\n        'desc': '$js_desc',\n        'author': '$js_author',\n        'date': '$current_date',\n        'slug': '$slug'\n    },"

# Find the line with "// Add more posts as needed" and insert the new post before it
awk -v new_entry="$new_post_entry" '
/\/\/ AUTO ADD LOCATION - KEEP THIS COMMENT AT END OF LIST WITH PRECEDING COMMA - DO NOT REMOVE OR ALTER THIS LINE/ {
  print new_entry
}
{
  print
}
' "$config_file" > "$tmp_config" && mv "$tmp_config" "$config_file"


echo "New post created at $post_dir"
echo "Inserted new post in config.js"
