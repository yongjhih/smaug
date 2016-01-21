# Unique header generation
require './lib/unique_head.rb'

# Markdown
set :markdown_engine, :redcarpet
set :markdown,
    layout_engine: :erb,
    fenced_code_blocks: true,
    smartypants: true,
    disable_indented_code_blocks: true,
    prettify: true,
    tables: true,
    with_toc_data: true,
    no_intra_emphasis: true,
    renderer: UniqueHeadCounter

# Uses .env in the root of the project
activate :dotenv

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Activate the syntax highlighter
activate :syntax
activate :i18n, langs: [:en]

ready do
  require './lib/multilang.rb'
end

activate :sprockets

activate :autoprefixer do |config|
  config.browsers = ['last 2 version', 'Firefox ESR']
  config.cascade  = false
  config.inline   = true
end

# Github pages require relative links
activate :relative_assets
set :relative_links, true

# Build Configuration
configure :build do
  # If you're having trouble with Middleman hanging, commenting
  # out the following two lines has been known to help
  activate :minify_css
  activate :minify_javascript
  # activate :relative_assets
  # activate :asset_hash
  activate :gzip
end

# Deploy Configuration
# If you want Middleman to listen on a different port, you can set that below
set :port, 4567

helpers do
  require './lib/toc_data.rb'
end

redirect "changelog/",                          to: "https://github.com/tradegecko/smaug/commits"
redirect "api/address/",                        to: "#address"
redirect "api/company/",                        to: "#company"
redirect "api/contact/",                        to: "#contact"
redirect "api/currency/",                       to: "#currency"
redirect "api/fulfillment-line-item/",          to: "#fulfillmentlineitem"
redirect "api/fulfillment/",                    to: "#fulfillment"
redirect "api/image/",                          to: "#image"
redirect "api/invoice-line-item/",              to: "#invoicelineitem"
redirect "api/invoice/",                        to: "#invoice"
redirect "api/location/",                       to: "#location"
redirect "api/note/",                           to: "#note"
redirect "api/order-line-item/",                to: "#orderlineitem"
redirect "api/order/",                          to: "#order"
redirect "api/payment-term/",                   to: "#paymentterm"
redirect "api/payment/",                        to: "#payment"
redirect "api/price-list/",                     to: "#pricelist"
redirect "api/procurement/",                    to: "#procurement"
redirect "api/product/",                        to: "#product"
redirect "api/purchase-order-line-item/",       to: "#purchaseorderlineitem"
redirect "api/purchase-order/",                 to: "#purchaseorder"
redirect "api/stock-adjustment-line-item/",     to: "#stockadjustmentlineitem"
redirect "api/stock-adjustment/",               to: "#stockadjustment"
redirect "api/stock-transfer-line-item/",       to: "#stocktransferlineitem"
redirect "api/stock-transfer/",                 to: "#stocktransfer"
redirect "api/tax-component/",                  to: "#taxcomponent"
redirect "api/tax-type/",                       to: "#taxtype"
redirect "api/user/",                           to: "#user"
redirect "api/variant/",                        to: "#variant"
redirect "developer/creating-a-sales-order/",         to: "#the-ordering-flow"
redirect "developer/creating-an-application/",        to: "#creating-an-application"
redirect "developer/filters/",                        to: "#filters"
redirect "developer/getting-an-authorization-code/",  to: "#getting-an-authorization-code"
redirect "developer/making-an-api-call/",             to: "#making-an-api-call"
redirect "developer/pagination/",                     to: "#pagination"
redirect "developer/privileged-access-tokens/",       to: "#privileged-access-tokens"
redirect "developer/rate-limiting/",                  to: "#rate-limiting"
redirect "developer/refresh-an-access-token/",        to: "#refresh-an-access-token"
redirect "developer/requesting-for-an-access-token/", to: "#requesting-for-an-access-token"
redirect "developer/testing-with-oauth2-gem/",        to: "#testing-with-oauth"
redirect "developer/tradegecko-omniauth-strategy/",   to: "#tradegecko-omniauth-strategy"
redirect "resources/",                                to: ""
redirect "resource/",                                 to: ""
redirect "getting-started/",                          to: "#getting-started"
