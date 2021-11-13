import 'dart:convert';

class Contact {
  String name;
  String phone;
  Contact({required this.name, required this.phone});

  String toJSON() {
    final map = {
      'name': name,
      'phone': phone,
    };
    return jsonEncode(map);
  }

  factory Contact.fromJSON(String json) {
    final map = jsonDecode(json);
    return Contact(name: map['name'], phone: map['phone']);
  }
}
