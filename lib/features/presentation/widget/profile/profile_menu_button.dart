import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/app/core/constant.dart';
import 'package:pinjem_in_app/app/core/sharedpreference.dart';
import 'package:pinjem_in_app/features/presentation/widget/profile/colored_button.dart';
import 'package:pinjem_in_app/features/presentation/widget/profile/profile_button.dart';

class ProfileMenuButton extends StatelessWidget {
  const ProfileMenuButton({
    required this.profileMenuIndex,
    super.key,
  });
  final ValueNotifier<int> profileMenuIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: hintTextColor),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 260,
            child: ListView.builder(
              itemCount: Constants.profileMenu.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final menu = Constants.profileMenu[index];
                final icon = Constants.profileMenuIcon[index];
                return Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: profileMenuIndex,
                      builder: (context, value, child) {
                        return ProfileButton(
                          preIcon: icon,
                          labelText: menu,
                          index: index,
                          value: value,
                          onpressed: () async {
                            profileMenuIndex.value = index;
                            if (index == 0) {
                              await Get.bottomSheet<String>(
                                BottomSheet(
                                  elevation: 5,
                                  backgroundColor: Colors.white,
                                  onClosing: () {
                                    profileMenuIndex.value = 1;
                                  },
                                  builder: (context) {
                                    return SizedBox(
                                      width: double.infinity,
                                      height: 200,
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          const Text(
                                            'Anda Yakin Ingin Keluar?',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ColoredButton(
                                                borderColor:
                                                    Colors.red.shade300,
                                                backgroundColor:
                                                    Colors.red.shade50,
                                                text: 'Tidak',
                                                textColor: Colors.red.shade300,
                                                onTap: () {
                                                  Get.back<bool>();
                                                  profileMenuIndex.value = 1;
                                                },
                                              ),
                                              ColoredButton(
                                                borderColor:
                                                    Colors.green.shade300,
                                                textColor:
                                                    Colors.green.shade400,
                                                backgroundColor:
                                                    Colors.green.shade50,
                                                text: 'Ya',
                                                onTap: () async {
                                                  await SharedPrefStore
                                                      .removeBearerToken();
                                                  if (context.mounted) {
                                                    await Navigator.of(context)
                                                        .pushNamedAndRemoveUntil(
                                                      '/',
                                                      (route) => false,
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
