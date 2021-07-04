enum L {
  decode,
  general,
  none
}

class Log {

  static final logType = L.none;

  static void out(type, message) {
    if( logType == type) {
      if(type == L.decode)
        print("DECODE: $message");
    }
  }

}