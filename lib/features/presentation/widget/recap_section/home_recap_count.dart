import 'package:flutter/material.dart';

class HomeRecapCount extends StatelessWidget {
  const HomeRecapCount({
    required this.shimmer,
    required this.countTitle,
    required this.pinjamCount,
    required this.diterimaCount,
    required this.ditolakCount,
    this.backgroundColor,
    super.key,
  });

  final Color? backgroundColor;
  final bool shimmer;
  final String countTitle;
  final String pinjamCount;
  final String diterimaCount;
  final String ditolakCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: shimmer ? Border.all(color: Colors.grey) : null,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColoredBox(
                color: shimmer ? Colors.black : Colors.transparent,
                child: Text(
                  countTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ColoredBox(
                  color: shimmer ? Colors.black : Colors.transparent,
                  child: Column(
                    children: [
                      Text(
                        pinjamCount,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Pinjaman',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                  child: VerticalDivider(
                    thickness: 2,
                    color: Color(0xffD9D9D9),
                  ),
                ),
                ColoredBox(
                  color: shimmer ? Colors.black : Colors.transparent,
                  child: Column(
                    children: [
                      Text(
                        diterimaCount,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Diterima',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                  child: VerticalDivider(
                    thickness: 2,
                    color: Color(0xffD9D9D9),
                  ),
                ),
                ColoredBox(
                  color: shimmer ? Colors.black : Colors.transparent,
                  child: Column(
                    children: [
                      Text(
                        ditolakCount,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Ditolak ',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
