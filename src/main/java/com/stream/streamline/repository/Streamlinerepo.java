package com.stream.streamline.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.stream.streamline.model.*;


@Repository
public interface  Streamlinerepo extends JpaRepository<SignUpModel, Integer> {

}
