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

final List<MenuCategory> menu = [
  MenuCategory(
    name: 'Snacks',
    items: [
      MenuItem(name: 'French Fries', price: 3.99),
      MenuItem(name: 'Chicken Wings', price: 6.99),
      MenuItem(name: 'Onion Rings', price: 4.99),
    ],
  ),
  MenuCategory(
    name: 'Drinks',
    items: [
      MenuItem(name: 'Cola', price: 1.99),
      MenuItem(name: 'Iced Tea', price: 2.49),
      MenuItem(name: 'Orange Juice', price: 2.99),
    ],
  ),
  MenuCategory(
    name: 'Dinner',
    items: [
      MenuItem(name: 'Steak', price: 15.99),
      MenuItem(name: 'Salmon', price: 12.99),
      MenuItem(name: 'Pasta', price: 10.99),
    ],
  ),
  MenuCategory(
    name: 'Breakfast',
    items: [
      MenuItem(name: 'Pancakes', price: 8.99),
      MenuItem(name: 'Omelette', price: 7.99),
      MenuItem(name: 'Bagel with Cream Cheese', price: 5.99),
    ],
  ),
  MenuCategory(
    name: 'Dessert',
    items: [
      MenuItem(name: 'Cheesecake', price: 4.99),
      MenuItem(name: 'Ice Cream Sundae', price: 3.99),
      MenuItem(name: 'Chocolate Cake', price: 5.99),
    ],
  ),
];
