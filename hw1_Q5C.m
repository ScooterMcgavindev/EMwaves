% ELEC 4133 HW 1, #5C: Functions of Space and Time
% Turn the on screen animation into a cideo file
% campure the frames from part C and save them to an AVI file
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
t = [start_time:dt:stop_time]; % compute all the values for time
%% video writer
v = VideoWriter('HW1_extracredit.avi') % setup a video writer object
open(v)
for i = [1:length(t)]
   E = Em*cos(w*t(i) - B*z);
   figure(1);
   plot(z,E);
   ylim([-6 6]);
   title(['plot' num2str(t(i))])
   grid on;
   frame = getframe;
   writeVideo(v,frame);
   pause(0.2);
end
close(v)