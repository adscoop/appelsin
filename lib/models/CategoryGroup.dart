class CategoryGroup {
  final String? name; // or other fields

  CategoryGroup({this.name});

  factory CategoryGroup.fromJson(Map<String, dynamic> json) {
    return CategoryGroup(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
