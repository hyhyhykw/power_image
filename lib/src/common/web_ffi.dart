

import 'dart:typed_data';

class Pointer<T>{

factory  Pointer.fromAddress(int handle){
  throw UnsupportedError('Unsupported for web platform');
}

Uint8List asTypedList(int length){
  throw UnsupportedError('Unsupported for web platform');
}
}

class Uint8{

}