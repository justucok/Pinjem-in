import 'package:flutter/material.dart';
import 'package:pinjem_in_app/features/presentation/widget/menu_section/home_menu_elements.dart';

class HomeMenuSection extends StatelessWidget {
  const HomeMenuSection({
    required this.onTapMobil,
    required this.onTapRuangan,
    required this.onTapRiwayatPinjamMobil,
    required this.onTapRiwayatPinjamRuangan,
    super.key,
  });

  final void Function() onTapMobil;
  final void Function() onTapRiwayatPinjamMobil;
  final void Function() onTapRuangan;
  final void Function() onTapRiwayatPinjamRuangan;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTapMobil,
              child: const HomeMenuElements(
                menuColor: Color(0xffC1E9FF),
                iconContainerColor: Color(0xff0C6898),
                menuIcon: Icons.add,
                menuText: 'Pinjam Mobil',
                useIcon: true,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: onTapRiwayatPinjamMobil,
              child: const HomeMenuElements(
                menuColor: Color(0xffC1E9FF),
                iconContainerColor: Color(0xff0C6898),
                menuImage: 'lib/app/assets/car.png',
                menuText: 'Riwayat Pinjam Mobil',
                useIcon: false,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTapRuangan,
              child: const HomeMenuElements(
                menuColor: Color(0xffFDEDCA),
                iconContainerColor: Color(0xffE26B00),
                menuText: 'Pinjam Ruangan',
                useIcon: true,
                menuIcon: Icons.add,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: onTapRiwayatPinjamRuangan,
              child: const HomeMenuElements(
                menuColor: Color(0xffFDEDCA),
                iconContainerColor: Color(0xffE26B00),
                menuText: 'Riwayat Pinjam Ruangan',
                useIcon: false,
                menuImage: 'lib/app/assets/room.png',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
