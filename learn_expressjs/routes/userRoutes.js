const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController');
const objectController = require('../controllers/objectController');

router.get('/users', userController.getAllUsers);
router.post('/users', userController.addUser);
router.get('/users_bind', userController.getAllUsersBind.bind(userController));
router.get('/objects', objectController.getAllUsers);
router.get('/objects_bind', objectController.getAllUsersBind.bind(objectController));

module.exports = router;
