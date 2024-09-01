import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/notification/get_notification/notification_bloc.dart';
import 'package:pinjem_in_app/features/presentation/pages/notifikasi/notification_detail_screen.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/notification/notification_breadcrumbs.dart';
import 'package:pinjem_in_app/features/presentation/widget/notification/notification_list.dart';
import 'package:pinjem_in_app/features/presentation/widget/notification/notification_loading.dart';
import 'package:shimmer/shimmer.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationBloc = NotificationBloc()..add(LoadNotification());
    return BlocProvider(
      create: (context) => notificationBloc,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(),
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15),
                child: NotificationBreadcrumb(
                  notifDetail: false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<NotificationBloc, NotificationState>(
                builder: (context, state) {
                  if (state is NotificationSuccess) {
                    final data = state.notification;
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          notificationBloc.add(LoadNotification());
                        },
                        child: ListView.builder(
                          padding: const EdgeInsets.all(15),
                          physics: const BouncingScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute<dynamic>(
                                        builder: (context) =>
                                            NotificationDetailScreen(
                                          type: data[index].type,
                                          transactionId:
                                              data[index].transactionId,
                                        ),
                                      ),
                                    );
                                  },
                                  child: NotificationList(
                                    type: data[index].type,
                                    title: data[index].notification,
                                    timeago: data[index].timeago,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: 6,
                        padding: const EdgeInsets.all(15),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Shimmer.fromColors(
                                baseColor: const Color(0xffe8e8e8),
                                highlightColor: const Color(0xffc4c4c4),
                                child: const NotificationListLoading(),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
