import 'package:flutter/material.dart';
import 'package:flutter_mvvm/model/product_list_model.dart';
import 'package:flutter_mvvm/repo/api_status.dart';
import 'package:flutter_mvvm/repo/product_services.dart';

class ProductViewModel extends ChangeNotifier {
  bool _loading = false;
  List<Result>? _productListModel = [];

  bool get loading => _loading;
  List<Result>? get productListModel => _productListModel;

  ProductViewModel() {
    getProduct();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setProductListModel(ProductListModel productListModel) {
    List<Result>? results = productListModel.results;
    _productListModel = results;
  }

  getProduct() async {
    setLoading(true);
    var response = await ProductServices.getProduct();
    if (response is Success) {
      setProductListModel(response.response as ProductListModel);
    }

    // if (response is Failure) {
    //   UserError userError = UserError(
    //     code: response.code,
    //     message: response.errorResponse,
    //   );
    //   setUserError(userError);
    // }
    setLoading(false);
  }
}
