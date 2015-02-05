# [Template-Modules by Makio64](https://github.com/Makio64/Template-Modules)

This template is a boilerplate using gulp with coffee/stylus/jade to create one page app loading modules(pages) asynchronimously. Each modules is optimized and the common parts (chunks) are load only one time. It doesnt use bower or napa cause download all the examples/source.. on each project isn't a good practice, especially true on Three.js or Pixi.js. 
If you are looking for a more simple architecture but using coffee/stylus/jade/gulp, check my template [here](https://github.com/Makio64/Template).

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

### Command

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

### Architecture 

####Folders & files
```shell
./src : source files coffee/stylus/jade
./build : builded files from source
./build/index.html : page for testing the main app
./build/module_001.html : page for testing the module '001'
./dist : final files compressed & optimized 
./static : static files not builded ( .htaccess, image, etc..)
./static/vendors/ : your lib for the project
./gulp : command gulp
```

####Coffee
```shell
-Main.coffee : entry point of the app
--Core : important class for any project
---Stage3d : helper for three.js
---Stage2d : helper for pixi.js
---ShaderLoader : helper to manage glsl files & chunks
---ShageRenderer : manage the update/resize with signal 
---scenes
----SceneTraveler : Simple system to handle transition between scene
----Scene : Basic scene
--Modules : your modules
---xxx/Main : your entry point for the module xxx
```

### What the template do exactly for you
- create a local server with livereload ( reload your browser when you change a file )
- compile your stylus / jade / coffeescript automatically
- give a nice, light and basic structure for your coffee/stylus development
- sourcemap for stylus & coffeescript for easy debugging
- notify the compilation success/error via growl
- include optimized .httaccess / manifest / robot for your webapp
- include nib for stylus

### How to
- Stop the server : crtl+c on the terminal
- Change the image compression : gulp/optimize.js
- Change the port of the server : gulp/browser-sync.js

### This template use
- Gulp | http://gulpjs.com/
- Webpack | http://bower.io/
- Stylus | http://learnboost.github.io/stylus/
- CoffeeScript | http://coffeescript.org/
- Jade | http://jade-lang.com/

### Lib by default in npm ( recommended way when possible )
- Signals | https://github.com/millermedeiros/js-signals

### Lib by default in vendors
- Three.js | http://threejs.org/docs/
- Pixi.js | http://www.pixijs.com/
- GSAP.js | http://greensock.com/gsap
- dat.gui.js | https://github.com/dataarts/dat.gui

##Versions
1.0:
- first implementation
