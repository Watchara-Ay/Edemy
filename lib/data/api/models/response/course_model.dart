class Course {
  final int id;
  final String name;

  const Course({
    required this.id,
    required this.name,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
    );
  }
}