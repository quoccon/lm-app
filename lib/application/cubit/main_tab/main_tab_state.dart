part of 'main_tab_cubit.dart';

class MainTabState extends BaseState {
  final itemTab = [
    TabBarItem(-1, icon: '', title: 'Trang chủ'),
    TabBarItem(0, icon: '', title: 'Tin nhắn'),
    TabBarItem(1, icon: '', title: 'Thông báo'),
    TabBarItem(2, icon: '', title: 'Tài khoản'),
  ];

  final int selectItem;

  MainTabState({this.selectItem = -1});

  MainTabState copyWith({int? selectItem, int? nextIndex}) {
    return MainTabState(selectItem: selectItem ?? this.selectItem);
  }

  @override
  List<Object?> get props => [selectItem];
}

class TabBarItem {
  final String icon;
  final String title;
  final int index;

  TabBarItem(this.index, {required this.icon, required this.title});
}
