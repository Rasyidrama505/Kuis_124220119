import 'package:flutter/material.dart';

class Bayar extends StatelessWidget {
  final String fullName;
  final String email;
  final String totalRoom;
  final String totalNight;
  final String price; 

  const Bayar({
    super.key,
    required this.fullName,
    required this.email,
    required this.totalRoom,
    required this.totalNight,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Payment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Payment Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Full Name'),
                    SizedBox(height: 10),
                    Text('Email'),
                    SizedBox(height: 10),
                    Text('Total Room'),
                    SizedBox(height: 10),
                    Text('Total Night'),
                    SizedBox(height: 10),
                    Text('Total Price'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(fullName),
                    const SizedBox(height: 10),
                    Text(email),
                    const SizedBox(height: 10),
                    Text(totalRoom),
                    const SizedBox(height: 10),
                    Text(totalNight),
                    const SizedBox(height: 10),
                    Text('Rp $price'), 
                  ],
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Payment successful!'),
                  ),
                );
              },
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
