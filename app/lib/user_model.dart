class User{
  String id;
  String name;
  String surname;
  String contact;
  String email;
  String password;
  String retry_password;

  User({this.id='',required this.name,required this.surname,required this.contact,required this.email,
      required this.password,required this.retry_password});

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'name':name,
      'surname': surname,
      'contact':contact,
      'email':email,
      'password': password,
      'retry_password': retry_password,
    };
  }

  factory User.fromJson(Map<String, dynamic> json){
    return User(id: json['id'],
        name: json['name'],
        surname: json['surname'],
        contact: json['contact'],
        email: json['email'],
        password: json['password'],
        retry_password: json['retry_password']);
  }
}