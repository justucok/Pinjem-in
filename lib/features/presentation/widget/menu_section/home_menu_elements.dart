import 'package:flutter/material.dart';

class HomeMenuElements extends StatelessWidget {
  const HomeMenuElements({
    required this.menuColor,
    required this.iconContainerColor,
    required this.menuText,
    required this.useIcon,
    this.menuIcon,
    this.menuImage,
    super.key,
  });

  final Color menuColor;
  final Color iconContainerColor;
  final IconData? menuIcon;
  final String? menuImage;
  final String menuText;
  final bool useIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: menuColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: iconContainerColor,
                shape: BoxShape.circle,
              ),
              child: useIcon
                  ? Center(
                      child: Icon(
                        menuIcon,
                        color: Colors.white,
                      ),
                    )
                  : Center(
                      child: Image.asset(menuImage!),
                    ),
            ),
            const SizedBox(
              height: 7,
            ),
            SizedBox(
              width: 115,
              child: Text(
                menuText,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
