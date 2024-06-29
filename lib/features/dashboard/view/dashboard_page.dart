class _DashboardState extends StatefulWidget
{
  _DashboardState({key?key}):super(key:key);
}
  @override
  class _DashboardState extends State<Dashboard> 
  {
    int _selectedIndex = 0;
    final List<Widget> _pages = 
    [
    HomePage(),
    ContactUsPage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index)
  
  {
    setState((){
      _selectedIndex = index;
    })
  }
  Widget _getBody(int selectedIndex) 
  {
    return _pages[selectedIndex];
  }

    @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: _getBody(_selectedIndex),
      bottomNavigationBar: _buildBottomNavigationBar(_selectedIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }

    Widget _buildBottomNavigationBar(int selectedIndex) 
  {
    return BottomNavigationBar
    (
      backgroundColor: AppColors.white,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.lightBlue,
      unselectedItemColor: AppColors.black,
      items: 
      [
        BottomNavigationBarItem
        (
          activeIcon: const Icon(
            Icons.home, 
            color: AppColors.lightBlue
            ),
          icon: const Icon(
            Icons.home_outlined),
          label: AppStrings.homeIcon,
        ),
        BottomNavigationBarItem
        (
          activeIcon: const Icon(Icons.calendar_month, color: AppColors.lightBlue),
          icon: const Icon(Icons.calendar_today_outlined),
          label: "Contact Us",
        ),
        BottomNavigationBarItem
        (
          activeIcon: const Icon(Icons.menu_book, color: AppColors.lightBlue),
          icon: const Icon(Icons.menu_book_rounded),
          label: "Favourite",
        ),
      ],
      currentIndex: selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
