import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/utils/size_config.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/pages/search_category.dart';

// ignore: must_be_immutable
class MainPage extends ConsumerWidget {
  late TextEditingController _searchTextFieldController;
  String dropdownvalue = SearchCategory.popular;

  MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _searchTextFieldController = TextEditingController();
    return _buildUi();
  }

  Widget _buildUi() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _backgoundWidget(),
            _forgroundWidget(),
          ],
        ),
      ),
    );
  }

  Widget _backgoundWidget() {
    return Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://e0.pxfuel.com/wallpapers/991/270/desktop-wallpaper-ocean-background-png-transparent-ocean-background-png-ocean-water.jpg"))),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
        ),
      ),
    );
  }

  Widget _forgroundWidget() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, SizeConfig.screenHeight! * 0.02, 0, 0),
      width: SizeConfig.screenWidth! * 0.88,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _tabBarWidget(),
          Container(
            height: SizeConfig.screenHeight! * 0.83,
            padding:
                EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.01),
            child: _moviesListViewWidget(),
          )
        ],
      ),
    );
  }

  Widget _tabBarWidget() {
    return Container(
      height: SizeConfig.screenHeight! * 0.08,
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_searchFieldWidget(), _CategorySelectorWidget()],
      ),
    );
  }

  Widget _searchFieldWidget() {
    return SizedBox(
      width: SizeConfig.screenWidth! * 0.50,
      height: SizeConfig.screenHeight! * 0.05,
      child: TextField(
        controller: _searchTextFieldController,
        onSubmitted: (input) {},
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(
                Icons.search,
                color: Colors.white24,
              ),
            ),
            hintStyle: TextStyle(color: Colors.white54),
            filled: false,
            contentPadding: EdgeInsetsDirectional.only(top: 1),
            fillColor: Colors.white24,
            hintText: "Search...."),
      ),
    );
  }

  Widget _CategorySelectorWidget() {
    return DropdownButton(
      items: const [
        DropdownMenuItem(
            value: SearchCategory.popular,
            child: Text(SearchCategory.popular,
                style: TextStyle(color: Colors.white))),
        DropdownMenuItem(
            value: SearchCategory.upComing,
            child: Text(SearchCategory.upComing,
                style: TextStyle(color: Colors.white))),
        DropdownMenuItem(
            value: SearchCategory.none,
            child: Text(SearchCategory.none,
                style: TextStyle(color: Colors.white))),
        DropdownMenuItem(
            value: SearchCategory.none,
            child: Text(SearchCategory.none,
                style: TextStyle(color: Colors.white))),
      ],
      onChanged: (value) {
        dropdownvalue = value!;
      },
      dropdownColor: Colors.black38,
      value: dropdownvalue,
      icon: Container(
        margin: EdgeInsets.only(bottom: 10.h, top: 8.h),
        child: const Icon(
          Icons.menu,
          color: Colors.white24,
        ),
      ),
      underline: Container(
        height: 1,
        color: Colors.white24,
      ),
    );
  }

  Widget _moviesListViewWidget() {
    final List<Movie> _movie = [];
    for (int i = 0; i < 20; i++) {
        _movie.add(
          Movie(
              name: "movie${i + 1}",
              language: "EN",
              isAdult: true,
              description: "description",
              posterPath: "posterPath",
              backdropPath: "backdropPath",
              rating: 8.3,
              releaseDate: "2024-5-24"),
        );
      }
    if (_movie.length != 0) {
      
      return ListView.builder(
          itemCount: _movie.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.screenHeight! * 0.01),
              child: GestureDetector(
                onTap: () {},
                child: Text(_movie[index].name),
              ),
            );
          });
    } else {
      return const Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      );
    }
  }
}
