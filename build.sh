#!/bin/bash

log_info() { echo "[info] $1" >&0; }
log_error() { echo "[error] $1" >&2; }

js_to_html() {
    pygmentize -f html -l js -O "wrapcode" "$1"
}

AXIOS_URL='https://www.npmjs.com/package/axios'
NATIVE_FETCH_URL='https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API'
NODE_FETCH_URL='https://www.npmjs.com/package/node-fetch'
COLOR_CLI=`which pygmentize`

if [ $? -ne 0 ]; then
    log_error 'pygmentize is not installed; exiting'
    exit 1
else
    log_info "Using pygmentize at $COLOR_CLI"
fi

echo '<!DOCTYPE html>'
echo '<html xmlns="http://www.w3.org/1999/xhtml" lang="en-us" xml:lang="en-us">'
echo '<title>You might not need axios</title>'
echo '<meta name="description" content="Comparisons between the axios library and fetch API" />'
echo '<meta charset="utf-8" />'
echo '<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />'
echo '<link rel="stylesheet" href="./styles.css" />'
echo ''
echo '<h1>You might not need axios</h1>'
echo "<p>This project aims to compare the usage of the <a href=\"$AXIOS_LIB_URL\">axios library</a> and the <a href=\"$NATIVE_FETCH_URL\">fetch native API</a>, (<a href=\"$NODE_FETCH_URL\">node-fetch</a> for node), and also aims to leave space for contributions for others to learn in the way.</p>"
echo '<p>In my opinion, sometimes libraries can make useful abstractions, but they can hide the simplicity of using the native APIs and the understanding of how these magic functions work. Having this understanding makes you more flexible to use different solutions, or modifying existing ones.</p>'
echo ''

log_info 'Head info added'

echo '<ol>'
for directory in ./comparisons/*; do
    link="$(basename "$directory")"
    title="$(echo "$link" |sed 's/\-/ /g')"
    echo "    <li><a href=\"#$link\">$title</a></li>"
done
echo '</ol>'

log_info 'Table of content added'

for directory in ./comparisons/*; do
    log_info "Adding comparison for $directory..."

    link="$(basename "$directory")"
    title="$(echo "$link" |sed 's/\-/ /g')"
    vanilla_html="$(js_to_html "$directory/vanilla.js")"
    axios_html="$(js_to_html "$directory/axios.js")"

    echo "    <h2 id="$link">$title</h2>"
    echo "    <section class=\"comparison $title\">"
    echo '        <section class="axios">'
    echo '            <h3>axios</h3>'
    echo "            $axios_html"
    echo '        </section>'
    echo '        <section class="vanilla">'
    echo '            <h3>vanilla</h3>'
    echo "            $vanilla_html"
    echo '        </section>'
    echo '    </section>'
done

echo '</html>'

log_info 'Done! :)'
