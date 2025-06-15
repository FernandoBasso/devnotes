# Fernando Basso Dev Notes

## Intro

This is a website where I keep software engineering notes.

Currently, the source files are on private Gitlab repository and publicly hosted on Gitlab pages:

- https://gitlab.com/fernandobasso/devnotes
- https://fernandobasso.gitlab.io/devnotes

The content is writen in Markdown and can be done in any text editor or in Obsidian (open the directory `content` as an Obsidian vault).

The website is published using [Quartz](https://quartz.jzhao.xyz/) as it has good support for publishing Obsidan notes (search, paths, tags, etc.)

## Local website preview

Make sure to use the node version found in `cat .nvmrc`, then:

```bash
$ npm install
$ npx quartz build --serve
```

Then point your browser to http://localhost:8080/.

## Publish new content to the website

Commit the changes and push to the `devel` branch.
The new changes should be publicly available on the website after the [pipeline](https://gitlab.com/fernandobasso/devnotes/-/pipelines) finishes running.
