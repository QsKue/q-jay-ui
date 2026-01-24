
enum SongSortMode {
  artistAscending, artistDescending, titleAscending, titleDescending, dateAscending, dateDescending;
  SongSortMode get nextOrder => switch(this) {
    SongSortMode.artistAscending => SongSortMode.artistDescending,
    SongSortMode.artistDescending => SongSortMode.artistAscending,
    SongSortMode.titleAscending => SongSortMode.titleDescending,
    SongSortMode.titleDescending => SongSortMode.titleAscending,
    SongSortMode.dateAscending => SongSortMode.dateDescending,
    SongSortMode.dateDescending => SongSortMode.dateAscending,
  };
}

enum SongDuration {
  oneMinute(1),
  oneMinuteHalf(2),
  twoMinutes(3),
  threeMinutes(4),
  fullLength(0);

  final int value;
  const SongDuration(this.value);

  static SongDuration fromValue(int value) {
    for (final e in SongDuration.values) {
      if (e.value == value) return e;
    }
    return SongDuration.fullLength;
  }

  String get label => switch (this) {
    SongDuration.oneMinute => "~1 min",
    SongDuration.oneMinuteHalf => "~1.5 min",
    SongDuration.twoMinutes => "~2 min",
    SongDuration.threeMinutes => "~3 min",
    SongDuration.fullLength => "Full",
  };
}

class Song {
  final String id;
  final String artist;
  final String title;
  bool played;
  bool liked;
  bool pinned;
  bool banned;
  final DateTime dateAdded;

  Song({
    required this.id,
    required this.artist,
    required this.title,
    required this.played,
    required this.liked,
    required this.pinned,
    required this.banned,
    required this.dateAdded
  });
}