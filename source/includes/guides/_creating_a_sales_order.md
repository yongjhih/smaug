## Creating a Sales Order

There are several ways to create a Sales Order via the TradeGecko API, 
depending on the number of line items, and whether the order is being made to a 
new or existing customer.

Let's start with the simplest option: 
Creating a < 100 line item Sales Order to an existing customer being 
shipped and billed to an existing address.

### 1 . Create the Order

We're going to be POSTing the following JSON to the `/orders` endpoint.

```json--inline
{
  "order": {
    "company_id": 101,
    "shipping_address_id": 1002,
    "billing_address_id": 1002,
    "status": "active",
    "issued_at": "21-02-2018",
    "order_line_items": [
      { "variant_id": 14, "quantity": 1 },
      { "variant_id": 15, "quantity": 2 }
    ]
  }
}
```

```ruby
order = gecko.Order.create({ 
  company_id: 101,
  shipping_address_id: 1002,
  billing_address_id: 1002,
  issued_at: Time.now,
})
order.order_line_items.build(variant_id: 14, quantity: 1)
order.order_line_items.build(variant_id: 15, quantity: 2)
order.save
```

```shell
curl -X POST -H "Content-type: application/json" -H "Authorization: Bearer <ACCESS_TOKEN>" https://api.tradegecko.com/orders/ \
-d '{"order": {"company_id": 101, "shipping_address_id": 1002, "billing_address_id": 1002, "status": "active", "issued_at": "21-02-2018", "order_line_items": [{"variant_id": 14, "quantity": 1}, {"variant_id": 15, "quantity": 2}]}}'
```
