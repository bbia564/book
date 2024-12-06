import 'package:intl/intl.dart';
import 'dart:convert';

class BookEntity {
  int id;
  DateTime createdTime;
  String name;
  List<BookContent> list;

  BookEntity({
    required this.id,
    required this.createdTime,
    required this.name,
    required this.list
  });

  factory BookEntity.fromJson(Map<String, dynamic> json) {
    return BookEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      name: json['name'],
      list: (jsonDecode(json['list']) as List)
          .map((e) => BookContent.fromJson(e))
          .toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'name': name,
      'list': jsonEncode(list.map((e) => e.toJson()).toList())
    };
  }
}

class BookContent {
  DateTime createdTime;
  String title;
  String content;

  BookContent({
   required this.createdTime,
    required this.title,
    required this.content
  });

  factory BookContent.fromJson(Map<String, dynamic> json) {
    return BookContent(
      createdTime: DateTime.parse(json['createdTime']),
      title: json['title'],
      content: json['content']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdTime': createdTime.toIso8601String(),
      'title': title,
      'content': content
    };
  }

  String get createdTimeString {
    return DateFormat('yyyy/MM/dd HH:mm').format(createdTime);
  }
}

class NoteEntity {
  int id;
  DateTime createdTime;
  String title;
  String content;

  NoteEntity({
    required this.id,
    required this.createdTime,
    required this.title,
    required this.content
  });

  factory NoteEntity.fromJson(Map<String, dynamic> json) {
    return NoteEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      title: json['title'],
      content: json['content']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'title': title,
      'content': content
    };
  }

  String get createdTimeString {
    final now = DateTime.now();
    if (now.difference(createdTime).inDays < 1) {
      return DateFormat('HH:mm').format(createdTime);
    }
    return DateFormat('yyyy/MM/dd HH:mm').format(createdTime);
  }
}