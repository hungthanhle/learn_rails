const userService = require('../services/userService');

function userController() { // bị cho vào middleware
  console.log("create new instance");

  this.getAllUsers = function (req, res) {
    console.log(this); //global
    console.log(this == global); // true
    const users = userService.getUsers();
    res.json(users);
  }

  this.addUser = function (req, res) {
    const { name, email } = req.body;
    const newUser = userService.addUser(name, email); // UserService { users: [] } // UserService
    res.json(newUser);
  }

  this.getAllUsersBind = function (req, res) {
    console.log(this); // UserController {}
    const users = userService.getUsers();
    res.json(users);
  }
}

module.exports = new userController();
