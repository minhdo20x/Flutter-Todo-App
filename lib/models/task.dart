class Task {
  final int? id;
  late final String name;
  bool? isDone;

  Task({this.id, required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone!;
  }

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        name: json['name'],
        isDone: json['isDone'] == 0,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone! ? 0 : 1,
    };
  }
}
