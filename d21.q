inp:read0`:d21;

r:" => " vs/: inp;
r:{"/" vs/: x}each r;

rot90:{[bd] bd:flip bd; bd[(0;count[bd]-1)]:bd[(count[bd]-1;0)]; bd};
allrot:{[bd] res:(rot90\)[bd]; bd:flip bd; res,:(rot90\)[bd]; res};
{add:ar where not any (ar:allrot x[0])~\:/:r[;0]; {r,:(y;x)}[x[1];]each add}each r;

f:{[bd]
  sz:$[0=count[bd] mod 2;2;3];
  part:sz cut sz cut' bd;
  bd:raze {[part;sz;x] raze each flip {[part;x;y] id:first where part[x;;y]~/:r[;0]; r[id;1]}[part;x;]peach til count part}[part;sz;]peach til count part;
  bd};

final:(f/)[5;(".#.";"..#";"###")];
ans1:count where (raze final)="#";

final:(f/)[18;(".#.";"..#";"###")];
ans2:count where (raze final)="#";



