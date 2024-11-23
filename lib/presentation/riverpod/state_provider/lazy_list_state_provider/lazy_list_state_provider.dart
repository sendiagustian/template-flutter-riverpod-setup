import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/enums/status_enums.dart';

part 'lazy_list_state_provider.g.dart';

class LazyListState<T> {
  final List<T> datas;
  final List<T> dataViews;
  final int requestLimit;
  final int requestPage;
  final DataStatus dataStatus;

  LazyListState({
    required this.datas,
    required this.dataViews,
    required this.requestLimit,
    required this.requestPage,
    required this.dataStatus,
  });

  LazyListState<T> copyWith({
    List<T>? datas,
    List<T>? dataViews,
    int? requestLimit,
    int? requestPage,
    DataStatus? dataStatus,
  }) {
    return LazyListState<T>(
      datas: datas ?? this.datas,
      dataViews: dataViews ?? this.dataViews,
      requestLimit: requestLimit ?? this.requestLimit,
      requestPage: requestPage ?? this.requestPage,
      dataStatus: dataStatus ?? this.dataStatus,
    );
  }
}

@riverpod
class LazyListEvent<T> extends _$LazyListEvent<T> {
  @override
  LazyListState<T> build() {
    state = LazyListState<T>(
      datas: [],
      dataViews: [],
      requestLimit: 15,
      requestPage: 1,
      dataStatus: DataStatus.onLoad,
    );

    return state;
  }

  void initialLoad(List<T> datas, {int requestLimit = 15}) {
    if (datas.isEmpty) state = state.copyWith(dataStatus: DataStatus.onLoad);

    state = state.copyWith(
      dataStatus: DataStatus.valid,
      datas: datas,
      requestPage: 1,
      requestLimit: requestLimit,
      dataViews: datas.take(state.requestLimit).toList(),
    );
  }

  void loadMore() {
    int reqPage = state.requestPage + 1;
    final newItems = state.datas.skip(reqPage * state.requestLimit).take(state.requestLimit).toList();

    if (newItems.isEmpty) return;

    state = state.copyWith(
      requestPage: reqPage,
      dataViews: [
        ...state.dataViews,
        ...newItems,
      ],
    );
  }

  Future<void> refresh() async {
    state = state.copyWith(
      dataStatus: DataStatus.valid,
      dataViews: state.datas.take(state.requestLimit).toList(),
      requestPage: 1,
    );
  }

  void setErrorInit() {
    state = state.copyWith(dataStatus: DataStatus.error);
  }
}
