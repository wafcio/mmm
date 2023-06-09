# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :relative_assets
set :relative_links, true

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

ignore "/category.html"

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

categories = YAML.load_file("data/categories.yml")

categories.each do |category|
  proxy(
    "/#{category["slug"]}.html",
    '/category.html',
    locals: {
      slug: category["slug"]
    }
  )  
end

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
