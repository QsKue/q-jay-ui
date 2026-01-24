
enum SongListColumn {
  play,
  track, title, artist,
  dateAdded,
  banned, pinned, remove
}

extension ColumnTitle on SongListColumn {
  String? get title => switch (this) {
    SongListColumn.track => "Track",
    SongListColumn.title => "Title",
    SongListColumn.artist => "Artist",
    SongListColumn.dateAdded => "Added",
    _ => null,
  };
}

extension ColumnWidth on SongListColumn {
  bool get fixedWidth => switch (this) {
    SongListColumn.track => false,
    SongListColumn.title => false,
    SongListColumn.artist => false,
    _ => true,
  };
}