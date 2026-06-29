package com.gramcare.backend.repository;

import com.gramcare.backend.entity.FamilyMonitoring;
import com.gramcare.backend.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface FamilyMonitoringRepository extends JpaRepository<FamilyMonitoring, UUID> {
    List<FamilyMonitoring> findByElderlyUser(User user);
    List<FamilyMonitoring> findByFamilyMemberId(UUID familyMemberId);
}
