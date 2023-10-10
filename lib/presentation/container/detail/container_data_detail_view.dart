import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/core/widgets/app_bar_widget.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/core/widgets/search_filter.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/container/store/container_store.dart';
import 'package:boilerplate/utils/conversion/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContainerDataDetailView extends StatefulWidget {
  final String containerName;

  const ContainerDataDetailView({super.key, required this.containerName});

  @override
  State<ContainerDataDetailView> createState() =>
      _ContainerDataDetailViewState();
}

class _ContainerDataDetailViewState extends State<ContainerDataDetailView> {
  late final String containerName;

  //stores
  final ContainerStore _containerStore = getIt<ContainerStore>();

  @override
  void initState() {
    super.initState();
    containerName = widget.containerName;
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    if (!_containerStore.loading) {
      await _containerStore.getContainerDetail();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      appBar: _buildAppBar(),
    );
  }

  _buildAppBar() {
    final locale = context.appLocale;
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child:
          DefaultAppBar(trKey: 'home_container_detail', suffix: containerName),
    );
  }

  _buildBody() {
    return Column(
      children: [
        _buildSearchFilter(),
        Expanded(
          child: Stack(
            children: [
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
      builder: (context) => _containerStore.loading
          ? CustomProgressIndicatorWidget()
          : Material(
              child: _buildListView(),
            ),
    );
  }

  Widget _buildListView() {
    final containerList = _containerStore.containerDetailModel!.receiptList;
    final locale = context.appLocale;
    return containerList!.isNotEmpty
        ? ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 16),
            itemCount: containerList.length,
            separatorBuilder: (context, position) {
              return Dimens.vSpaceSemiRegular;
            },
            itemBuilder: (context, position) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox.shrink());
            },
          )
        : Center(
            child: Text(
              locale.translate('home_tv_no_post_found'),
            ),
          );
  }

  // Widget _buildListItem(int position) {
  //   var item = _containerStore.containerDetailModel!.receiptList![position];
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(10.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //           color: Colors.white,
  //           border:
  //               Border(left: BorderSide(color: context.primary, width: 16.0)),
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey.withOpacity(0.5),
  //               spreadRadius: 5,
  //               blurRadius: 7,
  //               offset: Offset(0, 3), // changes position of shadow
  //             ),
  //           ]),
  //       child: ListTile(
  //         dense: true,
  //         visualDensity: VisualDensity(vertical: VisualDensity.maximumDensity),
  //         style: ListTileStyle.list,
  //         minLeadingWidth: 0.0,
  //         contentPadding: EdgeInsets.symmetric(vertical: 8.0),
  //         leading: SizedBox.square(),
  //         trailing: PopupMenuButton(
  //             elevation: 4.0,
  //             constraints:
  //                 BoxConstraints(minWidth: Dimens.screenWidth(context) * .1),
  //             position: PopupMenuPosition.over,
  //             offset: Offset(0.0, -16.0),
  //             padding: EdgeInsets.all(0),
  //             itemBuilder: (context) {
  //               return <PopupMenuEntry>[
  //                 PopupMenuItem(
  //                   height: Dimens.screenHeight(context) * .04,
  //                   value: '0',
  //                   child: Text(
  //                     'Edit Data',
  //                     style: context.textTheme.bodySmall,
  //                   ),
  //                   // onTap: () => onSelected,
  //                 ),
  //                 PopupMenuItem(
  //                   height: Dimens.screenHeight(context) * .04,
  //                   value: '1',
  //                   child: Text(
  //                     'Hapus Data',
  //                     style: context.textTheme.bodySmall,
  //                   ),
  //                   // onTap: () => onSelected,
  //                 )
  //               ];
  //             },
  //             child: FractionallySizedBox(
  //               alignment: Alignment.center,
  //               child: Icon(Icons.more_vert),
  //               widthFactor: .1,
  //             )),
  //         title: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Text(
  //                     item.markingNumber,
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                     softWrap: false,
  //                     style:
  //                         context.textTheme.bodyMedium!.copyWith(fontSize: 11),
  //                   ),
  //                   Text(
  //                     item.updatedAt.toString(),
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                     softWrap: false,
  //                     style:
  //                         context.textTheme.bodyMedium!.copyWith(fontSize: 11),
  //                   ),
  //                 ],
  //               ),
  //               Dimens.vSpaceTiny,
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     item.receivingNumber,
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                     softWrap: false,
  //                     style: context.textTheme.titleMedium,
  //                   ),
  //                   Text(
  //                     item.history.packing!.containerNoConsortiom.toString(),
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                     softWrap: false,
  //                     style:
  //                         context.textTheme.bodyMedium!.copyWith(fontSize: 11),
  //                   ),
  //                 ],
  //               ),
  //               Dimens.vSpaceRegular,
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                     item.product.,
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                     softWrap: false,
  //                     style: context.textTheme.titleMedium,
  //                   ),
  //                   RichText(
  //                     text: TextSpan(
  //                       children: [
  //                         TextSpan(
  //                             text: item.quantity.toString(),
  //                             style: context.textTheme.titleMedium!
  //                                 .copyWith(fontWeight: FontWeight.bold)),
  //                         TextSpan(
  //                             text: ' QC', style: context.textTheme.titleMedium)
  //                       ],
  //                     ),
  //                   )
  //                   // Text(
  //                   //   '${item.quantity.toString()} QC',
  //                   //   maxLines: 1,
  //                   //   overflow: TextOverflow.ellipsis,
  //                   //   softWrap: false,
  //                   //   style: context.textTheme.titleMedium,
  //                   // ),
  //                 ],
  //               ),
  //               Divider(
  //                 thickness: 1.5,
  //                 indent: 0.0,
  //               ),
  //               Text(
  //                 'Notes: ${item.notes}',
  //                 maxLines: 1,
  //                 overflow: TextOverflow.ellipsis,
  //                 softWrap: false,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_containerStore.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_containerStore.errorStore.errorMessage);
        }

        return SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    final locale = context.appLocale;
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: locale.translate('home_tv_error'),
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }
}
