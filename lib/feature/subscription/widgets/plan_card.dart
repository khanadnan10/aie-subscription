// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:subscription_ui/utils/colors.dart';

class PlanCard extends StatelessWidget {
  final String type;
  final String tag;
  final bool isSelected;
  final String price;
  final List<String> packageInfo;
  const PlanCard({
    Key? key,
    required this.type,
    required this.tag,
    required this.isSelected,
    required this.price,
    required this.packageInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;

    return Material(
      elevation: isSelected == true ? 10 : 15,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(80.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        // height: screenSize.height * 0.7,
        // width: screenSize.width * 0.8,
        decoration: BoxDecoration(
          color: isSelected == true ? AppColor.kBlue : AppColor.kWhite,
          borderRadius: BorderRadius.circular(60.0),
        ),
        padding: const EdgeInsets.only(bottom: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Text(
                      type,
                      style: TextStyle(
                        fontSize: 36.0,
                        color: isSelected == true
                            ? AppColor.kWhite
                            : AppColor.kBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      tag,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: isSelected == true
                            ? AppColor.kWhite
                            : AppColor.kBlue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // pricing text --------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '₹$price',
                            style: TextStyle(
                              fontSize: 64.0,
                              color: isSelected == true
                                  ? AppColor.kWhite
                                  : AppColor.kBlue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Per month',
                            style: TextStyle(
                              fontSize: 10.0,
                              color: isSelected == true
                                  ? AppColor.kWhite
                                  : AppColor.kBlue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      // Info about the plan -----------------------
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0).copyWith(top: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: packageInfo.map((item) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\u2022 $item',
                          style: TextStyle(
                            fontSize: 10.0,
                            color: isSelected == true
                                ? AppColor.kWhite
                                : AppColor.kBlue,
                            fontWeight: FontWeight.w700,
                          ),
                          softWrap: true,
                        ),
                        const SizedBox(height: 6.0),
                      ],
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
