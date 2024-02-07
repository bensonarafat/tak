import 'package:flutter/material.dart';
import 'package:onboarding_slider_flutter/onboarding_slider_flutter.dart';
import 'package:tak/core/constants/assets.dart';

///
/// App Constants
///

const endpoint = "https://api.walteredmundsltd.com/api/v1/";

const paystackInitializeEndpoint =
    "https://api.paystack.co/transaction/initialize";

const paystackSecretKey = "sk_test_8e6cf8a8d90cd1bd6e29d5616ef7daf1a30b0c21";

const imageplaceholder =
    "https://res.cloudinary.com/dxlgnxlzt/image/upload/v1701278678/default/kuwck4jccdl457cbgziy.png";
const LinearGradient onboardGradiant = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xff0a74d7),
    Color(0xff105DA5),
    Color(0xff144A7D),
    Color(0xff173B5D),
    Color(0xff1B2D3D),
    Color(0xff1D252E),
    Color(0xff1E1F1F),
  ],
);

final List<OnBoardModel> onBoardData = [
  const OnBoardModel(
    title: "Write some heading here",
    description:
        "Write some some content here, this is a sample text which i wrote here",
    image: onboardingCarousel1,
  ),
  const OnBoardModel(
    title: "Write some heading here",
    description:
        "Write some some content here, this is a sample text which i wrote here",
    image: onboardingCarousel1,
  ),
  const OnBoardModel(
    title: "Write some heading here",
    description:
        "Write some some content here, this is a sample text which i wrote here",
    image: onboardingCarousel1,
  ),
];
