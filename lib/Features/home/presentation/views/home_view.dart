import 'package:booklyapp/Features/home/Data/repo/homerepoimplmantion.dart';
import 'package:booklyapp/Features/home/presentation/view_models/featrued_book_cubit/home_book_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widget/custom_actions_home_view.dart';
import 'package:booklyapp/Features/home/presentation/views/widget/home_view_body.dart';
import 'package:booklyapp/Features/home/presentation/views/widget/profile_details.dart';

import 'package:booklyapp/core/utils/service_locator.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // traeger cubit
    HomeCubit(getit.get<Homerepoimplmantion>()).fetchFeaturedBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 90,
          backgroundColor: const Color(0xFF7968FF),
          leadingWidth: double.infinity,
          leading: const ProfileDetails(),
          actions: const [CustomActionsHomeView()]),
      // provide cubit to the screen
      body: BlocProvider(
        create: (context) => HomeCubit(getit.get<Homerepoimplmantion>()),
        child: const HomeViewBody(),
      ),
    );
  }
}
