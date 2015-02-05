/**
 * Optimize final files
 */

var gulp 		= require('gulp');
var path		= require('./config').path;

var imagemin	= require('gulp-imagemin');
var cssmin 		= require('gulp-cssmin');

var rev 		= require('gulp-rev');
var collect 	= require('gulp-rev-collector');

gulp.task( 'copyToDist', function() {
	gulp.src([
			path.static+'**/*.*',
			path.static+'.*',
			'!'+path.static+'img/**/*.*',
			'!'+path.static+'vendor/**/*.*'
		])
		.pipe(gulp.dest(path.dist))

	return gulp.src([
			path.build+'**/*.*',
			'!'+path.build+'css/**/*.*',
			'!'+path.build+'js/**/*.map'
		])
		.pipe(gulp.dest(path.dist))
})

gulp.task('imagemin', function() {
  return gulp.src(path.static+'img/**/*.*')
    .pipe(imagemin({
		optimizationLevel: 2
    }))
    .pipe(gulp.dest(path.dist+'img/'))
});

 
gulp.task('cssmin', function () {
    return gulp.src(path.build+'/**/*.css')
        .pipe(cssmin())
		.pipe(rev())
        .pipe(gulp.dest(path.dist))
		.pipe(rev.manifest({ path: 'manifest.json' }))
        .pipe(gulp.dest( path.dist+'rev/css' ) );
});

gulp.task('rev', function() {
    return gulp.src([path.dist+'rev/**/*.json', path.dist+'**.html'])
        .pipe( collect({
            replaceReved: true,
        }) )
        .pipe( gulp.dest('dist') );
});