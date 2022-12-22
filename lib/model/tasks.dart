class Task {
  String id;
  String title;
  String description;
  int date;
  bool isDone;

  Task(
      {this.id = '',
      required this.title,
      required this.description,
      required this.date,
      this.isDone = false});
  Map<String,dynamic> tojson(){
    return{
      "id":id,
      "title":title,
      "description":description,
      "date":date,
      "isdone":isDone
    };
}
  Task.fromjson(Map<String,dynamic>json):this(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    date: json['date'],
    isDone: json['isdone'],
  );
}
