enum AppPage {
  landing('/landing',''),
  error('/error', ''),
  login('/login', ''),
  root('/', ''),
  home('/home', ''),
  suggestion('/suggestion', ''),
  setting('/setting', ''),
  detail1('detail/:id', 'id'),
  detail2('detail2/:id', 'id'),
  detail3('detail3/:id2', 'id2'),
  infoDetail('info_detail', '');

  const AppPage(this.path, this.params);
  final String path;
  final String params;
}

/*
extension AppPageExtension on AppPage{
  String get path{
    switch(this){
      case AppPage.landing:
        return '/landing';
      case AppPage.error:
        return '/error';
      case AppPage.root:
        return '/';
      case AppPage.tab1:
        return '/tab1_page';
      case AppPage.detail1:
        return 'detail/:id';
      default:
        return '/';
    }
  }

  /// return parameters from route path
  /// https://gorouter.dev/parameters
  String get params{
    switch(this){
      case AppPage.detail1:
        return 'id';
      default:
        return '';
    }
  }
}*/
