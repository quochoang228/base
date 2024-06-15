import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rootPageControllerProvider = StateProvider.autoDispose<PageController>((ref) => PageController(initialPage: ref.watch(rootIndexProvider)));

final rootIndexProvider = StateProvider.autoDispose<int>((ref) => 0);