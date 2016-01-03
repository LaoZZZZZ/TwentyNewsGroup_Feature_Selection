function y = SimAnn_Accept_Worse_Sol(delta, t)
% delta = new obj val - old obj val
% min problem (pValue)

%const_K = 1.38 * 10^(-23);     % J/K
const_K = 8.617 * 10^(-5);      % eV/K

x = -delta / (const_K * t);
if x > 0 
    accept_prob = exp(x);
else
    accept_prob = 1;
end
u = rand();
if u < accept_prob
    y = true;
else
    y = false;
end
end