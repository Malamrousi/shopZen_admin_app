class UsersQueries {
  factory UsersQueries() {
    return _instance;
  }
  const UsersQueries._();

  static const UsersQueries _instance = UsersQueries._();

  Map<String, dynamic> getAllUsers() {
    return {
      'query': '''
      {
        users {
          id
          name
          email
          avatar
        }
      }
    ''',
    };
  }

  Map<String, dynamic> deleteUser({required String userId}) {

      return {
      'query': r'''
            mutation DeleteUser($userId: ID!) {
              deleteUser(id: $userId)
            }
      ''',
      'variables': {
        'userId': userId,
      },
    };
  }
}
