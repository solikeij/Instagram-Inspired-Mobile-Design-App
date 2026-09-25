<<<<<<< HEAD
class HomeArguments {
  final String name;
  final String email;

  HomeArguments({
    required this.name,
    required this.email,
  });
}
=======
/// Only display information is passed to Home. Never pass passwords.
class HomeArguments {
  const HomeArguments({required this.name, required this.email});
  final String name;
  final String email;
}
>>>>>>> 114b604102c028d9ed107c22ad8bf5ef0124dddd
