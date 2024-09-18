import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/color_const.dart';
import '../../../common/constants/string_const.dart';
import '../../../common/widgets/text_labels/label_custom.dart';
import '../../../core/storage/secured_storage.dart';
import '../controller/home_controller.dart';
import 'widgets/news_item_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routePath = '/homeScreen';
  static const String routeName = 'home-screen';

  const HomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BlottColors.darkScreenBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<String?>(
              future: ref.read(securedStorageProvider).retrieveFirstName(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0.h,
                          vertical: 22.0.h,
                        ),
                        child: BlottLabelCustom(
                          title: 'Hey ${snapshot.data}',
                          size: 32.0,
                          fontWeight: FontWeight.w900,
                          color: BlottColors.whiteColor,
                        ),
                      );
                    }
                  case ConnectionState.waiting:
                  default:
                    return const SizedBox();
                }
              },
            ),
            Expanded(
              child: ref
                  .watch(
                fetchNewsFutureProvider,
              )
                  .when(
                data: (data) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      return ref.refresh(fetchNewsFutureProvider);
                    },
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return NewsItemWidget(
                          newsData: data[index],
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) {
                  // debugPrint(error.toString());
                  return const BlottLabelCustom(
                    title: BlottStrings.errorMessageFetchingNews,
                    size: 16.0,
                    color: BlottColors.whiteColor,
                    maxLines: 2,
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: BlottColors.whiteColor,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
