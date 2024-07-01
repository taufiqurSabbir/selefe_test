final productJSON = [

  // vegetable dummy product

  {
    "id": 3,
    "name": "Potato Regular",
    "category": "vegetable",
    'subscribed': 120,
    'oldPrice' : 50,
    "price": 45,
    "image": "https://purepng.com/public/uploads/large/purepng.com-potatofapotatofood-cropsvegetablepotatos-1701527311348afxiy.png",
    "ishavediscount": true,
    "discountamount": 20,
    "minorder": 3,
    "details": "Fresh and organic potatoes sourced from local farms. Perfect for a variety of dishes.",
    "review": {
      "rating": 4.5,
      "count": 320
    },
    "FAQ": [
      {
        "question": "What is the origin of these potatoes?",
        "answer": "These potatoes are sourced from local farms."
      },
      {
        "question": "Are these potatoes organic?",
        "answer": "Yes, these potatoes are 100% organic."
      }
    ]
  },
  {
    "id": 3,
    "name": "Onion",
    'subscribed': 80,
    "category": "vegetable",
    "price": 100,
    'oldPrice' : 120,
    "image": "https://static.vecteezy.com/system/resources/previews/027/214/959/original/garlic-garlic-garlic-transparent-background-ai-generated-free-png.png",
    "ishavediscount": true,
    "discountamount": 25,
    "minorder": 5,
    "details": "Fresh and organic potatoes sourced from local farms. Perfect for a variety of dishes.",
    "review": {
      "rating": 4.5,
      "count": 320
    },
    "FAQ": [
      {
        "question": "What is the origin of these potatoes?",
        "answer": "These potatoes are sourced from local farms."
      },
      {
        "question": "Are these potatoes organic?",
        "answer": "Yes, these potatoes are 100% organic."
      }
    ]
  },
  {
    "id": 3,
    "name": "Tomato",
    "category": "vegetable",
    'subscribed': 55,
    "price": 50,
    'oldPrice' : 65,
    "image": "https://purepng.com/public/uploads/large/purepng.com-tomatovegetables-tomato-941524712357ikhy3.png",
    "ishavediscount": false,
    "discountamount": 5,
    "minorder": 7,
    "details": "Fresh and organic potatoes sourced from local farms. Perfect for a variety of dishes.",
    "review": {
      "rating": 4.5,
      "count": 320
    },
    "FAQ": [
      {
        "question": "What is the origin of these potatoes?",
        "answer": "These potatoes are sourced from local farms."
      },
      {
        "question": "Are these potatoes organic?",
        "answer": "Yes, these potatoes are 100% organic."
      }
    ]
  },
  {
    "id": 3,
    "name": "Carrot",
    'subscribed': 52,
    "category": "vegetable",
    "price": 50,
    'oldPrice' : 62,
    "image": "https://www.pikpng.com/pngl/b/53-530112_carrot-png-download-image-carrot-png-clipart.png",
    "ishavediscount": true,
    "discountamount": 5,
    "minorder": 1,
    "details": "Fresh and organic potatoes sourced from local farms. Perfect for a variety of dishes.",
    "review": {
      "rating": 4.5,
      "count": 320
    },
    "FAQ": [
      {
        "question": "What is the origin of these potatoes?",
        "answer": "These potatoes are sourced from local farms."
      },
      {
        "question": "Are these potatoes organic?",
        "answer": "Yes, these potatoes are 100% organic."
      }
    ]
  },

  //Fruits dummy product

  {
    "id": 3,
    "name": "Banana",
    'subscribed': 65,
    "category": "Fruits",
    "price": 30,
    'oldPrice' : 56,
    "image": "https://i.pinimg.com/originals/39/e3/8a/39e38a13253cb077924e1714b0f292e9.png",
    "ishavediscount": true,
    "discountamount": 5,
    "minorder": 5,
    "details": "Fresh and organic potatoes sourced from local farms. Perfect for a variety of dishes.",
    "review": {
      "rating": 4.5,
      "count": 320
    },
    "FAQ": [
      {
        "question": "What is the origin of these potatoes?",
        "answer": "These potatoes are sourced from local farms."
      },
      {
        "question": "Are these potatoes organic?",
        "answer": "Yes, these potatoes are 100% organic."
      }
    ]
  },
  // Rice

  {
    "id": 3,
    "name": "Chinigura",
    "category": "Rice",
    'subscribed': 58,
    "price": 50,
    'oldPrice' : 75,
    "image": "https://pnghq.com/wp-content/uploads/white-rice-png-image-with-transparent-background-47177.png",
    "ishavediscount": true,
    "discountamount": 5,
    "minorder": 1,
    "details": "Fresh and organic potatoes sourced from local farms. Perfect for a variety of dishes.",
    "review": {
      "rating": 4.5,
      "count": 320
    },
    "FAQ": [
      {
        "question": "What is the origin of these potatoes?",
        "answer": "These potatoes are sourced from local farms."
      },
      {
        "question": "Are these potatoes organic?",
        "answer": "Yes, these potatoes are 100% organic."
      }
    ]
  },
  //milk

  {
    "id": 3,
    'subscribed': 69,
    "name": "Milk",
    "category": "milk",
    "price": 150,
    'oldPrice' : 230,
    "image": "https://freepngdownload.com/image/thumb/milk-png-free-download-71.png",
    "ishavediscount": false,
    "discountamount": 5,
    "minorder": 1,
    "details": "Fresh and organic potatoes sourced from local farms. Perfect for a variety of dishes.",
    "review": {
      "rating": 4.5,
      "count": 320
    },
    "FAQ": [
      {
        "question": "What is the origin of these potatoes?",
        "answer": "These potatoes are sourced from local farms."
      },
      {
        "question": "Are these potatoes organic?",
        "answer": "Yes, these potatoes are 100% organic."
      }
    ]
  },
];

// separate images

// Extracting image URLs from productJSON
List<String> extractImageUrls(List<Map<String, dynamic>> products) {
  return products.map((product) => product['image'] as String).toList();
}

final List<String> imageUrls = extractImageUrls(productJSON);
