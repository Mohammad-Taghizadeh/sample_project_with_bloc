// to convert the response into a non nullable object (model)

import 'package:sample_project_with_bloc/app/extensions.dart';
import 'package:sample_project_with_bloc/data/responses/responses.dart';
import 'package:sample_project_with_bloc/domain/model.dart';

String EMPTY = "";
int ZERO = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(this?.id?.orEmpty() ?? EMPTY, this?.name?.orEmpty() ?? EMPTY,
        this?.numOfNotifications?.orZero() ?? ZERO);
  }
}

extension ContactResponseMapper on ContactResponse? {
  Contacts toDomain() {
    return Contacts(this?.email?.orEmpty() ?? EMPTY, this?.phone?.orEmpty() ?? EMPTY,
        this?.link?.orEmpty() ?? EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.contacts?.toDomain(), this?.customer?.toDomain() ,);
  }
}

