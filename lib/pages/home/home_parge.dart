import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/custom_text.dart';
import 'package:weatherapp/widgets/drawer_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/night.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _appBar(),
          body: _body(),
          drawer: const DrawerMenu(),
        ),
      ],
    );
  }

  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const CustomText(
        text: "Good evening!",
        fontSize: 22,
        fontWeight: FontWeight.w300,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.refresh_rounded),
        ),
      ],
    );
  }

  _body() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Center(
        child: Column(
          children: const [
            CustomText(
              text: "Piraju",
              color: Colors.white,
              fontSize: 52,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(height: 12),
            CustomText(
              text: "Sexta-feira, Janeiro, 2022",
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(height: 40),
            CustomText(
              text: "19°C",
              fontSize: 72,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            CustomText(
              text: "                           ",
              fontSize: 20,
              color: Colors.white,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
              textDecorationStyle: TextDecorationStyle.dashed,
            ),
            SizedBox(height: 30),
            CustomText(
              text: "Clear",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 15),
            CustomText(
              text: "16°c/18°c",
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
