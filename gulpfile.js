var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');
var source = require('vinyl-source-stream');
var connect = require('gulp-connect');
var gutil = require('gulp-util');
var uglify = require('gulp-uglify');
var buffer = require('vinyl-buffer');
var imagemin = require('gulp-imagemin');
var concat = require('gulp-concat');
var babel = require('gulp-babel');
var addsrc = require('gulp-add-src');
var autoprefixer = require('gulp-autoprefixer');

var paths = {
  sass: './assets/stylesheets/**/*.scss',
  js: './assets/javascripts/**/*.js',
  dist: './dist/'
};

var env = process.env.ASSET_ENV || '';
var isProduction = env.toLowerCase() === 'production';

// CSS
gulp.task('sass', function() {
  var includePaths = [
    './node_modules/normalize.css'
  ];

  var sassOptions = {
    outputStyle: 'expanded',
    includePaths: includePaths
  };

  if (isProduction) {
    sassOptions.outputStyle = 'compressed';
  }

  return gulp.src(paths.sass)
    .pipe(isProduction ? gutil.noop() : sourcemaps.init())
    .pipe(sass(sassOptions))
    .pipe(autoprefixer({
      browsers: ['last 2 versions'],
      cascade: false
    }))
    .pipe(isProduction ? gutil.noop() : sourcemaps.write())
    .pipe(connect.reload())
    .pipe(gulp.dest(paths.dist));
});

// JS
gulp.task('js', function () {
  var modules = [
    './source/javascripts/modules/**/*.js',
    './source/javascripts/main.js'
  ];

  var lib = [
    './assets/javascripts/baseline-modernizr.js',
    './node_modules/jquery/dist/jquery.js'
  ];

  return gulp.src(modules)
    .pipe(isProduction ? gutil.noop() : sourcemaps.init())
    .pipe(concat("application.js"))
    .pipe(babel())
    .pipe(addsrc.prepend(lib))
    .pipe(concat("application.js"))
    .pipe(isProduction ? gutil.noop() : sourcemaps.write("."))
    .pipe(isProduction ? uglify() : gutil.noop())
    .pipe(connect.reload())
    .pipe(gulp.dest(paths.dist));
});

// Server
gulp.task('server', function() {
  connect.server({
    root: paths.dist,
    livereload: true
  });
});

// Watch
gulp.task('watch', function() {
  gulp.watch(paths.sass, ['sass']);
  gulp.watch(paths.js, ['js']);
});

// Build
gulp.task('build', ['sass', 'js']);

// Default
gulp.task('default', ['watch', 'build', 'server']);
