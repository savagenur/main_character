import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:main_character/core/extension/build_context_extension.dart';
import 'package:main_character/views/chart/chart_page.dart';
import 'package:main_character/views/home/home_page.dart';
import 'package:main_character/views/profile/profile_page.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() => _currentIndex = value),
        currentIndex: _currentIndex,
        items: _items,
      ),
    );
    // return MockWidget();
  }

  List<BottomNavigationBarItem> get _items {
    return [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
          ),
          label: "Home"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.pie_chart,
          ),
          label: "Charts"),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Profile"),
    ];
  }

  List<Widget> get _pages {
    return [
      HomePage(),
      ChartPage(),
      ProfilePage(),
    ];
  }
}

class MockWidget extends StatefulWidget {
  const MockWidget({super.key});

  @override
  State<MockWidget> createState() => _MockWidgetState();
}

class _MockWidgetState extends State<MockWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.scaffoldBackground,
      body: MyAnimatedPositioned(),
    );
  }
}

class MyAnimatedPositioned extends StatefulWidget {
  @override
  _MyAnimatedPositionedState createState() => _MyAnimatedPositionedState();
}

class _MyAnimatedPositionedState extends State<MyAnimatedPositioned>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool selected = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => setState(() {
          selected = !selected;
        }),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 6.0 * 3.14,
              child: child,
            );
          },
          child: Text(
            "data",
          ),
        ),
      ),
    );
  }
}
