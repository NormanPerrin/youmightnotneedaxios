const url = 'https://example.com';

fetch(url)
    .then(response => response.json())
    .then(data => console.log(data));
