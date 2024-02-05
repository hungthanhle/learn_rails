const userService = require('../services/userService');

const getAllUsers = function (req, res) {
  console.log(this);
  console.log(this == global); // true
  /*
  <ref *1> Object [global] {
    global: [Circular *1],
    queueMicrotask: [Function: queueMicrotask],
    clearImmediate: [Function: clearImmediate],
    setImmediate: [Function: setImmediate] {
      [Symbol(nodejs.util.promisify.custom)]: [Getter]
    },
    structuredClone: [Function: structuredClone],
    clearInterval: [Function: clearInterval],
    clearTimeout: [Function: clearTimeout],
    setInterval: [Function: setInterval],
    setTimeout: [Function: setTimeout] {
      [Symbol(nodejs.util.promisify.custom)]: [Getter]
    },
    atob: [Function: atob],
    btoa: [Function: btoa],
    performance: Performance {
      nodeTiming: PerformanceNodeTiming {
        name: 'node',
        entryType: 'node',
        startTime: 0,
        duration: 89362.14284299687,
        nodeStart: 0.16088400036096573,
        v8Start: 2.1423680000007153,
        bootstrapComplete: 84.26856299862266,
        environment: 14.037248000502586,
        loopStart: 174.41775999963284,
        loopExit: -1,
        idleTime: 65233.418648
      },
      timeOrigin: 1707126034688.676
    },
    fetch: [AsyncFunction: fetch]
  }
  */
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
