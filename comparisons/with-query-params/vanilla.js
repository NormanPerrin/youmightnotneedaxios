// ----------------------------------- //
// Use URL and URLSearchParams classes //
// ----------------------------------- //
//
// Within node, this classes can be required:
// ```
// const { URL, URLSearchParams } = require('url');
// ```
//
// Within the web, these classes are globally available.

const url = new URL("https://example.com"),
    params = {
        param1: 'value',
        param2: 'value'
        // ...
        // it might have more attributes
    };

Object.keys(params).forEach(key =>
    url.searchParams.append(key, params[key])
);

fetch(url)
    .then(response => response.text())
    .then(data => console.log(data));

// --------------------------------------- //
// Or with the URLSearchParams constructor //
// --------------------------------------- //

const url = new URL('http://example.com'),
    params = {
        param1: 'value',
        param2: 'value'
        // ...
        // it might have more attributes
    },
    // also...
    params = [
        ['param1', 'value'],
        ['param2', 'value']
    ]

url.search = new URLSearchParams(params).toString();

fetch(url)
    .then(response => response.text())
    .then(data => console.log(data));
