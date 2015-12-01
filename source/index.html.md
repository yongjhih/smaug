---
title: TradeGecko API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - ruby
  - shell

toc_footers:
  - <a href='https://go.tradegecko.com/register'>Sign up for an Account</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors
guides:
  - order_flow

asides:
  - creating_an_application
  - getting_an_auth_code
  - requesting_for_an_access_token
  - refreshing_access_tokens
  - making_an_api_call
  - testing_with_oauth
  - omniauth
  - privileged_access_token
  - pagination
  - filtering
  - rate_limiting

resources:
  - account
  - address
  - company
  - contact
  - note
  - user

search: true
---

# Introduction

## The TradeGecko Inventory and Order Management Platform API

Build tools that solve problems for millions of wholesale and retail businesses worldwide.

You can view code examples in the dark area to the right; switch the programming language of the examples with the tabs in the top right.

If anything is missing or seems wrong, please check the [GitHub issues](https://github.com/tradegecko/smaug/issues)
for existing known issues or [create a new issue](https://github.com/tradegecko/smaug/issues/new).

# Authentication

> To authorize, use this code:

```ruby
require 'gecko'

api = Gecko::Account.authorize!('gordonGecko')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: gordonGecko"
```


> Make sure to replace `geckogeckogecko` with your API key.

TradeGecko uses OAuth 2.0 authentication  to allow access to the API. 
You can register a new TradeGecko API application at our [developer portal](http://developer.tradegecko.com/).

TradeGecko expects for the API token to be included in all API requests to the server in a header that looks like the following:

`Authorization: geckogeckogecko`

<aside class="notice">
You must replace <code>gordonGecko</code> with your personal API key.
</aside>
