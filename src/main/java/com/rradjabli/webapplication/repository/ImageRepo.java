package com.rradjabli.webapplication.repository;

import com.rradjabli.webapplication.model.Image;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImageRepo extends JpaRepository<Image,Long> {
}
