import 'package:scoped_model/scoped_model.dart';
import 'FollowsModel.dart';

class MainModel extends Model with FollowsModel {
  @override
  void up(bool isUp) {
    // TODO: implement up
    super.up(isUp);
    notifyListeners();
  }
}
