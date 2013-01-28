require "boarding_pass"
require "lib/application_helper"
helpers ApplicationHelper

activate :livereload

###
# Page options, layouts, aliases and proxies
###

page "/styleguide/*" do
  @styleguide = Kss::Parser.new('source/stylesheets')
end

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end


###
# Helpers
###

helpers do
  # Generates a styleguide block.
  def styleguide_block(section, &block)
    @section = @styleguide.section(section)
    @example_html = capture(&block)
    concat partial("styleguide/block")
  end

  # Captures the result of a block within an erb template without spitting it
  # to the output buffer.
  def kss_capture(&block)
    out, @_out_buf = @_out_buf, ""
    yield
    @_out_buf
  ensure
    @_out_buf = out
  end
end


set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'


# Build-specific configuration
configure :build do
  # activate :sprockets

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  activate :asset_hash
  activate :gzip

  # TODO necessary?
  compass_config do |config|
    config.sass_options = { :debug_info => false }
  end

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
