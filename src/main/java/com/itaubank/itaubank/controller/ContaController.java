package com.itaubank.itaubank.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itaubank.itaubank.dao.ContaDao;
import com.itaubank.itaubank.model.Conta;

@RestController
public class ContaController {
	@Autowired
	private ContaDao dao;

	@GetMapping("/contas")
	public ArrayList<Conta> listarContas() {
		return (ArrayList<Conta>) dao.findAll();
	}
	
	@GetMapping("/contas/{id}")
	public ResponseEntity<Conta> listarContas(@PathVariable int id) {
		Conta resultado;
		resultado = dao.findById(id).orElse(null);
		if(resultado != null) {
			return ResponseEntity.ok(resultado);
		}
		else {
			return ResponseEntity.notFound().build();
		}
	}
	
	@PostMapping("/contas")
	public String adicionarNovaConta(@RequestBody Conta novaConta) {
		dao.save(novaConta);
		return "ok";
	}
}
