import 'package:bloc_tutorial/bloc%20api%20handling%20with%20dio/logic/cubits/post_cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('API Handling'),
      ),
      body: SafeArea(
          child: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          if (state is PostErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error.toString()),
              backgroundColor: Colors.red,
            ));
          }
        },
        builder: (context, state) {
          if (state is PostLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoadedState) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final item = state.posts[index];
                  return ListTile(
                    title: Text(item.title.toString()),
                    subtitle: Text(item.body.toString()),
                  );
                });
          }
          return Center(
            child: Text('An error occured!'),
          );
        },
      )),
    );
  }
}
