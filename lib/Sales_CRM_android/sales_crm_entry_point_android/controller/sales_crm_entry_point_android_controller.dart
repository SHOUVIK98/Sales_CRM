import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sale_crm/Sales_CRM_android/views/calender/screen/calender_screen.dart';
import 'package:sale_crm/Sales_CRM_android/views/home/screen/home_screen.dart';
import 'package:sale_crm/Sales_CRM_android/views/summary/screen/summary_screen.dart';
import '../../views/contacts/screen/contact_screen.dart';
import 'package:sale_crm/Sales_CRM_android/views/account/screen/account_screen.dart';
import 'package:sale_crm/Sales_CRM_android/views/deals/screen/deals_screen.dart';
import 'package:sale_crm/Sales_CRM_android/views/task/screen/task_screen.dart';

import '../../views/leads/all_leads_screen/screen/lead_screen.dart';

class SalesCrmEntryPointAndroidController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;

  List<Widget> pages = [
    CalendarScreen(),
    HomeScreen(),
    LeadScreen(),
    ContactScreen(),
    AccountScreen(),
    DealsScreen(),
    TaskScreen(),
    SummaryScreen()
  ];

  void goToTab(int page) {
    currentPage.value = page;
    pageController.jumpToPage(page);
  }

  void animateToTab(int page) {
    currentPage.value = page;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 700),
        curve: Curves.ease);
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
