package com.gramcare.backend.service;

import com.gramcare.backend.entity.FamilyMonitoring;
import com.gramcare.backend.entity.User;
import com.gramcare.backend.repository.FamilyMonitoringRepository;
import com.gramcare.backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FamilyService {
    private final FamilyMonitoringRepository monitoringRepository;
    private final UserRepository userRepository;

    public List<FamilyMonitoring> getLinkedElderly(UUID familyMemberId) {
        return monitoringRepository.findByFamilyMemberId(familyMemberId);
    }

    @Transactional
    public FamilyMonitoring linkToElderly(UUID familyMemberId, UUID elderlyUserId, String relationship) {
        User elderlyUser = userRepository.findById(elderlyUserId)
                .orElseThrow(() -> new RuntimeException("Elderly user not found"));
        
        FamilyMonitoring link = FamilyMonitoring.builder()
                .familyMemberId(familyMemberId)
                .elderlyUser(elderlyUser)
                .relationship(relationship)
                .isApproved(false) // Needs approval from elderly user
                .linkedAt(LocalDateTime.now())
                .build();
        
        return monitoringRepository.save(link);
    }

    @Transactional
    public FamilyMonitoring approveLink(UUID linkId) {
        FamilyMonitoring link = monitoringRepository.findById(linkId)
                .orElseThrow(() -> new RuntimeException("Link not found"));
        link.setApproved(true);
        return monitoringRepository.save(link);
    }
}
