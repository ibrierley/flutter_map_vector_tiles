enum L {
  decode,
  general,
  expression,
  none
}

class Log {

  static final logType = L.decode;

  static void out(type, message) {
    if( logType == type) {
      if(type == L.decode)
        print("DECODE: $message");
    }
  }

}