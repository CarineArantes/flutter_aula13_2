import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter_aula13_2/dados.dart';
import 'package:flutter_aula13_2/dados_json.dart';

class Nova extends StatefulWidget {
  const Nova({super.key});

  @override
  State<Nova> createState() => _NovaState();
}

// Preparando para receber dados no futuro
Future<String> carregaDados() async {
  return Dados.original;
}

class _NovaState extends State<Nova> {
  late Future<DadosJSON> _futureDados;

  @override
  void initState() {
    super.initState();
    _futureDados = buscaDados();
  }

  Future<String> _carregaDadosRemotos() async {
    final response = await (http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')));
    if (response.statusCode == 200) {
      print('response statusCode is 200');
      return response.body;
    } else {
      print('Http Error: ${response.statusCode}!');
      throw Exception('Invalid data source.');
    }
  }

  Future<DadosJSON> buscaDados() async {
    String original = await _carregaDadosRemotos();
    final decodificada = json.decode(original);
    return DadosJSON.fromJson(decodificada);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Filme'),
        ),
        body: Center(
          child: FutureBuilder<DadosJSON>(
            future: _futureDados,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erro ao carregar dados: ${snapshot.error}');
              } else {
                return Text(snapshot.data!.title);
              }
            },
          ),
        ),
      ),
    );
  }
}
