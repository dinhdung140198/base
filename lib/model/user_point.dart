class UserPoint {
  final String title;
  final String description;
  final int point;

  UserPoint({
    required this.title,
    required this.description,
    required this.point,
  });


  factory UserPoint.fromJson(Map<String, dynamic> json){
    return UserPoint(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      point: json['point'] ?? 0,
    );
  }


  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'point': point,
  };
}
