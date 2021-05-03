import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _showBalanceInNaira = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            leading: Center(
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xFFE9BBFF),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        'SV',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              'HaggleX',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Icon(
                      Icons.notifications_none,
                      // size: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '5',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total portfolio balance',
                            style: TextStyle(fontSize: 9),
                          ),
                          Text(
                            // Font not displaying ₦
                            _showBalanceInNaira ? 'N0.00' : '\$****',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    FlutterSwitch(
                      value: _showBalanceInNaira,
                      onToggle: (value) =>
                          setState(() => _showBalanceInNaira = value),
                      toggleColor: Theme.of(context).accentColor,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      activeText: 'USD',
                      inactiveText: 'NGN',
                      activeTextFontWeight: FontWeight.normal,
                      inactiveTextFontWeight: FontWeight.normal,
                      showOnOff: true,
                      activeTextColor: Colors.black,
                      inactiveTextColor: Colors.black,
                      // width: 75,
                      valueFontSize: 12,
                      toggleSize: 30,
                      activeIcon: Text(
                        'NGN',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      inactiveIcon: Container(
                        child: Text(
                          'USD',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(kToolbarHeight),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  // horizontal: 16,
                ),
                child: Theme(
                  data: ThemeData.light(),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              4,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(
                                        left: 3, right: 3),
                                    child: SizedBox(
                                      width: 330,
                                      child: Image.asset(
                                          'assets/images/slide-${index + 1}.png'),
                                    ),
                                  )),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        title: Text(
                          'Markets',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Theme(
            data: ThemeData.light(),
            child: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index.isEven) {
                    return ListTile(
                      leading: Image.asset('assets/images/hag.png'),
                      title: Text('Haggle (HAG)'),
                      subtitle: Text('NGN 380'),
                      trailing: Image.asset('assets/images/graph.png'),
                    );
                  }
                  return Divider(
                    height: 0,
                    color: Colors.grey,
                  );
                },
                childCount: max(0, 10 * 2 - 1),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData.light(),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          fixedColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Image.asset('assets/images/dashboard.png'),
            ),
            BottomNavigationBarItem(
              label: 'Wallet',
              icon: Image.asset('assets/images/wallet.png'),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Image.asset('assets/images/otc.png'),
            ),
            BottomNavigationBarItem(
              label: 'Savings',
              icon: Image.asset('assets/images/savings.png'),
            ),
            BottomNavigationBarItem(
              label: 'More',
              icon: Image.asset('assets/images/more.png'),
            ),
          ],
        ),
      ),
    );
  }
}
