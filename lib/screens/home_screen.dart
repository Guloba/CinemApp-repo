import 'package:badges/badges.dart';
import 'package:cinemapp/models%20&%20providers/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:cinemapp/constants/constants.dart';
import 'package:cinemapp/screens1/home/components/background_list_view.dart';
import 'package:cinemapp/screens1/home/components/movie_list_view.dart';
import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:cinemapp/screens/wishlist/wishlist_screen.dart';
import 'package:cinemapp/widgets/back_layer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/Home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size get size => MediaQuery.of(context).size;

  //to Center the movie List View
  double get movieItemWidth => size.width / 2 + 48;

  ScrollController backgroundScrollController = ScrollController();
  ScrollController movieScrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    // connecting Background list and Movie list
    movieScrollController.addListener(() {
      backgroundScrollController
          .jumpTo(movieScrollController.offset * (size.width / movieItemWidth));
    });

    return Scaffold(
      backgroundColor: black,
      body:BackdropScaffold(
        headerHeight: MediaQuery.of(context).size.height * 0.4,
        backLayerBackgroundColor: Colors.grey.shade900,
        appBar: BackdropAppBar(
          title: const Text('CinemApp'),
          leading: const BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),
          actions: [
            Consumer<WishlistProvider>(builder: (context, wp, _) {
              return Badge(
                toAnimate: true,
                animationType: BadgeAnimationType.slide,
                position: BadgePosition.topEnd(top: 5, end: 7),
                badgeContent: Text(wp.wishlistList.length.toString()),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(WishlistScreen.routeName);
                  },
              icon: const Icon(Icons.favorite),
            ),
             );
            }),
            IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                backgroundColor: Colors.purple,
                child: CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(
                    'https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg',
                  ),
                ),
              ),
            ),
          ],
        ),
        backLayer: const BackLayer(),
        frontLayer: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Background of home screen
          BackgroundListView(backgroundScrollController),

          //Movie detail List view
          MovieListView(
            movieScrollController,
            movieItemWidth,
          ),
        ],
      ),
      ),
    );
  }
}
