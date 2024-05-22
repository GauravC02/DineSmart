class MenuItem {
  final String name;
  final double price;

  MenuItem({required this.name, required this.price});
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
      MenuItem(name: 'Fried Chicken', price: 5.99),
      MenuItem(name: 'Chicken Popcorn', price: 4.99),
      MenuItem(name: 'Chicken Burger', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(name: 'Cola', price: 1.99),
      MenuItem(name: 'Iced Tea', price: 2.49),
      MenuItem(name: 'Milkshake', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Sides',
    items: [
      MenuItem(name: 'Mashed Potatoes', price: 2.99),
      MenuItem(name: 'Coleslaw', price: 1.99),
      MenuItem(name: 'Corn on the Cob', price: 1.49),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(name: 'Chocolate Cake', price: 3.49),
      MenuItem(name: 'Apple Pie', price: 1.99),
    ],
  ),
  MenuCategory(
    name: 'Family Meals',
    items: [
      MenuItem(name: '8-Piece Bucket', price: 19.99),
      MenuItem(name: '12-Piece Bucket', price: 27.99),
    ],
  ),
];

// Menu for Pizza Hut
final List<MenuCategory> pizzaHutMenu = [
  MenuCategory(
    name: 'Pizza',
    items: [
      MenuItem(name: 'Pepperoni Pizza', price: 10.99),
      MenuItem(name: 'Supreme Pizza', price: 12.99),
      MenuItem(name: 'Vegetarian Pizza', price: 11.99),
    ],
  ),
  MenuCategory(
    name: 'Pasta',
    items: [
      MenuItem(name: 'Spaghetti Carbonara', price: 8.99),
      MenuItem(name: 'Chicken Alfredo', price: 9.99),
      MenuItem(name: 'Vegetable Lasagna', price: 7.99),
    ],
  ),
  MenuCategory(
    name: 'Appetizers',
    items: [
      MenuItem(name: 'Garlic Breadsticks', price: 4.49),
      MenuItem(name: 'Stuffed Garlic Knots', price: 5.99),
    ],
  ),
  MenuCategory(
    name: 'Salads',
    items: [
      MenuItem(name: 'Caesar Salad', price: 6.99),
      MenuItem(name: 'Greek Salad', price: 7.49),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(name: 'Cinnamon Sticks', price: 3.99),
      MenuItem(name: 'Chocolate Brownie', price: 4.99),
    ],
  ),
];

// Menu for McDonald's
final List<MenuCategory> mcdonaldsMenu = [
  MenuCategory(
    name: 'Burgers',
    items: [
      MenuItem(name: 'Big Mac', price: 4.99),
      MenuItem(name: 'Quarter Pounder', price: 5.99),
      MenuItem(name: 'Cheeseburger', price: 2.99),
    ],
  ),
  MenuCategory(
    name: 'Fries',
    items: [
      MenuItem(name: 'Medium Fries', price: 2.49),
      MenuItem(name: 'Large Fries', price: 2.99),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(name: 'Coca-Cola', price: 1.99),
      MenuItem(name: 'Sprite', price: 1.99),
      MenuItem(name: 'Fanta', price: 1.99),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(name: 'Apple Pie', price: 1.49),
      MenuItem(name: 'McFlurry', price: 3.49),
    ],
  ),
  MenuCategory(
    name: 'Breakfast',
    items: [
      MenuItem(name: 'Egg McMuffin', price: 3.99),
      MenuItem(name: 'Hotcakes', price: 4.49),
    ],
  ),
  MenuCategory(
    name: 'Salads',
    items: [
      MenuItem(name: 'Caesar Salad', price: 3.99),
      MenuItem(name: 'Garden Salad', price: 3.49),
    ],
  ),
  MenuCategory(
    name: 'Wraps',
    items: [
      MenuItem(name: 'Grilled Chicken Wrap', price: 4.99),
      MenuItem(name: 'Veggie Wrap', price: 3.99),
    ],
  ),
];

// Menu for Burger King
final List<MenuCategory> burgerKingMenu = [
  MenuCategory(
    name: 'Burgers',
    items: [
      MenuItem(name: 'Whopper', price: 5.99),
      MenuItem(name: 'Chicken Sandwich', price: 4.99),
      MenuItem(name: 'Cheeseburger', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Sides',
    items: [
      MenuItem(name: 'Onion Rings', price: 2.99),
      MenuItem(name: 'Mozzarella Sticks', price: 3.49),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(name: 'Pepsi', price: 1.99),
      MenuItem(name: 'Diet Coke', price: 1.99),
      MenuItem(name: 'Lemonade', price: 2.49),
    ],
  ),
  MenuCategory(
    name: 'Salads',
    items: [
      MenuItem(name: 'Caesar Salad', price: 4.99),
      MenuItem(name: 'Garden Salad', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Desserts',
    items: [
      MenuItem(name: 'Apple Pie', price: 1.49),
      MenuItem(name: 'Sundae', price: 2.99),
    ],
  ),
  MenuCategory(
    name: 'Breakfast',
    items: [
      MenuItem(name: 'Pancakes', price: 3.99),
      MenuItem(name: 'French Toast Sticks', price: 2.99),
    ],
  ),
  MenuCategory(
    name: 'Chicken',
    items: [
      MenuItem(name: 'Chicken Tenders', price: 4.99),
      MenuItem(name: 'Grilled Chicken Salad', price: 5.99),
    ],
  ),
];

// Menu for Starbucks
final List<MenuCategory> starbucksMenu = [
  MenuCategory(
    name: 'Coffee',
    items: [
      MenuItem(name: 'Caffè Americano', price: 2.49),
      MenuItem(name: 'Cappuccino', price: 3.49),
      MenuItem(name: 'Latte', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Tea',
    items: [
      MenuItem(name: 'Green Tea', price: 2.99),
      MenuItem(name: 'Chai Tea Latte', price: 4.9),
      MenuItem(name: 'Earl Grey', price: 3.49),
    ],
  ),
  MenuCategory(
    name: 'Pastries',
    items: [
      MenuItem(name: 'Croissant', price: 2.99),
      MenuItem(name: 'Blueberry Muffin', price: 3.49),
      MenuItem(name: 'Chocolate Chip Cookie', price: 1.99),
    ],
  ),
  MenuCategory(
    name: 'Sandwiches',
    items: [
      MenuItem(name: 'Turkey & Cheese', price: 5.49),
      MenuItem(name: 'Caprese Panini', price: 6.49),
    ],
  ),
  MenuCategory(
    name: 'Smoothies',
    items: [
      MenuItem(name: 'Mango Tango', price: 4.99),
      MenuItem(name: 'Berry Blast', price: 4.99),
    ],
  ),
  MenuCategory(
    name: 'Yogurt Parfaits',
    items: [
      MenuItem(name: 'Strawberry Yogurt Parfait', price: 3.49),
      MenuItem(name: 'Granola & Honey Yogurt Parfait', price: 3.99),
    ],
  ),
  MenuCategory(
    name: 'Bottled Beverages',
    items: [
      MenuItem(name: 'Bottled Water', price: 1.49),
      MenuItem(name: 'Juice', price: 2.49),
    ],
  ),
];
