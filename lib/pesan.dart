import 'package:flutter/material.dart';
import 'package:kuis_124220119/bayar.dart';

class Pesan extends StatefulWidget {
  final String image;
  final String name;
  final String price;

  const Pesan({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _totalRoomController = TextEditingController();
  final TextEditingController _totalNightController = TextEditingController();

  int _totalPrice = 0;

  void _calculateTotalPrice() {
    final int roomCount = int.tryParse(_totalRoomController.text) ?? 0;
    final int nightCount = int.tryParse(_totalNightController.text) ?? 0;
    final int basePrice = int.parse(widget.price.replaceAll('Rp ', '').replaceAll('.', ''));

    setState(() {
      _totalPrice = basePrice * roomCount * nightCount; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name), 
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.asset(
                widget.image,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.price,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Booking Information',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _totalRoomController,
              decoration: const InputDecoration(
                labelText: 'Total Room',
              ),
              onChanged: (value) => _calculateTotalPrice(), 
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _totalNightController,
              decoration: const InputDecoration(
                labelText: 'Total Night',
              ),
              onChanged: (value) => _calculateTotalPrice(), 
            ),
            const SizedBox(height: 40),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bayar(
                        fullName: _nameController.text,
                        email: _emailController.text,
                        totalRoom: _totalRoomController.text,
                        totalNight: _totalNightController.text,
                        price: _totalPrice.toString(),
                      ),
                    ),
                  );
                },
                child: const Text('Proses Ke Pembayaran'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
