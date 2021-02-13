# You might not need axios

Comparisons between the [axios](https://www.npmjs.com/package/axios) library and [fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) native API, for node [node-fetch](https://www.npmjs.com/package/node-fetch).

## Build comparisons

First, you have to have installed [pygmentize](https://pygments.org/).

Then run this command:

```bash
npm run build
```

Now the `index.html` should have been updated.

## Add a comparison

Within the `./comparisons` directory, the comparisons are defined as expected.

To add one:

1. create a folder with a title of the comparison. For the name:
    - use lowercase.
    - and instead of spaces, use `-`.
2. create an `axios.js` file within the new folder, with the case you want to compare, considering:
3. create a `vanilla.js` file within the new folder, with the fetch version of the axios code you've created.

Finally and more important. Don't be afraid of propose some comparison!

I'd love to accept proposals and help if needed.

## Contributing

As the project just started, all types of colaborations are welcome! styling, documentation, comparions, all is needed.
