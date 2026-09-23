/// Only display information is passed to Home. Never pass passwords.
class HomeArguments {
  const HomeArguments({required this.name, required this.email});
  final String name;
  final String email;
}
