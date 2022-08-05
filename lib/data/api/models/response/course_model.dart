class Course {
  final int id;
  final String name;
  final String courseDetail;

  const Course({
    required this.id,
    required this.name,
    required this.courseDetail,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      courseDetail: json['courseDetail'],
    );
  }
}
