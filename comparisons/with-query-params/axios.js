const url = 'https://example.com',
    params = {
        param1: 'value',
        param2: 'value'
        // ...
        // it might have more attributes
    };

axios.get(url, { params })
    .then(response => console.log(response.data));
