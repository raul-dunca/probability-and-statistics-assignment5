%mean([2,5,2,1],1)
%a) 
vec=[7,7,4,5,9,9,4,12,8,1,8,7,3,13,2,1,17,7,12,5,6,2,1,13,14,10,2,4,9,11,3,5,12,6,10,7];
sigma=5;
L=length(vec);
mx = mean(vec);
oneminusalpha=input('confidence level: ');


alpha=1-oneminusalpha;

%formula given in conf_invpdf just apply them
%whick function to use look at the notation T/N , etc
z1 = norminv(1 - alpha/2, 0, 1);
z2 = norminv(alpha/2, 0, 1); % z2 = -z1
ci1 = mx - sigma/sqrt(L) * z1;
ci2 = mx - sigma/sqrt(L) * z2;

fprintf('C.I. for the mean (sigma known): (%3.4f, %3.4f)\n', ci1, ci2);

%b)

%formula given in conf_invpdf just apply them + L-1 bcs the formula says
%n-1

s=std(vec);
t1 = tinv(1 - alpha/2,L-1);
t2 = tinv(alpha/2,L-1); 
ci1 = mx - s/sqrt(L) * t1;
ci2 = mx - s/sqrt(L) * t2;

fprintf('C.I. for the mean(sigma unknown): (%3.4f, %3.4f)\n', ci1, ci2);


%c)

s=var(vec);
%formula given in conf_invpdf just apply them + L-1 bcs the formula says
%n-1
t1 = chi2inv(1 - alpha/2, L-1);
t2 = chi2inv(alpha/2, L-1); 
ci1 = (L-1)*s / t1;
ci2 = (L-1)*s/  t2;

fprintf('C.I. for the mean(variance): (%3.4f, %3.4f)\n', ci1, ci2);
fprintf('C.I. for the mean(standar deviation): (%3.4f, %3.4f)\n', sqrt(ci1), sqrt(ci2));
