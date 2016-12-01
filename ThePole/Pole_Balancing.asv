%% Pole_Balancing
%   Jeong Ji Hoon
%   ST_ID : 2016010980

%% JEONG_JIHOON
%   @Knowblesse
%   Created on 2016-12-01
%   Last Modified on 2016-12-01

%% Initialization
clear; % close workspace
clear;
clc; % close command window (output window of Matlab)

%% Constants

Start_Pole_Angle = 0.1; % in rad
Start_Cart_Position = 2;

Mass_Cart = 1; % in kg
Mass_Pole = 10; % in kg. Assume the Density of the pole is uniform.

L = 6;  % Length of the Pole in m

Length_Cart = 5; % in m. Lenght and Height of the cart doesn't affect the result.
Height_Cart = 1; % Only Location of the Center Point of the Cart matters.

g = 9.81; % Gravity in m/s^2

%% Conditions
Track_Limit = 10; % in m
Time_Limit = 10000; % in sec
Pole_Failure_Angle = 12; % in rad
Ts = 0.02; % Time Step in second

%% Variables
Cart = Start_Cart_Position; % Location of the Cart's Center Point
vCart = 0; % Velocity of the Cart m/s
aCart = 0; % Acceleration of the Cart m/s^2

Pole = Start_Pole_Angle; % Location of the Pole. rad
vPole = 0; % Velocity of the Pole. rad/s
aPole = 0; % Acceleration of the Pole. rad/s^2

F = 0; % Force Applied to the Cart. N

%% Initialize the Screen
figure(1);
clf;

% Draw Cart
rectangle('Position',[-Start_Cart_Position - (Length_Cart/2), -(Height_Cart/2), Length_Cart, Height_Cart],'FaceColor','k');

% Draw Pole
line([Cart, Cart + (L * sin(Start_Pole_Angle))],[0,L * cos(Start_Pole_Angle)],'Color','r', 'LineWidth',3);

axis([-10, 10, -1, 19]);

%% Run
for t = 1 : Time_Limit
    
    %% 이곳에 Pole, vPole, Cart, vCart 값들을 토대로 F를 계산하는 함수를 넣습니다.
     % 예
     % F = mayTheForceBWithU(Pole,vPole,Cart,vCart);  
    
    new_aPole = (     g*sin(Pole) + cos(Pole)*(  (-F -Mass_Pole*L/2*vPole^2*sin(Pole))/(Mass_Cart + Mass_Pole)  )     )...
        / ( L/2 * (4/3 - (Mass_Pole*(cos(Pole))^2) / (Mass_Cart + Mass_Pole) ));
    new_aCart = (F + Mass_Pole*L/2 * ( vPole^2*sin(Pole) - aPole*cos(Pole) )) / (Mass_Cart+Mass_Pole);
    
    aPole = new_aPole;
    aCart = new_aCart;
    
    vPole = vPole + Ts * aPole;
    vCart = vCart + Ts * aCart;
    
    Pole = Pole + Ts * vPole;
    Cart = Cart + Ts * vCart;
    
    clf;
    
    % Draw Cart
    rectangle('Position',[Cart - (Length_Cart/2), -(Height_Cart/2), Length_Cart, Height_Cart],'FaceColor','k');

    % Draw Pole
    line([Cart, Cart + L * sin(Pole)],[0,L * cos(Pole)],'Color','r', 'LineWidth',3);
    axis([-10, 10, -1, 19]);

    drawnow;
    
    if ( Pole >= pi/2 || Pole <= -pi/2 ) % Fall on ground
        disp('Pole has fallen X_X');
        break;
    end
    pause(Ts);
end
    