%% DRP Code for Aron and Charlie
%1/18/24
%% Start of code
% Example usage
clear;clc;clear all 
%Start timer (efficiency measurement)
tic
%Teams are in order as follows, Note that the corresponding order does not
%effect rank. J
%"FSU";"Miami";"Michigan";"Penn State";"Tennessee"; "Missouri";
%;"Mississippi";"Georgia";"Duke";"UNC";"USC";"Oregon";"Ohio"
W = [9; 6; 9; 8; 7; 7; 8; 9; 6; 7; 7; 8; 9]; % Number of wins for each team
L = [0;3;0;1;2;2;1;0;3;2;3;1;0];   % Number of losses for each team
M= [22.6;8.5;34;24.9;16.3;6.4;9.6;21.8;6.9;11.3;11;10.1;21.4];  %Margin of victory
%Data pulled from online (Aron cite?)

nTeams = length(W); % Number of teams
% Colley matrix
A = eye(nTeams) * 2 + diag(-ones(nTeams-1,1), 1) + diag(-ones(nTeams-1,1), -1);

% Diagonal adjustment
D = diag(W + L);
A = A + D;
% Right-hand side vector, Better ranking vector
b = 1 + 0.5 * ((1+(M/100)).*W - L);
% Old Colleys
%bc = 1 + 0.5 * (W - L);
%colleyrank=A\bc;

% Solve the linear system (Ax=b) by taking the inverse of A, We can talk
% about inverses of matricies next meeting if you guys would like
ranking = A \ b;
%Difference=ranking-colleyrank

%Display Team names
Teams=["FSU";"Miami";"Michigan";"Penn State";"Tennessee"; "Missouri";
;"Mississippi (Ole Miss)";"Georgia";"Duke";"UNC";"USC";"Oregon";"Ohio State"];
%Display corresponding computations (rankings) for each team
for i=1:length(W) 
disp(Teams(i));
disp(ranking(i));
end
%End timer

toc
