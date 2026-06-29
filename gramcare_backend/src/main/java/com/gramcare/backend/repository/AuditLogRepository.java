package com.gramcare.backend.repository;

import com.gramcare.backend.entity.AuditLog;
import com.gramcare.backend.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface AuditLogRepository extends JpaRepository<AuditLog, UUID> {
    List<AuditLog> findByUserOrderByCreatedAtDesc(User user);
}
