class ChecklistModel {
  final String workOrderId;
  final String status;

  ChecklistModel({
    required this.workOrderId,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "action": "CHECKLIST_UPDATE",
      "workOrderId": workOrderId,
      "status": status,
      "timestamp": DateTime.now().toIso8601String(),
    };
  }
}