import 'package:flutter/material.dart';

class NotificationListLoading extends StatelessWidget {
  const NotificationListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          ColoredBox(
            color: Colors.black,
            child: Image.asset('lib/app/assets/image-riwayat-ruangan.png'),
          ),
          const SizedBox(
            width: 13,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              ColoredBox(
                color: Colors.black,
                child: SizedBox(
                  width: 250,
                  child: Text(
                    'Permintaan Peminjaman Ruangan dengan Optimus Telah Dibuat!',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ColoredBox(
                color: Colors.black,
                child: Text(
                  '5 Hari Yang Lalu',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
