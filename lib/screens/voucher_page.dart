import 'package:flutter/material.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  State<VoucherPage> createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  String selectedCategory = "All";

  final List<String> categories = [
    "All",
    "Transport",
    "Shopping",
    "Green",
    "Charity",
  ];

  final List<Map<String, dynamic>> vouchers = [
    {
      "icon": Icons.directions_bus,
      "title": "10% Bus Monthly Ticket",
      "description": "Valid for all city bus routes",
      "credits": 500,
      "rating": 4.8,
      "price": 45,
      "discountedPrice": 40.5,
      "availability": "2 days left",
      "category": "Transport"
    },
    {
      "icon": Icons.eco_outlined,
      "title": "Plant a Tree",
      "description": "We’ll plant a tree in your name",
      "credits": 1500,
      "rating": 5.0,
      "price": null,
      "discountedPrice": null,
      "availability": "Always available",
      "category": "Green"
    },
    {
      "icon": Icons.local_cafe_outlined,
      "title": "Coffee Shop 50% Off",
      "description": "Valid at participating cafes",
      "credits": 300,
      "rating": 4.8,
      "price": 8,
      "discountedPrice": 4,
      "availability": "3 days left",
      "category": "Shopping"
    },
    {
      "icon": Icons.water_drop_outlined,
      "title": "Clean Water Access",
      "description": "\$15 donation for clean water projects",
      "credits": 1000,
      "rating": 5.0,
      "price": null,
      "discountedPrice": null,
      "availability": "Always available",
      "category": "Charity"
    },
    {
      "icon": Icons.recycling_outlined,
      "title": "Ocean Cleanup Donation",
      "description": "\$10 donation to clean initiatives",
      "credits": 1000,
      "rating": 5.0,
      "price": null,
      "discountedPrice": null,
      "availability": "Always available",
      "category": "Charity"
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredVouchers = selectedCategory == "All"
        ? vouchers
        : vouchers.where((v) => v["category"] == selectedCategory).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Voucher Marketplace",
          style: TextStyle(
            color: Color(0xFF4CAF50),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.card_giftcard_outlined, color: Colors.grey),
          )
        ],
      ),
      body: Column(
        children: [
          // Available Credits
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF66B34A), Color(0xFF7FF4E6)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Available Credits",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text("2,450",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Icon(Icons.card_giftcard_outlined,
                    color: Colors.white, size: 30),
              ],
            ),
          ),

          // Category Tabs
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: categories.map((cat) {
                final bool isSelected = selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(cat),
                    selected: isSelected,
                    selectedColor: const Color(0xFF4CAF50),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                    onSelected: (_) {
                      setState(() => selectedCategory = cat);
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 8),

          // Voucher List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredVouchers.length + 1, // +1 for "How it works"
              itemBuilder: (context, index) {
                if (index < filteredVouchers.length) {
                  final v = filteredVouchers[index];
                  return _buildVoucherCard(v);
                } else {
                  return _buildHowItWorksBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Voucher Card
  Widget _buildVoucherCard(Map<String, dynamic> v) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF66B34A), Color(0xFF7CFFF0)],
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    v["icon"],
                    color: const Color(0xFF4CAF50),
                    size: 36,
                  ),
                ),

                // Nút credits ở góc phải
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4CAF50),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "${v["credits"]} credits",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


          // Body content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(v["title"],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54)),
                const SizedBox(height: 4),
                Text(v["description"],
                    style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 10),

                // Rating & price info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Colors.orange, size: 18),
                        const SizedBox(width: 4),
                        Text(v["rating"].toString(),
                            style: const TextStyle(fontSize: 14, color: Colors.black54),),
                        if (v["price"] != null) ...[
                          const SizedBox(width: 8),
                          Text("\$${v["price"]}",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 13)),
                          const SizedBox(width: 4),
                          Text("\$${v["discountedPrice"]}",
                              style: const TextStyle(
                                  color: Color(0xFF21A366),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)),
                        ]
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 16),
                        const SizedBox(width: 4),
                        Text(v["availability"],
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 13)),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 14),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text("Redeem",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // "How it works" Box
  Widget _buildHowItWorksBox() {
    return Container(
      margin: const EdgeInsets.only(top: 4, bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8E5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBDE5B2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.info_outline, color: Color(0xFF21A366), size: 24),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "💡 How it works\nEarn credits by choosing eco-friendly transport. "
                  "Redeem vouchers to save money and support sustainability!",
              style: TextStyle(
                color: Color(0xFF2E7D32),
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
