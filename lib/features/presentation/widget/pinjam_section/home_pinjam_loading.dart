import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class HomePinjamLoading extends StatelessWidget {
  const HomePinjamLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColoredBox(
                  color: Colors.red,
                  child: Text(
                    'Lorem Ipsum',
                    style: homePinjamTitleStyle.copyWith(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ColoredBox(
                      color: Colors.black,
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: Color(0xff2B9FDC),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(child: Text('YYYY-MM-DD hh:mm a')),
                        ],
                      ),
                    ),
                    Container(
                      height: 27,
                      width: 92,
                      decoration: BoxDecoration(
                        color: const Color(0xffDCFFDC),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Color(0xff008000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    ColoredBox(
                      color: Colors.black,
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            color: Color(0xff2B9FDC),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('YYYY-MM-DD hh:mm a'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ColoredBox(
                      color: Colors.black,
                      child: SizedBox(
                        width: 153,
                        child: Text('Pinjaman diterima, ayo ambil mobil'),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffE26B00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Konfirmasi',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
