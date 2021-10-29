function mudaTitulo(titulo) {
    document.getElementById('tituloProcura').innerHTML = titulo;
}

function exigePesquisa(requerido) {
    document.getElementById('formProcura').required = requerido;
}

function limpaTabela(table) {
    while (table.rows.length > 0) {
        table.deleteRow(0);
    }
}

function cabecCliente(table) {
    var tr = table.insertRow();
    var th = document.createElement('th');
    th.innerHTML = 'Código';
    tr.appendChild(th);
    th = document.createElement('th');
    th.innerHTML = 'Nome';
    tr.appendChild(th);
    th = document.createElement('th');
    th.innerHTML = 'CPF';
    tr.appendChild(th);
    th = document.createElement('th');
    th.innerHTML = 'Telefone';
    tr.appendChild(th);
    th = document.createElement('th');
    th.innerHTML = 'E-mail';
    tr.appendChild(th);
    table.appendChild(tr);
}

function exibeCliente(table, codigo, nome, cpf, telefone, email) {
    var tr = table.insertRow();
    tr.insertCell().innerHTML = codigo;
    tr.insertCell().innerHTML = nome;
    tr.insertCell().innerHTML = cpf;
    tr.insertCell().innerHTML = telefone;
    tr.insertCell().innerHTML = email;
    table.appendChild(tr);
}

function retornaClientes() {
    var table = document.getElementById('clientes');
    limpaTabela(table);
    document.getElementById("clientesModal").style.display = "block";
    $.getJSON('http://localhost:8080/clientes', function (data) {
        cabecCliente(table);
        $.each(data, function (key, item) {
            exibeCliente(table, item.codigo, item.nome, item.cpf, item.telefone, item.email);
        });
    });
}

function retornaCliente() {
    var table = document.getElementById('cliente');
    limpaTabela(table);
    var procura = document.getElementById('formProcura').value;
    if (procura.length > 0) {
        var titulo = document.getElementById('titCliente');
        titulo.innerHTML = "cliente não encontrado";
        document.getElementById("clienteModal").style.display = "block";
        $.getJSON('http://localhost:8080/clientes/' + procura, function (data) {
            titulo.innerHTML = "dados do cliente";
            cabecCliente(table);
            exibeCliente(table, data.codigo, data.nome, data.cpf, data.telefone, data.email);
        });
    }
}

function cabecConta(table) {
    var tr = table.insertRow();
    var th = document.createElement('th');
    th.innerHTML = 'Número';
    tr.appendChild(th);
    th = document.createElement('th');
    th.innerHTML = 'Agência';
    tr.appendChild(th);
    th = document.createElement('th');
    th.innerHTML = 'Tipo de Conta';
    tr.appendChild(th);
    th = document.createElement('th');
    th.innerHTML = 'Saldo';
    th.style.textAlign = "right";
    tr.appendChild(th);
    th = document.createElement('th');
    th.innerHTML = 'Titular';
    tr.appendChild(th);
    table.appendChild(tr);
}

function exibeConta(table, numero, agencia, tipo, saldo, titular) {
    var tr = table.insertRow();
    tr.insertCell().innerHTML = numero;
    tr.insertCell().innerHTML = agencia;
    switch (tipo) {
        case 0:
            tr.insertCell().innerHTML = "Conta Corrente";
            break;
        case 1:
            tr.insertCell().innerHTML = "Conta Poupança";
            break;
        case 2:
            tr.insertCell().innerHTML = "Investimento";
            break;
        default:
            tr.insertCell().innerHTML = "Desconhecida";
    }
    var td = tr.insertCell();
    td.style.textAlign = "right";
    td.innerHTML = (new Intl.NumberFormat('pt-br', { style: 'currency', currency: 'BRL' }).format(saldo));
    tr.insertCell().innerHTML = titular;
    table.appendChild(tr);
}

function retornaContas() {
    var table = document.getElementById('contas');
    limpaTabela(table);
    document.getElementById("contasModal").style.display = "block";
    $.getJSON('http://localhost:8080/contas', function (data) {
        cabecConta(table);
        $.each(data, function (key, item) {
            exibeConta(table, item.numero, item.agencia, item.tipo, item.saldo, item.titular.nome);
        });
    });
}

function retornaConta() {
    var table = document.getElementById('conta');
    limpaTabela(table);
    var procura = document.getElementById('formProcura').value;
    if (procura.length > 0) {
        var titulo = document.getElementById('titConta');
        titulo.innerHTML = "conta não encontrada";
        document.getElementById("contaModal").style.display = "block";
        $.getJSON('http://localhost:8080/contas/' + procura, function (data) {
            titulo.innerHTML = "dados da conta";
            cabecConta(table);
            exibeConta(table, data.numero, data.agencia, data.tipo, data.saldo, data.titular.nome);
        });
    }
}

function closeModal(modal) {
    document.getElementById(modal).style.display = "none";
}

window.onclick = function (event) {
    var target = event.target;
    if (target.classList.contains('modal')) {
        target.style.display = "none";
    }
}