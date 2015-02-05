/**
 * Alias for common tasks
 */

var gulp = require( 'gulp' );
var runSequence = require('run-sequence');
var argv 		= require('yargs')
					.usage('Module: $0 -module [moduleName]')
					.argv;

gulp.task( 'compile', function(cb){
	runSequence([ 'stylus', 'jade', 'webpack' ], cb)
});

gulp.task( 'watch', function(cb){
	runSequence([ 'watchStylus','watchJade','watchCoffee' ], cb)
});

gulp.task( 'default', function(cb) {
	runSequence(['compile'], ['browser-sync'], ['watch'], cb)
});

gulp.task( 'dist', function(cb) { 
	runSequence(['cleanDist','stylus', 'jade', 'webpack-build'], ['copyToDist','imagemin','cssmin'],['rev'],['cleanRev'], cb) 
});