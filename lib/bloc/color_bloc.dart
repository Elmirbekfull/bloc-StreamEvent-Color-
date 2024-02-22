import 'dart:async';

import 'package:flutter/material.dart';

// перечисление событий, которые могут произойти
// ignore: constant_identifier_names
enum ColorEvent { event_red, event_green, event_black }

// Логика управления цветом
class ColorBloc {
  Color _color = Colors.red;
  // 1 controller
  final _inputEventController =
      StreamController<ColorEvent>(); // для входных событий
  StreamSink<ColorEvent> get inputEventSink => _inputEventController
      .sink; // Позволяет добавлять события в _inputEventController
  // 2 controller
  final _outputStateController =
      StreamController<Color>(); // для вывода текущего состояния цвета
  Stream<Color> get outputStateStream => _outputStateController
      .stream; // : Позволяет получать текущее состояние цвета из _outputStateController

  // метод, который обрабатывает события и устанавливает соответствующий цвет
  void _mapEventToState(ColorEvent event) {
    if (event == ColorEvent.event_red) {
      _color = Colors.red;
    } else if (event == ColorEvent.event_green)
      // ignore: curly_braces_in_flow_control_structures
      _color = Colors.green;
    else if (event == ColorEvent.event_black)
      // ignore: curly_braces_in_flow_control_structures
      _color = Colors.black;
    else
      // ignore: curly_braces_in_flow_control_structures
      throw Exception("Неправильный тип события");
    _outputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  // dispose закрытие контроллеров потока
  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
