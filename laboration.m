%Laboration TMME12
%% Indata
m1= 1;
m2 = 5;
g=9.82;
l=1;
h=l/3;
theta_0=90*pi/180;
theta_dot_0=0;
r_0=l/3;
r_dot_0=0;
t_max=10;
%% Diffekv
options = odeset('RelTol',1e-6,'AbsTol',1e-10);
[t_vek,Y]=ode45(@meksys_ekv,[0 t_max],[theta_0 0 r_0 0],options,m1,m2,l,g);
theta=Y(:,1);
theta_dot=Y(:,2);
r=Y(:,3);
r_dot=Y(:,4);
%% Plot Uppgift 3
figure(1)
subplot(2,1,1);
plot(t_vek, theta*180/pi)
subplot(2,1,2)
plot(t_vek,r);
figure(2)
plot(r.*sin(theta),-r.*cos(theta))
%% Plot Uppgift 5
S=m2*(g+(r.*theta_dot.^2-(m2*g)/m1 +cos(theta)*g)/(1+m1/m2));
figure(3)
plot(t_vek,S)
%% Plot Uppgift 4
delta_T = m1*((r.^2.*theta_dot.^2)+(r_dot.^2))/2+m2*(r_dot.^2)/2;
delta_Vg= m2*g*-((2/3)*l-r)-m1*g*cos(theta).*r;
E=abs(delta_T+delta_Vg);
figure(4)
plot(t_vek,E)
axis([0 10 14 18]);
%% Animation
t_scale=3;
anim_y1_2014(t_vek,r,theta,l,h,t_scale)
