class OrganizationDTO {
  final String id;
  final String name;

  OrganizationDTO({
    required this.id,
    required this.name,
  });

  factory OrganizationDTO.fromJson(Map<String, dynamic> json) {
    return OrganizationDTO(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
