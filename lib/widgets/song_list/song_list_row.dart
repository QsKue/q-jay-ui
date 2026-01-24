import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qjay/app/store/player_store.dart';
import 'package:qjay/models/common.dart';

import 'package:qjay/widgets/button/hover_icon.dart';

import 'song_list_types.dart';
import 'song_list.dart';

class SongListRow<T extends SongListProvider> extends StatefulWidget {
  final SongListRowTheme? theme;

  final int index;

  final List<SongListColumn> columns;
  final void Function(SongListColumn column)? onCellTap;

  const SongListRow({
    super.key,
    this.theme,
    required this.index,
    required this.columns,
    this.onCellTap,
  });

  @override
  State<SongListRow> createState() => _SongListRowState<T>();
}

class _SongListRowState<T extends SongListProvider> extends State<SongListRow<T>> {
  bool _hovered = false;

  String _formatDate(DateTime? date) {
    if (date == null) return "";

    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inSeconds < 60) {
      return "${diff.inSeconds} second${diff.inSeconds == 1 ? '' : 's'} ago";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago";
    } else if (diff.inDays < 7) {
      return "${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago";
    } else if (diff.inDays < 30) {
      final weeks = (diff.inDays / 7).floor();
      return "$weeks week${weeks == 1 ? '' : 's'} ago";
    } else {
      // Fallback: "October 14, 2025"
      const shortMonths = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
      ];

      final monthName = shortMonths[date.month - 1];
      return "$monthName ${date.day}, ${date.year}";
    }
  }

  Widget buildIcon({
    required SongListRowTheme theme,
    required SongListColumn column,
    required IconData icon,
    bool isActive = false,
  })
    => Center(
      child: HoverIcon(
        theme: theme.iconTheme,
        icon: icon,
        isActive: isActive,
        onPressed: () => widget.onCellTap?.call(column),
      ),
    );

  Widget buildText({
    required SongListRowTheme theme,
    required ThemeData themeData,
    required String text,
  })
    => Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: theme.textStyle ?? themeData.textTheme.bodyMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
      ),
    );

  @override
  Widget build(BuildContext context) {
    final theme = widget.theme
      ?? Theme.of(context).extension<SongListRowTheme>()
      ?? SongListRowTheme();

    final songIndex = context.select<T, int?>((provder) => provder.songList.elementAtOrNull(widget.index) == null ? null : widget.index);
    if (songIndex == null) return const SongListRowPlaceholder();
    // return const SongListRowPlaceholder();
    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.of(context);

    final currentSongId = context.select<PlayerStore, String?>((store) => store.currentSong?.id);
    final isCurrentSong = context.select<T, bool>((store) => store.songList.elementAtOrNull(songIndex)?.id == currentSongId);
    final isPlaying = context.select<PlayerStore, bool>((store) => store.playerState == PlayerState.playing);

    // add to theme selected color
    final foregroundColor = isCurrentSong ? colorScheme.primary : colorScheme.onSurface;
    final foregroundSubColor = isCurrentSong ? colorScheme.secondary : colorScheme.onSurface;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Container(
        color: isCurrentSong ? themeData.highlightColor : _hovered ? theme.backgroundHoveredColor ?? themeData.hoverColor : theme.backgroundColor ?? colorScheme.surface,
        padding: theme.padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.columns.map((column) {
            
            final isPinned = context.select<T, bool>((store) => store.songList.elementAtOrNull(songIndex)?.pinned ?? false);

            final child = Padding(
              padding: theme.columnPadding,
              child: Align(
                alignment: Alignment.centerLeft,
                child: switch (column) {
                  SongListColumn.play => buildIcon(
                    theme: theme.copyWith(
                      iconTheme: theme.iconTheme.copyWith(
                        size: 24
                      )
                    ),
                    column: column,
                    icon: isCurrentSong && isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  SongListColumn.track => Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.select<T, String>((store) => store.songList.elementAtOrNull(songIndex)?.title ?? "Uknown"),
                          style: theme.titleTextStyle ?? themeData.textTheme.titleMedium?.copyWith(
                            color: foregroundColor,
                            fontWeight: FontWeight.bold
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                        Text(
                          context.select<T, String>((store) => store.songList.elementAtOrNull(songIndex)?.artist ?? "Uknown"),
                          style: theme.subtitleTextStyle ?? themeData.textTheme.labelSmall?.copyWith(
                            color: foregroundSubColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ],
                    ),
                  ),
                  SongListColumn.title => buildText(
                    theme: theme,
                    themeData: themeData,
                    text: context.select<T, String>((store) => store.songList.elementAtOrNull(songIndex)?.title ?? "Uknown")
                  ),
                  SongListColumn.artist => buildText(
                    theme: theme,
                    themeData: themeData,
                    text: context.select<T, String>((store) => store.songList.elementAtOrNull(songIndex)?.artist ?? "Uknown")
                  ),
                  SongListColumn.dateAdded => buildText(
                    theme: theme,
                    themeData: themeData,
                    text: _formatDate(context.select<T, DateTime?>((store) => store.songList.elementAtOrNull(songIndex)?.dateAdded))
                  ),
                  SongListColumn.banned => buildIcon(
                    theme: theme.copyWith(
                      iconTheme: theme.iconTheme.copyWith(
                        activeColor: theme.iconActiveColor ?? colorScheme.error,
                      ),
                    ),
                    column: column,
                    icon: Icons.block,
                    isActive: context.select<T, bool>((store) => store.songList.elementAtOrNull(songIndex)?.banned ?? false),
                  ),
                  SongListColumn.pinned => buildIcon(
                    theme: theme.copyWith(
                      iconTheme: theme.iconTheme.copyWith(
                        size: 24,
                      ),
                    ),
                    column: column,
                    icon: isPinned ? Icons.playlist_add_check_rounded : Icons.playlist_add_rounded,
                    isActive: isPinned,
                  ),
                  SongListColumn.remove => buildIcon(
                    theme: theme.copyWith(
                      iconTheme: theme.iconTheme.copyWith(
                        size: 22
                      )
                    ),
                    column: column,
                    icon: Icons.remove_circle_outline,
                  ),
                },
              ),
            );
      
            return column.fixedWidth ? SizedBox(width: theme.iconColumnWidth, child: child) : Expanded(child: child);
          }).toList()
        ),
      ),
    );
  }
}
