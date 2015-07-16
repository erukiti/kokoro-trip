gulp = require 'gulp'
browserify = require 'gulp-browserify'
plumber = require 'gulp-plumber'
rename = require 'gulp-rename'

gulp.task 'build', ->
  gulp
  gulp
    .src 'src/index.coffee', read: false
    .pipe plumber()
    .pipe browserify
      transform: ['coffeeify']
      extensions: ['.coffee']
      debug: true
    .pipe rename 'index.js'
    .pipe gulp.dest './build/'


gulp.task 'watch', ['build'], ->
  gulp.watch 'src/**/*.coffee', ['build']
