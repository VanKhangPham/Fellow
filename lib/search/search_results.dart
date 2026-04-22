import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key, required this.destination});

  final String destination;

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  static const Color _primary = Color(0xFF00C7A7);
  static const Color _textPrimary = Color(0xFF212121);
  static const Color _textSecondary = Color(0xFF8A8A8A);
  static const Color _background = Color(0xFFF9F9F9);
  static const Color _cardShadow = Color.fromRGBO(0, 0, 0, 0.08);

  static const List<_GuideResultItem> _guideResults = [
    _GuideResultItem(
      imagePath:
          'assets/images/explore/4293a86720d50b28e6ad1b224c2db9f92d54d9d5.jpg',
      name: 'Tuan Tran',
      reviews: '127 Reviews',
    ),
    _GuideResultItem(
      imagePath:
          'assets/images/explore/fc207b73626f5125383e54e4f9bd8e50563101a4.jpg',
      name: 'Linh Hana',
      reviews: '127 Reviews',
    ),
    _GuideResultItem(
      imagePath:
          'assets/images/explore/d8d1d509c67d429aab24f69d4b7219554c1c69b7.png',
      name: 'Tuan Tran',
      reviews: '127 Reviews',
    ),
    _GuideResultItem(
      imagePath:
          'assets/images/explore/67f8ecec96e4799757e73bf4c011c059135b7527.jpg',
      name: 'Linh Hana',
      reviews: '127 Reviews',
    ),
    _GuideResultItem(
      imagePath:
          'assets/images/explore/21c7c394eebe1f5ab9fb03014d50d398e03633a0.jpg',
      name: 'Tuan Tran',
      reviews: '127 Reviews',
    ),
    _GuideResultItem(
      imagePath:
          'assets/images/explore/744f85922de533c19555ae4c251ce3dec7041419.png',
      name: 'Linh Hana',
      reviews: '127 Reviews',
    ),
  ];

  late final List<_TourResultItem> _tourResults = [
    _TourResultItem(
      imagePath:
          'assets/images/explore/69c85a3ef2934da77239256b0a2f5429818850a5.jpg',
      title: 'Da Nang - Ba Na - Hoi An',
      date: 'Jan 30, 2020',
      days: '3 days',
      price: '\$400.00',
      likes: '1247 likes',
      favorited: false,
      bookmarked: false,
    ),
    _TourResultItem(
      imagePath:
          'assets/images/explore/e8bbf8e4a3407d7d2ac4e0c6107ed68738f49e92.png',
      title: 'Melbourne - Sydney',
      date: 'Jan 30, 2020',
      days: '3 days',
      price: '\$600.00',
      likes: '1247 likes',
      favorited: true,
      bookmarked: true,
    ),
    _TourResultItem(
      imagePath:
          'assets/images/explore/6236a6fc45bbe62cddf36784fcd2767ec32f1972.jpg',
      title: 'Hanoi - Ha Long Bay',
      date: 'Jan 30, 2020',
      days: '3 days',
      price: '\$300.00',
      likes: '1247 likes',
      favorited: false,
      bookmarked: true,
    ),
    _TourResultItem(
      imagePath:
          'assets/images/explore/69c85a3ef2934da77239256b0a2f5429818850a5.jpg',
      title: 'Da Nang - Ba Na - Hoi An',
      date: 'Jan 30, 2020',
      days: '3 days',
      price: '\$400.00',
      likes: '1247 likes',
      favorited: false,
      bookmarked: false,
    ),
  ];

  late final TextEditingController _searchController;

  String get _displayDestination {
    final query = _searchController.text.trim();
    return query.isEmpty ? widget.destination : query;
  }

  void _showFilterDialog() {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => _FilterBottomSheet(
      onApply: (filters) {
        // TODO: Áp dụng filters
        Navigator.pop(context);
      },
    ),
  );
}

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.destination);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 28),
          children: [
            _buildTopBar(),
            const SizedBox(height: 24),
            _buildSearchBarRow(),
            const SizedBox(height: 28),
            _buildSectionTitle('Guides in $_displayDestination'),
            const SizedBox(height: 18),
            _buildGuidesGrid(),
            const SizedBox(height: 28),
            _buildSectionTitle('Tours in $_displayDestination'),
            const SizedBox(height: 18),
            _buildToursList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        splashRadius: 22,
        icon: const Icon(Icons.close, size: 28, color: _textPrimary),
      ),
    );
  }

  Widget _buildSearchBarRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: _cardShadow,
                  blurRadius: 14,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    cursorColor: _primary,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Where you want to explore',
                      hintStyle: TextStyle(
                        color: Color(0xFFBDBDBD),
                        fontSize: 16,
                      ),
                    ),
                    style: const TextStyle(
                      color: _textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                if (_searchController.text.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      _searchController.clear();
                      setState(() {});
                    },
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Color(0xFFB8B8B8),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 14),
        GestureDetector(
          onTap: _showFilterDialog,  // ← Thêm dòng này
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              'assets/images/search/Vector.svg',
              width: 22,
              height: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: _textPrimary,
              fontSize: 22,
              fontWeight: FontWeight.w700,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'SEE MORE',
          style: TextStyle(
            color: _primary,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
      ],
    );
  }

  Widget _buildGuidesGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _guideResults.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 18,
        mainAxisExtent: 238,
      ),
      itemBuilder: (context, index) => _buildGuideCard(_guideResults[index]),
    );
  }

  Widget _buildGuideCard(_GuideResultItem guide) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            children: [
              Image.asset(
                guide.imagePath,
                width: double.infinity,
                height: 165,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.18),
                        Colors.black.withOpacity(0.36),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                right: 10,
                bottom: 10,
                child: Row(
                  children: [
                    ..._buildStars(size: 15),
                    const SizedBox(width: 6),
                    Text(
                      guide.reviews,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          guide.name,
          style: const TextStyle(
            color: _textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.location_on, size: 16, color: _primary),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                _displayDestination,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: _primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildToursList() {
    return Column(
      children: List.generate(_tourResults.length, (index) {
        final tour = _tourResults[index];
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == _tourResults.length - 1 ? 0 : 18,
          ),
          child: _buildTourCard(tour),
        );
      }),
    );
  }

  Widget _buildTourCard(_TourResultItem tour) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: _cardShadow,
            blurRadius: 16,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.asset(
                  tour.imagePath,
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.06),
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.35),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      tour.bookmarked = !tour.bookmarked;
                    }),
                    child: Icon(
                      tour.bookmarked
                          ? Icons.bookmark
                          : Icons.bookmark_border_rounded,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  bottom: 10,
                  child: Row(
                    children: [
                      ..._buildStars(),
                      const SizedBox(width: 8),
                      Text(
                        tour.likes,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        tour.title,
                        style: const TextStyle(
                          color: _textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => setState(() {
                        tour.favorited = !tour.favorited;
                      }),
                      child: Icon(
                        tour.favorited
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color: _primary,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _buildTourMetaRow(
                  icon: Icons.calendar_today_outlined,
                  label: tour.date,
                ),
                const SizedBox(height: 7),
                _buildTourMetaRow(
                  icon: Icons.access_time,
                  label: tour.days,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    tour.price,
                    style: const TextStyle(
                      color: _primary,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTourMetaRow({
    required IconData icon,
    required String label,
  }) {
    return Row(
      children: [
        Icon(icon, size: 15, color: const Color(0xFFB1B1B1)),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: _textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildStars({double size = 14}) {
    return List<Widget>.generate(
      5,
      (_) => Icon(
        Icons.star,
        color: const Color(0xFFFFC107),
        size: size,
      ),
    );
  }
}

class _GuideResultItem {
  const _GuideResultItem({
    required this.imagePath,
    required this.name,
    required this.reviews,
  });

  final String imagePath;
  final String name;
  final String reviews;
}

class _TourResultItem {
  _TourResultItem({
    required this.imagePath,
    required this.title,
    required this.date,
    required this.days,
    required this.price,
    required this.likes,
    required this.favorited,
    required this.bookmarked,
  });

  final String imagePath;
  final String title;
  final String date;
  final String days;
  final String price;
  final String likes;
  bool favorited;
  bool bookmarked;
}

class _FilterBottomSheet extends StatefulWidget {
  final Function(Map<String, dynamic>) onApply;

  const _FilterBottomSheet({required this.onApply});

  @override
  State<_FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<_FilterBottomSheet> {
  late int _selectedTab; // 0: Guides, 1: Tours
  late TextEditingController _dateController;
  late TextEditingController _feeController;
  final List<String> _languages = ['Vietnamese', 'English', 'Korean', 'Spanish', 'French'];
  late Set<String> _selectedLanguages;

  @override
  void initState() {
    super.initState();
    _selectedTab = 0;
    _dateController = TextEditingController();
    _feeController = TextEditingController();
    _selectedLanguages = {};
  }

  @override
  void dispose() {
    _dateController.dispose();
    _feeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            16 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24),
                  const Text(
                    'Filters',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF212121),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, size: 24, color: Color(0xFF212121)),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Tabs
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _selectedTab == 0 ? const Color(0xFF00C7A7) : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: _selectedTab == 1 ? Border.all(color: const Color(0xFFE0E0E0)) : null,
                        ),
                        child: Center(
                          child: Text(
                            'Guides',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: _selectedTab == 0 ? Colors.white : const Color(0xFF212121),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _selectedTab == 1 ? const Color(0xFF00C7A7) : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: _selectedTab == 0 ? Border.all(color: const Color(0xFFE0E0E0)) : null,
                        ),
                        child: Center(
                          child: Text(
                            'Tours',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: _selectedTab == 1 ? Colors.white : const Color(0xFF212121),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Filters for Guides
              if (_selectedTab == 0) ...[
                // Date
                const Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    hintText: 'mm/dd/yy',
                    hintStyle: const TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
                    prefixIcon: const Icon(Icons.calendar_today, size: 18, color: Color(0xFF9E9E9E)),
                    border: InputBorder.none,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00C7A7), width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Guide's Language
                const Text(
                  "Guide's Language",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: _languages.map((lang) {
                    final isSelected = _selectedLanguages.contains(lang);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedLanguages.remove(lang);
                          } else {
                            _selectedLanguages.add(lang);
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFF00C7A7) : Colors.white,
                          border: Border.all(
                            color: isSelected ? const Color(0xFF00C7A7) : const Color(0xFFE0E0E0),
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          lang,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : const Color(0xFF212121),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 28),

                // Fee
                const Text(
                  'Fee',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _feeController,
                  decoration: InputDecoration(
                    hintText: 'Fee',
                    hintStyle: const TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
                    prefixIcon: const Icon(Icons.attach_money, size: 18, color: Color(0xFF9E9E9E)),
                    suffixText: '(\$/hour)',
                    suffixStyle: const TextStyle(color: Color(0xFF9E9E9E), fontSize: 12),
                    border: InputBorder.none,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF00C7A7), width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ] else ...[
                // Filters for Tours (có thể thêm later)
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Tour filters coming soon',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 32),

              // Apply Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onApply({
                      'tab': _selectedTab,
                      'date': _dateController.text,
                      'languages': _selectedLanguages.toList(),
                      'fee': _feeController.text,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C7A7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'APPLY FILTERS',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}