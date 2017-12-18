inpa:679;
inpb:771;

ga:{(16807*x) mod 2147483647};
gb:{(48271*x) mod 2147483647};

ans1:0;
g:{
  r:(ga x[0];gb x[1]);
  ans1::ans1+all (-16#0b vs' r[0])=(-16#0b vs' r[1]);
  r
  };

40000000 g/ (inpa;inpb);

ans2:0;

g2:{
  r:((ga/)[{0<>x mod 4};ga x[0]];(gb/)[{0<>x mod 8};gb x[1]]);
  ans2::ans2+all (-16#0b vs' r[0])=(-16#0b vs' r[1]);
  r
  };

5000000 g2\ (inpa;inpb);

