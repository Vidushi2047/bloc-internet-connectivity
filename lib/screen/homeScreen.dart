import 'package:bloc_internet_conectivity/bloc/internetBloc/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<InternetBloc, InternetState>(
              listener: (context, state) {
                if (state is InternetGainedState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Connected'),
                    duration: Duration(milliseconds: 300),
                  ));
                } else if (state is InternetLostState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Internet Lost'),
                    duration: Duration(milliseconds: 300),
                  ));
                }
              },
              builder: (context, state) {
                if (state is InternetGainedState) {
                  return Text('Connected');
                } else if (state is InternetLostState) {
                  return Text('Not Connected');
                } else {
                  return Text('Loading................');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
