clear all;
x = [zeros(1,9) ones(1,6) zeros(1,9)];
h = x;
y1 = conv(x,h);
y2 = filter(h,1,x);
figure()
hold on;

subplot(4,1,1)
plot(x,"r"); 
title("impuls prostokatny");

subplot(4,1,2)
plot(y1,"b");
title("funkcja conv")

subplot(4,1,3)
plot(y2,"g");
title("funkcja filter")

m=length(x);
n=length(h);
X=[x,zeros(1,n)]; 
H=[h,zeros(1,m)]; 
for i=1:n+m-1
    Y(i)=0;
    for j=1:m
        if(i-j+1>0)
            Y(i)=Y(i)+X(j)*H(i-j+1);
        else
        end
    end
end

subplot(4,1,4)
plot(Y,"y");
title("algorytm splotowy")

fid = fopen('x_h_sign.txt','wt');
for k = 1:size(x,1)
    fprintf(fid,'%g\t',x(k,:));
    fprintf(fid,'\n');
end
for k = 1:size(h,1)
    fprintf(fid,'%g\t',h(k,:));
    fprintf(fid,'\n');
end
fclose(fid)
