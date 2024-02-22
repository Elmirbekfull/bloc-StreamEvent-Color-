import 'package:bloc_lesson1/bloc/color_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "BLOC STREAM",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.outputStateStream,
          initialData: Colors.red,
          builder: (context, snapshot) {
            return AnimatedContainer(
              decoration: BoxDecoration(
                  color: snapshot.data,
                  borderRadius: BorderRadius.circular(12)),
              height: 100,
              width: 100,
              duration: const Duration(milliseconds: 1000),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvent.event_red);
            },
            backgroundColor: Colors.red,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvent.event_green);
            },
            backgroundColor: Colors.green,
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.inputEventSink.add(ColorEvent.event_black);
            },
            backgroundColor: Colors.black,
          )
        ],
      ),
    );
  }
}
