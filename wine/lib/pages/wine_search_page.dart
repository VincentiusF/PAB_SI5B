import 'package:flutter/material.dart';
import 'package:wine/models/wine.dart';
import '../data/wine_data.dart';

class WineSearchPage extends StatefulWidget {
  @override
  _WineSearchPageState createState() => _WineSearchPageState();
}

class _WineSearchPageState extends State<WineSearchPage> {
  int itemsToShow = 2;
  String searchQuery = "";
  String selectedType = "";
  String selectedPrice = "";
  String selectedCountry = "";

  List<Wine> get filteredWine {
    return wineData.where((wine) {
      final matchesSearch =
          searchQuery.isEmpty || wine.name.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesType = selectedType.isEmpty || wine.type.toLowerCase().contains(selectedType.toLowerCase());

      final priceInt = _parsePrice(wine.price);
      final matchesPrice = selectedPrice.isEmpty ||
          (selectedPrice == "< Rp500.000" && priceInt < 500000) ||
          (selectedPrice == "Rp500.000 - Rp1.000.000" && priceInt >= 500000 && priceInt <= 1000000) ||
          (selectedPrice == "> Rp1.000.000" && priceInt > 1000000);

      final matchesCountry =
          selectedCountry.isEmpty || wine.country.toLowerCase() == selectedCountry.toLowerCase();

      return matchesSearch && matchesType && matchesPrice && matchesCountry;
    }).toList();
  }

  int _parsePrice(String price) {
    final priceWithoutCurrency = price.replaceAll(RegExp(r'[^0-9]'), '');
    return int.tryParse(priceWithoutCurrency) ?? 0;
  }

  void loadMore() {
    setState(() {
      itemsToShow = (itemsToShow + 2).clamp(0, filteredWine.length);
    });
  }

  void resetFilters() {
    setState(() {
      selectedType = "";
      selectedPrice = "";
      selectedCountry = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        title: const Text("Search"),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 107, 10, 10), 
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 107, 10, 10), 
            borderRadius: BorderRadius.circular(8.0), 
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        elevation: 0, 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white, 
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 2, blurRadius: 5)],
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Cari wine",
                  prefixIcon: const Icon(Icons.search),
                  border: InputBorder.none, 
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDropdownButton("Jenis Wine", ["Red", "White", "Sparkling"], selectedType, (value) {
                  setState(() {
                    selectedType = value ?? "";
                  });
                }),
                const SizedBox(width: 8,),
                _buildDropdownButton("Harga", ["< Rp500.000", "Rp500.000 - Rp1.000.000", "> Rp1.000.000"],
                    selectedPrice, (value) {
                  setState(() {
                    selectedPrice = value ?? "";
                  });
                }),
                const SizedBox(width: 8,),
                _buildDropdownButton(
                    "Negara", ["Chile", "Argentina", "Australia", "Italy", "France"], selectedCountry, (value) {
                  setState(() {
                    selectedCountry = value ?? "";
                  });
                }),
              ],
            ),
            const SizedBox(height: 16),
            if (selectedType.isNotEmpty || selectedPrice.isNotEmpty || selectedCountry.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  if (selectedType.isNotEmpty)
                    Chip(
                      label: Text(selectedType),
                      onDeleted: () {
                        setState(() {
                          selectedType = "";
                        });
                      },
                      deleteIcon: const Icon(Icons.close),
                    ),
                  if (selectedPrice.isNotEmpty)
                    Chip(
                      label: Text(selectedPrice),
                      onDeleted: () {
                        setState(() {
                          selectedPrice = "";
                        });
                      },
                      deleteIcon: const Icon(Icons.close),
                    ),
                  if (selectedCountry.isNotEmpty)
                    Chip(
                      label: Text(selectedCountry),
                      onDeleted: () {
                        setState(() {
                          selectedCountry = "";
                        });
                      },
                      deleteIcon: const Icon(Icons.close),
                    ),
                ],
              ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredWine.isEmpty
                  ? Center(child: Text("No results found"))
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.50,
                      ),
                      itemCount: itemsToShow,
                      itemBuilder: (context, index) {
                        final wine = filteredWine[index];
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(wine.imagePath),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(wine.name, style: TextStyle(fontWeight: FontWeight.bold)),
                                    Text("${wine.region}, ${wine.country}"),
                                    Text("${wine.type}"),
                                    Text("Rp${wine.price}", style: TextStyle(color: Colors.red)),
                                    const SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text('Anda membeli ${wine.name}')),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                        backgroundColor: const Color.fromARGB(255, 107, 10, 10),
                                      ),
                                      child: Text(
                                        "Beli",
                                        style: TextStyle(color: Colors.white), 
                                        ),
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
            if (itemsToShow < filteredWine.length)
              ElevatedButton.icon(
                onPressed: loadMore,
                icon: const Icon(Icons.add, color: Colors.black,),
                label: const Text("Load More", style: TextStyle(color: Colors.black),),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownButton(String hint, List<String> items, String selectedValue, Function(String?) onChanged) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: selectedValue.isEmpty ? null : selectedValue,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: onChanged,
        isExpanded: true,
      ),
    );
  }
}
