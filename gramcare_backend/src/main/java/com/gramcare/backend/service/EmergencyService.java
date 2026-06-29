package com.gramcare.backend.service;

import com.gramcare.backend.entity.EmergencyAlert;
import com.gramcare.backend.entity.EmergencyContact;
import com.gramcare.backend.entity.User;
import com.gramcare.backend.repository.EmergencyAlertRepository;
import com.gramcare.backend.repository.EmergencyContactRepository;
import com.gramcare.backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class EmergencyService {
    private final EmergencyContactRepository contactRepository;
    private final EmergencyAlertRepository alertRepository;
    private final UserRepository userRepository;

    public List<EmergencyContact> getContacts(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return contactRepository.findByUser(user);
    }

    @Transactional
    public EmergencyContact addContact(UUID userId, EmergencyContact contact) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        contact.setUser(user);
        return contactRepository.save(contact);
    }

    @Transactional
    public EmergencyAlert triggerAlert(UUID userId, EmergencyAlert alert) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        alert.setUser(user);
        alert.setTriggeredAt(LocalDateTime.now());
        alert.setStatus("TRIGGERED");
        
        // In a real app, this would trigger SMS/Push notifications to contacts
        return alertRepository.save(alert);
    }

    public List<EmergencyAlert> getAlerts(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return alertRepository.findByUserOrderByTriggeredAtDesc(user);
    }
}
