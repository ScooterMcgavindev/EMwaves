% ELEC 4133 HW 1, #5: Functions of Space and Time
% Plots snapshots at 3 time intervals for the E-Field of a 100 [MHz] 
% propagating plane wave as a function of its distance z: [0,20] [m]
% Scott Skrobel   2/4/19

%% Variables:
%  eo       Permitivity of free space [F/m]
%  er       Permitivity [F/m]
%  muo      Permeability of free space [F/m]
%  mur      Permeability [F/m]
%  Em       Electric Field Amplitude [V/m] 
%  f        Frequency 100[MHz]
%  w        Angular frequency [rad/s]
%  B        Phase constant (Beta) [1/m]
%  T        Time Period [s]
%  lambda   Wavelength [m]
%  z        Position

%% Startup 
clear ;           % clears all variables from the current workspace
close all;        % closes all open figures

%% Initialize Variables
eo = 8.8542*10^(-12);
er = 1;
muo = 4*pi*10^(-7);
mur = 1;
Em = 5;
f = 100*10^(6); 
T = 1/f;
w = 2*pi*f;             
B = 2.0944;
lambda = 2*pi/B; 
N=100;
%T = [0 2.5e-9 5e-9]; 
dt = T/2;
dz = lambda/N;

%% Electric Field of a 100 [MHz] 
%  Ex(z,t) = Em*cos(wt - bz) [V/m]\
%  meshgrid transforms the domain specified by vectors z and t 
%    into arrays Z and T
%    The rows of the output array Z are copies of the vector z; 
%    columns of the output array T are copies of the vector T.
[z,t] = meshgrid(0:dz:20,0:dt:T); % Step size dz and dt
E = Em*cos(w.*t-B.*z);
figure(1)
for i = 1:3
    subplot(length(t(:,1)),1,i);
    plot(z, E(i,:),'r','linewidth',2);
    grid on;
    if i == 1;title('E as a function of Z, at time instat t =0');
    end
    
    if i == 2;title('E as a function of Z, at time instat t =T/2 = 2.5[ns]');
    end
    
    if i == 3;title('E as a function of Z, at time instat t =T = 5[ns]');
    end
    ylim([-6 6])
    xlabel('z[m]');
    ylabel('Ex(z,t)[V/m]');
end;