// FunctionHolder.dart  singlton class to call funtion anywhere
class FunctionHolder {
  static final FunctionHolder _instance = FunctionHolder._internal();
  FunctionHolder._internal();

  static FunctionHolder get instance => _instance;

  Function? functionInPage1;

// FunctionHolder.instance.functionInPage1?.call(); call this line
}