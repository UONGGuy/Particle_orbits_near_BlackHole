function tau_R = q2PropTime_dr(h)

k = sqrt(5./6.*(1+(h.^2)./36));
f = @(r) 1./sqrt(k.^2-1+1./r-h.^2./r.^2+h.^2./r.^3);
tau_R = integral(f,0,6);

end