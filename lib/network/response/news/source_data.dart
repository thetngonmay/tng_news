class SourceData{
  final String? id;
  final String name;

  SourceData(this.id, this.name);

  factory SourceData.fromMap(Map<String,dynamic> map){
    return SourceData(
        map['id']??"",
        map['name']??""
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name
    };
  }
}