import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environments {
  static const String LOCAL = 'local';
  static const String DEV = 'dev';
  static const String QAS = 'QAS';
  static const String PRODUCTION = 'prod';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.DEV;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.LOCAL,
      'url': 'http://localhost:8080/api/',
    },
    {
      'env': Environments.DEV,
      'url': '${dotenv.env['API_URL']}',
    },
    {
      'env': Environments.QAS,
      'url': '',
    },
    {
      'env': Environments.PRODUCTION,
      'url': '',
    },
  ];

  static Map<String, String> getEnvironment() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }

  static String getCurrentEnvironmentUrl() {
    return getEnvironment()['url']!;
  }
}

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironment()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}
