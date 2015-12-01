## Making an API call

```shell
curl -X GET -H "Content-type: application/json" -H "Authorization: Bearer <ACCESS_TOKEN>"
https://api.tradegecko.com/accounts %>/
```

```ruby
require 'gecko-ruby'
gecko.Account.where()
```

The TradeGecko API is entirely JSON based. In order to make an authenticated call
to the API, you must include your access token with the call.
OAuth2 uses a BEARER token that is passed along in an Authorization
header.

