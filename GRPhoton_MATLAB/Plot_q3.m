%%
%Plot of particle orbit potential energy

h=2;
K = @(r)((1-1./r).*(1+(h.^2)./r.^2))-1;
V_eff = @(h) -1./r+h.^2./r.^2.*(1-1./r);
dV_eff = @(h) 1./r.^2-2.*h.^2./r.^2+2.*h.^2./r.^4;
f1 = figure;
hold on
fplot(V_eff,[0 6]);
fplot(K,[0 6]);
%f2  = figure;
%fplot(dV_eff,[0 6.2]);

%% Test V_eff plots w diff h

V_eff = @(h) -1./r+h.^2./r.^2.*(1-1./r);
h=0:0.2:2;

for i=1:10