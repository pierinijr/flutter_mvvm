import 'package:flutter/material.dart';
import 'package:flutter_mvvm/model/product_list_model.dart';
import 'package:flutter_mvvm/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/drawer/navigation_drawer.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductViewModel productViewModel = context.watch<ProductViewModel>();
    return Scaffold(
        appBar: AppBar(
            leading: Builder(builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 24.0,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 24.0,
                ),
                onPressed: () {},
              ),
            ]),
        drawer: const NavigationDrawer(),
        body: listViewProducts(productViewModel));
  }

  listViewProducts(ProductViewModel productViewModel) {
    if (productViewModel.loading) {
      return const CircularProgressIndicator(
        color: Colors.black,
      );
    }
    // if (usersViewModel.userError != null) {
    //   return AppError(
    //     errortxt: usersViewModel.userError.message,
    //   );
    // }
    return GridView.count(
      crossAxisCount: 2,
      children:
          List.generate(productViewModel.productListModel!.length, (index) {
        Result productListModel = productViewModel.productListModel![index];
        return Center(
          child: Text(productListModel.title.toString()),
        );
      }),
    );
  }
}
