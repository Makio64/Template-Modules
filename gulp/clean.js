var gulp 	= require( 'gulp' );
var del 	= require( 'del' );

gulp.task('clean', function(cb) {
	del(['output'], cb);
});

gulp.task('cleanDist', function (cb) {
	del(['dist'], cb);
});

gulp.task('cleanRev', function (cb) {
	del(['dist/rev'], cb);
});