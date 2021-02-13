#!/bin/bash

PAINT_CLI=`which pygmentize`

if [ $? -ne 0 ]; then
    echo "pygmentize is not installed; exiting"
    exit 1
fi

js_to_html() {
    pygmentize -f html -l js -O "wrapcode" "$1"
}

echo '<!DOCTYPE html>'
echo '<html xmlns="http://www.w3.org/1999/xhtml" lang="en-us" xml:lang="en-us">'
echo '<title>You might not need axios</title>'
echo '<meta name="description" content="Comparisons between the axios library and fetch API" />'
echo '<meta charset="utf-8" />'
echo '<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />'
echo '<link rel="stylesheet" href="./styles.css" />'

for directory in ./comparisons/*; do
    title="$(basename "$directory" |sed 's/\-/ /g')"
    vanilla_html="$(js_to_html "$directory/vanilla.js")"
    axios_html="$(js_to_html "$directory/axios.js")"

    echo "    <h2>$title</h2>"
    echo "    <section class=\"comparison $title\">"
    echo '        <section class="vanilla">'
    echo '            <h3>vanilla</h3>'
    echo "            $vanilla_html"
    echo '        </section>'
    echo '        <section class="axios">'
    echo '            <h3>axios</h3>'
    echo "            $axios_html"
    echo '        </section>'
    echo '    </section>'
done

echo '</html>'
