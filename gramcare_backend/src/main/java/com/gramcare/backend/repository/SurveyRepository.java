package com.gramcare.backend.repository;

import com.gramcare.backend.entity.Survey;
import com.gramcare.backend.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface SurveyRepository extends JpaRepository<Survey, UUID> {
    List<Survey> findByWorkerIdOrderByCompletedAtDesc(UUID workerId);
    List<Survey> findByPatientOrderByCompletedAtDesc(User patient);
}
