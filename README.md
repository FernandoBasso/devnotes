# Fernando Basso Dev Notes

## Intro

This is a website where I keep software engineering notes.

Currently, the source files are on a Gitlab repository and hosted on Gitlab pages:

- https://gitlab.com/fernandobasso/devnotes
- https://fernandobasso.gitlab.io/devnotes

I also have it on Github as a copy:

- https://github.com/FernandoBasso/devnotes

The content is written in Markdown and can be done in any text editor or in Obsidian (open the directory `content` as an Obsidian vault).

The website is published using [Quartz](https://quartz.jzhao.xyz/) as it has good support for publishing Obsidian notes (search, paths, tags, etc.)

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

## Optimize images before committing

Make sure to run this script whenever there are new images to be committed:

```bash
$ ./optimg.sh
```
