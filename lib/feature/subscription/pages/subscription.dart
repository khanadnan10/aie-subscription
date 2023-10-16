import 'dart:math';

import 'package:flutter/material.dart';
import 'package:subscription_ui/feature/subscription/data/subscription.dart';
import 'package:subscription_ui/feature/subscription/widgets/plan_card.dart';
import 'package:subscription_ui/utils/colors.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  late final PageController pageController;
  int selectedPage = 0;
  double viewportFraction = 0.8;
  double? pageOffset = 0;

  @override
  void initState() {
    pageController = PageController(
        viewportFraction: viewportFraction, initialPage: selectedPage)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Choose your plan',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: AppColor.kWhite,
          ),
        ),
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () =>
              Navigator.pop(context), // navigating back to the previous page
          child: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.kWhite,
      body: Stack(
        alignment: Alignment.center,
        // clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Upper clipper -----------------------------------------
              const Expanded(
                child: Image(
                  alignment: Alignment.topLeft,
                  image: AssetImage('images/Vector 50.png'),
                ),
              ),
              // Bottom clipper -----------------------------------------
              Expanded(
                child: SizedBox(
                  width: screenSize.width,
                  child: const Image(
                    alignment: Alignment.bottomRight,
                    image: AssetImage('images/Vector 51.png'),
                  ),
                ),
              ),
            ],
          ),
          // Circle in bottom -----
          Positioned(
            bottom: -110.0,
            left: -280.0,
            child: Container(
              height: 600,
              width: 600,
              decoration: BoxDecoration(
                  color: AppColor.kWhite,
                  border: Border.all(
                    width: 45,
                    color: AppColor.kPrimaryPink,
                  ),
                  borderRadius: BorderRadius.circular(2000.0)),
            ),
          ),
          // BODY - Plans sections ------------------------
          SizedBox(
            height: screenSize.height * 0.7,
            // width: screenSize.width,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: subscription.length,
              controller: pageController,
              onPageChanged: (value) {
                selectedPage = value;
              },
              itemBuilder: (context, index) {
                double scale = max(viewportFraction,
                    (1 - (pageOffset! - index).abs()) + viewportFraction);
                return Padding(
                  padding: EdgeInsets.only(
                    right: 10.0,
                    left: 10.0,
                    top: 100 - scale * 50,
                  ),
                  child: PlanCard(
                    isSelected: index == selectedPage ? true : false,
                    type: subscription[index]['type'],
                    tag: subscription[index]['tag'],
                    price: subscription[index]['price'],
                    packageInfo: subscription[index]['packageInfo'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
