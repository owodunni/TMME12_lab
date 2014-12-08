function ydot=meksys_ekv(t,y,m1,m2,l,g)

theta     = y(1);
theta_dot = y(2);
r         = y(3);
r_dot     = y(4);

A = [m1+m2 0 ;
     0    r];

b = [m1*r*theta_dot^2-m2*g+m1*cos(theta)*g ;
     -sin(theta)*g-2*r_dot*theta_dot];
 
 z=A\b;
 
 
 
 ydot   = zeros(4,1);
 ydot(1)= theta_dot;
 ydot(2)= z(2);         %theta_dotdot
 ydot(3)= r_dot;
 ydot(4)= z(1);         %r_dotdot
