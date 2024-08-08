import 'package:mercy_touch/View/Screen/Cart.dart';
import 'package:mercy_touch/View/Screen/Services/MedicalGuide/MedicalGuideElementsDetails.dart';
import 'package:mercy_touch/View/Screen/Services/Pharmacy/DrugsDetails.dart';
import 'package:mercy_touch/Core/app_export.dart';
import 'package:mercy_touch/View/Screen/Services/Consulutation/Doctors.dart';
import 'package:mercy_touch/View/Screen/Services/Consulutation/DoctorsDetails.dart';
import 'package:mercy_touch/View/Screen/Services/Laboratory/DoctorsLab.dart';
import 'package:mercy_touch/View/Screen/Services/MedicalGuide/MedicalGuideElements.dart';
import 'package:mercy_touch/View/Screen/Services/Pharmacy/Drugs.dart';
import 'package:mercy_touch/View/Screen/myfavorite.dart';
// ignore: unused_import
import 'package:mercy_touch/Workspace/test/View.dart';


List<GetPage<dynamic>>? routes = [
  // ! TEST PAGE
   //GetPage(name: "/", page: () =>Cart(),),

  //! Default First inter face
   GetPage(name: "/", page: () => const OnBoarding(),middlewares: [MyMiddleWare()]),
  //! OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () =>  const OnBoarding()),
  //! Auth
  GetPage(name: AppRoute.login, page: () =>  Login()),
  GetPage(name: AppRoute.SginUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.verifiyCode, page: () => const VerifiyCode()),
  GetPage(name: AppRoute.SuccessResetPassword, page: () => SuccessResetPassword()),
  GetPage(name: AppRoute.SuccessSignUp, page: () => SuccessSignUp()),
  GetPage(name: AppRoute.VerifiyCodeSignUp, page: () => VerifiyCodeSignUp()),
  //!
  GetPage(name: AppRoute.Home, page: () => HomeScreen()),

  //!
  GetPage(name: AppRoute.MedicalGuide, page: () => MedicalGuide(),),
  GetPage(name: AppRoute.MedicalGuideElements, page: () => MedicalGuideElements()),
  GetPage(name: AppRoute.MedicalGuideElementsDetails, page: () => MedicalGuideElementsDetails()),
  
  
  //!
  GetPage(name: AppRoute.Consultation, page: () => Consultation()),
  GetPage(name: AppRoute.Doctors, page: () => Doctors()),
  GetPage(name: AppRoute.DoctorsDetails, page: () => DoctorsDetails()),
  GetPage(name: AppRoute.myfavorite, page: () => MyFavorite()),
  
  
  //!
  GetPage(name: AppRoute.Pharmacy, page: () => Pharmacy()),
  GetPage(name: AppRoute.Drugs, page: () => Drugs()),
  GetPage(name: AppRoute.DrugsDetails, page: () => DrugsDetails()),
  GetPage(name: AppRoute.Cart, page: () => Cart()),


  //!
  GetPage(name: AppRoute.Laboratory, page: () => Laboratory()),
  GetPage(name: AppRoute.DoctorsLab, page: () => DoctorsLab()),




  // GetPage(name: AppRoute.TestHome, page: () => TestHome()),


  // GetPage(name: AppRoute.Doctors, page: () => Doctors()),

];


