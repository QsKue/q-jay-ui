import 'package:flutter/material.dart';

abstract class PresetViewDataSource {
  Object sourceId(BuildContext context);
  Future<void> prefetchRange(int start, int count);
  Widget itemAtIndex(BuildContext context, int index);
}

class PresetDragData {
  PresetDragData({
    required this.sourceId,
    required this.sourceIndex,
    this.dragData,
  });

  final Object sourceId;
  final int sourceIndex;
  final Object? dragData;
}

abstract class PresetViewDragDataDelegate {
  Object? dragDataForItem(BuildContext context, int index);
  String labelForIndex(BuildContext context, int index);
  bool canAccept(BuildContext context, Object? dragData);
  void onExternalDrop(BuildContext context, Object? dragData, int insertIndex);
}

abstract class PresetViewReorderDelegate {
  Object sourceId(BuildContext context);
  void onReorderRequested(BuildContext context, int oldIndex, int newIndex);
  String labelForIndex(BuildContext context, int index);
}