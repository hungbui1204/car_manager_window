import 'package:flutter/material.dart';
import 'package:car_manager_window/model/menu_item.dart';
class MenuItems{
  static const List<MenuItemm> itemSystem = [
    itemSettings,
    itemExit
  ];
  static const List<MenuItemm> itemInOutManager = [
    itemInOut,
    itemResidentCard,
    itemGuestCard,
  ];
  static const itemSettings = MenuItemm(text: 'Settings', icon: Icons.settings);
  static const itemExit = MenuItemm(text: 'Exit', icon: Icons.exit_to_app);
  static const itemInOut = MenuItemm(text: 'In/Out Transport Manager', icon: Icons.compare_arrows);
  static const itemResidentCard = MenuItemm(text: 'Resident Card Manager', icon: Icons.account_circle_sharp);
  static const itemGuestCard = MenuItemm(text: 'Guest Card Manager', icon: Icons.manage_accounts_rounded);

}