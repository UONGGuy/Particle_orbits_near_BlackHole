%Proper time tests
clear;
h=1.77;
%% phi method
MP = q2RK4M(6,2000,h,0.001);
i=1;tau_P=0;k = sqrt(5./6.*(1+(h.^2)./36));

while MP(i+1,5)>=0
    if h==0
        f = @(r) 1./sqrt(k.^2-1+1./r-h.^2./r.^2+h.^2./r.^3);
        tau_P = integral(f,0,6);
        %tau_P=tau_P+(MP(i+1,5)-MP(i,5))./(k+1./MP(i,5)-h.^2./MP(i,5).^2+h.^2./MP(i,5).^3);
    else
        tau_P=tau_P+MP(i,5).^2./h.*(MP(i+1,2)-MP(i,2));
    end
    i=i+1;
end

%% dr method
%tau_R2 Re part appears to agree for 0.2<h<1.78,H=0.001 
%don't know why am getting Im part
%need smaller H to deal with smaller h

MR = q2RK4M(6,2000,h,0.001);
i=1;tau_R=0;
k = sqrt(5./6.*(1+(h.^2)./36));
tau_R2=0;

f = @(r) 1./sqrt(k.^2-1+1./r-h.^2./r.^2+h.^2./r.^3);
tau_R = integral(f,0,6);

while MR(i+1,5)>0
    tau_R2=tau_R2+(MR(i,5)-MR(i+1,5))./sqrt(k.^2-1+1./MR(i,5)-h.^2./(MR(i,5).^2)+h.^2./(MR(i,5).^3));
    i=i+1;
end

tau_R2_real = real(tau_R2);

%% RK4 using dr

r0=6; H=0.001;
RK4 = q2RK4PropTime(r0,h,H);
tau_RK4 =RK4(end,3);
tau_RK4 = abs(tau_RK4);
