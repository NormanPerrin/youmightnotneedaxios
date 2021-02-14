# You might not need axios

Comparisons between the [axios](https://www.npmjs.com/package/axios) library and [fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) native API, for node [node-fetch](https://www.npmjs.com/package/node-fetch).

## Build comparisons

The `index.html` file is autogenerated, shouldn't be modified directly. Instead, it's built from the npm `build` command.

1. First, you have to have installed [pygmentize](https://pygments.org/).
2. Then run this command:
    ```Bash
    npm run build
    ```

Now the `index.html` should have been updated.

## Add a comparison

All the comparisons are within the `comparisons` directory. Every comparison has:

- `vanilla.js` file --> has the native fetch API usage for some comparison.
- `axios.js` file --> has the axios lirary usage for some comparison.

To add one:

1. create a folder with a title of the comparison. For the name:
    - use lowercase.
    - and instead of spaces, use `-`.
2. create an `axios.js` file within the new folder, with the case you want to compare.
3. create a `vanilla.js` file within the new folder, with the fetch version of the axios code you've created.

**Try it and see what happends!**

Finally and more important. Don't be afraid of propose some comparison!

I'd love to accept proposals and help if needed.

## Contributing

As the project just started, all types of colaborations are welcome! styling, documentation, comparions, all is needed.

## index.html build explaination

The `build.sh` outputs the content for the `index.html` file.

What the script does is:

1. first, output the head part of the `index.html`.
2. then, for each comparison
    1. calculate the title (name of the comparison directory without the dashes `-`).
    2. generate the HTML with the `<span>` elements and the class name according to the part of the code.
