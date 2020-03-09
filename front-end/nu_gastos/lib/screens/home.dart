import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:nu_gastos/main.dart' as main;
import 'package:nu_gastos/screens/relatorios.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Widget _buildMovimentationsList() {
  return ListTile();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  PageController pageController;
  var pages = ['Relatórios', 'Lançamento Manual', 'Educação', 'Metas'];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NuGastos',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
              size: 30,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
      body: PageView.builder(
        itemCount: pages.length,
        controller: pageController,
        reverse: false,
        itemBuilder: (context, page) {
          return Column(
            children: <Widget>[
              Center(
                child: Text(pages[page]),
              ),
              RelatoriosWidgwt(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          selectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 42,
          ),
          onTap: (page) {
            pageController.animateToPage(page,
                duration: Duration(seconds: 1), curve: Curves.easeOutQuint);

            setState(() {
              _currentIndex = page;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                MaterialCommunityIcons.script_text_outline,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                pages[0],
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                MaterialCommunityIcons.pencil_plus_outline,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                pages[1],
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_library,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                pages[2],
                style: TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.merge_type,
                color: Theme.of(context).iconTheme.color,
              ),
              title: Text(
                pages[3],
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
      floatingActionButton: Transform.scale(
        scale: 1.5,
        child: FloatingActionButton(
          onPressed: null,
          splashColor: main.nubankRoxoPrincipal,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
