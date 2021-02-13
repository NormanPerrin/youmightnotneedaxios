const url = 'https://example.com';

fetch(url)
    .then(response => response.json())
    .then(console.log);
