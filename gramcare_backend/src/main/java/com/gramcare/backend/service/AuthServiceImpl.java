package com.gramcare.backend.service;

import com.gramcare.backend.dto.JwtResponse;
import com.gramcare.backend.dto.LoginRequest;
import com.gramcare.backend.dto.RegisterRequest;
import com.gramcare.backend.entity.Role;
import com.gramcare.backend.entity.User;
import com.gramcare.backend.repository.RoleRepository;
import com.gramcare.backend.repository.UserRepository;
import com.gramcare.backend.security.JwtTokenProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JwtTokenProvider tokenProvider;

    @Override
    public JwtResponse login(LoginRequest loginRequest) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getPhone(),
                        loginRequest.getPassword()
                )
        );

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = tokenProvider.generateToken(authentication);
        
        User user = userRepository.findByPhone(loginRequest.getPhone()).orElseThrow();
        String refreshToken = tokenProvider.generateRefreshToken(user.getPhone());

        return new JwtResponse(
                jwt,
                refreshToken,
                user.getId().toString(),
                user.getFullName(),
                user.getRole().getName()
        );
    }

    @Override
    @Transactional
    public void register(RegisterRequest registerRequest) {
        if (userRepository.existsByPhone(registerRequest.getPhone())) {
            throw new RuntimeException("Phone number already registered");
        }

        Role role = roleRepository.findByName(registerRequest.getRole())
                .orElseThrow(() -> new RuntimeException("Role not found"));

        User user = User.builder()
                .phone(registerRequest.getPhone())
                .passwordHash(passwordEncoder.encode(registerRequest.getPassword()))
                .fullName(registerRequest.getFullName())
                .role(role)
                .languagePreference(registerRequest.getLanguagePreference())
                .isActive(true)
                .build();

        userRepository.save(user);
    }

    @Override
    public JwtResponse refreshToken(String refreshToken) {
        if (tokenProvider.validateToken(refreshToken)) {
            String username = tokenProvider.getUsernameFromJWT(refreshToken);
            User user = userRepository.findByPhone(username).orElseThrow();
            
            String newAccessToken = tokenProvider.generateTokenFromUsername(username, 3600000); // 1 hour
            
            return new JwtResponse(
                    newAccessToken,
                    refreshToken,
                    user.getId().toString(),
                    user.getFullName(),
                    user.getRole().getName()
            );
        }
        throw new RuntimeException("Invalid refresh token");
    }

    @Override
    public void logout(String phone) {
        // In a stateless JWT setup, we'd typically handle this on the client 
        // or by adding the token to a blacklist in Redis.
        SecurityContextHolder.clearContext();
    }
}
