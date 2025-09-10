class SourceData {
  final String? id;
  final String name;

  SourceData(this.id, this.name);

  factory SourceData.fromMap(Map<String, dynamic> map){
    return SourceData(
        map['id'] ?? "",
        map['name'] ?? ""
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name
    };
  }

  static SourceData fromDbString(String value) {
    final parts = value.split('|');
    return SourceData(parts[0], parts[1]);
  }

  String toDbString() => '$id|$name';
}

