X1=[22.4,21.7,24.5,23.4,21.6,23.3,22.4,21.6,24.8,20.0];
X2=[17.7,14.8,19.6,19.6,12.1,14.8,15.4,12.6,14.0,12.2];

%a)
oneminusalpha=input('confidence level: ');


alpha=1-oneminusalpha;

%NOTE: s = std , s^2=var

m1x=mean(X1);
m2x=mean(X2);
m=m1x-m2x;

n1=length(X1);
n2=length(X2);

s1=var(X1);
s2=var(X2);

sp = sqrt(((n1-1)*s1 + (n2-1)*s2)/(n1+n2-2));
t1 = tinv(1 - alpha/2, n1+n2-2);
t2 = tinv(alpha/2, n1+n2-2); 
ci1 = m - t1 * sp * sqrt(1/n1+1/n2);
ci2 = m - t2 * sp * sqrt(1/n1+1/n2);
fprintf('C.I. for the difference of means (sigma1 == sigma2): (%3.4f, %3.4f)\n', ci1, ci2);

%b)





sqr = sqrt(s1/(n1)+s2/(n2));

c=(s1/(n1))/(s1/n1 +s2/n2);

n=((n1-1)*(n2-1))/(c^2*(n2-1)+((1-c)^2)*(n1-1));


t1 = tinv(1 - alpha/2,n);
t2 = tinv(alpha/2, n); 
ci1 = m - t1 * sqr;
ci2 = m - t2 * sqr;
fprintf('C.I. for the difference of means (sigma1 =! sigma2): (%3.4f, %3.4f)\n', ci1, ci2);

%c)

t1 = finv(1 - alpha/2,n1-1,n2-1);
t2 = finv(alpha/2, n1-1,n2-1); 
ci1 = (1/t1)*(s1/s2);
ci2 = (1/t2) * (s1/s2);
fprintf('C.I. for the ratio of the variances.: (%3.4f, %3.4f)\n', ci1, ci2);