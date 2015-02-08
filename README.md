# [Template-Modules](https://github.com/Makio64/Template-Modules)

Boilerplate using modern frontend tool to accelerate the dev ( gulp / coffee / stylus / jade / webpack / livereload ). It allow you to test the whole stuff or each module separetly base on async loading of optimized bundle. 

To resume it make files light, loading fast & test easy :) 

If you are looking for a very simple template have a look at [Template](https://github.com/Makio64/Template).

### Getting started 

- Install nodejs if you don't have it : http://nodejs.org/
- copy or clone the template somewhere
- Then type some command above ( gulp by default :) )

```
//Compile, start a livereload server, watch for change
gulp 
// same but for the module 001
gulp --module 001 

//Compilation the main app only
gulp compile
// same but for the module 001
gulp compile --module 001 

//Build the final optimized files ( compile/imagemin/cssmin/jsmin/versionning/etc.. )
gulp dist
```

### Features
- Fast compilation for your stylus / jade / coffeescript
- Sourcemap for coffeescript & stylus
- Use [shader-loader](https://github.com/Makio64/shader-loader) to handle your glsl files + chunks 
- Server with livereload ( reload your browser when you change a file )
- Create bundle to load the module asynchronously
- Create page html to test each module individually
- Notification via growl
- Optimize your final file

### Files architectures
- src : source files coffee/stylus/jade
- build : builded files from source
- build/index.html : page for testing the main app
- build/module_001.html : page for testing the module '001'
- dist : final files compressed & optimized 
- static : static files not builded ( .htaccess, image, etc..)
- static/vendors/ : your lib for the project
- gulp : command gulp

### FAQ
- How to stop the server? crtl+c in the terminal
- How to change the image compression? edit gulp/optimize.js
- How to change the port of the server? edit gulp/config.js
- Why no bower/napa? They are great but on big lib(three/pixi) they install too much stuffs. Also not push the lib can be bad if you want to edit them ( like the depth-sorter in threejs ).

### See also

- shader-loader | https://github.com/Makio64/shader-loader
- Gulp | http://gulpjs.com/
- Webpack | http://webpack.github.io/
- Stylus | http://learnboost.github.io/stylus/
- CoffeeScript | http://coffeescript.org/
- Jade | http://jade-lang.com/

##Versions
1.0:
- first implementation
