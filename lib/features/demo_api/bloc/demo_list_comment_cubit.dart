import 'package:bloc/bloc.dart';
import 'package:driver_app/data/model/req_list_commnet_model.dart';
import 'package:equatable/equatable.dart';

import '../../../data/services/get/get_list_conments.dart';

part 'demo_list_comment_state.dart';

class DemoListCommentCubit extends Cubit<DemoListCommentState> {
  DemoListCommentCubit(this._getListCommentService)
      : super( DemoListCommentState());

  final GetListCommentService _getListCommentService;
  Future<void> getListComment() async {
    try {
      emit(state.copyWith(status: DemoListCommentStatus.loading));
      final result = await _getListCommentService.getListComment();
      emit(state.copyWith(
          status: DemoListCommentStatus.loaded,
          listComment: result,
      ));
    } on Exception {
      emit(state.copyWith(status: DemoListCommentStatus.error));
    }
  }
}
