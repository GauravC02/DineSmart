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
      MenuItem(id: 1, name: 'Fried Chicken', price: 5.99),
      MenuItem(id: 2, name: 'Chicken Popcorn', price: 4.99),
      MenuItem(id: 3, name: 'Chicken Burger', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(id: 4, name: 'Cola', price: 1.99),
      MenuItem(id: 5, name: 'Iced Tea', price: 2.49),
      MenuItem(id: 6, name: 'Milkshake', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Sides',
    items: [
      MenuItem(id: 7, name: 'Mashed Potatoes', price: 2.99),
      MenuItem(id: 8, name: 'Coleslaw', price: 1.99),
      MenuItem(id: 9, name: 'Corn on the Cob', price: 1.49),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 10, name: 'Chocolate Cake', price: 3.49),
      MenuItem(id: 11, name: 'Apple Pie', price: 1.99),
    ],
  ),
  MenuCategory(
    name: 'Family Meals',
    items: [
      MenuItem(id: 12, name: '8-Piece Bucket', price: 19.99),
      MenuItem(id: 13, name: '12-Piece Bucket', price: 27.99),
    ],
  ),
];

// Menu for Pizza Hut
final List<MenuCategory> pizzaHutMenu = [
  MenuCategory(
    name: 'Pizza',
    items: [
      MenuItem(id: 14, name: 'Pepperoni Pizza', price: 10.99),
      MenuItem(id: 15, name: 'Supreme Pizza', price: 12.99),
      MenuItem(id: 16, name: 'Vegetarian Pizza', price: 11.99),
    ],
  ),
  MenuCategory(
    name: 'Pasta',
    items: [
      MenuItem(id: 17, name: 'Spaghetti Carbonara', price: 8.99),
      MenuItem(id: 18, name: 'Chicken Alfredo', price: 9.99),
      MenuItem(id: 19, name: 'Vegetable Lasagna', price: 7.99),
    ],
  ),
  MenuCategory(
    name: 'Appetizers',
    items: [
      MenuItem(id: 20, name: 'Garlic Breadsticks', price: 4.49),
      MenuItem(id: 21, name: 'Stuffed Garlic Knots', price: 5.99),
    ],
  ),
  MenuCategory(
    name: 'Salads',
    items: [
      MenuItem(id: 22, name: 'Caesar Salad', price: 6.99),
      MenuItem(id: 23, name: 'Greek Salad', price: 7.49),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 24, name: 'Cinnamon Sticks', price: 3.99),
      MenuItem(id: 25, name: 'Chocolate Brownie', price: 4.99),
    ],
  ),
];

// Menu for McDonald's
final List<MenuCategory> mcdonaldsMenu = [
  MenuCategory(
    name: 'Burgers',
    items: [
      MenuItem(id: 26, name: 'Big Mac', price: 4.99),
      MenuItem(id: 27, name: 'Quarter Pounder', price: 5.99),
      MenuItem(id: 28, name: 'Cheeseburger', price: 2.99),
    ],
  ),
  MenuCategory(
    name: 'Fries',
    items: [
      MenuItem(id: 29, name: 'Medium Fries', price: 2.49),
      MenuItem(id: 30, name: 'Large Fries', price: 2.99),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(id: 31, name: 'Coca-Cola', price: 1.99),
      MenuItem(id: 32, name: 'Sprite', price: 1.99),
      MenuItem(id: 33, name: 'Fanta', price: 1.99),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 34, name: 'Apple Pie', price: 1.49),
      MenuItem(id: 35, name: 'McFlurry', price: 3.49),
    ],
  ),
  MenuCategory(
    name: 'Breakfast',
    items: [
      MenuItem(id: 36, name: 'Egg McMuffin', price: 3.99),
      MenuItem(id: 37, name: 'Hotcakes', price: 4.49),
    ],
  ),
  MenuCategory(
    name: 'Salads',
    items: [
      MenuItem(id: 38, name: 'Caesar Salad', price: 3.99),
      MenuItem(id: 39, name: 'Garden Salad', price: 3.49),
    ],
  ),
  MenuCategory(
    name: 'Wraps',
    items: [
      MenuItem(id: 40, name: 'Grilled Chicken Wrap', price: 4.99),
      MenuItem(id: 41, name: 'Veggie Wrap', price: 3.99),
    ],
  ),
];

// Menu for Burger King
final List<MenuCategory> burgerKingMenu = [
  MenuCategory(
    name: 'Burgers',
    items: [
      MenuItem(id: 42, name: 'Whopper', price: 5.99),
      MenuItem(id: 43, name: 'Chicken Sandwich', price: 4.99),
      MenuItem(id: 44, name: 'Cheeseburger', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Sides',
    items: [
      MenuItem(id: 45, name: 'Onion Rings', price: 2.99),
      MenuItem(id: 46, name: 'Mozzarella Sticks', price: 3.49),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(id: 47, name: 'Pepsi', price: 1.99),
      MenuItem(id: 48, name: 'Diet Coke', price: 1.99),
      MenuItem(id: 49, name: 'Lemonade', price: 2.49),
    ],
  ),
  MenuCategory(
    name: 'Salads',
    items: [
      MenuItem(id: 50, name: 'Caesar Salad', price: 4.99),
      MenuItem(id: 51, name: 'Garden Salad', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(id: 52, name: 'Apple Pie', price: 1.49),
      MenuItem(id: 53, name: 'Sundae', price: 2.99),
    ],
  ),
  MenuCategory(
    name: 'Breakfast',
    items: [
      MenuItem(id: 54, name: 'Pancakes', price: 3.99),
      MenuItem(id: 55, name: 'French Toast Sticks', price: 2.99),
    ],
  ),
  MenuCategory(
    name: 'Chicken',
    items: [
      MenuItem(id: 56, name: 'Chicken Tenders', price: 4.99),
      MenuItem(id: 57, name: 'Grilled Chicken Salad', price: 5.99),
    ],
  ),
];

// Menu for Starbucks
final List<MenuCategory> starbucksMenu = [
  MenuCategory(
    name: 'Coffee',
    items: [
      MenuItem(id: 58, name: 'Caffè Americano', price: 2.49),
      MenuItem(id: 59, name: 'Cappuccino', price: 3.49),
      MenuItem(id: 60, name: 'Latte', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Tea',
    items: [
      MenuItem(id: 61, name: 'Green Tea', price: 2.99),
      MenuItem(id: 62, name: 'Chai Tea Latte', price: 4.9),
      MenuItem(id: 63, name: 'Earl Grey', price: 3.49),
    ],
  ),
  MenuCategory(
    name: 'Pastries',
    items: [
      MenuItem(id: 64, name: 'Croissant', price: 2.99),
      MenuItem(id: 65, name: 'Blueberry Muffin', price: 3.49),
      MenuItem(id: 66, name: 'Chocolate Chip Cookie', price: 1.99),
    ],
  ),
  MenuCategory(
    name: 'Sandwiches',
    items: [
      MenuItem(id: 67, name: 'Turkey & Cheese', price: 5.49),
      MenuItem(id: 68, name: 'Caprese Panini', price: 6.49),
    ],
  ),
  MenuCategory(
    name: 'Smoothies',
    items: [
      MenuItem(id: 69, name: 'Mango Tango', price: 4.99),
      MenuItem(id: 70, name: 'Berry Blast', price: 4.99),
    ],
  ),
  MenuCategory(
    name: 'Yogurt Parfaits',
    items: [
      MenuItem(id: 71, name: 'Strawberry Yogurt Parfait', price: 3.49),
      MenuItem(id: 72, name: 'Granola & Honey Yogurt Parfait', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Bottled Beverages',
    items: [
      MenuItem(id: 73, name: 'Bottled Water', price: 1.49),
      MenuItem(id: 74, name: 'Juice', price: 2.49),
    ],
  ),
];
