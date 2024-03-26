class DBModel{
  int? id;
  String? name,quotes,author;

  DBModel({this.id, this.name, this.quotes, this.author});

  factory DBModel.mapToModel(Map m1){
    return DBModel(
      id: m1['id'],
      name: m1['name'],
      author: m1['author'],
      quotes: m1['quotes'],
    );
  }
}