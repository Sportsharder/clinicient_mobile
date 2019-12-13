import 'dart:convert';

class Therapist {
  final String username;
  final String name;
  final String password;
  final int id;
  final String image;

  Therapist({this.username, this.name, this.password, this.id, this.image});
}

class Therapists {
  Therapists._private();

  static List<Therapist> therapists = [
    Therapist(
        username: 'twyla',
        name: 'Twyla Sands',
        password: 'ttt',
        id: 5,
        image: 'assets/twila.png'),
    Therapist(
        username: 'roland',
        name: 'Roland Schitt',
        password: 'ttt',
        id: 6,
        image: 'assets/roland.png'),
    Therapist(
        username: 'stevie',
        name: 'Stevie Bud',
        password: 'ttt',
        id: 7,
        image: 'assets/stevie.png'),
  ];
}
