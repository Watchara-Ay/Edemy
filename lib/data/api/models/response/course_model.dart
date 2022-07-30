class Course {
  final int id;
  final String name;
  final int price;

  const Course({
    required this.id,
    required this.name,
    required this.price,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}