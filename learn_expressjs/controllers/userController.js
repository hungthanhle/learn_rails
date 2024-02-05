const userService = require('../services/userService');

class UserController { // bị cho vào middleware
  constructor() {
    console.log("create new instance");
  }

  getAllUsers(req, res) {
    console.log(this); //undefined
    const users = userService.getUsers();
    res.json(users);
  }

  addUser(req, res) {
    const { name, email } = req.body;
    const newUser = userService.addUser(name, email); // UserService { users: [] } // UserService
    res.json(newUser);
  }

  getAllUsersBind(req, res) {
    console.log(this); // UserController {}
    const users = userService.getUsers();
    res.json(users);
  }
}

module.exports = new UserController();
