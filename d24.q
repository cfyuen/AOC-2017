inp:read0`:d24;

p:"I"$"/" vs/:inp;

f:{[x]
  used:x`used; at:x`at; step:x`step;
  id:id where not (id:where at=p[;0]) in used;
  tbl,:flip `used`at`step!(asc each used,/:id;p[id;1];step+1);
  id:id where not (id:where at=p[;1]) in used;
  tbl,:flip `used`at`step!(asc each used,/:id;p[id;0];step+1);
  };

tbl:([]used:enlist `long$();at:enlist 0;step:enlist 0);

{f each select from tbl where step=x; tbl::distinct tbl; count[tbl]} each til 40;

ans1:select max sum each sum each p used from 1_tbl;
ans2:select max sum each sum each p used from tbl where step=max step;

