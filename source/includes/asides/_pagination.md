## Pagination

> The default limit is 100 items.

```shell
curl -X GET -H "Content-type: application/json" -H "Authorization: Bearer <ACCESS_TOKEN>"
https://api.tradegecko.com/users?limit=20&page=1
```

```ruby
require 'gecko-ruby'
gecko.User.where(limit: 5, page: 2)
```
 
The TradeGecko API enables pagination by allowing users to include 'limit'
and 'page' parameters on GET requests to index pages. 
