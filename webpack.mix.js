const mix = require('laravel-mix');

mix.webpackConfig({
    resolve: {
    extensions: ['.js', '.vue', '.json'],
    alias: {
        'vue$': 'vue/dist/vue.esm.js',
        '~': path.resolve(__dirname , 'resources/js') 
    },
    },
})

//mix.browserSync('my-domain.test');

mix.js('resources/js/app.js', 'public/js')
    .sass('resources/sass/app.scss', 'public/css');
