import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isExpense = true;

  String selectedCategory = "Shopping";

  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back + Title
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios),
                  ),

                  Expanded(
                    child: Center(
                      child: Text(
                        "Add Transaction",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Toggle
              _buildToggle(),

              const SizedBox(height: 20),

              // Amount
              _buildAmountField(),

              const SizedBox(height: 25),

              Text(
                "Category",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),

              _buildCategoryDropdown(),

              const SizedBox(height: 20),

              const Text("Note (optional)", style: TextStyle(fontSize: 15)),
              const SizedBox(height: 10),

              _buildNoteField(),

              const Spacer(),

              GestureDetector(
                onTap: () {
                  // ✅ Here you can print values or save to DB
                  print("Type: ${isExpense ? "Expense" : "Income"}");
                  print("Amount: ${amountController.text}");
                  print("Category: $selectedCategory");
                  print("Note: ${noteController.text}");
                },
                child: _buildGradientButton(),
              ),
            ],
          ),
        ),
      ),

      // Floating + Bottom Nav (Optional)
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Icon(Icons.home),
              Icon(Icons.bar_chart),
              SizedBox(width: 40),
              Icon(Icons.account_balance_wallet),
              Icon(Icons.person),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- WIDGETS ----------------

  Widget _buildToggle() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isExpense = true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isExpense ? Colors.pink : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Expense",
                    style: TextStyle(
                      color: isExpense ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => isExpense = false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: !isExpense ? Colors.green : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Income",
                    style: TextStyle(
                      color: !isExpense ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountField() {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFEDECF2),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: amountController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "\$0.00",
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCategory,
          isExpanded: true,
          items: ["Shopping", "Food", "Transport", "Salary"]
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (value) => setState(() => selectedCategory = value!),
        ),
      ),
    );
  }

  Widget _buildNoteField() {
    return TextField(
      controller: noteController,
      maxLines: 3,
      decoration: const InputDecoration(
        hintText: "Enter note...",
        border: UnderlineInputBorder(),
      ),
    );
  }

  Widget _buildGradientButton() {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Colors.purple, Colors.pink],
        ),
      ),
      child: Center(
        child: Text(
          isExpense ? "Add Expense" : "Add Income",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}