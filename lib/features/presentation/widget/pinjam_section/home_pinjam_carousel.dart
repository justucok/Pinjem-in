import 'package:flutter/material.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';

class HomePinjamCarousel extends StatelessWidget {
  const HomePinjamCarousel({
    required this.tujuan,
    required this.date,
    required this.time,
    required this.statusDesc,
    required this.onPressed,
    required this.status,
    required this.notYet,
    this.loadAgain,
    super.key,
  });

  final String tujuan;
  final String date;
  final String time;
  final String statusDesc;
  final String status;
  final bool notYet;
  final bool? loadAgain;
  final dynamic Function() onPressed;

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
                Text(
                  tujuan,
                  style: homePinjamTitleStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          color: Color(0xff2B9FDC),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(date),
                      ],
                    ),
                    Container(
                      height: 27,
                      width: 92,
                      decoration: BoxDecoration(
                        color: const Color(0xffDCFFDC),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          status,
                          style: const TextStyle(
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
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                      color: Color(0xff2B9FDC),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(time),
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
                    SizedBox(
                      width: 155,
                      child: Text(statusDesc),
                    ),
                    //Condition
                    if (!notYet)
                      ElevatedButton(
                        onPressed: onPressed,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffE26B00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          loadAgain == null
                              ? 'Konfirmasi'
                              : loadAgain!
                                  ? 'Coba Lagi'
                                  : 'Konfirmasi',
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    else
                      const SizedBox(),
                    //End of condition
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
