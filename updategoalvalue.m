
function [tot] = updategoalvalue(X,Y)
Diff = X-Y;
tot = norm(Diff,'fro').^2;