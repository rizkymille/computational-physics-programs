% Problem 8.1
% A = [9 4 2; 8 4 7; 1 3 8]
% 
% A =
% 
%      9     4     2
%      8     4     7
%      1     3     8
% 
% A'
% 
% ans =
% 
%      9     8     1
%      4     4     3
%      2     7     8
% 
% x = [2 9 5];
% y = [0 -4 8];
% z = [-9 -1 2];
% B = [x; y; z]
% 
% B =
% 
%      2     9     5
%      0    -4     8
%     -9    -1     2
% 
% C = A + B
% 
% C =
% 
%     11    13     7
%      8     0    15
%     -8     2    10
% 
% A = C - B
% 
% A =
% 
%      9     4     2
%      8     4     7
%      1     3     8
% 
% A*B
% 
% ans =
% 
%      0    63    81
%    -47    49    86
%    -70   -11    45
% 
% A.*B
% 
% ans =
% 
%     18    36    10
%      0   -16    56
%     -9    -3    16
% 
% D = [-5 -3 4; 8 2 9];
% A*D
% Error using  * 
% Incorrect dimensions for matrix multiplication. Check that the
% number of columns in the first matrix matches the number of
% rows in the second matrix. To perform elementwise
% multiplication, use '.*'.
% 
% Related documentation
%  
% D*A
% 
% ans =
% 
%    -65   -20     1
%     97    67   102
% 
% AI = inv(A)
% 
% AI =
% 
%    -0.1236    0.2921   -0.2247
%     0.6404   -0.7865    0.5281
%    -0.2247    0.2584   -0.0449
% 
% A*AI
% 
% ans =
% 
%     1.0000    0.0000    0.0000
%          0    1.0000   -0.0000
%          0   -0.0000    1.0000
% 
% I = eye(3)
% 
% I =
% 
%      1     0     0
%      0     1     0
%      0     0     1
% 
% P = [0 0 1; 0 1 0; 1 0 0]
% 
% P =
% 
%      0     0     1
%      0     1     0
%      1     0     0
% 
% PA = P*A
% 
% PA =
% 
%      1     3     8
%      8     4     7
%      9     4     2
% 
% AP = A * P
% 
% AP =
% 
%      2     4     9
%      7     4     8
%      8     3     1
% 
% Aug = [A I]
% 
% Aug =
% 
%      9     4     2     1     0     0
%      8     4     7     0     1     0
%      1     3     8     0     0     1
% 
% [n,m] = size(Aug)
% 
% n =
% 
%      3
% 
% 
% m =
% 
%      6



% Problem 8.2
% (maxdist-mindist).*rand(row,column) + mindist;
g = 9.81 % gravitasi
m = (80-60).*rand(3,1) + 60 % masa
k = (80-40).*rand(3,3) + 40 % konstanta pegas
x0 = (25-15).*rand(3,1) + 15 % panjang tali sebelum merenggang
x = k\(m*g) % hitung dengan left-division
x = inv(k)*m*g % hitung dnegan invers
x1 = x + x0 % hitung panjang totalnya sekarang