## Authorization Code with Refresh Token

The Authorization Code flow is a redirection-based flow, 
which means the application must be able to redirect the application user 
and receive authorization codes via a web browser.

### Phase 1: Authorization Phase

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

An authorization code is the key used to retrieve the access token. 
In order to acquire an authorization code, you need to redirect the user's 
browser to the authorization endpoint.

`https://api.tradegecko.com/oauth/authorize?response_type=code&client_id=<CLIENT_ID>&redirect_uri=<REDIRECT_URI>`

- `https://api.tradegecko.com/oauth/authorize`: indicates the API authorization endpoint.
- `response_type=code`: specifies that your application is requesting an authorization code grant.
- `client_id=<CLIENT_ID>`: the application's client ID provided when [registering your application](#registering-an-application). 
- `redirect_uri=<REDIRECT_URI>`: should be set to a URL in your application where
the user will be redirected back to after the request is authorized.



### Phase 2: User Authorization

Once directed to the above link, the user will be asked to log in to their TradeGecko account (if they're not already logged in).
They will then be asked to authorize or deny the authentication request.

[INSERT SCREENSHOT HERE]


### Phase 3: Authorization Code response

After the user successfully authorizes the application, they will be redirected back to
the provided `redirect_uri` with the authorization code as a query parameter named `code`.

e.g. `https://my.application.com/auth/app/callback?code=12bc6909c57aaa930`



### Phase 4: Requesting an Access Token

```shell
curl -H "Content-type: application/json" -X POST https://api.tradegecko.com/oauth/token -d '{"client_id": "d38abea2ef61c916a1e131de9fd04146579578f", "client_secret":"2kj2kd07e197f9942ca1876d759e9e9c45bdcdc", "redirect_uri": "https://my.application.com/auth/app/callback", "code": "c3d11b23992f53d748c7b25148da1ac4d838919", "grant_type": "authorization_code"}'
```

```json
{
  "access_token": "57ed301af04bf35b40f255feb5ef469ab2f046aff14",
  "expires_in": 7200,
  "refresh_token": "026b343de07818b3ffebfb3001eff9a00aea43da0a",
  "scope": "public",
  "token_type": "bearer"
}
```

The access token is a unique key used to make requests to the API.

In order to get an access token, the application must make a POST request to
`https://api.tradegecko.com/oauth/token` with the `client_id`,
`client_secret`, `redirect_uri`, `code` and `grant_type` as parameters.

- `https://api.tradegecko.com/oauth/token`: indicates the API token endpoint.
- `grant_type=authorization_code`: specifies that your application is requesting an authorization code.
- `client_id=<CLIENT_ID>`: the application's client ID provided when [registering your application](#registering-an-application). 
- `client_secret=<CLIENT_SECRET>`: the application's client secret provided when [registering your application](#registering-an-application). 
- `redirect_uri=<REDIRECT_URI>`: should be set to a URL in your application where the code will be received.
- `code`  must match the authorization code returned by the authorization endpoint in Phase 3



### Phase 5: Refreshing an Access Token

```shell
curl -H "Content-type: application/json" -X POST https://api.tradegecko.com/oauth/token -d '{"client_id": "9eb02720054", "client_secret": "b1d41094b83", "redirect_uri": "http://my.application.com/auth/callback", "refresh_token": "9582f8a45255", "grant_type": "refresh_token"}'
```

```ruby
  
```

```json
{
  "access_token": "439fc57cf1525e51555",
  "expires_in": 7200,
  "refresh_token": "ecfa1a22bd612cc1d8",
  "scope": "public",
  "token_type": "bearer"
}
```

A refresh token is a unique key used to request a new access token when
an existing current access token expires. 

To refresh an access token, the application must make a POST request to
`https://api.tradegecko.com/oauth/token` with the `client_id`,
`client_secret`, `redirect_uri`, `refresh_token` and `grant_type` as parameters.

- `https://api.tradegecko.com/oauth/token`: indicates the API token endpoint.
- `grant_type=refresh_token`: specifies that your application is requesting an refresh token.
- `client_id=<CLIENT_ID>`: the application's client ID provided when [registering your application](#registering-an-application). 
- `client_secret=<CLIENT_SECRET>`: the application's client secret provided when [registering your application](#registering-an-application). 
- `redirect_uri=<REDIRECT_URI>`: should be set to a URL in your application where the code will be received.
- `refresh_token`: must match the refresh token returned by the authorization endpoint in Phase 4

```json
{
  "error": "invalid_request",
  "error_description": "The request is missing a required parameter, includes an unsupported parameter value, or is otherwise malformed."
}
```

<aside class='notice'>
**Note:** When a token is refreshed, a new refresh token is
generated and this should be the one used the next time token refresh is invoked. 
Using an expired refresh token would return this error.
</aside>

