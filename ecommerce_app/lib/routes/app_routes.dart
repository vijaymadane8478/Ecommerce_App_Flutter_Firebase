import 'package:ecommerce_app/features/authentication/screens/forgot_password/forgot_password.dart';
import 'package:ecommerce_app/features/authentication/screens/login/loign.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/features/personalization/screens/Edit_profile/edit_profile.dart';
import 'package:ecommerce_app/features/personalization/screens/profile.dart';
import 'package:ecommerce_app/features/shop/screens/address/address.dart';
import 'package:ecommerce_app/features/shop/screens/cart/cart.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce_app/features/shop/screens/home/home.dart';
import 'package:ecommerce_app/features/shop/screens/order/order.dart';
import 'package:ecommerce_app/features/shop/screens/store/store.dart';
import 'package:ecommerce_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:get/get.dart';

class UAppRoutes {
  static final screens = [
    GetPage(name: URoutes.home, page: () => NavigationMenu()),
    GetPage(name: URoutes.store, page: () => StoreScreen()),
    GetPage(name: URoutes.wishlist, page: () => const WishlistScreen()),
    GetPage(name: URoutes.profile, page: () => const ProfileScreen()),
    GetPage(name: URoutes.order, page: () => const OrderScreen()),
    GetPage(name: URoutes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: URoutes.cart, page: () => const CartScreen()),
    GetPage(name: URoutes.editProfile, page: () => const EditProfileScreen()),
    GetPage(name: URoutes.userAddress, page: () => const AddressScreen()),
    GetPage(name: URoutes.signup, page: () => const SignupScreen()),
    GetPage(name: URoutes.verifyEmail, page: () => const VerifilemailScreen()),
    GetPage(name: URoutes.signIn, page: () => const LoginScreen()),
    GetPage(
      name: URoutes.forgetPassword,
      page: () => const forgotPassWordScrren(),
    ),
    GetPage(name: URoutes.onBoarding, page: () => const OnboardingScreen()),
  ];
}
