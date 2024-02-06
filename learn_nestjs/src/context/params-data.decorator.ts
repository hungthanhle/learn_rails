import { createParamDecorator, ExecutionContext } from '@nestjs/common';

// https://docs.nestjs.com/custom-decorators#param-decorators
export const ParamsData = createParamDecorator(
  (data: unknown, context: ExecutionContext) => { // nodejs đối số call funtion là params => context => req, res
    return context;
  },
);
