class Student {
  String name;
  String imageUrl;
  Student({
    required this.name,
    required this.imageUrl,
  });

  factory Student.fromJson(Map<String, dynamic> map) {
    return Student(
      name: map["name"]["first"],
      imageUrl: map["picture"]["medium"],
    );
  }

  @override
  String toString() => 'Student(name: $name, imageUrl: $imageUrl)';
}
