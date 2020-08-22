class User {
  final String id;
  final String email;

  User({
    this.id,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: '1',
        email: data['email'],
      );

  Map<String, dynamic> toJson() {
    return {"id": id, "email": email};
  }

  User copyWidth({
    String id,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }
  /*
  Todo copyWith({int id, String text, bool completed}) {
    return new Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      completed: completed ?? this.completed,
    );
  }
  */
}
