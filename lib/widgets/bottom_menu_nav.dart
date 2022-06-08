import 'package:flutter/material.dart';
import 'package:momo/constants.dart';
import 'package:momo/theme.dart';
import 'package:momo/views/loans/loans.dart';
import 'package:momo/views/receive_loan/home_page.dart';
import 'package:momo/views/user_profile/user_profile.dart';
import 'package:momo/views/wallets/wallets.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      const HomePage(),
      const Wallets(),
      const Loans(),
      const USerProfile()
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
          activeIcon: Icon(
            Icons.home_outlined,
            color: AppColors.mainColor,
          )),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: "Wallet",
          activeIcon: Icon(
            Icons.account_balance_wallet_outlined,
            color: AppColors.mainColor,
          )),
      const BottomNavigationBarItem(
          icon: Icon(Icons.money),
          label: "Loans",
          activeIcon: Icon(
            Icons.money,
            color: AppColors.mainColor,
          )),
      const BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Account",
          activeIcon: Icon(
            Icons.person_outlined,
            color: AppColors.mainColor,
          )),
    ];
    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
        fixedColor: AppColors.mainColor,
        selectedLabelStyle:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        unselectedLabelStyle: const TextStyle(
            color: AppColors.Tertiary,
            fontSize: 12,
            fontWeight: FontWeight.w400),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 0,
        backgroundColor: WHITE,
        items: _kBottmonNavBarItems,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        });
    return Scaffold(
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
