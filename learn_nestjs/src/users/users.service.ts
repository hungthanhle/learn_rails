import { Injectable } from '@nestjs/common';
import { User } from './user.model';

@Injectable()
export class UsersService {
  private users = [];

  getAllUsers() {
    return this.users;
  }

  addUser(name, email) {
    console.log(this); // UserService { users: [] }
    console.log(this?.constructor?.name); // UserService
    const newUser = new User(this.users.length + 1, name, email);
    this.users.push(newUser);
    return newUser;
  }
}
