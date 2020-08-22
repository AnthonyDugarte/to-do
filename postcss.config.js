module.exports = {
  plugins: [
    require('postcss-import'),
    require('postcss-flexbugs-fixes'),
    require('tailwindcss'),
    require('autoprefixer'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009',
      },
      stage: 3,
    }),
    // process.env.RAILS_ENV === 'production' &&
    //   require('@fullhuman/postcss-purgecss')({
    //     content: [
    //       './app/**/.html.erb',
    //       './app/helpers/**/*.rb',
    //       './app/javascript/**/*.js',
    //       './app/javascript/**/*.vue',
    //       './app/javascript/**/*.jsx',
    //     ],
    //     defaultExtractor: (content) => content.match(/[A-Za-z0-9-_:/]+/g) || [],
    //   }),
  ].filter(Boolean),
};
