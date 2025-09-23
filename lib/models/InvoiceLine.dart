class InvoiceLine {

  final String product;
  final String beskrivelse;
  final double pris;
  final double ialt;
final int antal;
 InvoiceLine({
    required this.product,
   required this.beskrivelse,
   required this.pris,
   required this.antal,
   required this.ialt
});


 factory InvoiceLine.fromJson(Map<String, dynamic> map ) {
   return InvoiceLine(product: map['product'], beskrivelse: map['beskrivelse'], pris: map['pris'], antal: map['antal'], ialt: map['ialt']);
 }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'product': product,
      'beskrivelse': beskrivelse,
      'pris': pris,
      'antal':antal,
      'ialt': ialt

    };


    return map;
  }
}