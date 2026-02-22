import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/age_calculator.dart';
import '../providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _selectedDate;
  Map<String, dynamic>? _result;

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(Duration(days: 365 * 20)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _result = AgeCalculator.calculate(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("📅 Age Calculator"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double padding = constraints.maxWidth > 600 ? 50 : 20;

          return SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  children: [
                    _buildInputCard(),
                    if (_result != null) ...[
                      SizedBox(height: 25),
                      _buildResultsGrid(constraints.maxWidth > 600),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),

      // ✅ PROFESSIONAL FOOTER
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(height: 1),
            SizedBox(height: 8),
            Text(
              "© 2026 All Rights Reserved by Muhammad Maaz",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputCard() {
    // "Select Your Date of Birth"
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Text(
              "Select Your Date of Birth",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 18),
            ElevatedButton.icon(
              onPressed: _pickDate,
              icon: Icon(Icons.calendar_month),
              label: Text(
                _selectedDate == null ? "Choose Date" : "Change Date",
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            if (_selectedDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                  "Born on: ${_result!['dayOfWeek']}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsGrid(bool isWide) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _infoTile("${_result!['years']}", "Years"),
              _infoTile("${_result!['months']}", "Months"),
              _infoTile("${_result!['days']}", "Days"),
            ],
          ),
        ),
        SizedBox(height: 25),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: isWide ? 4 : 2,
          childAspectRatio: 1.5,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          children: [
            _statCard("Zodiac", _result!['zodiac'], Colors.purple),
            _statCard(
              "Next Birthday",
              "${_result!['nextBirthday']} Days",
              Colors.orange,
            ),
            _statCard(
              "Total Weeks",
              "${_result!['totalWeeks']}",
              Colors.blue,
            ),
            _statCard(
              "Total Hours",
              "${_result!['totalHours']}",
              Colors.green,
            ),
          ],
        ),
        SizedBox(height: 25),
        // reset button
        ElevatedButton(
          onPressed: () {
            setState(() {
              _selectedDate = null;
              _result = null;
            });
          },
          child: Text("Reset"),
        )
      ],
    );
  }

  Widget _infoTile(String value, String label) {
    return Container(
      width: 110,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String title, String val, Color color) {
    return Card(
      elevation: 3,
      color: color.withOpacity(0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 12, color: color, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(
            val,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
