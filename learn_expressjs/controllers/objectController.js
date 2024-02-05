"use strict";
const userService = require('../services/userService');

const getAllUsers = function (req, res) {
  console.log(this); // undefined
  console.log(this == global); // false
  // node learn_expressjs/a.js
  const users = userService.getUsers();
  res.json(users);
}

const addUser = function (req, res) {
  const { name, email } = req.body;
  const newUser = userService.addUser(name, email); // UserService { users: [] } // UserService
  res.json(newUser);
}

const getAllUsersBind = function (req, res) {
  console.log(this); 
  /*
  Object {
    getAllUsers: [Function: getAllUsers],
    addUser: [Function: addUser],
    getAllUsersBind: [Function: getAllUsersBind]
  }
  */
  const users = userService.getUsers();
  res.json(users);
}

module.exports = {
  getAllUsers,
  addUser,
  getAllUsersBind,
};
