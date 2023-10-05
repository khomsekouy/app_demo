part of 'demo_list_comment_cubit.dart';

enum DemoListCommentStatus { initial, loading, loaded, error }

class DemoListCommentState extends Equatable {
   DemoListCommentState({
    this.status = DemoListCommentStatus.loading,
    this.listComment,
    this.message,
  });

  final DemoListCommentStatus status;
  final RequestListCommentModel? listComment;
  final String? message;
  DemoListCommentState copyWith({
    DemoListCommentStatus? status,
    String? massage,
   RequestListCommentModel? listComment,
  }) {
    return DemoListCommentState(
      status: status ?? this.status,
      message: massage ?? message,
      listComment: listComment ?? this.listComment,
    );
  }

  @override
  List<Object?> get props => [status, listComment, status];
}
