enum EnvironmentMode {
  ///"Dev" for test mode
  dev(0),
  production(1);

  const EnvironmentMode(this.mode);

  final int mode;

  static EnvironmentMode toEnvironmentMode(int mode) => values.firstWhere((element) => element.mode == mode);
}
