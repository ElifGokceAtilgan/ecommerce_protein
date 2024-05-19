# README

Ruby on Rails (API Mode) e-commerce application.

For the product creation process, you can look at the seeds.rb file and create it with rails db:seeds, you can update the stock_quantity values for stock control.

Graphiql Queries:

#new user registration

mutation CreateCustomerMutation{
  createCustomer(input: {
    name: "customer_name",
    surname: "customer_surname",
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


![Screenshot from 2024-05-19 23-38-55](https://github.com/ElifGokceAtilgan/ecommerce_protein/assets/83187400/39ac3988-5be8-41e7-8cd6-caf9b945c22b)



![Screenshot from 2024-05-19 23-40-10](https://github.com/ElifGokceAtilgan/ecommerce_protein/assets/83187400/c8d28e29-c794-4325-a785-9a9f8bceac53)
