inp:read0`:d5;
l:"I"$inp;

//l:0 3 0 1 -3;
d:(`l`at!(l;0));

f:{[d]
  l:d`l; at:d`at;
  if[(at<0)|(at>=count l);:d];
  jump:l[at];
  l[at]:l[at]+1;
  at:at+jump;
  d[`l]:l; d[`at]:at;
  d};

fd:(f/)d;
ans1:sum fd[`l]-d[`l];

cnt:0;

f2:{[d]
  l:d`l; at:d`at;
  if[(at<0)|(at>=count l);:d];
  jump:l[at];
  l[at]:l[at]+$[l[at]>=3;-1;1];
  at:at+jump;
  cnt::cnt+1;
  d[`l]:l; d[`at]:at;
  d};

fd:(f2/)d;
ans2:cnt;


