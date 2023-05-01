class NotesModel {
  int? id;
  String title;
  int quantity;
  double? rupees;

  NotesModel({this.id, required this.title, required this.quantity,required this.rupees});

  NotesModel.fromMap(Map<String, dynamic> res)
      : id = res['id'],
        title = res['title'],
        quantity = res['quantity'],
         rupees = res['rupees'];


  Map<String, Object?> tomap() {
    return {
      'id': id,
      'title': title,
      'quantity': quantity,
      'rupees':rupees,
    };
  }
}
