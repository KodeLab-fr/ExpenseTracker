import 'dart:convert';

/// Request model for the expense post to the api. Its role is to convert the informations needed to json.
class ExpenseRequestModel {
  String name;
  String type;
  String context;
  String date;
  String cost;
  String location;
  String description;

  ExpenseRequestModel({
    required this.name,
    required this.type,
    required this.context,
    required this.date,
    required this.cost,
    required this.location,
    required this.description,
  });

  Map<String, String> toJson() {
    Map<String, String> map = {
      'name': name,
      'type': type,
      'context': context,
      'date': date,
      'cost': cost,
      'location': location,
      'description': description,
    };
    return map;
  }
}

/// Respone model for the expense post to the api. Its role is to retrieve the response from the server.
class ExpenseResponseModel {
  String code; 
  String message;

  ExpenseResponseModel({
    required this.code,
    required this.message,
  });

  factory ExpenseResponseModel.fromJson(String response) {
    dynamic json = jsonDecode(response);
    return ExpenseResponseModel(
      code: json['code'] ?? " ",
      message: json['message'] ?? " ",
    );
  }
}
