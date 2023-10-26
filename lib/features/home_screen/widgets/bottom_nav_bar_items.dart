import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:spade_project/utils/services/custom_navigation.dart';
import 'package:spade_project/utils/theme/light_theme.dart';

List<SalomonBottomBarItem> bottomNavBarItems = [
  /// Home
  SalomonBottomBarItem(
    icon: Icon(Icons.shopping_basket_outlined),
    title: Text("Stocks"),
    selectedColor: LightTheme.of(currentContext!).primaryColor,
  ),

  /// Likes
  SalomonBottomBarItem(
    icon: Icon(Icons.account_balance),
    title: Text("Brands"),
    selectedColor: LightTheme.of(currentContext!).primaryColor,
  ),

  /// Search
  SalomonBottomBarItem(
    icon: Icon(Icons.calendar_today),
    title: Text("My orders"),
    selectedColor: LightTheme.of(currentContext!).primaryColor,
  ),

  /// Profile
  SalomonBottomBarItem(
    icon: Icon(Icons.person),
    title: Text("Profile"),
    selectedColor: LightTheme.of(currentContext!).primaryColor,
  ),
];