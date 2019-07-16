import 'package:scoped_model/scoped_model.dart';

class FollowsModel  {
  bool _isUp = false;
  get isUp => _isUp;

  void up(bool isUp){
    _isUp = isUp;
  }
}