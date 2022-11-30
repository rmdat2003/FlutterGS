/// Holds data for user profile
class User {
  final String imageURL;
  final String firstName;
  final String lastName;
  final String email;
  final int age;

  const User({
    required this.imageURL,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
  });
}
