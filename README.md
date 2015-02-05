# [Template-Modules](https://github.com/Makio64/Template-Modules)

Boilerplate using modern frontend tool to accelerate the dev ( gulp / coffee / stylus / jade / webpack / livereload ). It allow you to test the whole stuff or each module separetly base on async loading of optimized bundle. 

To resume it make files light, loading fast & test easy :) 

If you are looking for a very simple template have a look at [Template](https://github.com/Makio64/Template).

### Getting started 

- Install nodejs if you don't have it : http://nodejs.org/
- copy or clone the template somewhere
- Then open the terminal and push the following commands :
```shell
cd yourfolder // move to yourfolder
rm -rf .git && git init //remove the previous git files and create a new
npm install //if you have an erorr try with sudo
gulp //start the main app ( see below )
```

### Task(Gulp)

Test the Main app or a module ( compile / server livereload / watch for change ) :
```shell
gulp
gulp --module 001
```

Compile the file only :
```shell
gulp compile //compile the main app
gulp compile --module 001 //compile the module 001
```

Build the final optimized files ( compile/imagemin/cssmin/jsmin/versionning/etc.. ) :
```shell
gulp dist
```

### Features
- compile your stylus / jade / coffeescript automatically
- create sourcemap for coffeescript & stylus
- create a local server with livereload ( reload your browser when you change a file )
- create bundle to load the module asynchronously
- create page html to test each module individually
- notification via growl
- optimized .httaccess / manifest / robot for your webapp
- optimize your final file
### Architecture 

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
- How to change the port of the server? edit gulp/browser-sync.js
- Why no bower/napa? They are great but on big lib(three/pixi) they install too much stuffs. Also not push the lib can be bad if you want to edit them ( like the depth-sorter in threejs ).

### This template use

#####tools
- Gulp | http://gulpjs.com/
- Webpack | http://webpack.github.io/
- Stylus | http://learnboost.github.io/stylus/
- CoffeeScript | http://coffeescript.org/
- Jade | http://jade-lang.com/

#####librairies js
- Signals.js | https://github.com/millermedeiros/js-signals
- Three.js | http://threejs.org/docs/
- Pixi.js | http://www.pixijs.com/
- GSAP.js | http://greensock.com/gsap
- dat.GUI.js | https://github.com/dataarts/dat.gui

##Versions
1.0:
- first implementation
