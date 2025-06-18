import 'package:auvnet_flutter_task/Core/utils/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../Data/model/RestaurantModel.dart';
import '../widgets/Services.dart';
import '../widgets/adSwiper.dart';
import '../widgets/codewidget.dart';
import '../widgets/restaurantsWidget.dart';
import '../widgets/shortcutWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RestaurantModel> restaurants = [];

  @override
  void initState() {
    super.initState();
    loadRestaurants();
  }

  bool isLoading = true;
  Future<void> loadRestaurants() async {
    try {
      final data = await Supabase.instance.client.from('restaurants').select();
      print("Data from Supabase: $data");
      restaurants =
          (data as List).map((item) => RestaurantModel.fromJson(item)).toList();
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedFontSize: 12,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: ColorManager.primaryColor,
          unselectedItemColor: const Color(0xff667085),
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining_outlined),
              label: "deliver",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Profile",
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: 375.w,
                    height: 156.h,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          ColorManager.primaryColor,
                          ColorManager.yellowColor,
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 34.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Delivering to"),
                            Text("Al Satwa, 81A Street"),
                            Text("Hi hepa! "),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60.h, right: 30.w),
                        child: ClipRRect(
                          child: Image.asset(
                            "assets/images/profile.png",
                            height: 60.h,
                            width: 60.w,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0, top: 6),
                child: Text(
                  "Services:",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 156.h,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServicesWidget(
                        image: "assets/images/food.png",
                        title: "food",
                        text: "Up to 50%",
                      ),
                      ServicesWidget(
                        image: "assets/images/HealthAndwellness.png",
                        title: "Health &\nwellness",
                        text: "20mins",
                      ),
                      ServicesWidget(
                        image: "assets/images/Groceries.png",
                        title: "Groceries",
                        text: "15 mins",
                      ),
                    ],
                  ),
                ),
              ),
              const CodeWidget(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 15),
                child: Text(
                  "Shortcuts:",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 106.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShortcutWidget(
                        image: 'assets/icons/Pastorders.png',
                        title: "Past\norders",
                      ),
                      ShortcutWidget(
                        image: "assets/icons/SuperSaver.png",
                        title: "Super\nSaver",
                      ),
                      ShortcutWidget(
                        image: "assets/icons/Must-tries.png",
                        title: "Must-tries",
                      ),
                      ShortcutWidget(
                        image: "assets/icons/Give Back.png",
                        title: "Give Back",
                      ),
                      ShortcutWidget(
                        image: "assets/icons/BestSellers.png",
                        title: "Best\nSellers",
                      ),
                    ],
                  ),
                ),
              ),
              const Center(child: Adswiper()),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 15),
                child: Text(
                  "Popular restaurants nearby",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 120.h,
                child: restaurants.isEmpty
                    ? Center(child: isLoading ? CircularProgressIndicator() : Text("No restaurants found."))
                    : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: RestaurantsWidget(
                        title: restaurant.name,
                        text: restaurant.time,
                        image: restaurant.image,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
