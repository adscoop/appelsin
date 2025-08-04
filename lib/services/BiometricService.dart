import 'package:local_auth/local_auth.dart';





class Biometricservice {



  Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication auth = LocalAuthentication();

    final bool canCheckBiometrics = await auth.canCheckBiometrics;
    final bool isDeviceSupported = await auth.isDeviceSupported();

    if (!canCheckBiometrics || !isDeviceSupported) {
      return false;
    }

    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to continue',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      return didAuthenticate;
    } catch (e) {
      print("Authentication error: $e");
      return false;
    }
  }
}
