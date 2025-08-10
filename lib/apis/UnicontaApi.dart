import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:appelsin/models/AccountDTO.dart';
import 'package:appelsin/models/Company.dart';

class UnicontaApi {
  static const String _baseUrl = ''; // TODO: Add your base URL
  static const Map<String, String> _baseHeaders = {
    'Checksum': '36bceab4f854890b8d173a0338e36ac16d3f763fcaa71ddb6b503bc2c297f52a',
    'Authorization': 'Basic d29sZnBhY2s6d29sZjEyMzQ=',
    'Content-Type': 'application/json',
  };

  Future<String?> companyName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('company');
  }

  Future<http.Response> createCompany(Company company) async {
    final uri = Uri.parse('$_baseUrl/company'); // Example endpoint
    final companyNameValue = await companyName();

    final headers = {
      ..._baseHeaders,
      'Companyname': companyNameValue ?? '',
    };

    final response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(company),
    );

    if (response.statusCode != 200) {
      throw Exception("Cannot create company: ${response.statusCode}");
    }
    return response;
  }

  Future<List<AccountDTO>> getAccounts() async {
    final uri = Uri.parse('$_baseUrl/accounts'); // Example endpoint
    final companyNameValue = await companyName();

    final headers = {
      ..._baseHeaders,
      'Companyname': companyNameValue ?? '',
    };

    final response = await http.get(uri, headers: headers);

    if (response.statusCode != 200) {
      throw Exception("Failed to load accounts: ${response.statusCode}");
    }

    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => AccountDTO.fromJson(json)).toList();
  }

  Future<http.Response> createOffer(Map<String, dynamic> offerData) async {
    final uri = Uri.parse('$_baseUrl/offer');
    final companyNameValue = await companyName();

    final headers = {
      ..._baseHeaders,
      'Companyname': companyNameValue ?? '',
    };

    return await http.post(uri, headers: headers, body: jsonEncode(offerData));
  }

  Future<http.Response> createInvoice(Map<String, dynamic> invoiceData) async {
    final uri = Uri.parse('$_baseUrl/invoice');
    final companyNameValue = await companyName();

    final headers = {
      ..._baseHeaders,
      'Companyname': companyNameValue ?? '',
    };

    return await http.post(uri, headers: headers, body: jsonEncode(invoiceData));
  }

  Future<http.Response> getAllInvoices() async {
    final uri = Uri.parse('$_baseUrl/invoices');
    final companyNameValue = await companyName();

    final headers = {
      ..._baseHeaders,
      'Companyname': companyNameValue ?? '',
    };

    return await http.get(uri, headers: headers);
  }
}
