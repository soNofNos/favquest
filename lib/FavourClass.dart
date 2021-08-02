import 'package:favquest/FriendClass.dart';

class Favour{
  final String uuid;
  final String description;
  final DateTime dueDate;
  final bool accepted;
  final DateTime completed;
  final Friend friend;

  Favour({
    this.uuid,
    this.description,
    this.dueDate,
    this.accepted,
    this.completed,
    this.friend,
});

  get isDoing =>
    accepted == true && completed == null ;

  get isRequested => accepted == null;

  get isCompleted => completed != null;

  get isRefused => accepted == false;

}