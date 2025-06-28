import 'package:dartz/dartz.dart';
import '../../../../core/erroes/Failur.dart';
import '../entites/UserEntites.dart';

abstract class AuthRepo {
  Future<Either<Failur, UserEntity>> CreateUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failur, UserEntity>> SignWithEmailAndoPassword(
    String email,
    String password,
  );

  Future<Either<Failur, UserEntity>> signInWithGoogle();

  Future addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uid});

  Future saveUserData({required UserEntity user});

  Future<Either<Failur, UserEntity>> signInWithFacebook();

  Future<Either<Failur, void>> sendPasswordResetEmail({required String email});
}
