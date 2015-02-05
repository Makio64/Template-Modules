var gulp 		= require( 'gulp' );
var path 		= require( './config' ).path;
var argv 		= require('yargs').string('module').argv;
var browserSync = require( 'browser-sync' );

gulp.task('browser-sync', function() {

	browserSync({

		server: {
			baseDir: [path.build, path.static]
		},

		startPath: argv.module?'/module_'+argv.module+'.html':'',

		port: 9000

	});

});