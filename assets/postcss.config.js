const purgecss = require('@fullhuman/postcss-purgecss')({
  content: ["../**/*.html.eex", "../**/views/**/*.ex", "./js/**/*.js"],
  defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || []
})

module.exports = {
  plugins: [
    require("postcss-import"),
    require("tailwindcss"),
    ...(process.env.NODE_ENV === "production" ? [purgecss] : [])
  ]
};
