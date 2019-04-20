% ELEC 4133 HW 1, #5B: Functions of Space and Time
% On screen animation if E(z,t) from t=0 to t=100ns in 0.25 increments
% using a for loop and contininuously plot E from 1 to 20 meters
% Scott Skrobel   2/4/19

%% Variables:
%  Em       Electric Field Amplitude [V/m] 
%  f        Frequency 100[MHz]
%  w        Angular frequency [rad/s]
%  B        Phase constant (Beta) [1/m]
%  t        time [ns]
%  z        Position

%% Startup 
clear ;           % clears all variables from the current workspace
close all;        % closes all open figures

%% Variables
Em = 5;
f = 100*10^(6); 
w = 2*pi*f;             
B = 2.0944;

%% define start and stop times (t)from 0 to 100 [ns]
start_time = 0;
stop_time = 100e-9;
dt = 0.25e-9;                  % step size diff element for time t
t = [start_time:dt:stop_time]; % compute all the values for time
dz = 0.01;                     % step size
z = [0:dz:20];                 % z vector
%% for loop to continiously plot E(z,t)
for i = [1:length(t)]
   E = Em*cos(w*t(i) - B*z);
   figure(1);
   plot(z,E);
   ylim([-6 6]);
   title(['plot' num2str(t(i))])  % update title
   grid on;
   pause(0.2);                    % pause the frame 
end
