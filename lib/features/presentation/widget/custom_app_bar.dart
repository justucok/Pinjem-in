import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/app/config/themes/app_theme.dart';
import 'package:pinjem_in_app/features/presentation/bloc/notification/get_notification/notification_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notifBloc = NotificationBloc()..add(LoadNotification());
    return BlocProvider(
      create: (context) => notifBloc,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        title: InkWell(
          onTap: () {
            Navigator.of(context).popAndPushNamed('/home');
          },
          child: Image.asset('lib/app/assets/logo-white.png'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/notification');
            },
            icon: BlocBuilder<NotificationBloc, NotificationState>(
              bloc: notifBloc,
              builder: (context, state) {
                if (state is NotificationSuccess) {
                  final data = state.notification;
                  final status =
                      data.where((element) => element.status == 'Unread');
                  if (status.isNotEmpty) {
                    return Stack(
                      children: [
                        const Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                        ),
                        Container(
                          height: 7,
                          width: 7,
                          margin: const EdgeInsets.only(left: 14, top: 5),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                    );
                  }
                } else {
                  return const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  );
                }
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
            icon: Image.asset('lib/app/assets/profile.png'),
          ),
        ],
      ),
    );
  }
}
