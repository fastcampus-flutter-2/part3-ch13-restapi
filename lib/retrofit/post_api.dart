import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'post_api.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class PostApi {
  factory PostApi(Dio dio, {String baseUrl}) = _PostApi;

  @GET('/posts')
  Future<HttpResponse> getPosts();

  @POST("/posts")
  @Header('content-type:application/json')
  Future<HttpResponse> postPost(@Body() Map<String, dynamic> body);

  @PUT("/posts/{id}")
  Future<HttpResponse> putPost(
    @Path() String id,
    @Body() Map<String, dynamic> body,
  );

  @DELETE("/posts/{id}")
  Future<HttpResponse> deletePost(@Path() String id);
}
