package com.gramcare.backend.service;

import com.gramcare.backend.entity.Prescription;
import com.gramcare.backend.entity.User;
import com.gramcare.backend.repository.PrescriptionRepository;
import com.gramcare.backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class PrescriptionService {
    private final PrescriptionRepository prescriptionRepository;
    private final UserRepository userRepository;

    public List<Prescription> getPrescriptions(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return prescriptionRepository.findByUser(user);
    }

    @Transactional
    public Prescription savePrescription(UUID userId, Prescription prescription) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        prescription.setUser(user);
        return prescriptionRepository.save(prescription);
    }
}
