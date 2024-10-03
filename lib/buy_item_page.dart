import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'thank_you_page.dart';
import 'cart_page.dart';

class BuyItemPage extends StatefulWidget {
  final int itemIndex;

  BuyItemPage({required this.itemIndex});

  @override
  _BuyItemPageState createState() => _BuyItemPageState();
}

class _BuyItemPageState extends State<BuyItemPage> {
  int quantity = 1;
  int _selectedIndex = 0; // Index for Bottom Navigation Bar

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
        Navigator.pushNamed(context, '/products'); // Navigate to Products Page
        break;
      case 3:
        Navigator.pushNamed(context, '/profile'); // Navigate to Profile Page
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Buy Item', showBackButton: true),
      backgroundColor: Color(0xFFFFD700), // Gold background
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/item 6.jpg',
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Product ${widget.itemIndex}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${(widget.itemIndex + 1) * 10}', // Sample price
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (quantity > 1) quantity--;
                    });
                  },
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
              child: Text('Add to Cart'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/thankyou');
              },
              child: Text('Confirm Your Order'),
            ),
          ],
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
      ),
    );
  }
}
