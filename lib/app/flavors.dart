enum AppFlavor { dev, staging, prod }

class FlavorConfig {
  FlavorConfig._();

  static AppFlavor appFlavor = AppFlavor.dev;

  static String get name => appFlavor.name;
}
