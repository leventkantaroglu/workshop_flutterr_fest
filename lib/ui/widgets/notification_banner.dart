import 'package:flutter/material.dart';

class NotificationBanner extends StatelessWidget {
  const NotificationBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        color: Colors.green,
        child: const Center(
          child: Text(
            "Kayıtlar başladı",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
