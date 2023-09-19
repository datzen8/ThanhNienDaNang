enum Env { dev, stg, prod }

class Config {
  String baseUrl;

  Config({
    required this.baseUrl,
  });

  static var currentEnv = Env.dev;

  static Config get currentConfig {
    switch (currentEnv) {
      case Env.dev:
        return dev;
      case Env.stg:
        return stg;
      case Env.prod:
        return prod;
    }
  }

  static Config get dev => Config(
        baseUrl: 'https://intern.try0.xyz/api/v1',
      );

  static Config get stg => Config(
        baseUrl: 'https://intern.try0.xyz/api/v1',
      );

  static Config get prod => Config(
        baseUrl: 'https://intern.try0.xyz/api/v1',
      );
}
