package com.itaubank.itaubank.dao;

import org.springframework.data.repository.CrudRepository;

import com.itaubank.itaubank.model.Conta;

public interface ContaDao extends CrudRepository<Conta, Integer>  {

}
