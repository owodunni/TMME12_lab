function anim_y1_2014 (t,r,theta,l,h,t_scale)
%Animation routine for computer assignment in Mekanik Y, del 1, 2014.
%Input:
%Vector r and theta holding the values of "r"  and "theta" for the instants of time
%given in the vector t (output from ode45).
%l is the length of the string.
%h is the distance between the pegs.
%t_scale determines the time scale of the animation. t_scale=1 implies that
%the animation is done without changing the time scale. t_scale=10
%implies that the animation will take 10 times *longer*.






%Clear current figure:
clf


s=l-r-h;

%Calculate coordinates of point 1:
y1=-s;
x1=0*y1;

%Calculate coordinates of point 2:
x2=h+r.*sin(theta);
y2=-r.*cos(theta);

%Define plotting area of appropriate size:
h1=axes;
set(h1,'XLim',[-l h+max(r)+0.1*l],'YLim',[ -l l], ...
'NextPlot','add');
axis equal



%Plot for t=0:
h1=plot([0 0 h h+r(1)*sin(theta(1))],[-s(1) 0 0 -r(1)*cos(theta(1))]);
set(h1,'erasemode','xor','LineWidth',1.5,'Color','black');

 h2=plot(x2(1),y2(1),'.');
set(h2,'erasemode','none','Color','red')

h7=text(-0.9*l,0.9*l,['Tid: ' num2str(t(1),'%4.1f')]);
set(h7,'erasemode','xor')



t0=clock;
for i=2:length(t)

  
  set(h1,'XData',[0 0 h h+r(i)*sin(theta(i))], ...
      'YData',[-s(i) 0 0 -r(i)*cos(theta(i))]);
  
  set(h2,'XData',x2(i),'YData',y2(i));
  
  set(h7,'string',['Tid: ' num2str(t(i),'%4.1f')]);

  
  
  while etime(clock,t0)<t_scale*t(i),end %Wait to plot until t(i) seconds have
                                 %elapsed since start of animation. 
  drawnow
end

