class HomeModel{
  int? id;
  String? name,image;
  List<dynamic>? quotesList=[];
  List<dynamic>? authorList=[];

  HomeModel(
      {this.id,
        this.name,
        this.image,
        this.quotesList,
        this.authorList});

  factory HomeModel.mapToModel(Map m1){
    return HomeModel(
      id: m1['id'],
      name: m1['name'],
      image: m1['image'],
      quotesList: m1['quotes'],
      authorList: m1['author'],
    );
  }
}
