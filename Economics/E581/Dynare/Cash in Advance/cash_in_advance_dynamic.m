function [residual, g1, g2, g3] = cash_in_advance_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(12, 1);
T42 = (1+y(19)-params(2))*(1-y(6))/(1-y(17));
T46 = y(8)/(exp(params(5))*y(18));
T59 = y(16)*y(20)*exp(y(21)-params(8));
T66 = params(3)*y(1)^(params(4)-1);
T74 = params(3)*y(1)^params(4)+(1-params(3))*(y(6)*y(13))^params(4);
T75 = 1/params(4);
T77 = T74^(T75-1);
T82 = (1-params(3))*y(13)*(y(6)*y(13))^(params(4)-1);
T120 = T59*T59;
T125 = params(3)*getPowerDeriv(y(1),params(4)-1,1);
T127 = params(3)*getPowerDeriv(y(1),params(4),1);
T128 = getPowerDeriv(T74,T75-1,1);
T129 = T127*T128;
T137 = getPowerDeriv(T74,T75,1);
T142 = (-(1+y(19)-params(2)))/(1-y(17));
T150 = getPowerDeriv(y(6)*y(13),params(4),1);
T152 = (1-params(3))*y(13)*T150;
T153 = T128*T152;
T156 = getPowerDeriv(y(6)*y(13),params(4)-1,1);
T158 = (1-params(3))*y(13)*y(13)*T156;
T170 = (1+y(19)-params(2))*(1-y(6))/((1-y(17))*(1-y(17)));
T174 = 1/(exp(params(5))*y(18));
T185 = (-(y(8)*exp(params(5))))/(exp(params(5))*y(18)*exp(params(5))*y(18));
T208 = (1-params(3))*y(6)*T150;
T209 = T128*T208;
T215 = (1-params(3))*(y(6)*y(13))^(params(4)-1)+(1-params(3))*y(13)*y(6)*T156;
T236 = (-((-((-(1+params(9)+y(14)))*(y(10)+y(10))))/(y(10)*y(10)*y(10)*y(10))));
T383 = getPowerDeriv(T74,T75-1,2);
T384 = T127*T383;
T404 = T152*T152*T383+T128*(1-params(3))*y(13)*y(13)*getPowerDeriv(y(6)*y(13),params(4),2);
T417 = T208*T152*T383+T128*(1-params(3))*(T150+y(6)*y(13)*getPowerDeriv(y(6)*y(13),params(4),2));
T426 = T208*T208*T383+T128*(1-params(3))*y(6)*y(6)*getPowerDeriv(y(6)*y(13),params(4),2);
T477 = T127*getPowerDeriv(T74,T75,2);
lhs =y(4);
rhs =(1+params(9)+y(14))/y(10);
residual(1)= lhs-rhs;
lhs =y(6)*y(8);
rhs =(1+params(9)+y(14))/y(10)+y(5)*(1+params(5)+params(8))-(1+y(9)-params(2))*y(1);
residual(2)= lhs-rhs;
lhs =1;
rhs =params(1)*T42*T46;
residual(3)= lhs-rhs;
lhs =1;
rhs =params(1)*(1-y(6))*y(10)*y(8)/T59;
residual(4)= lhs-rhs;
lhs =y(9);
rhs =T66*T77;
residual(5)= lhs-rhs;
lhs =y(8);
rhs =T77*T82;
residual(6)= lhs-rhs;
lhs =y(14);
rhs =params(12)*y(2)+x(it_, 2);
residual(7)= lhs-rhs;
lhs =y(15);
rhs =params(10)*y(3)+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(13);
rhs =exp(y(15));
residual(9)= lhs-rhs;
lhs =y(11);
rhs =y(5)*(1+params(5)+params(8))-y(1)*(1-params(2));
residual(10)= lhs-rhs;
lhs =y(7);
rhs =T74^T75;
residual(11)= lhs-rhs;
lhs =y(12);
rhs =log(y(4))+params(6)*log(1-y(6));
residual(12)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(12, 23);

  %
  % Jacobian matrix
  %

  g1(1,4)=1;
  g1(1,10)=(-((-(1+params(9)+y(14)))/(y(10)*y(10))));
  g1(1,14)=(-(1/y(10)));
  g1(2,1)=1+y(9)-params(2);
  g1(2,5)=(-(1+params(5)+params(8)));
  g1(2,6)=y(8);
  g1(2,8)=y(6);
  g1(2,9)=y(1);
  g1(2,10)=(-((-(1+params(9)+y(14)))/(y(10)*y(10))));
  g1(2,14)=(-(1/y(10)));
  g1(3,6)=(-(params(1)*T46*T142));
  g1(3,17)=(-(params(1)*T46*T170));
  g1(3,8)=(-(params(1)*T42*T174));
  g1(3,18)=(-(params(1)*T42*T185));
  g1(3,19)=(-(params(1)*T46*(1-y(6))/(1-y(17))));
  g1(4,16)=(-((-(params(1)*(1-y(6))*y(10)*y(8)*y(20)*exp(y(21)-params(8))))/T120));
  g1(4,6)=(-(params(1)*(-(y(10)*y(8)))/T59));
  g1(4,8)=(-(params(1)*y(10)*(1-y(6))/T59));
  g1(4,10)=(-(params(1)*y(8)*(1-y(6))/T59));
  g1(4,20)=(-((-(params(1)*(1-y(6))*y(10)*y(8)*y(16)*exp(y(21)-params(8))))/T120));
  g1(4,21)=(-((-(params(1)*(1-y(6))*y(10)*y(8)*T59))/T120));
  g1(5,1)=(-(T77*T125+T66*T129));
  g1(5,6)=(-(T66*T153));
  g1(5,9)=1;
  g1(5,13)=(-(T66*T209));
  g1(6,1)=(-(T82*T129));
  g1(6,6)=(-(T82*T153+T77*T158));
  g1(6,8)=1;
  g1(6,13)=(-(T82*T209+T77*T215));
  g1(7,2)=(-params(12));
  g1(7,14)=1;
  g1(7,23)=(-1);
  g1(8,3)=(-params(10));
  g1(8,15)=1;
  g1(8,22)=(-1);
  g1(9,13)=1;
  g1(9,15)=(-exp(y(15)));
  g1(10,1)=1-params(2);
  g1(10,5)=(-(1+params(5)+params(8)));
  g1(10,11)=1;
  g1(11,1)=(-(T127*T137));
  g1(11,6)=(-(T137*T152));
  g1(11,7)=1;
  g1(11,13)=(-(T137*T208));
  g1(12,4)=(-(1/y(4)));
  g1(12,6)=(-(params(6)*(-1)/(1-y(6))));
  g1(12,12)=1;
end
if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(95,3);
  v2(1,1)=1;
  v2(1,2)=217;
  v2(1,3)=T236;
  v2(2,1)=1;
  v2(2,2)=309;
  v2(2,3)=(-((-1)/(y(10)*y(10))));
  v2(3,1)=1;
  v2(3,2)=221;
  v2(3,3)=  v2(2,3);
  v2(4,1)=2;
  v2(4,2)=167;
  v2(4,3)=1;
  v2(5,1)=2;
  v2(5,2)=123;
  v2(5,3)=  v2(4,3);
  v2(6,1)=2;
  v2(6,2)=185;
  v2(6,3)=1;
  v2(7,1)=2;
  v2(7,2)=9;
  v2(7,3)=  v2(6,3);
  v2(8,1)=2;
  v2(8,2)=217;
  v2(8,3)=T236;
  v2(9,1)=2;
  v2(9,2)=309;
  v2(9,3)=(-((-1)/(y(10)*y(10))));
  v2(10,1)=2;
  v2(10,2)=221;
  v2(10,3)=  v2(9,3);
  v2(11,1)=3;
  v2(11,2)=374;
  v2(11,3)=(-(params(1)*T46*(-(1+y(19)-params(2)))/((1-y(17))*(1-y(17)))));
  v2(12,1)=3;
  v2(12,2)=132;
  v2(12,3)=  v2(11,3);
  v2(13,1)=3;
  v2(13,2)=385;
  v2(13,3)=(-(params(1)*T46*(-((1+y(19)-params(2))*(1-y(6))*((-(1-y(17)))-(1-y(17)))))/((1-y(17))*(1-y(17))*(1-y(17))*(1-y(17)))));
  v2(14,1)=3;
  v2(14,2)=167;
  v2(14,3)=(-(params(1)*T142*T174));
  v2(15,1)=3;
  v2(15,2)=123;
  v2(15,3)=  v2(14,3);
  v2(16,1)=3;
  v2(16,2)=178;
  v2(16,3)=(-(params(1)*T170*T174));
  v2(17,1)=3;
  v2(17,2)=376;
  v2(17,3)=  v2(16,3);
  v2(18,1)=3;
  v2(18,2)=397;
  v2(18,3)=(-(params(1)*T142*T185));
  v2(19,1)=3;
  v2(19,2)=133;
  v2(19,3)=  v2(18,3);
  v2(20,1)=3;
  v2(20,2)=408;
  v2(20,3)=(-(params(1)*T170*T185));
  v2(21,1)=3;
  v2(21,2)=386;
  v2(21,3)=  v2(20,3);
  v2(22,1)=3;
  v2(22,2)=399;
  v2(22,3)=(-(params(1)*T42*(-exp(params(5)))/(exp(params(5))*y(18)*exp(params(5))*y(18))));
  v2(23,1)=3;
  v2(23,2)=179;
  v2(23,3)=  v2(22,3);
  v2(24,1)=3;
  v2(24,2)=409;
  v2(24,3)=(-(params(1)*T42*(-((-(y(8)*exp(params(5))))*(exp(params(5))*exp(params(5))*y(18)+exp(params(5))*exp(params(5))*y(18))))/(exp(params(5))*y(18)*exp(params(5))*y(18)*exp(params(5))*y(18)*exp(params(5))*y(18))));
  v2(25,1)=3;
  v2(25,2)=420;
  v2(25,3)=(-(params(1)*T46*(-1)/(1-y(17))));
  v2(26,1)=3;
  v2(26,2)=134;
  v2(26,3)=  v2(25,3);
  v2(27,1)=3;
  v2(27,2)=431;
  v2(27,3)=(-(params(1)*T46*(1-y(6))/((1-y(17))*(1-y(17)))));
  v2(28,1)=3;
  v2(28,2)=387;
  v2(28,3)=  v2(27,3);
  v2(29,1)=3;
  v2(29,2)=422;
  v2(29,3)=(-(params(1)*T174*(1-y(6))/(1-y(17))));
  v2(30,1)=3;
  v2(30,2)=180;
  v2(30,3)=  v2(29,3);
  v2(31,1)=3;
  v2(31,2)=432;
  v2(31,3)=(-(params(1)*T185*(1-y(6))/(1-y(17))));
  v2(32,1)=3;
  v2(32,2)=410;
  v2(32,3)=  v2(31,3);
  v2(33,1)=4;
  v2(33,2)=361;
  v2(33,3)=(-((-((-(params(1)*(1-y(6))*y(10)*y(8)*y(20)*exp(y(21)-params(8))))*(T59*y(20)*exp(y(21)-params(8))+T59*y(20)*exp(y(21)-params(8)))))/(T120*T120)));
  v2(34,1)=4;
  v2(34,2)=131;
  v2(34,3)=(-((-(y(20)*exp(y(21)-params(8))*params(1)*(-(y(10)*y(8)))))/T120));
  v2(35,1)=4;
  v2(35,2)=351;
  v2(35,3)=  v2(34,3);
  v2(36,1)=4;
  v2(36,2)=177;
  v2(36,3)=(-((-(y(20)*exp(y(21)-params(8))*params(1)*y(10)*(1-y(6))))/T120));
  v2(37,1)=4;
  v2(37,2)=353;
  v2(37,3)=  v2(36,3);
  v2(38,1)=4;
  v2(38,2)=167;
  v2(38,3)=(-(params(1)*(-y(10))/T59));
  v2(39,1)=4;
  v2(39,2)=123;
  v2(39,3)=  v2(38,3);
  v2(40,1)=4;
  v2(40,2)=223;
  v2(40,3)=(-((-(y(20)*exp(y(21)-params(8))*params(1)*y(8)*(1-y(6))))/T120));
  v2(41,1)=4;
  v2(41,2)=355;
  v2(41,3)=  v2(40,3);
  v2(42,1)=4;
  v2(42,2)=213;
  v2(42,3)=(-(params(1)*(-y(8))/T59));
  v2(43,1)=4;
  v2(43,2)=125;
  v2(43,3)=  v2(42,3);
  v2(44,1)=4;
  v2(44,2)=215;
  v2(44,3)=(-(params(1)*(1-y(6))/T59));
  v2(45,1)=4;
  v2(45,2)=171;
  v2(45,3)=  v2(44,3);
  v2(46,1)=4;
  v2(46,2)=453;
  v2(46,3)=(-((T120*(-(params(1)*(1-y(6))*y(10)*y(8)*exp(y(21)-params(8))))-(-(params(1)*(1-y(6))*y(10)*y(8)*y(16)*exp(y(21)-params(8))))*(T59*y(20)*exp(y(21)-params(8))+T59*y(20)*exp(y(21)-params(8))))/(T120*T120)));
  v2(47,1)=4;
  v2(47,2)=365;
  v2(47,3)=  v2(46,3);
  v2(48,1)=4;
  v2(48,2)=443;
  v2(48,3)=(-((-(params(1)*(-(y(10)*y(8)))*y(16)*exp(y(21)-params(8))))/T120));
  v2(49,1)=4;
  v2(49,2)=135;
  v2(49,3)=  v2(48,3);
  v2(50,1)=4;
  v2(50,2)=445;
  v2(50,3)=(-((-(params(1)*y(10)*(1-y(6))*y(16)*exp(y(21)-params(8))))/T120));
  v2(51,1)=4;
  v2(51,2)=181;
  v2(51,3)=  v2(50,3);
  v2(52,1)=4;
  v2(52,2)=447;
  v2(52,3)=(-((-(params(1)*y(8)*(1-y(6))*y(16)*exp(y(21)-params(8))))/T120));
  v2(53,1)=4;
  v2(53,2)=227;
  v2(53,3)=  v2(52,3);
  v2(54,1)=4;
  v2(54,2)=457;
  v2(54,3)=(-((-((-(params(1)*(1-y(6))*y(10)*y(8)*y(16)*exp(y(21)-params(8))))*(T59*y(16)*exp(y(21)-params(8))+T59*y(16)*exp(y(21)-params(8)))))/(T120*T120)));
  v2(55,1)=4;
  v2(55,2)=476;
  v2(55,3)=(-(((-(params(1)*(1-y(6))*y(10)*y(8)*y(20)*exp(y(21)-params(8))))*T120-(-(params(1)*(1-y(6))*y(10)*y(8)*T59))*(T59*y(20)*exp(y(21)-params(8))+T59*y(20)*exp(y(21)-params(8))))/(T120*T120)));
  v2(56,1)=4;
  v2(56,2)=366;
  v2(56,3)=  v2(55,3);
  v2(57,1)=4;
  v2(57,2)=466;
  v2(57,3)=(-((-(T59*params(1)*(-(y(10)*y(8)))))/T120));
  v2(58,1)=4;
  v2(58,2)=136;
  v2(58,3)=  v2(57,3);
  v2(59,1)=4;
  v2(59,2)=468;
  v2(59,3)=(-((-(T59*params(1)*y(10)*(1-y(6))))/T120));
  v2(60,1)=4;
  v2(60,2)=182;
  v2(60,3)=  v2(59,3);
  v2(61,1)=4;
  v2(61,2)=470;
  v2(61,3)=(-((-(T59*params(1)*y(8)*(1-y(6))))/T120));
  v2(62,1)=4;
  v2(62,2)=228;
  v2(62,3)=  v2(61,3);
  v2(63,1)=4;
  v2(63,2)=480;
  v2(63,3)=(-((T120*(-(params(1)*(1-y(6))*y(10)*y(8)*y(16)*exp(y(21)-params(8))))-(-(params(1)*(1-y(6))*y(10)*y(8)*T59))*(T59*y(16)*exp(y(21)-params(8))+T59*y(16)*exp(y(21)-params(8))))/(T120*T120)));
  v2(64,1)=4;
  v2(64,2)=458;
  v2(64,3)=  v2(63,3);
  v2(65,1)=4;
  v2(65,2)=481;
  v2(65,3)=(-((T120*(-(params(1)*(1-y(6))*y(10)*y(8)*T59))-(-(params(1)*(1-y(6))*y(10)*y(8)*T59))*(T120+T120))/(T120*T120)));
  v2(66,1)=5;
  v2(66,2)=1;
  v2(66,3)=(-(T125*T129+T77*params(3)*getPowerDeriv(y(1),params(4)-1,2)+T125*T129+T66*(T128*params(3)*getPowerDeriv(y(1),params(4),2)+T127*T384)));
  v2(67,1)=5;
  v2(67,2)=116;
  v2(67,3)=(-(T125*T153+T66*T152*T384));
  v2(68,1)=5;
  v2(68,2)=6;
  v2(68,3)=  v2(67,3);
  v2(69,1)=5;
  v2(69,2)=121;
  v2(69,3)=(-(T66*T404));
  v2(70,1)=5;
  v2(70,2)=277;
  v2(70,3)=(-(T125*T209+T66*T208*T384));
  v2(71,1)=5;
  v2(71,2)=13;
  v2(71,3)=  v2(70,3);
  v2(72,1)=5;
  v2(72,2)=282;
  v2(72,3)=(-(T66*T417));
  v2(73,1)=5;
  v2(73,2)=128;
  v2(73,3)=  v2(72,3);
  v2(74,1)=5;
  v2(74,2)=289;
  v2(74,3)=(-(T66*T426));
  v2(75,1)=6;
  v2(75,2)=1;
  v2(75,3)=(-(T82*(T128*params(3)*getPowerDeriv(y(1),params(4),2)+T127*T384)));
  v2(76,1)=6;
  v2(76,2)=116;
  v2(76,3)=(-(T82*T152*T384+T129*T158));
  v2(77,1)=6;
  v2(77,2)=6;
  v2(77,3)=  v2(76,3);
  v2(78,1)=6;
  v2(78,2)=121;
  v2(78,3)=(-(T153*T158+T82*T404+T153*T158+T77*(1-params(3))*y(13)*y(13)*y(13)*getPowerDeriv(y(6)*y(13),params(4)-1,2)));
  v2(79,1)=6;
  v2(79,2)=277;
  v2(79,3)=(-(T82*T208*T384+T129*T215));
  v2(80,1)=6;
  v2(80,2)=13;
  v2(80,3)=  v2(79,3);
  v2(81,1)=6;
  v2(81,2)=282;
  v2(81,3)=(-(T158*T209+T82*T417+T153*T215+T77*((1-params(3))*y(13)*T156+(1-params(3))*y(13)*(T156+y(6)*y(13)*getPowerDeriv(y(6)*y(13),params(4)-1,2)))));
  v2(82,1)=6;
  v2(82,2)=128;
  v2(82,3)=  v2(81,3);
  v2(83,1)=6;
  v2(83,2)=289;
  v2(83,3)=(-(T209*T215+T82*T426+T209*T215+T77*((1-params(3))*y(6)*T156+(1-params(3))*y(6)*T156+(1-params(3))*y(13)*y(6)*y(6)*getPowerDeriv(y(6)*y(13),params(4)-1,2))));
  v2(84,1)=9;
  v2(84,2)=337;
  v2(84,3)=(-exp(y(15)));
  v2(85,1)=11;
  v2(85,2)=1;
  v2(85,3)=(-(T137*params(3)*getPowerDeriv(y(1),params(4),2)+T127*T477));
  v2(86,1)=11;
  v2(86,2)=116;
  v2(86,3)=(-(T152*T477));
  v2(87,1)=11;
  v2(87,2)=6;
  v2(87,3)=  v2(86,3);
  v2(88,1)=11;
  v2(88,2)=121;
  v2(88,3)=(-(T152*T152*getPowerDeriv(T74,T75,2)+T137*(1-params(3))*y(13)*y(13)*getPowerDeriv(y(6)*y(13),params(4),2)));
  v2(89,1)=11;
  v2(89,2)=277;
  v2(89,3)=(-(T208*T477));
  v2(90,1)=11;
  v2(90,2)=13;
  v2(90,3)=  v2(89,3);
  v2(91,1)=11;
  v2(91,2)=282;
  v2(91,3)=(-(T208*T152*getPowerDeriv(T74,T75,2)+T137*(1-params(3))*(T150+y(6)*y(13)*getPowerDeriv(y(6)*y(13),params(4),2))));
  v2(92,1)=11;
  v2(92,2)=128;
  v2(92,3)=  v2(91,3);
  v2(93,1)=11;
  v2(93,2)=289;
  v2(93,3)=(-(T208*T208*getPowerDeriv(T74,T75,2)+T137*(1-params(3))*y(6)*y(6)*getPowerDeriv(y(6)*y(13),params(4),2)));
  v2(94,1)=12;
  v2(94,2)=73;
  v2(94,3)=(-((-1)/(y(4)*y(4))));
  v2(95,1)=12;
  v2(95,2)=121;
  v2(95,3)=(-(params(6)*(-1)/((1-y(6))*(1-y(6)))));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),12,529);
end
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],12,12167);
end
end