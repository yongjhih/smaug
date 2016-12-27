## Note about Status

Most objects have a status key. All status keys have an `archived` value. Most objects in TradeGecko can be deleted. The action of deleting is actually a "soft-delete", where the information is actually archived rather than completely removed from the database. An object with `archived` status means that the object has been soft-deleted. 
