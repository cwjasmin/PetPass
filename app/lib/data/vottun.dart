import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class VottunApiService {
  static const String _ipfbaseUrl = 'https://ipfsapi-v2.vottun.tech/ipfs/v2';
  final String baseUrl = 'https://api.vottun.tech/erc/v1/erc721';
  static final Map<String, String> _headers = {
    'Authorization': 'Bearer ${dotenv.get('API_KEY_VOTTUN')}',
    'x-application-vkn': '${dotenv.get('APP_ID')}',
    // Puedes agregar más headers si son necesarios
    // 'Authorization': 'Bearer TU_TOKEN',
  };

  // Mintear un nuevo NFT
  Future<Map<String, dynamic>> mintNFT({
    required String recipientAddress,
    required int tokenId,
    required String ipfsUri,
    required String ipfsHash,
    required int network,
    required String contractAddress,
    int? royaltyPercentage,
    int? gasLimit,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/mint'),
      /*headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      }, */
      body: jsonEncode({
        'recipientAddress': recipientAddress,
        'tokenId': tokenId,
        'ipfsUri': ipfsUri,
        'ipfsHash': ipfsHash,
        'network': network,
        'contractAddress': contractAddress,
        if (royaltyPercentage != null) 'royaltyPercentage': royaltyPercentage,
        if (gasLimit != null) 'gasLimit': gasLimit,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to mint NFT: ${response.body}');
    }
  }

  void mint() async {
    // Mintear un nuevo NFT
    final mintResult = await mintNFT(
      recipientAddress: '0xa4750976879ef2..59abd3ac1ab78873a0',
      tokenId: 1,
      ipfsUri: 'https://ipfsgw.vottun.tech/ipfs/QmZX4xbbqx2..HUGJurLqZ95NVv97',
      ipfsHash: 'QmZX4xbbqx2..HUGJurLqZ95NVv97',
      network: 80001,
      contractAddress: '0x6412bdbDf58634..f6805cb83613B2B1',
      royaltyPercentage: 10,
    );
    print('NFT Minted: ${mintResult['txHash']}');
  }

  /// Sube un archivo a IPFS
  static Future<String> uploadFile(File file) async {
    try {
      final uri = Uri.parse('$_ipfbaseUrl/file/upload');

      var request = http.MultipartRequest('POST', uri);

      request.headers.addAll(_headers);
      // Agregar el archivo y el filename
      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          filename: file.path.split('/').last,
        ),
      );
      request.fields['filename'] = file.path.split('/').last;

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        final responseData = json.decode(response.body);
        return responseData['hash'] as String;
      } else {
        throw Exception('Error al subir archivo: ${response.statusCode}');
      }
    } catch (e) {
      print('$e');
      throw Exception('Error: $e');
      
    }
  }
}
