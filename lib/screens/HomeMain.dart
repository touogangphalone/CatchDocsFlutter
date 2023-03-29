import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quizstar/screens/style/theme.dart';
import 'package:quizstar/widgets/app_drower.dart';
import 'package:quizstar/widgets/common.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    return ResponsiveBuilder(
        builder: (BuildContext context, SizingInformation sizingInformation) {
      return Scaffold(
        //drawer: AddDrower(),
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
                          });
                        },
                        child: SingleNavBarButton(
                          name: "home",
                          icon: FontAwesomeIcons.home,
                          selectedButton: _currentNavIndex == 0 ? true : false,
                        )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _currentNavIndex = 1;
                          });
                          /*Navigator.of(context)
                              .pushReplacementNamed(UserScreens.routeName);*/
                        },
                        child: SingleNavBarButton(
                          name: "Result",
                          icon: FontAwesomeIcons.book,
                          selectedButton: _currentNavIndex == 1 ? true : false,
                        )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _currentNavIndex = 2;
                          });
                          /*Navigator.of(context)
                                .pushReplacementNamed(AddPostScreen.routeName);*/
                        },
                        child: SingleNavBarButton(
                          name: "Chat",
                          icon: FontAwesomeIcons.message,
                          selectedButton: _currentNavIndex == 2 ? true : false,
                        )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _currentNavIndex = 3;
                          });
                        },
                        child: SingleNavBarButton(
                          name: "Infos",
                          icon: FontAwesomeIcons.briefcase,
                          selectedButton: _currentNavIndex == 3 ? true : false,
                        )),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _currentNavIndex = 4;
                          });
                        },
                        child: SingleNavBarButton(
                          name: "Notification",
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
          title: Text("CamSchool"),
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
            // CustomAppBar(
            // sizingInformation: sizingInformation,
            // ),
            Container(
              height: 45,
              /*child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: regions.length,
                itemBuilder: (ctx, i) => SingleRegions(regions[i]),
              ),*/
            ),
            Divider(),
            Expanded(
                /*child: ListView.builder(
                  itemCount: posts.length,
                itemBuilder: (ctx, i) => SinglePost(posts[i]),
                  ),*/
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
}
