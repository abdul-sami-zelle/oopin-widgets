import 'package:flutter/material.dart';
import 'package:oopin/utils/pageheader.dart';
import 'package:oopin/utils/userheader.dart';
import 'package:oopin/view/widgets/cities/cities.dart';
import 'package:oopin/view/widgets/dashoard/featuredcity.dart';
import 'package:oopin/view/widgets/opincaller.dart';
import 'package:oopin/view/widgets/opinionmaker/opinionmaker.dart';
import 'package:oopin/view/widgets/payment/paymentmethod.dart';
import 'package:oopin/view/widgets/payment/sessionselection.dart';
import 'package:oopin/view/widgets/reviews/ratingbox.dart';
import 'package:oopin/view/widgets/reviews/reviewlist.dart';
import 'package:oopin/view/widgets/services/servicecard.dart';
import 'package:oopin/view/widgets/subservices/subservices.dart';

class Newpage extends StatelessWidget {
  const Newpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(1.0)),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Pageheader(pagename: 'Dashoard', ismain: true),
                  SizedBox(height: 10),
                  Userheader(
                    content:
                        'Ask and discover opinions on anything that matters.',
                    heading: 'Welcome',
                    textfield: true,
                    controller: TextEditingController(),
                    img: 'assets/img/avatar.png',
                  ),
                  SizedBox(height: 10),
                  Opinionmaker(
                    image: 'assets/img/person-img.png',
                    name: 'John Doe',
                    location: 'Cambridge',
                    experience: '25 Years',
                    description:
                        'A seasoned career consultant with expertise in guiding individuals toward the right career paths. Skilled at analyzing strengths, interests, and market trends to provide tailored advice. Dedicated to helping clients achieve professional growth and long-term success.',
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Subservices(
                            title: 'Mexican',
                            image: 'assets/img/service.png',
                            isSelected: true,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Subservices(
                            title: 'Italian',
                            image: 'assets/img/italian.png',
                            isSelected: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  CityGridLayout(),
                  SizedBox(height: 20),
                  ServiceGrid(),
                  SizedBox(height: 20),
                  ReviewList(),
                  SizedBox(height: 20),
                  RatingSummaryCard(),
                  SizedBox(height: 20),
                  Opincaller(
                    image: 'assets/img/person-img.png',
                    name: 'John Doe',
                    location: 'Cambridge',
                    age: '25 Years',
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FeaturedcityCard(
                            cityname: 'London',
                            imagepath: 'assets/img/london.png',
                          ),
                          SizedBox(width: 10),
                          FeaturedcityCard(
                            cityname: 'Blackburn',
                            imagepath: 'assets/img/london.png',
                          ),
                          SizedBox(width: 10),
                          FeaturedcityCard(
                            cityname: 'Oxford',
                            imagepath: 'assets/img/london.png',
                          ),
                          SizedBox(width: 10),
                          FeaturedcityCard(
                            cityname: 'Cardiff',
                            imagepath: 'assets/img/london.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SessionSelection(),
                  SizedBox(height: 20),
                  PaymentOptionCard(heading: 'From Card', description: 'Select to use Credit/debit card for payment.', imagePath: 'assets/img/card.png'),
                  SizedBox(height:10),
                  PaymentOptionCard(heading: 'From Wallet', description: 'Select to pay using your in-app wallet', imagePath: 'assets/img/wallet.png'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
