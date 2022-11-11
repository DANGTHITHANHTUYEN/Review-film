import 'package:flutter/material.dart';
import 'package:review_film/features/account/services/account_services.dart';
import 'package:review_film/features/admin/screens/posts_screen.dart';

import '../../../constaints/global_variables.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(
      child: Text('Analytics Screen'),
    ),
    const Center(
      child: Text('Cart Screen'),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: GlobalVariables.appbarColor,
              // gradient: GlobalVariables.appBarGrandient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 55,
                ),
              ),
              const Text(
                'Admin',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
      body:Container(
        margin:const  EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 0.0),
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black12.withOpacity(0.03),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed:() => AccountServices().logOut(context),
          child: const Text(
           'logOut',
            style:  TextStyle(
                color: Colors.black, fontWeight: FontWeight.normal),
          ),
        ),
      ),
      
      // body: pages[_page],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _page,
      //   selectedItemColor: GlobalVariables.selectedNavBarColor,
      //   unselectedItemColor: GlobalVariables.unselectedNavBarColor,
      //   backgroundColor: GlobalVariables.backgroundColor,
      //   iconSize: 28,
      //   onTap: updatePage,
      //   items: [
      //     /*------------POSTS -------------*/
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         width: bottomBarWidth,
      //         decoration: BoxDecoration(
      //           border: Border(
      //             top: BorderSide(
      //               color: _page == 0
      //                   ? GlobalVariables.selectedNavBarColor
      //                   : GlobalVariables.backgroundColor,
      //               width: bottomBarBorderWidth,
      //             ),
      //           ),
      //         ),
      //         child: const Icon(
      //           Icons.home_outlined,
      //         ),
      //       ),
      //       label: '',
      //     ),
      //     /*------------- ANALYTICS-------------*/
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         width: bottomBarWidth,
      //         decoration: BoxDecoration(
      //           border: Border(
      //             top: BorderSide(
      //               color: _page == 1
      //                   ? GlobalVariables.selectedNavBarColor
      //                   : GlobalVariables.backgroundColor,
      //               width: bottomBarBorderWidth,
      //             ),
      //           ),
      //         ),
      //         child: const Icon(
      //           Icons.analytics_outlined,
      //         ),
      //       ),
      //       label: '',
      //     ),
      //     /*-------------- Order -----------*/
      //     BottomNavigationBarItem(
      //       icon: Container(
      //         width: bottomBarWidth,
      //         decoration: BoxDecoration(
      //           border: Border(
      //             top: BorderSide(
      //               color: _page == 2
      //                   ? GlobalVariables.selectedNavBarColor
      //                   : GlobalVariables.backgroundColor,
      //               width: bottomBarBorderWidth,
      //             ),
      //           ),
      //         ),
      //         child: const Icon(
      //           Icons.all_inbox_outlined,
      //         ),
      //       ),
      //       label: '',
      //     ),
      //   ],
      // ),
   
    );
  }
}
