import 'package:boilerplate/core/data/local/sembast/sembast_client.dart';
import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/domain/entity/container/container_data.dart';
import 'package:boilerplate/domain/entity/container/container_data_list.dart';
import 'package:sembast/sembast.dart';

class ContainerDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _containerStore = intMapStoreFactory.store(DBConstants.CONTS_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
//  Future<Database> get _db async => await AppDatabase.instance.database;

  // database instance
  final SembastClient _sembastClient;

  // Constructor
  ContainerDataSource(this._sembastClient);

  // DB functions:--------------------------------------------------------------
  Future<int> insert(ContainerData data) async {
    return await _containerStore.add(_sembastClient.database, data.toMap());
  }

  Future<int> count() async {
    return await _containerStore.count(_sembastClient.database);
  }

  Future<List<ContainerData>> getAllSortedByFilter(
      {List<Filter>? filters}) async {
    //creating finder
    final finder = Finder(
        filter: filters != null ? Filter.and(filters) : null,
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _containerStore.find(
      _sembastClient.database,
      finder: finder,
    );

    return recordSnapshots.map((e) {
      final container = ContainerData.fromMap(e.value);
      return container;
    }).toList();

    // // Making a List<Post> out of List<RecordSnapshot>
    // return recordSnapshots.map((snapshot) {
    //   final goods = GoodsReceipt.fromMap(snapshot.value);
    //   // An ID is a key of a record from the database.
    //   goods.id = snapshot.key;
    //   return goods;
    // }).toList();
  }

  Future<ContainerDataList> getPostsFromDb() async {
    // post list
    var goodsList;

    // fetching data
    final recordSnapshots = await _containerStore.find(
      _sembastClient.database,
    );

    // Making a List<Post> out of List<RecordSnapshot>
    if (recordSnapshots.length > 0) {
      goodsList = ContainerDataList(
          containerList: recordSnapshots.map((snapshot) {
        // var index = recordSnapshots.indexOf(snapshot);
        final data = ContainerData.fromMap(snapshot.value);
        return data;
      }).toList());
    }

    return goodsList;
  }

  Future<int> update(ContainerData data) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(data.containerNumber));
    return await _containerStore.update(
      _sembastClient.database,
      data.toMap(),
      finder: finder,
    );
  }

  Future<int> delete(ContainerData data) async {
    final finder = Finder(
      filter: Filter.byKey(data.items),
    );
    return await _containerStore.delete(
      _sembastClient.database,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _containerStore.drop(
      _sembastClient.database,
    );
  }
}
