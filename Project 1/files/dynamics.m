function output = dynamics(theta1, theta_dot1, theta_dot_dot1, theta2, theta_dot2, theta_dot_dot2, error1, error_dot1, error2, error_dot2)
    
    p1 = 3.16;
    p2 = 0.106;
    p3 = 0.173;
    m1 = 10.6;
    m2 = 4.85;
    l1 = 0.36;
    l2 = 0.24;
    K1 = 1;
    K2 = 10;
    g = 9.8;
    
    C1 = 10   * eye(2);
    C2 = 1000 * eye(2);
    
    M11 = p1 + 2 * p3 * cos(theta2);
    M12 = p2 + p3 * cos(theta2);
    M21 = p1 + 2 * p3 * cos(theta2);
    M22 = p2;

    B11 =  - theta_dot2 * p3 * sin(theta2);
    B12 =  -(theta_dot1 + theta_dot2) * p3 * sin(theta2);
    B21 =    theta_dot1 * p3 * sin(theta2);
    B22 =    0;
    
    f11 = K1 * theta_dot1 + K2 * sign(theta_dot1);
    f21 = K1 * theta_dot2 + K2 * sign(theta_dot2);

    g11 = (m1 + m2) * g * l1 * cos(theta1) + m2 * g * l2 * cos(theta1 + theta2);
    g21 = m2 * g * l2 * cos(theta1 + theta2);

    T1 = M11 * theta_dot_dot1 + M12 * theta_dot_dot2 + B11 * theta_dot1 + B12 * theta_dot2 + f11 + g11;
    T2 = M21 * theta_dot_dot1 + M22 * theta_dot_dot2 + B21 * theta_dot1 + B22 * theta_dot2 + f21 + g21;
    
    output(1,1) = -(C1(1,1) * error1) - (C2(1,1) * error_dot1) - T1 + theta_dot_dot1;
    output(2,1) = -(C1(2,2) * error2) - (C2(2,2) * error_dot2) - T2 + theta_dot_dot2;

end