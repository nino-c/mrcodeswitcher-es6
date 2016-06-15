var gulp          = require('gulp');
var notify        = require('gulp-notify');
var jade          = require('gulp-jade');
var less          = require('gulp-less');
var sass          = require('gulp-sass');
var concatCss     = require('gulp-concat-css');
var connect       = require('gulp-connect');
var source        = require('vinyl-source-stream');
var browserify    = require('browserify');
var babelify      = require('babelify');
var ngAnnotate    = require('browserify-ngannotate');
var browserSync   = require('browser-sync').create();
var rename        = require('gulp-rename');
var templateCache = require('gulp-angular-templatecache');
var uglify        = require('gulp-uglify');
var merge         = require('merge-stream');
//var paper         = require('paper');

// selectors
var scssFiles = "src/js/**/*.scss";
var jadeFiles = "src/js/**/*.jade";
var viewFiles = "src/js/**/*.html";
var jsFiles   = "src/js/**/*.js";
var lessFiles = "src/less/*.less";
var djangoStaticDir = "assets/**/*";

// particular files
var specificFiles = [
    "node_modules/bootstrap3/dist/css/bootstrap.css",
    "node_modules/angular-material/angular-material.css",
    "node_modules/codemirror/lib/codemirror.css",
    "node_modules/paper/dist/paper-full.js",
    "node_modules/underscore/underscore.js",
    "node_modules/jquery/dist/jquery.js",
    "node_modules/mathjax/MathJax.js"
];

var bundleJS = [
    "node_modules/codemirror/addon/edit/matchbrackets.js",
    "node_modules/codemirror/mode/javascript/javascript.js",
    "node_modules/codemirror/mode/coffeescript/coffeescript.js"
];


var interceptErrors = function(error) {
  var args = Array.prototype.slice.call(arguments);

  // Send error to notification center with gulp-notify
  notify.onError({
    title: 'Compile Error',
    message: '<%= error.message %>'
  }).apply(this, args);

  // Keep gulp from hanging on this task
  this.emit('end');
};

gulp.task('less', function () {
  return gulp.src(lessFiles)
    .pipe(less())
    .pipe(rename(path => {
        path.dirname = '';
    }))
    .pipe(gulp.dest('./build/css/'));
});

gulp.task('bundleJS', function() {
    return browserify(bundleJS)
        .bundle()
        .pipe(source('extra.js'))
        .pipe(gulp.dest('./build'));
})

gulp.task('specificFiles', function () {
  return gulp.src(specificFiles)
    .pipe(gulp.dest('./build/'));
});

gulp.task('bundleCss', function () {
  return gulp.src('./build/css/*.css')
    .pipe(concatCss("bundle.css"))
    .pipe(gulp.dest('./build/'));
});

gulp.task('browserify', ['views'], function() {
  return browserify('./src/js/app.js')
      .transform(babelify, {presets: ["es2015"]})
      .transform(ngAnnotate)
      .bundle()
      .on('error', interceptErrors)
      //Pass desired output filename to vinyl-source-stream
      .pipe(source('main.js'))
      // Start piping stream to tasks!
      .pipe(gulp.dest('./build/'));
});

gulp.task('html', function() {
  return gulp.src("src/index.html")
      .on('error', interceptErrors)
      .pipe(gulp.dest('./build/'));
});

gulp.task('views', function() {
  return gulp.src(viewFiles)
      .pipe(templateCache({
        standalone: true
      }))
      .on('error', interceptErrors)
      .pipe(rename("templates.js"))
      .pipe(gulp.dest('./src/js/config/'));
});

gulp.task('copyStatic', function() {
    return gulp.src(djangoStaticDir)
    .pipe(gulp.dest('./build/assets/'));
})

// This task is used for building production ready
// minified JS/CSS files into the dist/ folder
gulp.task('build', ['html', 'browserify'], function() {
  var html = gulp.src("build/index.html")
                 .pipe(gulp.dest('./dist/'));

  var js = gulp.src("build/main.js")
               .pipe(uglify())
               .pipe(gulp.dest('./dist/'));

  return merge(html,js);
});

gulp.task('default', ['html', 'specificFiles', 'less', 'bundleJS', 'browserify',
'bundleCss', 'copyStatic'], function() {

  browserSync.init(['./build/**/**.**'], {
    server: "./build",
    host: '0.0.0.0',
    port: 4000,
    notify: false,
    ui: {
      port: 4001
    }
  });

  // connect.server({
  //   livereload: true
  // });

  gulp.watch("src/index.html", ['html']);
  gulp.watch(viewFiles, ['views']);
  gulp.watch(specificFiles, ['specificFiles']);
  gulp.watch(lessFiles, ['less', 'bundleCss']);
  gulp.watch(djangoStaticDir, ['copyStatic']);
  gulp.watch(jsFiles, ['browserify']);
});
