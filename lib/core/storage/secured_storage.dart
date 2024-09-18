import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AppSecuredStorage {
  Future<void> storeFirstName(String? firstName);
  Future<String?> retrieveFirstName();
  Future<void> storeLastName(String? lastName);
  Future<String?> retrieveLastName();
  Future<void> clearAllData();
}

///
class AppSecuredStorageImpl implements AppSecuredStorage {
  final _securedStorage = const FlutterSecureStorage();

  final keyFname = 'blott_key_fname';
  final keyLname = 'blott_key_lname';

  @override
  Future<void> storeFirstName(String? firstName) async {
    return await _securedStorage.write(
      key: keyFname,
      value: firstName,
    );
  }

  @override
  Future<String?> retrieveFirstName() async {
    String? firstName = await _securedStorage.read(
      key: keyFname,
    );
    return firstName;
  }

  @override
  Future<void> storeLastName(String? lastName) async {
    await _securedStorage.write(
      key: keyLname,
      value: lastName,
    );
  }

  @override
  Future<String?> retrieveLastName() async {
    String? lastName = await _securedStorage.read(
      key: keyLname,
    );
    return lastName;
  }

  @override
  Future clearAllData() async {
    await Future.wait([
      _securedStorage.delete(key: keyFname),
      _securedStorage.delete(key: keyLname),
    ]);
  }
}

final securedStorageProvider = Provider<AppSecuredStorageImpl>((ref) {
  return AppSecuredStorageImpl();
});
