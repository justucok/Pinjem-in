import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({
    required this.type,
    required this.title,
    required this.timeago,
    super.key,
  });

  final String type;
  final String title;
  final String timeago;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xffECF8FF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Image.asset(
            type == 'Room'
                ? 'lib/app/assets/image-riwayat-ruangan.png'
                : 'lib/app/assets/image-riwayat-mobil.png',
          ),
          const SizedBox(
            width: 13,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 250,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                timeago,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
