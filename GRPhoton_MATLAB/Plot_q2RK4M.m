%For general look at many values of h
f1 = figure;
C = {'#0072BD','#D95319','k','#4DBEEE','#77AC30','m','#A2142F','r','c','#7E2F8E','#EDB120'};
polarplot([0 0], [6 0],'color',C{1});
pax = gca; pax.ThetaAxisUnits = 'radians';rlim([0 8]);
hold on
for i=1:10
    test_A = q2RK4M(6,2.*3.14,i./5,0.01);
    theta_A = test_A(:,2);
    r_A = test_A(:,5); 
    polarplot(theta_A,r_A,'color',C{i+1});    
    pax = gca; pax.ThetaAxisUnits = 'radians';rlim([0 8]);
end
title('Plot of particle orbits for different values of h over 2\pi radians');
legend('h = 0','h = 0.2','h = 0.4','h = 0.6','h = 0.8','h = 1.0','h = 1.2','h = 1.4','h = 1.6','h = 1.8','h = 2.0');

%Inspecting h=1.8 with greater period P=2000
f2 = figure;
test_B = q2RK4M(6,2000,1.8,0.01);
theta_B = test_B(:,2);
r_B = test_B(:,5); 
polarplot(theta_B,r_B,'color',C{10});    
pax = gca; pax.ThetaAxisUnits = 'radians';rlim([0 8]);
title('Plot of particle orbit over 2000 rad for h = 1.8')
legend('h = 1.8');

%Inspecting h=1.8 with greater period P=2000 and step size 0.001
f3 = figure;
test_C = q2RK4M(6,2000,1.8,0.001);
theta_C = test_C(:,2);
r_C = test_C(:,5); 
polarplot(theta_C,r_C,'color',C{10});    
pax = gca; pax.ThetaAxisUnits = 'radians';rlim([0 8]); pax.TitleFontSizeMultiplier = 0.8;
title({'Plot of particle orbit over 2000 rad for h = 1.8 with smaller step size 0.001'})
legend('h = 1.8');


%export graphs as .png
print(f1,'-dpng', 'C:\Users\UONG\Documents\MATLAB\CATAM\GRPhoton\q2orbitsplot.png', '-r600');
print(f2,'-dpng', 'C:\Users\UONG\Documents\MATLAB\CATAM\GRPhoton\q2anomaly.png', '-r600');
print(f3,'-dpng', 'C:\Users\UONG\Documents\MATLAB\CATAM\GRPhoton\q2anomalystep.png', '-r600');