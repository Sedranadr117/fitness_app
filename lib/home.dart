import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/models/menuItem.dart';
import 'package:fitnessapp/models/menuitems.dart';
import 'package:fitnessapp/views/chat/chat_controller.dart';
import 'package:fitnessapp/views/chat/chat_page.dart';
import 'package:fitnessapp/views/chatgpt/chat.dart';
import 'package:fitnessapp/views/food/food.dart';
import 'package:fitnessapp/views/gym_pre/pre.dart';
import 'package:fitnessapp/views/media/media_home.dart';
import 'package:fitnessapp/views/shops/home_page/shop.dart';
import 'package:fitnessapp/views/workout_page/workout_page.dart';
import 'package:fitnessapp/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import 'views/chat/chat_banned_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Menuitem currentitem = Menuitems.home;
  final chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      duration: const Duration(microseconds: 500),
      menuScreenWidth: MediaQuery.of(context).size.width,
      menuScreen: Builder(builder: (context) {
        return Menupage(
          currentitem: currentitem,
          onselecteditem: (value) {
            setState(() {
              currentitem = value;
              //  ZoomDrawer.of(context)!.close();
            });
          },
        );
      }),
      mainScreen: getscreen(),
      borderRadius: 40,
      showShadow: true,
      angle: /* -12.0 */ -8.0,
      drawerShadowsBackgroundColor: /* Color.fromARGB(255, 103, 185, 189) */
          const Color.fromARGB(255, 62, 82, 83),
      slideWidth: MediaQuery.of(context).size.width * 0.73,
    );
  }

  Widget getscreen() {
    switch (currentitem) {
      case Menuitems.home:
        return WorkoutPage();
      case Menuitems.shop:
        return Shop();
      case Menuitems.food:
        return Food();
      case Menuitems.media:
        return MediaHome();
      case Menuitems.chat:
        return !chatController.canAccessPage() ? ChatBannedPage() : ChatPage();

      default:
        return Pre();
    }
  }
}
