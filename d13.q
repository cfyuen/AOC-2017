inp:read0`:d13;
l:"I"$": " vs/: inp;
//l:(0 3;1 2;4 4;6 4);

ans1:sum (0=l[;0] mod 2*l[;1]-1)*(prd each l);

f:{all (x+l[;0]) mod 2*l[;1]-1};

ans2:first where f peach til 4000000;