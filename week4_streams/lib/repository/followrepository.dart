
 
    // Stream dataStream() async* {
  //   var result;
  //   while (true) {
  //     await Future.delayed(Duration(milliseconds: 600)).then((value) async {
  //       String? token = await storage.read(key: "token");
  //       bool isTokenExpired = JwtDecoder.isExpired(token!);
  //       if (isTokenExpired) {
  //         ProfileService().refreshSession(context);
  //         token = await storage.read(key: "token");
  //       }
  //       final response = await http.get(
  //         Uri.parse(url + "/api/collection/${widget.colID}"),
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Accept': 'application/json',
  //           'Authorization': 'JWT $token',
  //         },
  //       );

  //       if (response.statusCode == 200) {
  //         result = [json.decode(response.body)];
  //       } else {
  //         throw Exception('Failed to load post: ${response.body}');
  //       }
  //     });
  //     yield result;
  //   }
  // }