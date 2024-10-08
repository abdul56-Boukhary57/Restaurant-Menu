import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarNotifier extends StateNotifier<int> {
  NavBarNotifier()
      : super(0); //Initial Value

  void selectPage(int index) {
    state = index;
  }

}

final navBarProvider =
StateNotifierProvider<NavBarNotifier, int>((ref) {
  //stateful widget
  return NavBarNotifier();
});