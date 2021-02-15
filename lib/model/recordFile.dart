class RecordFile {
  int id;
  String title;
  String path;
  String date;
  int value; // 녹음or녹화

  RecordFile(
      {this.id,
        this.title,
        this.date,
        this.value,
        this.path,
 });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'value': value,
      'path' : path
    };
  }
}