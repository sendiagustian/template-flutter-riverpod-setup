import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wrapper_state_provider.g.dart';

class WrapperState {
  final int currentIndex;
  final PageController pageController;

  WrapperState({
    required this.currentIndex,
    required this.pageController,
  });

  WrapperState copyWith({
    int? currentIndex,
    PageController? pageController,
  }) {
    return WrapperState(
      currentIndex: currentIndex ?? this.currentIndex,
      pageController: pageController ?? this.pageController,
    );
  }
}

@riverpod
class WrapperStateEvent extends _$WrapperStateEvent {
  @override
  WrapperState build() {
    WrapperState initialData = WrapperState(
      currentIndex: 0,
      pageController: PageController(),
    );

    return initialData;
  }

  set currentIndex(int value) {
    state = state.copyWith(currentIndex: value);
  }
}
