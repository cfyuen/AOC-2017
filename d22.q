inp:read0`:d22;

d:(0 1;1 0;0 -1;-1 0);

state:raze (til count[inp]),''{where x="#"} each inp;
state:state!count[state]#2;

ans1:0;

f:{[dict]
  0N!at:dict`at; dir:dict`dir;
  dir:$[2=0^state[at];
    [state[at]:0;(dir+1) mod 4];
    [ans1+:1;state[at]:2;(dir+3) mod 4]];
  at+:d[dir];
  `at`dir!(at;dir)};
  
f/[10000;`at`dir!(12 12;3)];


state:raze (til count[inp]),''{where x="#"} each inp;
state:(`u#state)!count[state]#2;

ans2:0;

f2:{[dict]
  at:dict`at; dir:dict`dir;
  cur:0^state[at];
  if[1=cur;ans2+:1];
  dir:$[0=cur;(dir+3) mod 4;1=cur;dir;2=cur;(dir+1) mod 4;(dir+2) mod 4];
  state[at]:(cur+1) mod 4;
  at+:d[dir];
  `at`dir!(at;dir)};
  
f2/[10000000;`at`dir!(12 12;3)];


