# gorlog

A blogging framework written in vanilla HTML/JS/CSS with no server configuration and no dependencies

## Usage

### Easy: Fork and Deploy

1. Fork this repository
2. Deploy using [GitHub pages](https://pages.github.com/)

Your blog will be available at your-domain.com/gorlog. The root of your domain can be left to something else.

### View While Editing / In Development

Launch a static HTTP server at the root of this repository (that is, one layer above /gorlog). You can do this in Python like:

```
python3 -m http.server
```

### Custom Deployment Notes

The posts you create as well as the home page (at /gorlog) will depend on files assumed to be located at `your-domain.com/gorlog`, like `your-domain.com/gorlog/gorlog.js` and `your-domain.com/gorlog/gorlog.css`. You can modify the link tags in `template.html` and `index.html` as appropriate.

If you'd like to make your blog available at the root of your domain, move the contents inside `/gorlog` to the root of the repo and modify the link tags in `index.html` and `template.html`.

### Creating Posts

To create a new post, you can use the `./new-post.sh` bash script or you can insert a post manually.

To insert a post manually, create a folder for that post inside `gorlog/p` and add an `index.html`. Copy the code from `gorlog/template.html` into your `gorlog/p/your-post-name/index.html` to get started. Modify the title and meta tags in `<head>` and  write your post as HTML inside `<body>`. To make your post show up on the home page of your blog, add your post in `config.js`. Note that the "slug" should match the name of the folder you created for your post.

Be sure to keep the title/description/author information in sync with config.js if you ever change them.

## Configuration

Change the blog's title and description directly in `gorlog/index.html`. Change specific posts' information within their respective `index.html` files as well as `gorlog/config.js`.

You can add authors' links to `gorlog/config.js` so they show up appropriately in posts. If you're adding posts manually, you should add your posts to `gorlog/config.js` as you create them as well so that they show up in the gorlog home page. The `gorlog/config.js` file is also where you can configure the Copyright and footer.

Modify `gorlog/static/gorlog.css` as desired.

The `gorlog/static/gorlog.js` script will add divs to center the content you place in `<body>` as well as add a header and a footer based on the meta tags you include.

Replace `gorlog/static/favicon.ico` as needed.
