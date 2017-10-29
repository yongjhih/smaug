## Authentication Flows

> To authorize, use this code:

```ruby
require 'gecko-ruby'
gecko = Gecko::Client.new(<OAUTH_ID>, <OAUTH_SECRET>)
access_token = OAuth2::AccessToken.new(gecko.oauth_client, <ACCESS_TOKEN>)
gecko.access_token = access_token
gecko.Account.current
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: Bearer <ACCESS_TOKEN>"
```

> Make sure to replace `<ACCESS_TOKEN>` with your API key.

The TradeGecko API is based on [version 22 of the OAuth 2.0 specification](http://tools.ietf.org/html/draft-ietf-oauth-v2-22).

The TradeGecko API supports both the 'Authorization Code with Refresh tokens' and the 'Resource Owner Password Credentials' flow.

If you are familiar with OAuth, then the authentication endpoints are as follows:

- Authorization: `https://api.tradegecko.com/oauth/authorize` 
- Token Request: `https://api.tradegecko.com/oauth/token` 

<aside class='notice'>
  We very highly recommend using a third-party library in your chosen language rather than trying to implement OAuth flows manually.
  You can find <a href="https://oauth.net/code/#client-libraries">a list of recommended libraries here</a>
</aside>


## Choosing an Authentication Flow

Under the majority of circumstances we recommend the 'Authorization Code with Refresh Token' flow as it provides the highest level of security.

For prototyping, or one-off integrations you may use the 'Resource Owner Password Credentials' flows.

If you plan on building an application that will be used by multiple TradeGecko accounts, you MUST use the 'Authorization Code with Refresh Token' flow.
