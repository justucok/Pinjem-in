import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinjem_in_app/features/presentation/bloc/notification/notification_room_detail/notification_room_detail_bloc.dart';
import 'package:pinjem_in_app/features/presentation/widget/custom_app_bar.dart';
import 'package:pinjem_in_app/features/presentation/widget/detail_riwayat_pinjam_ruangan/detail_riwayat_pinjam_ruangan_loading.dart';
import 'package:pinjem_in_app/features/presentation/widget/riwayat_pinjam_ruangan/riwayat_pinjam_ruangan_breadcrumbs.dart';
import 'package:pinjem_in_app/features/presentation/widget/riwayat_pinjam_ruangan/riwayat_pinjam_ruangan_detail_section.dart';
import 'package:shimmer/shimmer.dart';

class DetailRiwayatPinjamRuanganScreen extends StatelessWidget {
  const DetailRiwayatPinjamRuanganScreen({
    required this.transactionId,
    super.key,
  });

  final String transactionId;

  @override
  Widget build(BuildContext context) {
    final roomDetailBloc = NotificationRoomDetailBloc()
      ..add(LoadNotificationRoomDetail(id: transactionId));
    return BlocProvider(
      create: (context) => roomDetailBloc,
      child: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(),
          ),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              const RiwayatPinjamRuanganBreadcrumbs(riwayatDetail: true),
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<NotificationRoomDetailBloc,
                  NotificationRoomDetailState>(
                bloc: roomDetailBloc,
                builder: (context, state) {
                  if (state is NotificationRoomDetailSuccess) {
                    final data = state.roomData;
                    return RiwayatPinjamRuanganDetailSection(
                      tujuanAcara: data.event,
                      deskripsi: data.description,
                      tanggal: data.date,
                      mulai: data.timeStart,
                      selesai: data.timeEnd,
                      penumpang: '${data.participant}',
                      sopir: data.consumption,
                      catatan: data.note,
                      status: data.status,
                      roomId: data.roomId,
                    );
                  } else {
                    return Shimmer.fromColors(
                      baseColor: const Color(0xffe8e8e8),
                      highlightColor: const Color(0xffc4c4c4),
                      child:
                          const DetailPinjamRuanganLoading(status: 'Diterima'),
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
