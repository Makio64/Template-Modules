var gulp = require( 'gulp' );

var path = require( './config' ).path;

var browserSync = require( 'browser-sync' );

gulp.task( 'watchStylus', function() {
	gulp.watch( path.stylus+'**/*.styl', ['stylus',browserSync.reload]);
} );

gulp.task('watchJade',function(){
	gulp.watch( path.jade+'**/*.jade', ['jade',browserSync.reload]);
})

gulp.task('watchCoffee',function(){
	gulp.watch( path.coffee+'**/*.coffee', ['webpack',browserSync.reload]);
})