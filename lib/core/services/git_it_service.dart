import 'package:fruits_hub/core/services/firebase_auth_service.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import 'database_service.dart';
import 'firestore_service.dart';

//final getIt = GetIt.instance;

void setupGetIt() {
  GetIt.I.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  GetIt.I.registerSingleton<DatabaseService>(FireStoreService());
  GetIt.I.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: GetIt.I<FirebaseAuthService>(), databaseService: GetIt.I<DatabaseService>(),
    ),
  );
}
