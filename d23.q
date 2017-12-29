inp:read0`:d23;

ins:`$" " vs/: inp;


getv:{[d;v] $[0Nj=d v;"J"$string v;d v]};

f:{[dict]
  at:dict`at; val:dict`val;
  if[at>=count[ins];:dict];
  $[ins[at;0]=`set;
    [val[ins[at;1]]:getv[val;ins[at;2]];at+:1];
    ins[at;0]=`sub;
    [val[ins[at;1]]-:getv[val;ins[at;2]];at+:1];
    ins[at;0]=`mul;
    [val[ins[at;1]]*:getv[val;ins[at;2]];ans1+:1;at+:1];
    $[0<>getv[val;ins[at;1]];at+:getv[val;ins[at;2]];at+:1]
    ];
  `at`val!(at;val)};

ans1:0;

f/[`at`val!(0;((`$/:.Q.a)!26#0))];

// Part 2 is basically counting composites between initial value of b and c, inclusive, with gap of "sub b -17"
// Rationale is if there is any factor of b, register f will be set to 0, which will increase h by 1
res:f\[100;`at`val!(0;((`$/:8#.Q.a)!(1,7#0)))];
vals:(first select from res where at=11)[`val;`b`c];

iscomp:{
  root:floor sqrt[x];
  any 0=x mod 2+til root-1};

ans2:count where iscomp each vals[0]+17*til 1+floor (vals[1]-vals[0])%17;
