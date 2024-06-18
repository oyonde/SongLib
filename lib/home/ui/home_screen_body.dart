part of 'home_screen.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => HomeScreenBodyState();
}

class HomeScreenBodyState extends State<HomeScreenBody> {
  late HomeBloc bloc;
  late HomeScreenState parent;
  int _currentPage = 0;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  late AppLocalizations l10n;
  List<Widget> homePages = <Widget>[];

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();

    if (isMobile) {
      checkPermissions(context, l10n);
      if (FlavorConfig.isProd()) {
        bloc.add(const HomeCheckUpdates());
      }
    }
    bloc.add(const HomeFetchData());
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    homePages = <Widget>[
      SearchScreen(parent: this),
      const Center(child: Text('Index 1: Business')),
      const Center(child: Text('Index 2: School')),
      const Center(child: Text('Index 3: Settings')),
    ];

    return bloc.state.status == Status.inProgress
        ? const SkeletonLoading()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                AppConstants.appTitle,
                style: TextStyles.pageTitle1,
              ),
              actions: <Widget>[
                InkWell(
                  onTap: () async {
                    await showSearch(
                      context: context,
                      delegate: SearchSongs(context, bloc, size.height),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.search),
                  ),
                ),
                /*InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.help),
            ),
          ),*/
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RouteNames.settings),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.settings),
                  ),
                ),
              ],
            ),
            body:
                SearchScreen(parent: this), //homePages.elementAt(_currentPage),
            //bottomNavigationBar: HomeScreenBottomNavBar(parent: this),
          );
  }
}
