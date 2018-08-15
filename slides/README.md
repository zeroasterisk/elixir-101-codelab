# Modules Modules Modules
> A [Bespoke.js](http://markdalgleish.com/projects/bespoke.js) presentation, built with [generator-bespoke](https://github.com/markdalgleish/generator-bespoke)

## Abstract

ES Modules and Common JS go together like old bay seasoning and vanilla ice cream.

This talk will dig into the inconsistencies of the two patterns, and how the Node.js project is dealing with reconciling the problem. The talk will look at the history of modules in the js ecosystem and the subtle difference between them. It will also skim over how ecma-262 is standardized by the tc39, and how esmodules were developed.

## Pitch

This is really important! Did you know that the way Babel implemented import is not to spec!!! Did you know that if node has to implement a synchronous loader your imports could load differently in node than the browser!!!

Many people are working quite hard to ensure Node and the Browser don't diverge; This is their story.

### Watch The Talk

[![Node.js Interactive 2017](https://img.youtube.com/vi/W5CXzo4TZVU/0.jpg)](https://www.youtube.com/watch?v=W5CXzo4TZVU)

## View slides locally

First, ensure you have the following installed:

1. [Node.js](http://nodejs.org)

Then, install dependencies and run the preview server:

```bash
$ npm install
$ npm start
```
