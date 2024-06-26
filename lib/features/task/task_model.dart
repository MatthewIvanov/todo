import 'package:flutter/material.dart';

enum TaskAspect { due, importance, text }

enum Importance {
  lowest('Нет'),
  low('Низкий'),
  high('!! Высокий');

  const Importance(this.text);

  final String text;
}

class TaskModel extends InheritedModel<TaskAspect> {
  final DateTime? due;
  final Importance importance;
  final String text;
  final bool completed;

  final int? id;

  const TaskModel(
      {super.key,
      this.id,
      required this.due,
      required this.importance,
      required this.text,
      this.completed = false,
      required super.child});

  static TaskModel of(BuildContext context) {
    final t = InheritedModel.inheritFrom<TaskModel>(context);
    assert(t is TaskModel, throw TypeError());
    return t!;
  }

  @override
  bool updateShouldNotify(TaskModel oldWidget) => this != oldWidget;

  @override
  bool updateShouldNotifyDependent(
          TaskModel oldWidget, Set<TaskAspect> dependencies) =>
      dependencies.contains(TaskAspect.due) && due != oldWidget.due ||
      dependencies.contains(TaskAspect.importance) &&
          importance != oldWidget.importance ||
      dependencies.contains(TaskAspect.text) && text != oldWidget.text;

  TaskModel switchStatus() => TaskModel(
      due: due,
      importance: importance,
      text: text,
      completed: !completed,
      child: child);
}

class UpdateTaskNotification<T> extends Notification {
  final T _data;

  UpdateTaskNotification(this._data);
  get data => _data;
}
