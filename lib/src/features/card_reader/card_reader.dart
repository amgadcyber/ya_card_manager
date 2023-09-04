/*
  Card Reader (via NFC) 
   
  @description: Reading/Writing data to the Yasham Cards provided by Yasham Media
   
  @UsedWith: Yarongtech MIFARE Classic 1k card
  
  The ISO14443A standard specifies 
    that a Mifare Classic 1k card should have 16 sectors 
    and 4 blocks per sector. 

   Author: Amgad Fahd
*/

import 'package:nfc_classic_mifare/nfc_classic_mifare.dart';

class CardReader {
  /// [sectorCount] -- Get the number of sectors in the card
  static Future<int?> get sectorCount async {
    final count = await NfcClassicMifare.sectorCount;
    return count;
  }

  /// [blockCount] -- Get the number of blocks for each sector of the card
  static Future<int?> get blockCount async {
    final count = await NfcClassicMifare.blockCount;
    return count;
  }

  /// [availability] Get the [AVAILABILITY] of the NFC feature on the Platform
  static Future<AVAILABILITY> get availability async {
    final response = await NfcClassicMifare.availability;
    return response;
  }

  /// [readAllYashamCardInfo] -- Read All Yasham Card Info
  static Future<List<List<String>>> readAllYashamCardInfo(
      {String? passwordA, String? passwordB}) async {
    return await NfcClassicMifare.readAll(
      passwordA: passwordA,
      passwordB: passwordB,
    );
  }

  /// [readASpecificBlock] -- Read A Specifc Block
  static Future<String?> readASpecificBlock({
    required int blockIndex,
    String? passwordA,
    String? passwordB,
  }) async {
    return await NfcClassicMifare.readBlock(
      blockIndex: blockIndex,
      passwordA: passwordA,
      passwordB: passwordB,
    );
  }

  /// [readASpecificSector] -- Read A Specifc Sector
  static Future<List<String>> readASpecificSector({
    required int sectorIndex,
    String? passwordA,
    String? passwordB,
  }) async {
    return await NfcClassicMifare.readSector(
      sectorIndex: sectorIndex,
      passwordA: passwordA,
      passwordB: passwordB,
    );
  }

  /// [writeYashamInfoCard] -- Write Yasham Info Card
  /// will return [true] if the write was successful
  static Future<bool> writeYashamInfoCard({
    required int blockIndex,
    required String message,
  }) async {
    return await NfcClassicMifare.writeBlock(
      blockIndex: blockIndex,
      message: message,
    );
  }
}
