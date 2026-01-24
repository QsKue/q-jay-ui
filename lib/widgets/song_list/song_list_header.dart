import 'package:flutter/material.dart';

import 'package:qjay/models/song.dart';

import 'song_list_types.dart';
import 'song_list_theme.dart';

class SongListHeader extends StatelessWidget {
  final SongListHeaderTheme? theme;

  final List<SongListColumn> columns;

  final SongSortMode? sortMode;
  
  final void Function(SongListColumn column)? onColumnTap;

  const SongListHeader({
    super.key,
    this.theme,
    required this.columns,
    this.sortMode,
    this.onColumnTap,
  });

  SongListColumn? get columnForSortMode => switch (sortMode) {
    SongSortMode.artistAscending => SongListColumn.artist,
    SongSortMode.artistDescending => SongListColumn.artist,
    SongSortMode.titleAscending => SongListColumn.track,
    SongSortMode.titleDescending => SongListColumn.track,
    SongSortMode.dateAscending => SongListColumn.dateAdded,
    SongSortMode.dateDescending => SongListColumn.dateAdded,
    _ => null,
  };

  bool get sortModeAscending => switch (sortMode) {
    SongSortMode.artistAscending => true,
    SongSortMode.artistDescending => true,
    SongSortMode.titleAscending => true,
    SongSortMode.titleDescending => false,
    SongSortMode.dateAscending => true,
    SongSortMode.dateDescending => false,
    _ => true,
  };

  @override
  Widget build(BuildContext context) {
    final headerTheme = theme
      ?? Theme.of(context).extension<SongListHeaderTheme>()
      ?? SongListHeaderTheme();

    final themeData = Theme.of(context).textTheme;
    final colorScheme = ColorScheme.of(context);

    final sortColumn = columnForSortMode;
    final ascending = sortModeAscending;
    
    return Container(
      padding: headerTheme.gutterPadding,
      decoration: BoxDecoration(
        color: headerTheme.backgroundColor ?? colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: columns.map((column) {
          
          final header = GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              onColumnTap?.call(column);
            },
            child: Padding(
              padding: headerTheme.itemPadding,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
            
                    Expanded(
                      child: Text(
                        column.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: headerTheme.textStyle ?? themeData.titleMedium?.copyWith(
                          color: colorScheme.onSurface
                        ),
                      ),
                    ),
            
                    if (sortColumn == column)
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Icon(
                          ascending ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                          size: headerTheme.iconSize,
                          color: headerTheme.iconColor ?? colorScheme.onPrimary,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );

          return column.fixedWidth ? SizedBox(width: headerTheme.iconColumnWidth, child: header,) : Expanded(child: header);
        }).toList()
      ),
    );
  }
}
