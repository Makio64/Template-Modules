/**
 * @author David Ronai / @makio64 / makiopolis.com
 * @commands :
 * - 'gulp' for testing your webapp
 * - 'gulp compile' for compiling only
 * - 'gulp build' for building final files
 */

var fs = require('fs');
var tasks = fs.readdirSync('./gulp/');

tasks.forEach(function(task) {
	if(task.slice(-3) != '.js') return;
	require('./gulp/' + task);
});
