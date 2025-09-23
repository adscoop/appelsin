class Product {
   int? id;
  final String varnr;
  final String beskrivelse;
  final double pris;

  Product({
    id,
    required this.varnr,
    required this.beskrivelse,
    required this.pris
});

  factory Product.toJson(Map<String, dynamic> map) {
    return Product(id: map['id'], varnr: map['varenr'], beskrivelse:  map['beskrivelse'], pris:  map['pris']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'varnr': varnr,
      'beskrivelse': beskrivelse,
      'pris': pris

    };


    return map;
  }
}