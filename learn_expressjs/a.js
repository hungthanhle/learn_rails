"use strict";

console.log(global);

function globalContext(){
  console.log(this);
}

const obj = {
  a: 1,
  objContext(){
    console.log(this);
  }
}

globalContext(); // undefined "use strict";
globalContext(); // global KHI KHÔNG "use strict";
obj.objContext(); // { a: 1, objContext: [Function: objContext] }
