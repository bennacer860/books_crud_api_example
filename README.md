This is a simple rails app that implement an API of the following endpoints with Integration Tests and return the right HTTP status:

```
               Prefix Verb   URI Pattern                      Controller#Action
         api_v1_books GET    /api/v1/books(.:format)          api/v1/books#index
                      POST   /api/v1/books(.:format)          api/v1/books#create
      new_api_v1_book GET    /api/v1/books/new(.:format)      api/v1/books#new
     edit_api_v1_book GET    /api/v1/books/:id/edit(.:format) api/v1/books#edit
          api_v1_book GET    /api/v1/books/:id(.:format)      api/v1/books#show
                      PATCH  /api/v1/books/:id(.:format)      api/v1/books#update
                      PUT    /api/v1/books/:id(.:format)      api/v1/books#update
                      DELETE /api/v1/books/:id(.:format)      api/v1/books#destroy
api_v1_finished_books GET    /api/v1/finished_books(.:format) api/v1/finished_books#index
```

