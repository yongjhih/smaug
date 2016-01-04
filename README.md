# TradeGecko developer docs
--------

### Example attribute.
```
name: {
  name: "",
  type: "String",
  description: "",
  filterable: "",
  updatable: true,
  creatable: true,
  required: false,
  readonly: false,
  beta: false,
  deprecated: false,
  private: false
},
```

### To Do

FulfillmentReturn
LedgerAccount
Login
Payment
Procurement
Refund
StockAdjustment
StockTransfer
TaxComponent
Webhook

### Add a new resource with

`thor generate model ClassName`

You will need 
```
OAUTH_SECRET=xxx
OAUTH_ID=xxx
OAUTH_TOKEN=xxx
```

In your .env.
