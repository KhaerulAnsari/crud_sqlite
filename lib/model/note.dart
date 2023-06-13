// ignore_for_file: prefer_const_declarations

final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    id,
    isImpoetant,
    number,
    title,
    description,
    time,
  ];

  static final String id = '_id';
  static final String isImpoetant = 'isImpoetant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  Note(
      {this.id,
      required this.isImportant,
      required this.number,
      required this.title,
      required this.description,
      required this.createdTime});

  Note copy({
    final int? id,
    final bool? isImportant,
    final int? number,
    final String? title,
    final String? description,
    final DateTime? createdTime,
  }) =>
      Note(
          id: id ?? this.id,
          isImportant: isImportant ?? this.isImportant,
          number: number ?? this.number,
          title: title ?? this.title,
          description: description ?? this.description,
          createdTime: createdTime ?? this.createdTime);

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        isImportant: json[NoteFields.isImpoetant] == 1,
        number: json[NoteFields.number] as int,
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.number: number,
        NoteFields.title: title,
        NoteFields.description: description,
        NoteFields.time: createdTime.toIso8601String(),
        NoteFields.isImpoetant: isImportant ? 1 : 0,
      };
}
