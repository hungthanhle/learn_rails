import { Controller, Get, Post, Body } from '@nestjs/common';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get()
  getAllUsers() {
    console.log(this);
    // UsersController {
    //   usersService: UsersService { users: [ [User], [User], [User] ] }
    // }
    const users = this.usersService.getAllUsers();
    return users;
  }

  @Post()
  addUser(@Body() user) {
    const { name, email } = user;
    const newUser = this.usersService.addUser(name, email); // UserService { users: [] } // UserService
    return newUser;
  }
}
