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
      MenuItem(id: 1, name: 'Fried Chicken', price: 5.00),
      MenuItem(id: 2, name: 'Chicken Popcorn', price: 4.00),
      MenuItem(id: 3, name: 'Chicken Burger', price: 3.00),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(id: 4, name: 'Cola', price: 1.00),
      MenuItem(id: 5, name: 'Iced Tea', price: 2.00),
      MenuItem(id: 6, name: 'Milkshake', price: 3.00),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 10, name: 'Chocolate Cake', price: 3.00),
      MenuItem(id: 11, name: 'Apple Pie', price: 1.00),
    ],
  ),
];

// Menu for Pizza Hut
final List<MenuCategory> pizzaHutMenu = [
  MenuCategory(
    name: 'Dinner',
    items: [
      MenuItem(id: 14, name: 'Pepperoni Pizza', price: 10.00),
      MenuItem(id: 15, name: 'Supreme Pizza', price: 12.00),
      MenuItem(id: 16, name: 'Vegetarian Pizza', price: 11.00),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 24, name: 'Cinnamon Sticks', price: 3.00),
      MenuItem(id: 25, name: 'Chocolate Brownie', price: 4.00),
    ],
  ),
];

// Menu for McDonald's
final List<MenuCategory> mcdonaldsMenu = [
  MenuCategory(
    name: 'Breakfast',
    items: [
      MenuItem(id: 36, name: 'Egg McMuffin', price: 3.00),
      MenuItem(id: 37, name: 'Hotcakes', price: 4.00),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 34, name: 'Apple Pie', price: 1.00),
      MenuItem(id: 35, name: 'McFlurry', price: 3.00),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(id: 31, name: 'Coca-Cola', price: 1.00),
      MenuItem(id: 32, name: 'Sprite', price: 1.00),
      MenuItem(id: 33, name: 'Fanta', price: 1.00),
    ],
  ),
];

// Menu for Burger King
final List<MenuCategory> burgerKingMenu = [
  MenuCategory(
    name: 'Breakfast',
    items: [
      MenuItem(id: 54, name: 'Pancakes', price: 3.00),
      MenuItem(id: 55, name: 'French Toast Sticks', price: 2.00),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 52, name: 'Apple Pie', price: 1.00),
      MenuItem(id: 53, name: 'Sundae', price: 2.00),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(id: 47, name: 'Pepsi', price: 1.00),
      MenuItem(id: 48, name: 'Diet Coke', price: 1.00),
      MenuItem(id: 00, name: 'Lemonade', price: 2.00),
    ],
  ),
];

// Menu for Starbucks
final List<MenuCategory> starbucksMenu = [
  MenuCategory(
    name: 'Breakfast',
    items: [
      MenuItem(id: 36, name: 'Egg McMuffin', price: 3.00),
      MenuItem(id: 37, name: 'Hotcakes', price: 4.00),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 34, name: 'Apple Pie', price: 1.00),
      MenuItem(id: 35, name: 'McFlurry', price: 3.00),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(id: 31, name: 'Coca-Cola', price: 1.00),
      MenuItem(id: 32, name: 'Sprite', price: 1.00),
      MenuItem(id: 33, name: 'Fanta', price: 1.00),
    ],
  ),
];
