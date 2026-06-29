package com.gramcare.backend.service;

import com.gramcare.backend.entity.HealthRecord;
import com.gramcare.backend.entity.User;
import com.gramcare.backend.repository.HealthRecordRepository;
import com.gramcare.backend.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class HealthRecordService {
    private final HealthRecordRepository healthRecordRepository;
    private final UserRepository userRepository;

    public List<HealthRecord> getRecords(UUID userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return healthRecordRepository.findByUser(user);
    }

    @Transactional
    public HealthRecord saveRecord(UUID userId, HealthRecord record) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        record.setUser(user);
        return healthRecordRepository.save(record);
    }
}
