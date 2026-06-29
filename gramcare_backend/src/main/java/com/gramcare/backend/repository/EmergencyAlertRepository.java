package com.gramcare.backend.repository;

import com.gramcare.backend.entity.EmergencyAlert;
import com.gramcare.backend.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface EmergencyAlertRepository extends JpaRepository<EmergencyAlert, UUID> {
    List<EmergencyAlert> findByUserOrderByTriggeredAtDesc(User user);
}
