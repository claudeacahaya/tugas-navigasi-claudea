import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.pink.shade100,
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.pink,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Claúdea Cahaya Cinta',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
