## Resource Owner Password Credentials flow

The TradeGecko API also supports the Resource Owner Password Credentials flow 
through the concept of Privileged Access Tokens.

These tokens are generated through the TradeGecko UI and do not expire. 
This means that you can access the API using the privileged token without the need 
to use browser redirects or manage refresh tokens. 

However you will need to manually manage key rotation yourselves if your privileged 
key gets compromised in any way.

Because of the inherent higher safety risks involved in storing privileged access tokens, 
the Resource Owner Password Credentials flow is only available on single-account Applications.

> Once you have obtained your Privileged Access Token, you can use cURL or Ruby to check if it is working.

```shell
curl -X GET -H "Content-type: application/json" -H "Authorization: Bearer <PRIVILEGED_ACCESS_TOKEN>"
https://api.tradegecko.com/accounts/current
```

```ruby
require 'gecko-ruby'
gecko = Gecko::Client.new(<OAUTH_ID>, <OAUTH_SECRET>)
access_token = OAuth2::AccessToken.new(gecko.oauth_client, <PRIVILEGED_ACCESS_TOKEN>)
gecko.access_token = access_token
gecko.Account.current
```

### Phase 1: Privileged Access Token Generation

As the application developer, after [registering your application](#registering-for-an-access-token), 
you will see a button to "Create a Privileged Token" for the application.

[INSERT SCREENSHOT HERE]

If you have already registered your application, you can add a privileged token by 
finding your application in your [TradeGecko App List](https://go.tradegecko.com/oauth/applications).

<aside class="notice">
Important: The Privileged Access Tokens provide unfettered access to your TradeGecko account, be very careful not to share them.
</aside>
