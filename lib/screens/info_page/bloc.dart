import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:isp_wallet/routers/routes.dart';
import 'package:isp_wallet/utils/bloc_base.dart';

class InfoBloc extends BlocBaseWithState<ScreenState> {
  @override
  ScreenState get currentState => super.currentState!;

  InfoBloc() {
    setState(ScreenState());
  }

  void next(PageController pageController, BuildContext context) async {
    if(pageController.page == 2) {
      context.router.replaceAll([const AuthRoute()]);
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    setState(currentState.copyWith(page: currentState.page + 1));
  }

  void skip(BuildContext context) async {
    context.router.replaceAll([const AuthRoute()]);
  }
}

class ScreenState {
  final bool loading;
  final int page;

  ScreenState({this.loading = false, this.page = 0});

  ScreenState copyWith({bool? loading, int? page}) {
    return ScreenState(loading: loading ?? this.loading, page: page ?? this.page);
  }
}
