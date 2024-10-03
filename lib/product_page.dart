import 'package:flutter/material.dart';
import 'buy_item_page.dart';
import 'cart_page.dart';
import 'app_bar.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _selectedIndex = 2; // Index for Bottom Navigation Bar (Products Page)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to the corresponding page based on index
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home'); // Navigate to Home Page
        break;
      case 1:
        Navigator.pushNamed(context, '/cart'); // Navigate to Cart Page
        break;
      case 2:
      // Already on Products Page, do nothing
        break;
      case 3:
        Navigator.pushNamed(context, '/profile'); // Navigate to Profile Page
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD700), // Gold background
      appBar: CustomAppBar(title: 'Products', showBackButton: true),
      body: Scrollbar(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return Card(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/item 6.jpg',
                    height: 50,
                  ),
                  SizedBox(height: 3),
                  Text('Product $index'),
                  Text(
                    '\$${(index + 1) * 10}', // Sample price
                    style: TextStyle(
                      fontSize: 16, // Adjusted font size to be visible
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BuyItemPage(itemIndex: index)),
                      );
                    },
                    child: Text('Buy Now'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        iconSize: 18, // Set icon size to 18 pixels
      ),
    );
  }
}
