import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/home_service.dart';
import 'package:pinjem_in_app/features/pinjam_ruangan/data/body/pinjam_ruangan_body.dart';

part 'post_pinjam_ruangan_event.dart';
part 'post_pinjam_ruangan_state.dart';

class PostPinjamRuanganBloc 
extends Bloc<PostPinjamRuanganEvent, PostPinjamRuanganState> {
  PostPinjamRuanganBloc() : super(PostPinjamRuanganInitial()) {
    on<PostDataPinjamRuangan>((event, emit) async {
      emit(PostPinjamRuanganLoading());
      try {
        final response =
        await PinjamRuanganService.postPinjamRuanganBody(event.body);
        log('post body: ${response.message}');
        if (response.status == 200) {
          emit(PostPinjamRuanganSuccess());
        } else {
          emit(PostPinjamRuanganFailed());
        }
        
      } catch (e) {
        log('Post Pinjam Ruangan Catch: $e');
      }
    });
  }
}
