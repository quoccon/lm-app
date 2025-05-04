part of 'main_tab_cubit.dart';

class MainTabState extends BaseState {
  final itemTab = [
    TabBarItem(0, icon: 'ic_home.svg', title: 'Trang chủ'),
    TabBarItem(1, icon: 'ic_chat.svg', title: 'Tin nhắn'),
    TabBarItem(2, icon: 'ic_notification.svg', title: 'Thông báo'),
    TabBarItem(3, icon: 'ic_account.svg', title: 'Tài khoản'),
  ];

  final int selectItem;

  MainTabState({this.selectItem = 0});

  MainTabState copyWith({int? selectItem}) {
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
