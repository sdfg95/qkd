function value = interpolate_point(x_point,x,y)
    for i = 1:length(y)
        if x_point < x(i)
            continue;
        else    
            A = (x(i+1) - x_point)/(x_point - x(i));
            value = (y(i+1) + A*y(i))/(A+1);
        end
    end    
end