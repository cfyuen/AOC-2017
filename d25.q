inp:read0`:d25;

mapd:"rl"!(1 -1);

steps:"J"$(-2#" " vs inp[1])[0];

d:()!();

pstring:{
  tok:last each " " vs/: x;
  at:tok[0;0];
  ins:"I"$'tok[2 6;0];
  dir:mapd tok[3 7;0];
  nxt:tok[4 8;0];
  d[at]:(ins;dir;nxt);
  };

{pstring inp[3+(x*10)+til 10]} each til 6;

f:{
  at:x 0; st:x 1;
  val:0^tape[at];
  tape[at]:d[st;;val][0];
  (at+d[st;;val][1];d[st;;val][2])};

init:(0;(-2#inp[0])[0]);
tape:(enlist 0)!(enlist 0);

f/[steps;init];

ans1:sum value tape;


