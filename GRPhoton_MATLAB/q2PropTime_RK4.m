function RK4 = q2PropTime_RK4(r0,h,H)

k = sqrt(5./6.*(1+(h.^2)./36));
f = @(r,t) ((k.^2-1)+(1./r)-(h.^2./r.^2).*(1-1./r)).^(-0.5); 
M = q2RK4M(r0,4*3.14,h,H);
A = M(:,5);
R = (A(~isnan(A)));
RK4 = zeros(length(R),3); % storage matrix
RK4(1,1) = 0; % zeroth iteration
RK4(:,2) = R(:)'; % r range
RK4(1,3) = 0; % t0 = 0
n = length(RK4); % #iterations

for i = 1:n-1
    RK4(i+1,1) = i;
    k1 = feval(f,RK4(i,2),RK4(i,3));
    k2 = feval(f,(RK4(i,2)+1/2*h),(RK4(i,3)+1/2*h*k1));
    k3 = feval(f,(RK4(i,2)+1/2*h),(RK4(i,3)+1/2*h*k2));
    k4 = feval(f,(RK4(i,2)+h),(RK4(i,3)+h*k3));
    RK4(i+1,3) = RK4(i,3) + 1/6*h*[k1 + 2*k2 + 2*k3 + k4];
end

end