import 'package:flutter/material.dart';

import '../../../../core/models/product/db_product_model.dart';
import '../widgets/search_list.dart';
import 'package:e_commerce/core/routes/navigation_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ValueNotifier<List<ProductModel>> foundproduct = ValueNotifier([]);

  @override
  void initState() {
    foundproduct.value = ValueNotifier<List<ProductModel>>([]).value;
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
              NavigationService.pop();
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
      result.value = ValueNotifier<List<ProductModel>>([]).value;
    } else {
      List<ProductModel> filteredList = ValueNotifier<List<ProductModel>>([]).value
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
