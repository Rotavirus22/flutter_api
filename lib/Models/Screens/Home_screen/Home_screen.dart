// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_api/Models/Screens/Home_screen/Home_screenState.dart';
import 'package:flutter_api/common/themeProvider.dart';
import 'package:flutter_api/main.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenState = Provider.of<HomeScreenState>(context);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    themeChange.darkTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'List of teams playing in FIFA world cup 2018',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: homeScreenState.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: homeScreenState.teamsData?.teams?.length ?? 2,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    navigatorKey.currentState!.pushNamed('/detailPage',
                        arguments: homeScreenState.teamsData!.teams![index].id);
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            homeScreenState.teamsData!.teams![index].flag!,
                          ),
                        ),
                        Text(
                          homeScreenState.teamsData!.teams![index].name!,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Text(homeScreenState
                            .teamsData!.teams![index].emojiString!),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
