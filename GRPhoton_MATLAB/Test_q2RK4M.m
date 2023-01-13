function RK4 = Test_q2RK4M(r0,h)

f = @(phi,r,z) z; %for U_n
g = @(phi,r,z) 3./2.*u.^2-u+1./(2.*h.^2); %for Z_n
H = 0.01; %step size
RK4 = zeros(1+2.*3.14./H,5); % storage matrix
P = 0:H:2.*3.14;
RK4(:,2) = P(:)'; % phi range
RK4(1,1) = 0; %# zeroth iteration
RK4(1,3) = 1./r0; % U_0 
RK4(1,4) = 0; %Z_0
RK4(1,5) = r0;%R_0
n = length(RK4); % #iterations

for i = 1:n-1
    RK4(i+1,1) = i;
    k1 = feval(f,RK4(i,2),RK4(i,3),RK4(i,4));
    k2 = feval(f,RK4(i,2)+1/2*H,RK4(i,3)+1/2*H*k1,RK4(i,4)+1/2*H*k1);
    k3 = feval(f,RK4(i,2)+1/2*H,RK4(i,3)+1/2*H*k2,RK4(i,4)+1/2*H*k2);
    k4 = feval(f,RK4(i,2)+H,RK4(i,3)+H*k3,RK4(i,4)+H*k3);
    RK4(i+1,3) = RK4(i,3) + 1/6*H*(k1 + 2*k2 + 2*k3 + k4);
    j1 = feval(g,RK4(i,2),RK4(i,3),RK4(i,4));
    j2 = feval(g,RK4(i,2)+1/2*H,RK4(i,3)+1/2*H*j1,RK4(i,4)+1/2*H*j1);
    j3 = feval(g,RK4(i,2)+1/2*H,RK4(i,3)+1/2*H*j2,RK4(i,4)+1/2*H*j2);
    j4 = feval(g,RK4(i,2)+H,RK4(i,3)+H*j3,RK4(i,4)+H*j3);
    RK4(i+1,4) = RK4(i,4) + 1/6*H*(j1 + 2*j2 + 2*j3 + j4);
    RK4(i+1,5) = 1./(RK4(i+1,3));
end

end