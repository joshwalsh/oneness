var pickFiles = require('broccoli-static-compiler'),
    compileSass = require('broccoli-ruby-sass'),
    mergeTrees = require('broccoli-merge-trees'),
    compileES6 = require('broccoli-es6-concatenator'),
    uglifyJavaScript = require('broccoli-uglify-js'),
    env = require('broccoli-env').getEnv();

// Vendor CSS
var bourbon = 'bower_components/bourbon/dist',
    normalize = 'bower_components/normalize-scss',
    underscore = 'bower_components/underscore',
    vexcss = 'bower_components/vex/sass',
    datetimecss = 'bower_components/datetimepicker';

// CSS
var css = 'assets/stylesheets';

var sassOptions = {
  bundleExec: true,
  'require': ['sass-css-importer']
}

if (env === 'production') {
  sassOptions.outputStyle = 'compressed';
} else {
  sassOptions.outputStyle = 'expanded';
  sassOptions.sourceMap = true;
}

var compiledCss = compileSass(
    [normalize, bourbon, vexcss, datetimecss, css],
    'main.scss',
    '/styles.css',
    sassOptions
);

// Vendor JS
var loader = 'bower_components/loader.js',
    jquery  = 'bower_components/jquery/dist',
    vexjs = 'bower_components/vex/js',
    datetimejs = 'bower_components/datetimepicker';

// JS
var js = 'assets/javascripts';

var sourceTrees = [js, loader, jquery, underscore, vexjs, datetimejs];
var appAndDependencies = new mergeTrees(sourceTrees, { overwrite: true });

var legacyFiles = [];

if (env === 'production') {
  legacyFiles = [
    'jquery.min.js',
    'underscore.js',
    'vex.min.js',
    'jquery.datetimepicker.js'
  ]
} else {
  legacyFiles = [
    'jquery.js',
    'underscore.js',
    'vex.min.js',
    'jquery.datetimepicker.js'
  ]
}

var applicationJs = compileES6(appAndDependencies, {
  loaderFile: 'loader.js',
  ignoredModules: [
  ],
  inputFiles: [
    'main.js'
  ],
  legacyFilesToAppend: legacyFiles,
  wrapInEval: false,
  outputFile: '/application.js'
});

if (env === 'production') {
  applicationJs = uglifyJavaScript(applicationJs);
}

// Images
// var images = pickFiles(image + '/assets', {
//   srcDir: '/',
//   files: ['**/*.png', '**/*.gif'],
//   destDir: '/'
// });

// module.exports = mergeTrees([compiledCss, applicationJs, images]);
module.exports = mergeTrees([compiledCss, applicationJs]);
