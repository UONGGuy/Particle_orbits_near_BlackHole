%Code to create table of proper times of in-fall
h=0:0.1:1.7;

Table = zeros(length(h),3);
Table(:,1)=h;

for i=1:length(h)
    Table(i,2) = q2PropTime_dr(h(i));
    Table(i,3) = q2PropTime_dP(h(i));
end

LTable = MLatex(Table,4);
