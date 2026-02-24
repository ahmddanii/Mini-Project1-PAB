import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../providers/transaction_provider.dart';
import '../models/transaction_model.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  String _selectedCategory = "Pemasukan";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    final formatRupiah = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    final currentSaldo = provider.saldo;
    final inputAmount = double.tryParse(_amountController.text) ?? 0;

    double previewSaldo = currentSaldo;

    if (_selectedCategory == "Pemasukan") {
      previewSaldo += inputAmount;
    } else {
      previewSaldo -= inputAmount;
    }

    void _submit() {
      if (_titleController.text.isEmpty ||
          inputAmount <= 0 ||
          _dateController.text.isEmpty)
        return;

      if (_selectedCategory == "Pengeluaran" && inputAmount > currentSaldo) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Saldo tidak cukup untuk pengeluaran!")),
        );
        return;
      }

      provider.addTransaction(
        TransactionModel(
          id: const Uuid().v4(),
          title: _titleController.text,
          amount: inputAmount,
          category: _selectedCategory,
          date: _dateController.text,
        ),
      );

      Navigator.pop(context);
    }

    InputDecoration inputStyle(String label) {
      return InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1ABC9C),
        title: const Text("Tambah Transaksi"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // SALDO SAAT INI
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1ABC9C), Color(0xFF16A085)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Saldo Saat Ini",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    formatRupiah.format(currentSaldo),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: _titleController,
              decoration: inputStyle("Nama Transaksi"),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: inputStyle("Jumlah"),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCategory,
                  isExpanded: true,
                  items: const [
                    DropdownMenuItem(
                      value: "Pemasukan",
                      child: Text("Pemasukan"),
                    ),
                    DropdownMenuItem(
                      value: "Pengeluaran",
                      child: Text("Pengeluaran"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: _dateController,
              decoration: inputStyle("Tanggal"),
            ),

            const SizedBox(height: 25),

            // PREVIEW SALDO
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: previewSaldo >= 0
                    ? Colors.green.withOpacity(0.1)
                    : Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Saldo Setelah Transaksi"),
                  Text(
                    formatRupiah.format(previewSaldo),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: previewSaldo >= 0 ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // BUTTON
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1ABC9C), Color(0xFF16A085)],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: _submit,
                child: const Text(
                  "Simpan Transaksi",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
