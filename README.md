# README

Ruby on Rails (API Mode) e-commerce application

You can find GraphQL Queries also the path:

queriesconfig/initializers/graphiql.rb

Graphiql Queries:

#new user registration

mutation CreateCustomerMutation{
  createCustomer(input: {
    name: "customer",
    surname: "customer surname",
    email: "customer_new@example.com",
    phone: "1111111"
  }) {
    customer {
      id
      name
      surname
      email
      phone
    }
    errors
  }
}

#Get customers list

query ListCustomersQuery {
  customers {
    id
    name
    surname
    email
    phone
  }
}

#Get products list

query ListProductsQuery {
  products {
    id
    name
    price
    stockQuantity
  }
}

#Adding the product to customer's cart with quantity parameter

mutation AddProductToCart {
  addProductToCart(input: { customerId: "2", productId: "5", quantity: 2 }) {
    success
  }
}

#To view a specific customer's cart

query CustomerCart {
  customerCart(customerId: "2") {
    id
    customer {
      id
      name
      surname
      email
      phone
    }
    cartItems {
      id
      product {
        id
        name
        price
      }
      quantity
    }
  }
}

#Creating order for specific customer

mutation CreateOrder {
  createOrder(input: { customerId: "2" }) {
    success
  }
}

#Get customers Orders with product details

query GetCustomerOrders {
  customerOrders(customerId: "2") {
    id
    customer {
      id
      name
      email
    }
    products {
      id
      name
      price
    }
    quantities
  }
}
