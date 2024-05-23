// 1st order Derivative

function yp = f(t,y)
	yp = t-y;
endfunction
t0 = 0;y0 = 1;
t = 0:0.1:1.5;
y = ode(y0,t0,t,f);
plot(t,y,'linewidth',5);

// 2nd order Derivative

function xp = f(t,x)
	xp(1) = x(2);
	xp(2) = -3*x(2)+10*x(1);
endfunction
t0 = 0;y0 = 1;yp0 = 3;
t = 3:0.1:5;
y = ode([y0;yp0],t0,t,f);
plot(t,y(1,:),'linewidth',5);