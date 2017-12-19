inp:read0`:d18;
l:" " vs/: inp;

getv:{if[0N=v:"J"$x;v:d[`$x]];v};

process:{[x]
  ins:l[x];
  cmd:`$ins[0];
  $[cmd=`snd;
      [sound::d`$ins[1];x+:1];
    cmd=`set;
      [v:getv ins[2];d[`$ins[1]]:v;x+:1];
    cmd=`add;
      [v:getv ins[2];d[`$ins[1]]+:v;x+:1];
    cmd=`mul;
      [v:getv ins[2];d[`$ins[1]]*:v;x+:1];
    cmd=`mod;
      [v:getv ins[2];d[`$ins[1]]:d[`$ins[1]] mod v;x+:1];
    cmd=`rcv;
      [if[0<>getv ins[1];if[ans1=0Nj;ans1::sound]];x+:1];
      $[0<getv ins[1];x+:getv ins[2];x+:1];
    ];
  x};

d:(`$'.Q.a)!26#0;
sound:0;
ans1:0Nj;
(process/)[1500;0];

// Part 2
getv2:{[id;x]if[0N=v:"J"$x;v:d[id;`$x]];v};

process2:{[id;arg]
  q:arg`q; x:(arg`x)[id];
  ins:l[x];
  cmd:`$ins[0];
  $[cmd=`snd;
      [q[1-id],:d[id;`$ins[1]];if[id=1;ans2::ans2+1];x+:1];
    cmd=`set;
      [v:getv2[id;ins[2]];d[id;`$ins[1]]:v;x+:1];
    cmd=`add;
      [v:getv2[id;ins[2]];d[id;`$ins[1]]+:v;x+:1];
    cmd=`mul;
      [v:getv2[id;ins[2]];d[id;`$ins[1]]*:v;x+:1];
    cmd=`mod;
      [v:getv2[id;ins[2]];d[id;`$ins[1]]:d[id][`$ins[1]] mod v;x+:1];
    cmd=`rcv;
      if[0<count q[id];d[id;`$ins[1]]:first q[id];q[id]:1_q[id];x+:1];
      $[0<getv2[id;ins[1]];x+:getv2[id;ins[2]];x+:1];
    ];
  ax:arg`x; ax[id]:x;
  `q`x!(q;ax)};

d:2#enlist ((`$'.Q.a)!26#0);
d[1;`p]:1;
ans2:0;

init:`q`x!((();());(0;0));

run:{
  x:(process2[0]/)[x];
  x:(process2[1]/)[x]
  };

(run/)[init];
