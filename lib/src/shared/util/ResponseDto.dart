class ResponseDto{

		int statusCode;
		String status;
		String body;
		String error;

    ResponseDto.fromJson(Map<String, dynamic> json){
      statusCode=json['statusCode'];
      status=json['status'];
      body=json['body'];
      error=json['error'];
    }
}