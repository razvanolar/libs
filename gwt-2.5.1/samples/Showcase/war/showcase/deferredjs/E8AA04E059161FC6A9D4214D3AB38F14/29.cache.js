function Wjb(a){this.b=a}
function Tjb(a,b){this.b=a;this.c=b}
function Pjb(a){var b,c,d;b=Lcc(gr(a.b.db,Wuc));c=Lcc(gr(a.c.db,Wuc));d=Lcc(gr(a.d.db,Wuc));OQb(a.e,"User '"+b+"' has security clearance '"+c+"' and cannot access '"+d+Yqc)}
function Ojb(a){var b,c,d,e,f,g;d=new CTb;b=yH(d.k,98);d.p[ctc]=5;g=u3(mR);e=new jMb(g);kj(e,new Tjb(a,g),(Vw(),Vw(),Uw));f=new sVb;f.f[ctc]=3;pVb(f,new XQb(Sxc));pVb(f,e);wTb(d,0,0,f);LTb(b,0)[Vuc]=2;tTb(d,1,0,Txc);tTb(d,1,1,"User '{0}' has security clearance '{1}' and cannot access '{2}'");a.b=new _Yb;RYb(a.b,'amelie');tTb(d,2,0,Uxc);wTb(d,2,1,a.b);a.c=new _Yb;RYb(a.c,'guest');tTb(d,3,0,Vxc);wTb(d,3,1,a.c);a.d=new _Yb;RYb(a.d,'/secure/blueprints.xml');tTb(d,4,0,Wxc);wTb(d,4,1,a.d);a.e=new VQb;tTb(d,5,0,ayc);wTb(d,5,1,a.e);QTb(b,5,0,(OUb(),NUb));c=new Wjb(a);kj(a.b,c,(Fx(),Fx(),Ex));kj(a.c,c,Ex);kj(a.d,c,Ex);Pjb(a);return d}
i1(640,1,dnc,Tjb);_.Dc=function Ujb(a){n3(this.b,this.c+$xc)};_.b=null;_.c=null;i1(641,1,Qmc,Wjb);_.Fc=function Xjb(a){Pjb(this.b)};_.b=null;i1(642,1,gnc);_.mc=function _jb(){N3(this.c,Ojb(this.b))};var mR=zbc($tc,'ErrorMessages'),_Q=xbc($tc,'CwMessagesExample$1',640),aR=xbc($tc,'CwMessagesExample$2',641);Vnc(wn)(29);