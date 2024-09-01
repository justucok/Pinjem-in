import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pinjem_in_app/features/presentation/bloc/notification/notification_car_detail/notification_car_detail_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/notification/notification_room_detail/notification_room_detail_bloc.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/detail_riwayat_pinjam_ruangan/detail_riwayat_pinjam_ruangan_loading.dart';
import 'package:pinjem_in_app/features/presentation/widget/notification/notification_breadcrumbs.dart';
import 'package:pinjem_in_app/features/presentation/widget/notification/notification_detail.dart';
import 'package:shimmer/shimmer.dart';

class NotificationDetailScreen extends StatelessWidget {
  const NotificationDetailScreen({
    required this.type,
    required this.transactionId,
    super.key,
  });
  final String type;
  final int transactionId;

  @override
  Widget build(BuildContext context) {
    final carNotifDetailBloc = NotificationCarDetailBloc();
    final roomNotifDetailBloc = NotificationRoomDetailBloc();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => carNotifDetailBloc),
        BlocProvider(create: (context) => roomNotifDetailBloc),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(),
          ),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              const NotificationBreadcrumb(
                notifDetail: true,
              ),
              const SizedBox(
                height: 30,
              ),
              if (type == 'Car')
                BlocBuilder<NotificationCarDetailBloc,
                    NotificationCarDetailState>(
                  bloc: carNotifDetailBloc
                    ..add(LoadNotificationCarDetail(id: '$transactionId')),
                  builder: (context, state) {
                    if (state is NotificationCarDetailSuccess) {
                      final data = state.carData;
                      return NotificationDetail(
                        type: type,
                        tujuanAcara: data.destination,
                        deskripsi: data.description,
                        tanggal: DateFormat('dd MMMM yyyy')
                            .format(DateTime.parse(data.datetimeStart)),
                        jam: DateFormat('HH.mm')
                            .format(DateTime.parse(data.datetimeStart)),
                        penumpang: '${data.passanger}',
                        sopir: data.driver,
                        catatan: data.passangerDesc,
                        status: data.status,
                        confirmNote: data.confirmationNote,
                        carId: data.carId,
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: const Color(0xffe8e8e8),
                        highlightColor: const Color(0xffc4c4c4),
                        child: const DetailPinjamRuanganLoading(
                          status: 'Diterima',
                        ),
                      );
                    }
                  },
                )
              else
                BlocBuilder<NotificationRoomDetailBloc,
                    NotificationRoomDetailState>(
                  bloc: roomNotifDetailBloc
                    ..add(LoadNotificationRoomDetail(id: '$transactionId')),
                  builder: (context, state) {
                    if (state is NotificationRoomDetailSuccess) {
                      final data = state.roomData;
                      return NotificationDetail(
                        type: type,
                        tujuanAcara: data.event,
                        deskripsi: data.description,
                        tanggal: DateFormat('dd MMMM yyyy')
                            .format(DateTime.parse(data.date)),
                        penumpang: '${data.participant}',
                        sopir: data.consumption,
                        catatan: data.note,
                        mulai: data.timeStart,
                        selesai: data.timeEnd,
                        status: data.status,
                        confirmNote: data.confirmationNote,
                        roomId: data.roomId,
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: const Color(0xffe8e8e8),
                        highlightColor: const Color(0xffc4c4c4),
                        child: const DetailPinjamRuanganLoading(
                          status: 'Diterima',
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
