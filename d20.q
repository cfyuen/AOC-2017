inp:read0`:d20;

p:{"J"$"," vs/: -1_/:3_/:x} each ", " vs/: inp;

doit:{
  p[;1]+:p[;2];
  p[;0]+:p[;1];
  };

do[1000;doit[]];
ans1:first where q=min q:sum each abs p[;0];

p:{"J"$"," vs/: -1_/:3_/:x} each ", " vs/: inp;

collision:{
  rem:l where not differ l:asc p[;0];
  p::p where not p[;0] in rem;
  doit[];
  };

do[1000;collision[]];
ans2:count p;