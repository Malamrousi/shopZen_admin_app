class DashboardQueries {
  factory DashboardQueries() {
    return _instance;
  }
  const DashboardQueries._();

  static const DashboardQueries _instance = DashboardQueries._();

  Map<String, dynamic> getAllProductNumber() {
    return {
      'query': '''
            {
            products{
              title
            }
          }
      ''',
    };
  }

  Map<String, dynamic> getAllCategoryNumber() {
    return {
      'query': '''
            {
            categories{
              name
            }
          }
      ''',
    };
  }

  Map<String, dynamic> getAllUsersNumber() {
    return {
      'query': '''
            {
            users{
              name
            }
          }
      ''',
    };
  }
}
