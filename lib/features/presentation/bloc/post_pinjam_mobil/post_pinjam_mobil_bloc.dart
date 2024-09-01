import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pinjem_in_app/app/core/network/home_service.dart';
import 'package:pinjem_in_app/features/pinjam_mobil/data/body/pinjam_mobil_body.dart';

part 'post_pinjam_mobil_event.dart';
part 'post_pinjam_mobil_state.dart';

class PostPinjamMobilBloc
    extends Bloc<PostPinjamMobilEvent, PostPinjamMobilState> {
  PostPinjamMobilBloc() : super(PostPinjamMobilInitial()) {
    on<PostDataPinjamMobil>((event, emit) async {
      emit(PostPinjamMobilLoading());
      try {
        final response =
            await PinjamMobilService.postPinjamMobilBody(event.body);
        log('post body: ${response.message}');

        if (response.status == 200) {
          emit(PostPinjamMobilSuccess());
        } else {
          emit(PostPinjamMobilFailed());
        }
      } catch (e) {
        log('Post Pinjam Mobil Catch: $e');
      }
    });
  }
}
