class MenuItem {
  final int id; // Add id property
  final String name;
  final double price;

  MenuItem({required this.id, required this.name, required this.price});
}

class MenuCategory {
  final String name;
  final List<MenuItem> items;

  MenuCategory({required this.name, required this.items});
}

// Menu for KFC
final List<MenuCategory> kfcMenu = [
  MenuCategory(
    name: 'Snacks',
    items: [
      MenuItem(id: 1, name: 'Fried Chicken', price: 200.0),
      MenuItem(id: 2, name: 'Chicken Popcorn', price: 400.0),
      MenuItem(id: 3, name: 'Chicken Burger', price: 300.0),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(id: 4, name: 'Cola', price: 100.0),
      MenuItem(id: 5, name: 'Iced Tea', price: 200.0),
      MenuItem(id: 6, name: 'Milkshake', price: 200.0),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 10, name: 'Chocolate Cake', price: 600.0),
      MenuItem(id: 11, name: 'Apple Pie', price: 500.0),
    ],
  ),
];

// Menu for Pizza Hut
final List<MenuCategory> pizzaHutMenu = [
  MenuCategory(
    name: 'Dinner',
    items: [
      MenuItem(id: 14, name: 'Pepperoni Pizza', price: 800.0),
      MenuItem(id: 15, name: 'Supreme Pizza', price: 820.0),
      MenuItem(id: 16, name: 'Vegetarian Pizza', price: 670.0),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 24, name: 'Cinnamon Sticks', price: 300.0),
      MenuItem(id: 25, name: 'Chocolate Brownie', price: 400.0),
    ],
  ),
];

// Menu for McDonald's
final List<MenuCategory> mcdonaldsMenu = [
  MenuCategory(
    name: 'Breakfast',
    items: [
      MenuItem(id: 36, name: 'Egg McMuffin', price: 300.0),
      MenuItem(id: 37, name: 'Hotcakes', price: 300.0),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 34, name: 'Apple Pie', price: 500.0),
      MenuItem(id: 35, name: 'McFlurry', price: 300.0),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(id: 31, name: 'Coca-Cola', price: 100.0),
      MenuItem(id: 32, name: 'Sprite', price: 100.0),
      MenuItem(id: 33, name: 'Fanta', price: 100.0),
    ],
  ),
];

// Menu for Burger King
final List<MenuCategory> burgerKingMenu = [
  MenuCategory(
    name: 'Breakfast',
    items: [
      MenuItem(id: 54, name: 'Pancakes', price: 300.0),
      MenuItem(id: 55, name: 'French Toast Sticks', price: 200.0),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 52, name: 'Apple Pie', price: 300.0),
      MenuItem(id: 53, name: 'Chocolate Brownie', price: 400.0),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(id: 47, name: 'Pepsi', price: 140.0),
      MenuItem(id: 48, name: 'Diet Coke', price: 180.0),
      MenuItem(id: 00, name: 'Lemonade', price: 150.0),
    ],
  ),
];

// Menu for Starbucks
final List<MenuCategory> starbucksMenu = [
  MenuCategory(
    name: 'Breakfast',
    items: [
      MenuItem(id: 36, name: 'Egg McMuffin', price: 300.0),
      MenuItem(id: 37, name: 'Hotcakes', price: 400.0),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 34, name: 'Apple Pie', price: 400.0),
      MenuItem(id: 35, name: 'Cream Pie', price: 500.0),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(id: 31, name: 'Coca-Cola', price: 100.0),
      MenuItem(id: 32, name: 'Sprite', price: 100.0),
      MenuItem(id: 33, name: 'Fanta', price: 100.0),
    ],
  ),
];
