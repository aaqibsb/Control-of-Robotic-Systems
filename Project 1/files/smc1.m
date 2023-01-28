function output = smc1(e1, e2, e_int1, e_int2, e_dot1, e_dot2, delay)

    C1 = 10;
    C2 = 1000;
    Kr = 10;
    Kp = 10;
    Ki = 10;
    Kd = 10;
    
    s1 = (C1 * e_int1) + (C2 * e1) + e_dot1;
    s2 = (C1 * e_int2) + (C2 * e2) + e_dot2;
    
    if (abs(s1) > delay)    
        sat_s1 = sign(s1);
    else
        sat_s1 = s1/delay;
    end
    
    if (abs(s2) > delay)    
        sat_s2 = sign(s2);
    else
        sat_s2 = s2/delay;
    end
    
    output(1,1) = -(Kr + (Kp * e1) + (Ki * e_int1) + (Kd * e_dot1)) * sat_s1;
    output(2,1) = -(Kr + (Kp * e2) + (Ki * e_int2) + (Kd * e_dot2)) * sat_s2;
end