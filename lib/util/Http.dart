import 'package:dio/dio.dart';
import 'package:party_building_application/config/index.dart';

class Http {
  static Http instance;
  static String token;
  static final _Config = new Const();
  static Dio _dio;
  Options _options;

  static Http getInstance() {
    print("getInstance");
    if (instance == null) {
      instance = new Http();
    }
  }

  Http() {
    _options = new Options(
        baseUrl: _Config.BASE_URL,
        connectTimeout: _Config.connectTimeout,
        receiveTimeout: _Config.receiveTimeout,
        headers: {});

    _dio = new Dio(_options);

    _dio.interceptor.request.onSend = (Options options) async {
      print(options.baseUrl);
      return options;
    };

    _dio.interceptor.response.onSuccess = (Response response) async {
      print("get请求成功");
      return response;
    };
    _dio.interceptor.response.onError = (DioError e) {
      print(e);
      return e;
    };
  }

  get(url, {options, cancelToken, data = null}) async {
    print('get请求启动! url：$url ,body: $data');
    Response response;

    try {
      response = await _dio.get(url, data: data, cancelToken: cancelToken);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      } else {
        print('get请求发生错误：$e');
      }
    }
    return response.data;
  }

  post(url, {options, cancelToken, data}) async {
    print('post请求启动! url：$url ,body: $data');
    Response response;

    try {
      response = await _dio.post(url,
          data: data != null ? data : {}, cancelToken: cancelToken);
      print(response);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      } else {
        print('get请求发生错误：$e');
      }
    }
    return response.data;
  }

  //下载文件
  download(url, savePath,
      {options, cancelToken, data = null, onProgress}) async {
    Response response;
    try {
      response = await _dio.download(
        url,
        savePath,
        cancelToken: CancelToken(),
        onProgress: (int received, int total) => onProgress(received, total),
        data: data != null ? data : {},
      );
      print(response);
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      } else {
        print('get请求发生错误：$e');
      }
    }
    return response.data;
  }
}
