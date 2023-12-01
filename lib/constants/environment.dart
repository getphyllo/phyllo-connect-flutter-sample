import 'package:phyllo_connect/phyllo_connect.dart';
import 'package:flutter_sample_app/constants/configs.dart';

class Environment {
  final PhylloEnvironment environment;
  final String clientId;
  final String clientSecret;

  const Environment._({
    required this.environment,
    required this.clientId,
    required this.clientSecret,
  });

  static const Environment development = Environment._(
    environment: PhylloEnvironment.development,
    clientId: '930b618d-bb30-46ed-be07-170b5ae3b6ea',
    clientSecret: 'a5fc2c7b-79e2-4642-b62a-66c922968db0',
  );

  static const Environment sandbox = Environment._(
    environment: PhylloEnvironment.sandbox,
    clientId: Configs.clientId,
    clientSecret: Configs.clientSecret,
  );

  static const Environment staging = Environment._(
    environment: PhylloEnvironment.development,
    clientId: 'f937d228-6f95-4a37-8454-2be0dbb163dc',
    clientSecret: '98dee08b-0514-48aa-a531-7c70577668de',
  );

  static const Environment production = Environment._(
    environment: PhylloEnvironment.production,
    clientId: 'de5a5733-5d95-407f-a926-a94a6fb6c22c',
    clientSecret: '5d4e0b3e-50db-4bb0-986d-b054c8b41359',
  );

  static List<Environment> get values => [development, sandbox, production];
}
