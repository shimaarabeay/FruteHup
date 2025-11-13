import 'package:dartz/dartz.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/firebase_services.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure,UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomExceptions catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure('يوجد خطاء حاول مره اخرى'));
    }
  }
}
