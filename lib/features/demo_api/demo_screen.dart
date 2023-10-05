import 'package:driver_app/features/demo_api/bloc/demo_list_comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  void initState() {
    context.read<DemoListCommentCubit>().getListComment();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create list view with 3 item
      body: BlocBuilder<DemoListCommentCubit, DemoListCommentState>(
        builder: (context, state) {
          if (state.status == DemoListCommentStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == DemoListCommentStatus.error) {
            return const Center(
              child: Text('Error'),
            );
          } else if (state.status == DemoListCommentStatus.loaded) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Text(state.listComment!.name ?? 'No data'
                  , style: TextStyle(fontSize: 20)
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
