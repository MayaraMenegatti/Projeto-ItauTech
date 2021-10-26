package com.itaubank.itaubank.dao;

import java.util.ArrayList;

import org.springframework.data.repository.CrudRepository;

import com.itaubank.itaubank.model.Cliente;

public interface ClienteDao extends CrudRepository<Cliente, Integer> {
public ArrayList<Cliente> findAllByNomeContaining(String palavra);
}
