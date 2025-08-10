class Company {

  final String compamyname;
  Company({
    required this.compamyname
});

  factory Company.fromJson(Map<String ,dynamic> map) {
    return Company(compamyname: map['companyname']);
  }

  Map<String, dynamic> toJson(){
    return {
      'companyname':compamyname
    };
  }

}