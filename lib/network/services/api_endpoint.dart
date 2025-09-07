class EndPoint{

  static String BaseUrl = "https://newsapi.org/v2";

  static String everything(String searchKey) => '$BaseUrl/everything?q=$searchKey';

  static String topHeadline(String? country, String? query) => '$BaseUrl/top-headlines?country=$country&q=$query';

  static String newsByCategory(String category, String? country) => '$BaseUrl/top-headlines?country=$country&category=$category';

}