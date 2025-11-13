import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_app/core/errors/exceptions.dart';
class FirebaseAuthService{
  Future<User>createUserWithEmailAndPassword({required email,required password})async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomExceptions(message: 'كلمة المرور ضعيفة للغاية');
      }
      else if (e.code == 'email-already-in-use') {
        throw CustomExceptions(message: ' لقد قمت بالتسجل مسبقا الرجاء تسجيل الدخول');
      }
      else {
        print('Firebase error code: ${e.code}');
        throw CustomExceptions(message: '  لقد حدث خطا ما اعد المحاولة مره اخرى من فضلك  ');
      }
    }
    catch (e) {
      throw CustomExceptions(message:' خطأ غير معروف حاول مره اخرى ؟');
    }
  }
}