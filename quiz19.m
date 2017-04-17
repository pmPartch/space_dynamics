%% week3 Concept Check 19 'MRP Addition and Subtraction

%question 3

sBN = [0.1;0.2;0.3];  % s'
sRN = [0.5;0.3;0.1];  % s

sBN2 = sBN'*sBN;      % s'^2
sRN2 = sRN'*sRN;      % s^2

sBR = ( (1-sBN2)*sRN - (1 - sRN2)*sBN + 2*cross(sRN,sBN)) / (1 + sBN2*sRN2 + 2*dot(sBN,sRN))

%this produces the followiing:
%     0.3800
%    -0.1144
%     0.0233

%% week 3 Concept Check 19 (alternative solution)

%now the grader does not like this answer....so I'll try to verify this 
%by converting the entire problem to DCM's

s = [0.1;0.2;0.3]; %sigma

sx = [0 -s(3) s(2);s(3) 0 -s(1);-s(2) s(1) 0];
s2 = s'*s;

BN = eye(3) + (8*sx*sx - 4*(1 - s2)*sx)/(1+s2)^2;

s = [0.5;0.3;0.1]; %sigma

sx = [0 -s(3) s(2);s(3) 0 -s(1);-s(2) s(1) 0];
s2 = s'*s;

RN = eye(3) + (8*sx*sx - 4*(1 - s2)*sx)/(1+s2)^2;

BR = BN*(RN'); % BN*RN' = BN*NR = BR

C = BR;

z = sqrt(trace(C) + 1);

sigma = [C(2,3)-C(3,2);C(3,1)-C(1,3);C(1,2)-C(2,1)]/(z*(z+2))

%this also produces the output (negative of first result):
%    -0.3800
%     0.1144
%    -0.0233

