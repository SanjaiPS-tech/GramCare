package com.gramcare.backend.service;

import com.gramcare.backend.dto.JwtResponse;
import com.gramcare.backend.dto.LoginRequest;
import com.gramcare.backend.dto.RegisterRequest;

public interface AuthService {
    JwtResponse login(LoginRequest loginRequest);
    void register(RegisterRequest registerRequest);
    JwtResponse refreshToken(String refreshToken);
    void logout(String phone);
}
