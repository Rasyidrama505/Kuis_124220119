import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kuis_124220119/login.dart';
import 'package:kuis_124220119/pesan.dart';
import 'package:kuis_124220119/pesan.dart';
import 'package:url_launcher/url_launcher.dart';


Future<void> _LaunchURL(String url) async {
  final Uri uri = Uri.parse(url); 
  if (await canLaunchUrl(uri)) {  
    await launchUrl(uri);         
  } else {
    throw 'Could not launch $url'; 
  }
}


class Home extends StatefulWidget {
  final String username;  
  const Home({super.key, required this.username});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final List<String> _images = [
    'assets/hotel.jpg', 
    'assets/hotel.jpg', 
    'assets/hotel.jpg', 
    'assets/hotel.jpg',
    'assets/hotel.jpg', 
    'assets/hotel.jpg', 
    'assets/hotel.jpg', 
    'assets/hotel.jpg',
    'assets/hotel.jpg', 
    'assets/hotel.jpg', 
  ];

  final List<String> _productNames = [
    'Blue Lagoon Single Bed',
    'Blue Lagoon Double Bed',
    'Blue Lagoon Single Bed VIP',
    'Blue Lagoon Double Bed VIP',
    'Blue Lagoon Single Bed VVIP',
    'Blue Lagoon Double Bed VVIP',
    'Blue Lagoon Single Bed 1',
    'Blue Lagoon Double Bed 2',
    'Blue Lagoon Single Bed 3',
    'Blue Lagoon Double Bed 4',
  ];

  final List<String> _prices = [
    'Rp 500.000',
    'Rp 750.000',
    'Rp 1.000.000',
    'Rp 1.500.000',
    'Rp 2.500.000',
    'Rp 3.750.000',
    'Rp 1.000.000',
    'Rp 2.000.000',
    'Rp 2.500.000',
    'Rp 2.750.000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Blue Doorz"),
        centerTitle: true, 
        leading: IconButton(
          icon: const Icon(Icons.logout), 
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(), 
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
  height: 150.0,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        'assets/logo.png',
        height: 100, 
        width: 80,
      ),
      const SizedBox(width: 10), 
      Expanded( 
        child: Text(
          "Welcome to Blue Doorz ${widget.username}!", 
          textAlign: TextAlign.left, 
          style: const TextStyle(fontSize: 20),
        ),
      ),
      const SizedBox(width: 10), 
      ElevatedButton(
        onPressed: () {
          String url = 'https://traveloka.com';
          _LaunchURL(url);
        }, 
        child: const Text('About Us'),
      ),
    ],
  ),
),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _images.length, 
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0), 
                          child: Image.asset(
                            _images[index], 
                            height: 300, 
                            width: double.infinity, 
                            fit: BoxFit.cover, 
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _productNames[index], 
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          _prices[index], 
                          style: const TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Pesan(
                                  image: _images[index],
                                  name: _productNames[index],
                                  price: _prices[index],
                                ),
                              ),
                            );
                          },
                          child: const Text('Pesan'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
