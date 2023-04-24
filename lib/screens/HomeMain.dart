import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizstar/l10n/en/app_localizations_en.dart';
import 'package:quizstar/screens/classe_page.dart';
import 'package:quizstar/screens/concours_page.dart';
import 'package:quizstar/screens/cour.dart';
import 'package:quizstar/screens/resultat_concour.dart';
import 'package:quizstar/screens/style/theme.dart';
import 'package:quizstar/screens/user_profile.dart';
import 'package:quizstar/widgets/app_drower.dart';
import 'package:quizstar/widgets/common.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'admin_discution.dart';
import 'apropos.dart';
import 'champoins_concour.dart';
import 'change_password.dart';
import 'forum.dart';
import 'notification.dart';

class HomeMain extends StatefulWidget {
  static const routName = '/home-main';

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  bool _init = true;
  bool _isLoding = false;

  int _currentNavIndex = 0;
  bool _isScrollDown = false;
  ScrollController _scrollController;
  bool _showAppNavBar = true;
  bool _showHome = true;
  bool _showClasse = false;
  bool _showConcour = false;
  bool _showChat = false;
  bool _showForum = false;
  bool _showNotification = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _initialScroll();
  }

  @override
  void didChangeDependencies() async {
    if (_init) {
      //Provider.of<PostsState>(context, listen: false).getProfilesData();
      //Provider.of<PostsState>(context, listen: false).getRegionsData();
      // _isLoding =
      // await Provider.of<PostsState>(context, listen: false).getPostsData();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  void _initialScroll() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!_isScrollDown) {
          _isScrollDown = true;
          _hideAppNavBar();
        }
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (_isScrollDown) {
          _isScrollDown = false;
          _showAppNvBar();
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text("test");
  @override
  Widget build(BuildContext context) {
    //final posts = Provider.of<PostsState>(context).post;
    //final regions = Provider.of<PostsState>(context).region;
    //final profiles = Provider.of<PostsState>(context).profile;
    /*if (_isLoding == false ||
        posts == null ||
        regions == null ||
        profiles == null)
      return Scaffold(
        backgroundColor: blueColor,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    else*/
    // return ResponsiveBuilder(
    //   builder: (BuildContext context, SizingInformation sizingInformation) {
    //   return Scaffold(
    //       body: Center(
    //           child: Text(
    //         'Bonjour, bienvenue sur cette page !',
    //         style: TextStyle(fontSize: 24),
    //       )),
    //   );});

    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
      return Scaffold(
        bottomNavigationBar: _showAppNavBar
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: sizingInformation.screenSize.height * 0.07,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  border: Border(
                      top: BorderSide(color: Colors.black26, width: 0.80)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            _currentNavIndex = 0;
                            _showClasses();
                            // Navigator.pushNamed(context, '/home');
                          });
                        },
                        child: SingleNavBarButton(
                          name: "Classes",
                          icon: FontAwesomeIcons.home,
                          selectedButton: _currentNavIndex == 0 ? true : false,
                        )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _showConcours();
                            _currentNavIndex = 1;
                          });
                          /*Navigator.of(context)
                              .pushReplacementNamed(UserScreens.routeName);*/
                        },
                        child: SingleNavBarButton(
                          name: "Concour(s)",
                          icon: FontAwesomeIcons.book,
                          selectedButton: _currentNavIndex == 1 ? true : false,
                        )),
                    InkWell(
                        onTap: () {
                          setState(() {
                          _showNotifications();
                            _currentNavIndex = 4;
                          });
                        },
                        child: SingleNavBarButton(
                          name: "Notifications",
                          icon: FontAwesomeIcons.solidBell,
                          selectedButton: _currentNavIndex == 4 ? true : false,
                        )),
                  ],
                ))
            : Container(
                height: 0.0,
                width: 0.0,
              ),
        drawer: AddDrower(),
        appBar: AppBar(
          // title: Text(AppLocalizations.of(context).helloWorld),
          title: Text("helloWorld"),
          centerTitle: true,
          backgroundColor: blueColor,
          actions: <Widget>[
            /*new IconButton(
              onPressed: () {
                setState(() {
                  if (customIcon.icon == Icons.search) {
                    customIcon = const Icon(Icons.cancel);
                    customSearchBar = const ListTile(
                      leading: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28,
                      ),
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: 'search...',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    customIcon = const Icon(Icons.search);
                    customSearchBar = const Text("search");
                  }
                });
              },
              icon: customIcon,
            ),*/
            SizedBox(
              width: 10,
            ),
            InkWell(
              child: CircleAvatar(
                maxRadius: 24.0,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1605821469603-6112b2cd8254?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=689&q=80'),
            //borderRadius: BorderRadius.all(Radius.circular(40)),
                /*backgroundImage: NetworkImage(
                  "http://127.0.0.1:8000${profiles[0].profileUrl}",
                ),*/
              ),
            ),
            SizedBox(
              width: 9,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(child: 
            _showHome ? HomeClasseScreens() : 
            _showForum ? ChangePasswordPage(): 
            _showChat ? AdminDiscussionScreen(): 
            _showConcour ? ConcoursPage(): 
            _showClasse ? HomeClasseScreens(): 
            _showNotification ? NotificationScreen() : null ,
                ),
          ],
        ),
      );
    });
  }

  void _hideAppNavBar() {
    setState(() {
      _showAppNavBar = false;
    });
  }

  void _showAppNvBar() {
    setState(() {
      _showAppNavBar = true;
    });
  }
  
  void _showClasses() {
    setState(() {
      _showClasse = true;
      _showHome = false;
      _showConcour = false;
      _showChat = false;
      _showForum = false;
      _showNotification = false;
    });
  }


  void _showHomes() {
    setState(() {
      _showHome = true;
      _showClasse = false;
      _showConcour = false;
      _showChat = false;
      _showForum = false;
      _showNotification = false;
    });
  }

  void _showConcours() {
    setState(() {
      _showConcour = true;
      _showHome = false;
      _showClasse = false;
      _showChat = false;
      _showForum = false;
      _showNotification = false;
    });
  }

  void _showChats() {
    setState(() {
      _showChat = true;
      _showConcour = false;
      _showHome = false;
      _showClasse = false;
      _showForum = false;
      _showNotification = false;
    });
  }

  void _showForums() {
    setState(() {
      _showForum = true;
      _showChat = false;
      _showConcour = false;
      _showHome = false;
      _showClasse = false;
      _showNotification = false;
    });
  }

  void _showNotifications() {
    setState(() {
      _showNotification = true;
      _showForum = false;
      _showChat = false;
      _showConcour = false;
      _showHome = false;
      _showClasse = false;
    });
  }

}


