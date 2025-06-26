# gorlog

A blogging framework written in vanilla HTML/JS/CSS with no server configuration and no dependencies

## Usage

If you have a static website running on something like GitHub pages, all you have to do is copy the `gorlog` folder inside this repository into the root of your site. You might consider forking this repository and keeping the posts you write in version control. Your posts will live in the `/gorlog/p` folder. Your posts will be listed at `/gorlog/index.html`.

To create a new post, you can use the `./new-post.sh` bash script or you can insert a post manually. To insert a post manually, you can create a folder for that post inside `gorlog/p` and add an `index.html`. You can copy the code from `gorlog/template.html` into your `gorlog/p/your-post-name/index.html` to get started. Modify the title and meta tags in `<head>` and  write your post as HTML inside `<body>`. To make your post show up on the home page of your blog, add your post in `config.js`.

To deploy your blog, simply run a static HTTP server at the root of this repo. You can use Python:

```
python3 -m http.server
```

...or using whatever method you prefer.

Just make sure that `gorlog.js` and `gorlog.css` are linked correctly in your posts. By default, they are linked from `/gorlog/gorlog.js` and `/gorlog/gorlog.css`, respectively. You can change the links in the template.html file if your setup requires something different.


## Configuration

You can add authors' links to `config.js` so they show up appropriately in posts. If you're adding posts manually, you should add your posts to `config.js` as you create them as well so that they show up in the gorlog home page. The `config.js` file is also where you can configure the Copyright and footer.

Modify `static/gorlog.css` as desired.

The `static/gorlog.js` script will add divs to center the content you place in `<body>` as well as add a header and a footer based on the meta tags you include.

Replace `static/favicon.ico` as needed.
