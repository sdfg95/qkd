function Dist = MaxAchDistance(L,K)
    for i = 1:length(L)
        if K(i) > 0
            continue;
        else
            dist_num = i - 1;
            break
        end
    end
    Dist = L(dist_num);
end