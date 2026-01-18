import 'package:flutter/material.dart';

import '../../../../core/database/function/product_db_function.dart';
import '../../../../core/database/models/product/db_product_model.dart';
import '../../../../core/widgets/search_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ValueNotifier<List<ProductModel>> foundproduct = ValueNotifier([]);

  @override
  void initState() {
    foundproduct.value = productListNotifier.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.chevron_left,
              size: 45,
              color: Colors.grey,
            )),
        title: SizedBox(
          width: 310,
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              onChanged: (value) => runFilter(value),
              decoration: const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
      ),
      body: SearchListWidget(foundproduct: foundproduct),
    );
  }

  runFilter(String enteredKeyWord) {
    ValueNotifier<List<ProductModel>> result = ValueNotifier([]);

    if (enteredKeyWord.isEmpty) {
      result.value = productListNotifier.value;
    } else {
      List<ProductModel> filteredList = productListNotifier.value
          .where((product) => product.title
              .toLowerCase()
              .contains(enteredKeyWord.toLowerCase()))
          .toList();
      result.value = filteredList;
    }

    setState(() {
      foundproduct = result;
    });
  }
}
