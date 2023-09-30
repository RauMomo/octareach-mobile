import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/core/widgets/search_filter.dart';
import 'package:boilerplate/domain/entity/container/container_data.dart';
import 'package:boilerplate/presentation/container/detail/container_data_detail_view.dart';
import 'package:boilerplate/utils/conversion/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContainerDataListScreen extends StatefulWidget {
  @override
  _ContainerDataListScreenState createState() =>
      _ContainerDataListScreenState();
}

class _ContainerDataListScreenState extends State<ContainerDataListScreen> {
  //stores:---------------------------------------------------------------------

  late final List<ContainerData> containerList;

  @override
  void initState() {
    containerList = [
      ContainerData(
          containerNumber: 'F020',
          dateTime: 'Friday, 02-05-2023 16:45',
          items: 4,
          quantity: 30),
      ContainerData(
          containerNumber: 'F019',
          dateTime: 'Friday, 02-05-2023 16:45',
          items: 8,
          quantity: 30),
      ContainerData(
          containerNumber: 'F018',
          dateTime: 'Friday, 02-05-2023 16:45',
          items: 4,
          quantity: 30),
      ContainerData(
          containerNumber: 'F017',
          dateTime: 'Friday, 02-05-2023 16:45',
          items: 2,
          quantity: 30),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  //appbar methods:
  PreferredSizeWidget _buildAppBar() {
    final locale = context.appLocale;
    return AppBar(
      primary: true,
      title: Column(
        children: [
          Text(
            locale.translate('home_container'),
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: context.colorScheme.background,
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Column(
      children: [
        _buildSearchFilter(),
        Expanded(
          child: Stack(
            children: <Widget>[
              _handleErrorMessage(),
              _buildMainContent(),
            ],
          ),
        ),
      ],
    );
  }

  _buildSearchFilter() {
    return SearchFilter();
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return Material(child: _buildListView());
      },
    );
  }

  Widget _buildListView() {
    final locale = context.appLocale;
    return ListView.builder(
      itemCount: containerList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: _buildListItem(index),
        );
      },
    );
    // return ListView.separated(
    //   padding: EdgeInsets.symmetric(vertical: 16),
    //   itemCount: _goodsStore.goodsReceiptList!.goods!.length,
    //   separatorBuilder: (context, position) {
    //     return Divider();
    //   },
    //   itemBuilder: (context, position) {
    //     return Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 16),
    //       child: _buildListItem(position),
    //     );
    //   },
    // );
  }

  Widget _buildListItem(int position) {
    var item = containerList[position];
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(left: BorderSide(color: context.primary, width: 16.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: ListTile(
          onTap: () {
            context.navigator.push(
              MaterialPageRoute(
                builder: (context) {
                  return ContainerDataDetailView();
                },
              ),
            );
          },
          dense: true,
          visualDensity: VisualDensity(vertical: VisualDensity.maximumDensity),
          style: ListTileStyle.list,
          minLeadingWidth: 0.0,
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
          leading: SizedBox.square(),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.containerNumber,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: context.textTheme.titleMedium,
                    ),
                    Text(
                      item.dateTime,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style:
                          context.textTheme.bodyMedium!.copyWith(fontSize: 11),
                    ),
                  ],
                ),
                Dimens.vSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: item.items.toString(),
                              style: context.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: ' ITEMS',
                              style: context.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.w300))
                        ],
                      ),
                    ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: item.quantity.toString(),
                              style: context.textTheme.titleMedium!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: ' QC', style: context.textTheme.titleMedium)
                        ],
                      ),
                    )
                    // Text(
                    //   '${item.quantity.toString()} QC',
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    //   softWrap: false,
                    //   style: context.textTheme.titleMedium,
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _handleErrorMessage() {
    return SizedBox.shrink();
  }

  // // General Methods:-----------------------------------------------------------
  // _showErrorMessage(String message) {
  //   final locale = context.appLocale;
  //   Future.delayed(Duration(milliseconds: 0), () {
  //     if (message.isNotEmpty) {
  //       FlushbarHelper.createError(
  //         message: message,
  //         title: locale.translate('home_tv_error'),
  //         duration: Duration(seconds: 3),
  //       )..show(context);
  //     }
  //   });

  //   return SizedBox.shrink();
  // }
}

class TileClipper extends CustomClipper<RRect> {
  @override
  RRect getClip(Size size) {
    return RRect.fromRectAndRadius(
      Rect.fromLTRB(0, 0, 100, 100),
      Radius.circular(100),
    );
  }

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) {
    return true;
  }
}
