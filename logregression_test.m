% Sample points
x = [0.05 0.25 2 6.75 16 31.25 54 87.75 128 182.25 250];
y = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0];

% The above function is of the form Y = Cn*ln(X)^n + Cn-1*ln(X)^(n-1)... C0
% Use polynomial regression to find Y based on ln(x)
tx = log(x);

% Polynomial Fit
p = polyfit(tx,y,4);

% The best fit function
% Y = Cn*X^n + Cn-1*X^(n-1)...+ C0
% Keep in mind the X = ln(x)... tx = ln(x)
funt_exp = p(1).*tx.^4 + p(2).*tx.^3 + p(3).*tx.^2 + p(4).*tx.^1 + p(5);

fprintf('%.5fln(x)^4 + %.5fln(x)^3 + %.5fln(x)^2 + %.5fln(x) + %.5f\n',p(1),p(2),p(3),p(4),p(5));

% Test
regress_funct = 0.00003.*log(x).^4 + 0.00215.*log(x).^3 + 0.00521.*log(x).^2 + 0.05207.*log(x) + 0.16538;

% Plot
plot(x,y)
hold on;
plot(x,regress_funct)