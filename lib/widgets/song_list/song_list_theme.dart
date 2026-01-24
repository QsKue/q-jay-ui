import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qjay/widgets/button/hover_icon_theme.dart';

class SongListHeaderTheme extends ThemeExtension<SongListHeaderTheme> {
  final Color? backgroundColor;
  final double iconColumnWidth;

  final EdgeInsetsGeometry gutterPadding;
  final EdgeInsetsGeometry itemPadding;

  final Color? iconColor;
  final double iconSize;

  final TextStyle? textStyle;

  const SongListHeaderTheme({
    this.backgroundColor,
    this.iconColumnWidth = 42,

    this.gutterPadding = const EdgeInsetsGeometry.all(4),
    this.itemPadding = const EdgeInsetsGeometry.symmetric(horizontal: 4),

    this.iconColor,
    this.iconSize = 24,

    this.textStyle,
  });

  @override
  SongListHeaderTheme copyWith({
    Color? backgroundColor,
    double? iconColumnWidth,

    EdgeInsetsGeometry? gutterPadding,
    EdgeInsetsGeometry? itemPadding,

    Color? iconColor,
    double? iconSize,

    TextStyle? textStyle,
  })
    => SongListHeaderTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconColumnWidth: iconColumnWidth ?? this.iconColumnWidth,
      
      gutterPadding: gutterPadding ?? this.gutterPadding,
      itemPadding: itemPadding ?? this.itemPadding,

      iconColor: iconColor ?? this.iconColor,
      iconSize: iconSize ?? this.iconSize,

      textStyle: textStyle ?? this.textStyle,
    );

  @override
  SongListHeaderTheme lerp(covariant SongListHeaderTheme? other, double t) {
    if (other is! SongListHeaderTheme) return this;
    return SongListHeaderTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      iconColumnWidth: lerpDouble(iconColumnWidth, other.iconColumnWidth, t)!,

      gutterPadding: EdgeInsetsGeometry.lerp(gutterPadding, other.gutterPadding, t)!,
      itemPadding: EdgeInsetsGeometry.lerp(itemPadding, other.itemPadding, t)!,

      iconColor: Color.lerp(iconColor, other.iconColor, t),
      iconSize: lerpDouble(iconSize, other.iconSize, t)!,

      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
    );
  }
  
}

class SongListRowTheme extends ThemeExtension<SongListRowTheme> {
  final Color? backgroundColor;
  final Color? backgroundHoveredColor;

  final Color? placeholderBackgroundColor;
  final BorderRadiusGeometry placeholderBorderRadius;
  final double placeholderSpacing;

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry columnPadding;

  final TextStyle? textStyle;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;

  final double iconColumnWidth;
  final HoverIconTheme iconTheme;
  final Color? iconActiveColor;

  const SongListRowTheme({
    this.backgroundColor,
    this.backgroundHoveredColor,

    this.placeholderBackgroundColor,
    this.placeholderBorderRadius = const BorderRadius.all(Radius.circular(8)),
    this.placeholderSpacing = 4,

    this.padding = const EdgeInsetsGeometry.fromLTRB(0, 0, 4, 0),
    this.columnPadding = const EdgeInsetsGeometry.only(right: 4),

    this.textStyle,
    this.titleTextStyle,
    this.subtitleTextStyle,

    this.iconColumnWidth = 52,
    this.iconTheme = const HoverIconTheme(),
    this.iconActiveColor,
  });

  @override
  SongListRowTheme copyWith({
    Color? backgroundColor,
    Color? backgroundHoveredColor,

    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? columnPadding,

    TextStyle? textStyle,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,

    double? iconColumnWidth,
    HoverIconTheme? iconTheme,
    Color? iconActiveColor,
  })
    => SongListRowTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundHoveredColor: backgroundHoveredColor ?? this.backgroundHoveredColor,

      padding: padding ?? this.padding,
      columnPadding: columnPadding ?? this.columnPadding,

      textStyle: textStyle ?? this.textStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      subtitleTextStyle: subtitleTextStyle ?? this.subtitleTextStyle,

      iconColumnWidth: iconColumnWidth ?? this.iconColumnWidth,
      iconTheme: iconTheme ?? this.iconTheme,
      iconActiveColor: iconActiveColor ?? this.iconActiveColor,
    );

  @override
  SongListRowTheme lerp(SongListRowTheme? other, double t) {
    if (other is! SongListRowTheme) return this;
    return SongListRowTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      backgroundHoveredColor: Color.lerp(backgroundHoveredColor, other.backgroundHoveredColor, t),

      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      columnPadding: EdgeInsetsGeometry.lerp(columnPadding, other.columnPadding, t)!,

      textStyle: TextStyle.lerp(textStyle, other.textStyle, t),
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t),
      subtitleTextStyle: TextStyle.lerp(subtitleTextStyle, other.subtitleTextStyle, t),

      iconColumnWidth: lerpDouble(iconColumnWidth, other.iconColumnWidth, t)!,
      iconTheme: iconTheme.lerp(other.iconTheme, t),
      iconActiveColor: Color.lerp(iconActiveColor, other.iconActiveColor, t),
    );
  }
  
}

class SongListTheme extends ThemeExtension<SongListTheme> {
  // Colors
  final Color headerColor;
  final Color columnColor;
  final Color accentActiveColor;
  final Color bannedActivatedColor;
  final Color rowHoverBackground;
  final HoverIconTheme playIconTheme;
  final HoverIconTheme actionIconTheme;

  // Sort icon in header
  final double headerSortIconSize;
  final Color headerSortIconColor;

  // Sizing & layout
  final double headerHeight;
  final double rowHeight;
  final double columnGap;
  final double rowGap;
  final EdgeInsets listPadding;
  final EdgeInsets cellPadding;
  final EdgeInsets songListGutter;

  // Typography
  final TextStyle headerTextStyle;
  final TextStyle rowTextStyle;
  final TextStyle trackTitleTextStyle;
  final TextStyle trackArtistTextStyle;

  // Column widths (optional). If null, theme falls back to sensible defaults.
  final double defaultColumnMinWidth; // used for icon-like columns if specific width is null
  final double? playColumnMinWidth;
  final double? playedColumnMinWidth;
  final double? trackColumnMinWidth;   // usually expanded; width generally ignored
  final double? titleColumnMinWidth;   // usually expanded; width generally ignored
  final double? artistColumnMinWidth;  // usually expanded; width generally ignored
  final double? dateAddedColumnMinWidth;
  final double? bannedColumnMinWidth;
  final double? likedColumnMinWidth;
  final double? pinnedColumnMinWidth;
  final double? removeColumnMinWidth;

  const SongListTheme({
    // Colors
    required this.headerColor,
    required this.columnColor,
    required this.accentActiveColor,
    required this.bannedActivatedColor,
    required this.rowHoverBackground,
    required this.playIconTheme,
    required this.actionIconTheme,

    // Sort icon
    required this.headerSortIconSize,
    required this.headerSortIconColor,

    // Sizing & layout
    required this.headerHeight,
    required this.rowHeight,
    required this.columnGap,
    required this.rowGap,
    required this.listPadding,
    required this.cellPadding,
    required this.songListGutter,

    // Typography
    required this.headerTextStyle,
    required this.rowTextStyle,
    required this.trackTitleTextStyle,
    required this.trackArtistTextStyle,

    // Column widths
    required this.defaultColumnMinWidth,
    this.playColumnMinWidth,
    this.playedColumnMinWidth,
    this.trackColumnMinWidth,
    this.titleColumnMinWidth,
    this.artistColumnMinWidth,
    this.dateAddedColumnMinWidth,
    this.bannedColumnMinWidth,
    this.likedColumnMinWidth,
    this.pinnedColumnMinWidth,
    this.removeColumnMinWidth,
  });

  /// Convenience: compute width for a given column when a fixed width is needed.
  /// Returns null for expanded text columns (track/title/artist) — width not used.
  double? minWidthForColumn(SongColumn c, double scale) {
    switch (c) {
      case SongColumn.play:
        return playColumnMinWidth != null ? playColumnMinWidth! * scale : playIconTheme.size + cellPadding.horizontal * scale;
      case SongColumn.played:
        return playedColumnMinWidth != null ? playedColumnMinWidth! * scale : playIconTheme.size + cellPadding.horizontal * scale;
      case SongColumn.track:
        return trackColumnMinWidth != null ? trackColumnMinWidth! * scale : defaultColumnMinWidth;
      case SongColumn.title:
        return titleColumnMinWidth != null ? titleColumnMinWidth! * scale : defaultColumnMinWidth;
      case SongColumn.artist:
        return artistColumnMinWidth != null ? artistColumnMinWidth! * scale : defaultColumnMinWidth;
      case SongColumn.dateAdded:
        return dateAddedColumnMinWidth != null ? dateAddedColumnMinWidth! * scale : defaultColumnMinWidth;
      case SongColumn.banned:
        return bannedColumnMinWidth != null ? bannedColumnMinWidth! * scale : actionIconTheme.size + cellPadding.horizontal * scale;
      case SongColumn.liked:
        return likedColumnMinWidth != null ? likedColumnMinWidth! * scale : actionIconTheme.size + cellPadding.horizontal * scale;
      case SongColumn.pinned:
        return pinnedColumnMinWidth != null ? pinnedColumnMinWidth! * scale : actionIconTheme.size + cellPadding.horizontal * scale;
      case SongColumn.remove:
        return removeColumnMinWidth != null ? removeColumnMinWidth! * scale : actionIconTheme.size + cellPadding.horizontal * scale;
    }
  }

  factory SongListTheme.fromBrightness(Brightness b, TextTheme text) {
    return b == Brightness.dark ? SongListTheme.dark(text) : SongListTheme.light(text);
  }

  static SongListTheme light(TextTheme text) => SongListTheme(
    // Colors
    headerColor: const Color(0x105C5F66),
    columnColor: const Color(0xFF5C5F66),
    accentActiveColor: const Color(0xFFE53935),
    bannedActivatedColor: const Color(0xFFE53935),
    rowHoverBackground: const Color(0x105C5F66),
    playIconTheme: HoverIconTheme(),
    actionIconTheme: HoverIconTheme(),

    // Sort icon
    headerSortIconSize: 18,
    headerSortIconColor: const Color(0xFF5C5F66),

    // Sizing & layout
    headerHeight: 40,
    rowHeight: 52,
    columnGap: 8,
    rowGap: 2,
    listPadding: const EdgeInsets.symmetric(vertical: 8),
    cellPadding: const EdgeInsets.symmetric(horizontal: 4.0),
    songListGutter: const EdgeInsets.symmetric(horizontal: 8.0),

    // Typography
    headerTextStyle: (text.labelMedium ?? const TextStyle())
        .copyWith(fontWeight: FontWeight.w600, color: const Color(0xFF5C5F66)),
    rowTextStyle: (text.bodyMedium ?? const TextStyle())
        .copyWith(color: const Color(0xFF5C5F66)),
    trackTitleTextStyle: (text.bodyMedium ?? const TextStyle())
        .copyWith(fontWeight: FontWeight.w600, color: const Color(0xFF5C5F66)),
    trackArtistTextStyle: (text.bodySmall ?? const TextStyle())
        .copyWith(color: const Color(0xFF5C5F66)),

    // Column widths
    defaultColumnMinWidth: 44.0,
    dateAddedColumnMinWidth: 120.0,
  );

  static SongListTheme dark(TextTheme text) => SongListTheme(
    // Colors
    headerColor: const Color(0x105C5F66),
    columnColor: const Color(0xFFCACDD2),
    accentActiveColor: const Color(0xFFFF6B6B),
    bannedActivatedColor: const Color(0xFFFF6B6B),
    rowHoverBackground: const Color(0x14FFFFFF),

    playIconTheme: HoverIconTheme(),
    actionIconTheme: HoverIconTheme(),

    // Sort icon
    headerSortIconSize: 18,
    headerSortIconColor: const Color(0xFFCACDD2),

    // Sizing & layout
    headerHeight: 40,
    rowHeight: 52,
    columnGap: 8,
    rowGap: 2,
    listPadding: const EdgeInsets.symmetric(vertical: 8),
    cellPadding: const EdgeInsets.symmetric(horizontal: 4.0),
    songListGutter: const EdgeInsets.symmetric(horizontal: 8.0),
    // type
    headerTextStyle: (text.labelMedium ?? const TextStyle())
        .copyWith(fontWeight: FontWeight.w600, color: const Color(0xFFCACDD2)),
    rowTextStyle: (text.bodyMedium ?? const TextStyle())
        .copyWith(color: const Color(0xFFCACDD2)),
    trackTitleTextStyle: (text.bodyMedium ?? const TextStyle())
        .copyWith(color: const Color(0xFFCACDD2), fontWeight: FontWeight.w600),
    trackArtistTextStyle: (text.bodyMedium ?? const TextStyle())
        .copyWith(color: const Color(0xFFCACDD2), fontSize: ((text.bodyMedium?.fontSize) ?? 14) - 2),

    // Column widths
    defaultColumnMinWidth: 44.0,
    dateAddedColumnMinWidth: 120.0,
  );

  @override
  SongListTheme copyWith({
    Color? headerColor,
    Color? columnColor,
    Color? accentActiveColor,
    Color? bannedActivatedColor,
    Color? rowHoverBackground,
    double? headerHeight,
    double? rowHeight,
    double? columnGap,
    double? rowGap,
    EdgeInsets? listPadding,
    EdgeInsets? cellPadding,
    EdgeInsets? songListGutter,
    double? defaultColumnWidth,
    double? playColumnWidth,
    double? playedColumnWidth,
    double? trackColumnWidth,
    double? titleColumnWidth,
    double? artistColumnWidth,
    double? dateAddedColumnWidth,
    double? bannedColumnWidth,
    double? likedColumnWidth,
    double? pinnedColumnWidth,
    double? removeColumnWidth,
    TextStyle? headerTextStyle,
    TextStyle? rowTextStyle,
    TextStyle? trackTitleTextStyle,
    TextStyle? trackArtistTextStyle,
    HoverIconTheme? playIconTheme,
    HoverIconTheme? actionIconTheme,
    double? headerSortIconSize,
    Color? headerSortIconColor,

  }) {
    return SongListTheme(
      headerColor: headerColor ?? this.headerColor,
      columnColor: columnColor ?? this.columnColor,
      accentActiveColor: accentActiveColor ?? this.accentActiveColor,
      bannedActivatedColor: bannedActivatedColor ?? this.bannedActivatedColor,
      rowHoverBackground: rowHoverBackground ?? this.rowHoverBackground,
      headerHeight: headerHeight ?? this.headerHeight,
      rowHeight: rowHeight ?? this.rowHeight,
      columnGap: columnGap ?? this.columnGap,
      rowGap: rowGap ?? this.rowGap,
      listPadding: listPadding ?? this.listPadding,
      cellPadding: cellPadding ?? this.cellPadding,
      songListGutter: songListGutter ?? this.songListGutter,
      defaultColumnMinWidth: defaultColumnWidth ?? this.defaultColumnMinWidth,
      playColumnMinWidth: playColumnWidth ?? this.playColumnMinWidth,
      playedColumnMinWidth: playedColumnWidth ?? this.playedColumnMinWidth,
      trackColumnMinWidth: trackColumnWidth ?? this.trackColumnMinWidth,
      titleColumnMinWidth: titleColumnWidth ?? this.titleColumnMinWidth,
      artistColumnMinWidth: artistColumnWidth ?? this.artistColumnMinWidth,
      dateAddedColumnMinWidth: dateAddedColumnWidth ?? this.dateAddedColumnMinWidth,
      bannedColumnMinWidth: bannedColumnWidth ?? this.bannedColumnMinWidth,
      likedColumnMinWidth: likedColumnWidth ?? this.likedColumnMinWidth,
      pinnedColumnMinWidth: pinnedColumnWidth ?? this.pinnedColumnMinWidth,
      removeColumnMinWidth: removeColumnWidth ?? this.removeColumnMinWidth,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
      rowTextStyle: rowTextStyle ?? this.rowTextStyle,
      trackTitleTextStyle: trackTitleTextStyle ?? this.trackTitleTextStyle,
      trackArtistTextStyle: trackArtistTextStyle ?? this.trackArtistTextStyle,
      headerSortIconSize: headerSortIconSize ?? this.headerSortIconSize,
      headerSortIconColor: headerSortIconColor ?? this.headerSortIconColor,
      playIconTheme: playIconTheme ?? this.playIconTheme,
      actionIconTheme: actionIconTheme ?? this.actionIconTheme,
    );
  }

  @override
  SongListTheme lerp(ThemeExtension<SongListTheme>? other, double t) {
    if (other is! SongListTheme) return this;
    return SongListTheme(
      headerColor: Color.lerp(headerColor, other.headerColor, t)!,
      columnColor: Color.lerp(columnColor, other.columnColor, t)!,
      accentActiveColor: Color.lerp(accentActiveColor, other.accentActiveColor, t)!,
      bannedActivatedColor: Color.lerp(bannedActivatedColor, other.bannedActivatedColor, t)!,
      rowHoverBackground: Color.lerp(rowHoverBackground, other.rowHoverBackground, t)!,
      playIconTheme: playIconTheme.lerp(other.playIconTheme, t),
      actionIconTheme: actionIconTheme.lerp(other.actionIconTheme, t),
      headerHeight: _lerpDouble(headerHeight, other.headerHeight, t),
      rowHeight: _lerpDouble(rowHeight, other.rowHeight, t),
      columnGap: _lerpDouble(columnGap, other.columnGap, t),
      rowGap: _lerpDouble(rowGap, other.rowGap, t),
      listPadding: EdgeInsets.lerp(listPadding as EdgeInsets?, other.listPadding as EdgeInsets?, t) ?? listPadding,
      cellPadding: EdgeInsets.lerp(cellPadding as EdgeInsets?, other.cellPadding as EdgeInsets?, t) ?? cellPadding,
      songListGutter: EdgeInsets.lerp(songListGutter as EdgeInsets?, other.songListGutter as EdgeInsets?, t) ?? songListGutter,
      defaultColumnMinWidth: _lerpDouble(defaultColumnMinWidth, other.defaultColumnMinWidth, t),
      playColumnMinWidth: _lerpOpt(playColumnMinWidth, other.playColumnMinWidth, t),
      playedColumnMinWidth: _lerpOpt(playedColumnMinWidth, other.playedColumnMinWidth, t),
      trackColumnMinWidth: _lerpOpt(trackColumnMinWidth, other.trackColumnMinWidth, t),
      titleColumnMinWidth: _lerpOpt(titleColumnMinWidth, other.titleColumnMinWidth, t),
      artistColumnMinWidth: _lerpOpt(artistColumnMinWidth, other.artistColumnMinWidth, t),
      dateAddedColumnMinWidth: _lerpOpt(dateAddedColumnMinWidth, other.dateAddedColumnMinWidth, t),
      bannedColumnMinWidth: _lerpOpt(bannedColumnMinWidth, other.bannedColumnMinWidth, t),
      likedColumnMinWidth: _lerpOpt(likedColumnMinWidth, other.likedColumnMinWidth, t),
      pinnedColumnMinWidth: _lerpOpt(pinnedColumnMinWidth, other.pinnedColumnMinWidth, t),
      removeColumnMinWidth: _lerpOpt(removeColumnMinWidth, other.removeColumnMinWidth, t),
      headerTextStyle: TextStyle.lerp(headerTextStyle, other.headerTextStyle, t)!,
      rowTextStyle: TextStyle.lerp(rowTextStyle, other.rowTextStyle, t)!,
      trackTitleTextStyle: TextStyle.lerp(trackTitleTextStyle, other.trackTitleTextStyle, t)!,
      trackArtistTextStyle: TextStyle.lerp(trackArtistTextStyle, other.trackArtistTextStyle, t)!,
      headerSortIconColor: Color.lerp(headerSortIconColor, other.headerSortIconColor, t)!,
      headerSortIconSize: _lerpDouble(headerSortIconSize, other.headerSortIconSize, t),
    );
  }

  static double _lerpDouble(double a, double b, double t) => a + (b - a) * t;
  static double? _lerpOpt(double? a, double? b, double t) {
    if (a == null && b == null) return null;
    return _lerpDouble(a ?? b!, b ?? a!, t);
  }
}

/// Columns you can show.
enum SongColumn { play, played, track, title, artist, dateAdded, banned, liked, pinned, remove }

/// Column configuration.
class SongColumnSpec {
  final SongColumn column;
  final bool isExpanded;
  final int flex;
  final double? width; // null => use theme.widthForColumn(column)

  const SongColumnSpec.expanded(this.column, {this.flex = 1})
    : isExpanded = true, width = null;

  const SongColumnSpec.fixed(this.column, {this.width})
    : isExpanded = false, flex = 0;

  factory SongColumnSpec.defaultFor(SongColumn c) {
    switch (c) {
      case SongColumn.track:
        return SongColumnSpec.expanded(c, flex: 2);
      case SongColumn.title:
        return SongColumnSpec.expanded(c, flex: 2);
      case SongColumn.artist:
        return SongColumnSpec.expanded(c, flex: 2);
      case SongColumn.play:
      case SongColumn.played:
      case SongColumn.banned:
      case SongColumn.remove:
      case SongColumn.liked:
      case SongColumn.pinned:
        return SongColumnSpec.fixed(c); // width from theme
      case SongColumn.dateAdded:
        return SongColumnSpec.fixed(c); // width from theme
    }
  }
}
