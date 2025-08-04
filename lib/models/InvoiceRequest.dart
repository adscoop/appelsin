import 'DCOrder.dart';
class InvoiceRequest {
  final DCOrder order;
  final String project;
  final String invoiceCategory;
  final DateTime invoiceDate;
  final DateTime fromDate;
  final DateTime toDate;
  final String task;
  final String workspace;
  final String draftFolderName;
  final int acountId;
  final int contraAcountId;
  final int contraVatAcountId;
  final double credit;
  final String text;
  final DateTime dueDate;
  final int externalKey;

  InvoiceRequest({
    required this.order,
    required this.project,
    required this.invoiceCategory,
    required this.invoiceDate,
    required this.fromDate,
    required this.toDate,
    required this.task,
    required this.workspace,
    required this.draftFolderName,
    required this.acountId,
    required this.contraAcountId,
    required this.contraVatAcountId,
    required this.credit,
    required this.text,
    required this.dueDate,
    required this.externalKey,
  });

  factory InvoiceRequest.fromJson(Map<String, dynamic> json) {
    return InvoiceRequest(
      order: DCOrder.fromJson(json['order']),
      project: json['project'],
      invoiceCategory: json['invoiceCategory'],
      invoiceDate: DateTime.parse(json['invoiceDate']),
      fromDate: DateTime.parse(json['fromDate']),
      toDate: DateTime.parse(json['toDate']),
      task: json['task'],
      workspace: json['workspace'],
      draftFolderName: json['draftFolderName'],
      acountId: json['acountId'],
      contraAcountId: json['contraAcountId'],
      contraVatAcountId: json['contraVatAcountId'],
      credit: (json['credit'] as num).toDouble(),
      text: json['text'],
      dueDate: DateTime.parse(json['dueDate']),
      externalKey: json['externalKey'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order': order.toJson(),
      'project': project,
      'invoiceCategory': invoiceCategory,
      'invoiceDate': invoiceDate.toIso8601String(),
      'fromDate': fromDate.toIso8601String(),
      'toDate': toDate.toIso8601String(),
      'task': task,
      'workspace': workspace,
      'draftFolderName': draftFolderName,
      'acountId': acountId,
      'contraAcountId': contraAcountId,
      'contraVatAcountId': contraVatAcountId,
      'credit': credit,
      'text': text,
      'dueDate': dueDate.toIso8601String(),
      'externalKey': externalKey,
    };
  }
}
