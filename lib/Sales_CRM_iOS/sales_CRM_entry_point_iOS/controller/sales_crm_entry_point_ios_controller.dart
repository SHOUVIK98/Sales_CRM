import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_iOS/views/home/screen/home_ios.dart';

import '../../views/accounts/screen/accouts_ios.dart';
import '../../views/contacts/screen/contacts_ios.dart';
import '../../views/leads/screen/leads_ios.dart';

class SalesCrmEntryPointIosController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;

  List<Widget> pages = [
    // CalendarScreen(),
    HomeIos(),
    LeadsIos(),
    ContactsIos(),
    AccountsIos(),
    // ContactScreen(),
    // ProfileScreen()
  ];

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
