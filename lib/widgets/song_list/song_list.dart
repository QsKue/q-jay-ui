import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qjay/models/song.dart';

import 'song_list_header.dart';
import 'song_list_row.dart';
import 'song_list_theme.dart';

export 'song_list_header.dart';
export 'song_list_placeholder.dart';
export 'song_list_row.dart';
export 'song_list_theme.dart';

abstract class SongListProvider {
  List<Song?> get songList;
}

class SongList<T extends SongListProvider> extends StatelessWidget {
  final SongListTheme? theme;

  final List<SongColumn> columns;
  final Map<SongColumn, SongColumnSpec> overrides;

  final EdgeInsetsGeometry? padding;
  final double? rowGap;
  final bool showHeader;

  final double? headerHeight;
  final double? rowHeight;
  final double? colGap;
  final TextStyle? headerTextStyle;
  final TextStyle? rowTextStyle;

  final void Function(dynamic song)? onRowTap;
  final void Function(SongColumn column)? onCellTap;

  final SongColumn? sortColumn;
  final bool ascending;
  final void Function(SongColumn column)? sortBy;

  const SongList({
    super.key,
    this.theme,
    required this.columns,
    this.overrides = const {},
    this.padding,
    this.rowGap,
    this.showHeader = true,
    this.headerHeight,
    this.rowHeight,
    this.colGap,
    this.headerTextStyle,
    this.rowTextStyle,
    this.onRowTap,
    this.onCellTap,
    this.sortColumn,
    this.ascending = true,
    this.sortBy,
  });

  @override
  Widget build(BuildContext context) {
    final t = theme
      ?? Theme.of(context).extension<SongListTheme>()
      ?? SongListTheme.fromBrightness(Theme.of(context).brightness, Theme.of(context).textTheme);

    final children = <Widget>[];

    // if (showHeader) {
    //   children.add(Padding(
    //     padding: EdgeInsets.only(
    //       left: (padding ?? t.listPadding).horizontal / 2,
    //       right: (padding ?? t.listPadding).horizontal / 2,
    //       bottom: 4,
    //     ),
    //     child: SongListHeader(
    //       columns: columns,
    //       overrides: overrides,
    //       height: headerHeight ?? t.headerHeight,
    //       gap: colGap ?? t.columnGap,
    //       textStyle: headerTextStyle ?? t.headerTextStyle,
    //       sortColumn: sortColumn,
    //       ascending: ascending,
    //       sortBy: sortBy,
    //     ),
    //   ));
    // }

    final songCount = context.select<T, int>((provider) => provider.songList.length);

    // for (int i = 0; i < songCount; i++) {
    //   children.add(Padding(
    //     padding: EdgeInsets.symmetric(
    //       horizontal: (padding ?? t.listPadding).horizontal / 2,
    //       vertical: (rowGap ?? t.rowGap) / 2,
    //     ),
    //     child: SongListRow<T>(
    //       index: i,
    //       columns: columns,
    //       overrides: overrides,
    //       height: rowHeight ?? t.rowHeight,
    //       gap: colGap ?? t.columnGap,
    //       textStyle: rowTextStyle ?? t.rowTextStyle,
    //       onCellTap: onCellTap,
    //     ),
    //   ));
    // }

    return Padding(
      padding: padding ?? t.listPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
