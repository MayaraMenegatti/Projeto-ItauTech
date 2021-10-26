package com.itaubank.itaubank.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itaubank.itaubank.dao.ClienteDao;
import com.itaubank.itaubank.model.Cliente;
import com.itaubank.itaubank.model.Conta;

@RestController
public class ClienteController {
	@Autowired
	private ClienteDao dao;

	@GetMapping("/clientes")
	public ArrayList<Cliente> listarClientes() {
		return (ArrayList<Cliente>) dao.findAll();

	}

	@GetMapping("/clientes/{id}")
	public ResponseEntity<Cliente> listarClientes(@PathVariable int id) {
		Cliente resultado;
		resultado = dao.findById(id).orElse(null);
		if (resultado != null) {
			return ResponseEntity.ok(resultado);
		} else {
			return ResponseEntity.notFound().build();
		}
	}

	@PostMapping("/clientes")
	public String adicionarNovoCliente(@RequestBody Cliente novaCliente) {
		dao.save(novaCliente);
		return "ok";
	}
}
