class Questions{
  final String id;
  final String title;
  final Map<String, bool>alternative;


  Questions({
    required this.id,
    required this.title,
    required this.alternative,
  });

  @override
  String toString(){
    return 'Question(id: $id, title: $title, options: $alternative)';
  }


}