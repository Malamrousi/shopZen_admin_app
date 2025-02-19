import '../../../../features/category/data/models/create_category_request_body.dart';

class CategoryQueries {
  factory CategoryQueries() {
    return _instance;
  }
  const CategoryQueries._();

  static const CategoryQueries _instance = CategoryQueries._();

  Map<String, dynamic> getAllCategories() {
    return {
      'query': '''
      { 
       categories{
	      id
	    	name
		   image
       creationAt
       updatedAt
              }
                   }
       '''
    };
  }

  Map<String, dynamic> createCategory(
      {required CreateCategoryRequestBody createCategory}) {
    return {
      'query': r'''
              mutation createCategory($name: String!, $image: String!) {

              addCategory{

              data: {name:$name , image :$image}

              }{

              id
              name
              image
              }
              }


 ''',
      'variables': {'name': createCategory.name, 'image': createCategory.image}
    };
  }
}
