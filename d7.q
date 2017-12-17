inp:read0`:d7;
l:" -> " vs/: inp;
name:" " vs/: l[;0];
child:", " vs/: l[;1];

ans1:name[;0] where not name[;0] in (distinct raze child);

w:"I"$1_/:-1_/:name[;1];

x:();
y:();
check:{[s]
  if[s like "";:0];
  id:first where name[;0] like s;
  res:check each child[id];
  if[1<count distinct res;x,:enlist s;y,:enlist res];
  w[id]+sum res};

check "cqmvs";

id:first where name[;0] like first x;
wrong:first child[id];
id:first where name[;0] like wrong;
ans2:w[id]-max[first y]-min[first y];


