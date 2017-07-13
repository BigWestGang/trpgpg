import gulp from 'gulp'
import sourcemaps from 'gulp-sourcemaps'
import source from 'vinyl-source-stream'
import buffer from 'vinyl-buffer'
import browserify from 'browserify'
import babel from 'babelify'
import plz from 'gulp-pleeease'

const jsPath = {
  "src": "./web/static/js/app.js",
  "dest": "./priv/static/js/"
}

const stylPath = {
  "src": "./web/static/styl/app.styl",
  "dest": "./priv/static/css"
}

const copyPath = {
  "src": [
    "./web/static/assets/*",
    "./web/static/assets/images/**"
  ],
  "base": {base: './web/static/assets'},
  "dest": "./priv/static"
}

const fontPath = {
  "src": "./node_modules/font-awesome-stylus/fonts/*",
  "base": {base: './node_modules/font-awesome-stylus'},
  "dest": "./priv/static"
}
const handleError = (err) => {
  console.error(err.toString())
}

gulp.task('browserify', () => {
  let bundler = browserify(jsPath.src, {debug: true})
    .transform(babel)
  bundler
    .bundle()
    .on('error', handleError)
    .pipe(source('app.js'))
    .pipe(buffer())
    .pipe(sourcemaps.init({loadMaps: true}))
    .pipe(sourcemaps.write('./'))
    .pipe(gulp.dest(jsPath.dest))
})

gulp.task('stylus', () => {
  gulp.src(stylPath.src)
    .pipe(sourcemaps.init())
    .pipe(plz({
      stylus: {'include Css': true},
      out: 'app.min.css'
    }))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(stylPath.dest))
})

gulp.task('copy', () => {
  gulp.src(copyPath.src, copyPath.base)
    .pipe(gulp.dest(copyPath.dest))
})

gulp.task('copyFonts', () => {
  gulp.src(fontPath.src, fontPath.base)
    .pipe(gulp.dest(fontPath.dest))
})

gulp.task('watch', () => {
  gulp.watch(
    [
      './web/static/js/*.js',
      './web/static/styl/*.styl'
    ],
    [
      'browserify',
      'stylus',
      'copy',
      'copyFonts'
    ]
  )
})

gulp.task('default', ['watch'])