import { Controller, Get, Post, Body } from '@nestjs/common';
import { UsersService } from './users.service';
import { ParamsData } from '../context/params-data.decorator';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {
    console.log('create new instance');
    /*
    Starting Nest application...
    create new instance
    [Nest] 41944  - 02/06/2024, 2:48:35 PM     LOG [InstanceLoader] AppModule dependencies initialized +16ms
    [Nest] 41944  - 02/06/2024, 2:48:35 PM     LOG [InstanceLoader] UsersModule dependencies initialized +0ms
    [Nest] 41944  - 02/06/2024, 2:48:35 PM     LOG [RoutesResolver] 
    */

    /*
    không có lần 2 "create new instance"
    */
  }

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
  addUser(@Body() user) { // nodejs đối số call funtion là params => context => res => res.body
    const { name, email } = user;
    const newUser = this.usersService.addUser(name, email); // UserService { users: [] } // UserService
    return newUser;
  }

  @Get('/params')
  params(@ParamsData() context) { // nodejs đối số call funtion là params => context <= INJECT BY DECORATOR
    const request = context.switchToHttp().getRequest();
    console.log(request.url);
    console.log(request.method);
    return { success: true };
  }
}
