h = 1.6:0.01:2.0; %only need to test values in this range based off orbit plots
lim = 1; %limiting radius for capture
H = zeros(length(h),1); %storage matrix. Entry = 0 if captured, h if not.
for i=1:length(h)
    M = q2RK4M(6,2000,h(i),0.001); %2000rad chosen for orbital period as significantly longer than infall times seen
    if M(length(M),5) > lim %5th column contains radii
        H(i)=h(i);
    end
end

j=1; %counter for elements of H
while H(j) == 0 
    j=j+1;
end
fprintf('Massive particles are captured for values of h between 0 and %1.2f. \n',H(j))
