function tau_P = q2PropTime_dP(h)

MP = q2RK4M(6,2000,h,0.001);
i=1;tau_P=0;k = sqrt(5./6.*(1+(h.^2)./36));

while MP(i+1,5)>=0
    if h==0
        f = @(r) 1./sqrt(k.^2-1+1./r-h.^2./r.^2+h.^2./r.^3);
        tau_P = integral(f,0,6);
    else
        tau_P=tau_P+MP(i,5).^2./h.*(MP(i+1,2)-MP(i,2));
    end
    i=i+1;
end

end