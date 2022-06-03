class Questions{
  final String id;
  final String title;
  final Map<String, bool>opttions;


  Questions({
    required this.id,
    required this.title,
    required this.opttions,
  });

  @override
  String toString(){
    return 'Question(id: $id, title: $title, options: $opttions)';
  }


}