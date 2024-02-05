const User = require('../models/userModel');

class UserService { // không bị dùng ở middleware
  constructor() {
    this.users = [];
  }

  addUser(name, email) {
    console.log(this); // UserService { users: [] }
    console.log(this?.constructor?.name); // UserService
    const newUser = new User(this.users.length + 1, name, email);
    this.users.push(newUser);
    return newUser;
  }

  getUsers() {
    return this.users;
  }
}

module.exports = new UserService();
