import 'dart:typed_data';

import 'package:riverpod_sample/main.dart';

extension PacketExtension on int {
  List<int> convertInt2Bytes(Endian order, int byteSize) {
    //value : int형 변수 최대 8바이트 (64비트 까지)
    //order 바이트 정렬기준, little -> 작은값부터  bing -> 큰값부터 앞으로
    try{
      const kMaxBytes = 8;
      logger.i(":::::>>>>>>>>>>>>>>>>>> this " + this.toString());
      var bytes = Uint8List(kMaxBytes)..buffer.asByteData().setInt16(0, this, order);
      List<int> intArray;
      if(order == Endian.big){
        intArray = bytes.sublist(kMaxBytes - byteSize, kMaxBytes).toList();
      }else{
        intArray = bytes.sublist(0, byteSize).toList();
      }
      return intArray;
    }catch(e) {
      logger.e('util convert error: $e');
    }
    return [];
  }

}
