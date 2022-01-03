import 'package:flutter/material.dart';

class NotificationBanner extends StatelessWidget {
  final String bannerText;
  const NotificationBanner(this.bannerText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        color: Colors.green,
        child: Center(
          child: Text(
            bannerText,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
