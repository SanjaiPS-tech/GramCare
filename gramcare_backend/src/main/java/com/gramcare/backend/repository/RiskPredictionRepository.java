package com.gramcare.backend.repository;

import com.gramcare.backend.entity.RiskPrediction;
import com.gramcare.backend.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Repository
public interface RiskPredictionRepository extends JpaRepository<RiskPrediction, UUID> {
    Optional<RiskPrediction> findFirstByUserOrderByPredictedAtDesc(User user);
    List<RiskPrediction> findByUserOrderByPredictedAtDesc(User user);
}
