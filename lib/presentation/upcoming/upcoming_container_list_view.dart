import 'package:boilerplate/constants/dimens.dart';
import 'package:boilerplate/core/widgets/app_bar_widget.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/core/widgets/search_filter.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/upcoming/store/upcoming_container_store.dart';
import 'package:boilerplate/utils/conversion/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UpcomingContainerListView extends StatefulWidget {
  const UpcomingContainerListView({super.key});

  @override
  State<UpcomingContainerListView> createState() =>
      _UpcomingContainerListViewState();
}

class _UpcomingContainerListViewState extends State<UpcomingContainerListView> {
  final UpcomingContainerStore _containerStore =
      getIt<UpcomingContainerStore>();

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
      child: DefaultAppBar(trKey: 'home_container_detail', suffix: ''),
    );
  }

  _buildBody() {
    return Column(
      children: [
        _buildSearchFilter(),
        Expanded(
          child: Stack(
            children: [
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
      builder: (context) => _containerStore.isLoading
          ? CustomProgressIndicatorWidget()
          : Material(
              child: _buildListView(),
            ),
    );
  }

  Widget _buildListView() {
    final containerList =
        _containerStore.upcomingContainerList?.upcomingContainers;
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
                child: _buildListItem(position),
              );
            },
          )
        : Center(
            child: Text(
              locale.translate('home_tv_no_post_found'),
            ),
          );
  }

  Widget _buildListItem(int position) {
    var item =
        _containerStore.upcomingContainerList?.upcomingContainers![position];
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
          dense: true,
          visualDensity: VisualDensity(vertical: VisualDensity.maximumDensity),
          style: ListTileStyle.list,
          minLeadingWidth: 0.0,
          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
          leading: SizedBox.square(),
          trailing: PopupMenuButton(
              elevation: 4.0,
              constraints:
                  BoxConstraints(minWidth: Dimens.screenWidth(context) * .1),
              position: PopupMenuPosition.over,
              offset: Offset(0.0, -16.0),
              padding: EdgeInsets.all(0),
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    height: Dimens.screenHeight(context) * .04,
                    value: '0',
                    child: Text(
                      'Edit Data',
                      style: context.textTheme.bodySmall,
                    ),
                    // onTap: () => onSelected,
                  ),
                  PopupMenuItem(
                    height: Dimens.screenHeight(context) * .04,
                    value: '1',
                    child: Text(
                      'Hapus Data',
                      style: context.textTheme.bodySmall,
                    ),
                    // onTap: () => onSelected,
                  )
                ];
              },
              child: FractionallySizedBox(
                alignment: Alignment.center,
                child: Icon(Icons.more_vert),
                widthFactor: .1,
              )),
          // trailing: IconButton(
          //   padding: EdgeInsets.only(bottom: Dimens.screenHeight(context)),
          //   visualDensity: VisualDensity(vertical: -4, horizontal: -4),
          //   onPressed: () {
          //     PopU
          //   },
          //   icon: Icon(Icons.more_vert),
          // ),
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
                      item!.containerNumber!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style:
                          context.textTheme.bodyMedium!.copyWith(fontSize: 11),
                    ),
                    Text(
                      item.estimationTime!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style:
                          context.textTheme.bodyMedium!.copyWith(fontSize: 11),
                    ),
                  ],
                ),
                Dimens.vSpaceTiny,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.quantity.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: context.textTheme.titleMedium,
                    ),
                    Text(
                      item.items.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style:
                          context.textTheme.bodyMedium!.copyWith(fontSize: 11),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1.5,
                  indent: 0.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
