class Player {
  List<String> _addUser = [];

  createUser(String userName) {
    this._addUser.add(userName);
  }

  List<String> getPlayer() {
    return this._addUser;
  }

  int get userLength => this._addUser.length;
  void listClear() {
    this._addUser.clear();
  }
}
