var gulp        = require('gulp');

var path        = require('./config').path;

var webpack     = require("webpack");
var webpackGulp = require('gulp-webpack');

var argv        = require('yargs').string('module').argv;

var entryCoffee = path.coffee+(argv.module?'modules/'+argv.module+'/':'')+'Main.coffee'

gulp.task('webpack', function() {
	return createWebpack(false,false)
});

gulp.task('webpack-watch', function() {
	return createWebpack(false,true)
});

gulp.task('webpack-build', function() {
	return createWebpack(true,false)
});

function createWebpack(build,watch){

	//default
	var plugins = []
	var debug 	= true
	var devtool = '#source-map'
	var output = argv.module?'bundle'+argv.module+'.js':'bundle.js'

	if(build||!watch){
		plugins.push( new webpack.optimize.OccurenceOrderPlugin() )
		plugins.push( new webpack.optimize.DedupePlugin() )
		plugins.push( new webpack.optimize.CommonsChunkPlugin({children: true, async: true}) )
	}

	if(build){
		plugins.push( new webpack.optimize.UglifyJsPlugin({sourceMap:false,compress: {warnings: false}}) )
		debug 	= false
		devtool = ''
	}

	return gulp.src(entryCoffee)
			.pipe(webpackGulp({
				devtool: devtool,
				debug: debug,
				watch: watch,
				watchDelay: 0,
				devServer:{
					port:1000
				},
				module: {
					loaders: [
						{ test: /\.coffee$/, loader: 'coffee' },
					]
				},
				output: {
					path: __dirname+'/../build/js/',
					filename: output,
					publicPath:'./js/'
				},
				resolve: {
					extensions:['','.coffee'],
					root:__dirname+'/../src/coffee/'
				},
				plugins:plugins
			}))
			.pipe(gulp.dest(path.build+'js/'));
}
