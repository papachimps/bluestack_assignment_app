class User {
  final String id;
  final String alias;
  final String name;
  final String profileImgUrl;
  final int rating;
  final int tournamentsPlayed;
  final int tournamentsWon;

  User({
    required this.id,
    required this.alias,
    required this.name,
    required this.profileImgUrl,
    required this.rating,
    required this.tournamentsPlayed,
    required this.tournamentsWon,
  });

  int get winningPercentage => (tournamentsWon * 100) ~/ tournamentsPlayed;
}
