import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendar extends StatefulWidget {
  final double width;
  final Color selectedColor;
  final TextStyle? monthStyle;
  final TextStyle? dayStyle;
  final TextStyle? dateStyle;
  final int yearRange; // Default: 50 years before/after current
  final Function(DateTime)? onDateSelected;

  const CustomCalendar({
    super.key,
    this.width = 340,
    this.selectedColor = Colors.teal,
    this.monthStyle,
    this.dayStyle,
    this.dateStyle,
    this.yearRange = 50,
    this.onDateSelected,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime selectedDate;
  late DateTime currentMonth;
  late ScrollController _yearScrollController;
  String viewMode = 'date'; // 'date', 'month', 'year'

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    currentMonth = DateTime(selectedDate.year, selectedDate.month);
    _yearScrollController = ScrollController();
  }

  @override
  void dispose() {
    _yearScrollController.dispose();
    super.dispose();
  }

  void _goToPreviousMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
    });
  }

  void _goToNextMonth() {
    setState(() {
      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    });
  }

  void _changeView(String newView) {
    setState(() {
      viewMode = newView;
    });

    if (newView == 'year') {
      // Wait for frame to build before jumping
      WidgetsBinding.instance.addPostFrameCallback((_) {
        int currentYear = DateTime.now().year;
        int startYear = currentYear - widget.yearRange;
        int index = selectedDate.year - startYear;
        double itemExtent = 60; // Approximate item height
        _yearScrollController.jumpTo((index * itemExtent) - 120);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = widget.width;
    final cellWidth = screenWidth / 7;

    return Container(
      width: screenWidth,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))
        ],
      ),
      child: Column(
        children: [
          // Header (Month / Year)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, color: Colors.teal),
                onPressed:
                    viewMode == 'date' ? _goToPreviousMonth : null, // Disable in month/year view
              ),
              GestureDetector(
                onTap: () {
                  if (viewMode == 'date') {
                    _changeView('month');
                  } else if (viewMode == 'month') {
                    _changeView('year');
                  }
                },
                child: Text(
                  viewMode == 'date'
                      ? DateFormat.yMMMM().format(currentMonth)
                      : viewMode == 'month'
                          ? '${currentMonth.year}'
                          : 'Select Year',
                  style: widget.monthStyle ??
                      const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right, color: Colors.teal),
                onPressed:
                    viewMode == 'date' ? _goToNextMonth : null, // Disable in month/year view
              ),
            ],
          ),

          const SizedBox(height: 10),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: viewMode == 'date'
                ? _buildDateView(cellWidth)
                : viewMode == 'month'
                    ? _buildMonthGrid()
                    : _buildYearGrid(),
          ),
        ],
      ),
    );
  }

  // --- DATE VIEW ---
  Widget _buildDateView(double cellWidth) {
    final daysInMonth = DateTime(currentMonth.year, currentMonth.month + 1, 0).day;
    final firstWeekday = DateTime(currentMonth.year, currentMonth.month, 1).weekday;
    final totalCells = firstWeekday - 1 + daysInMonth;
    final totalRows = (totalCells / 7).ceil();
    final totalHeight = totalRows * 48.0 + 40; // Adjusts height automatically

    return Column(
      key: const ValueKey('date_view'),
      children: [
        // Weekday Row
        Row(
          children: List.generate(7, (i) {
            final weekday = DateFormat.E().dateSymbols.STANDALONESHORTWEEKDAYS[i];
            return Expanded(
              child: Center(
                child: Text(
                  weekday,
                  style: widget.dayStyle ??
                      const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 5),

        SizedBox(
          height: totalHeight,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
            ),
            itemCount: totalRows * 7,
            itemBuilder: (context, index) {
              final dayNum = index - (firstWeekday - 2);
              if (dayNum <= 0 || dayNum > daysInMonth) {
                return const SizedBox.shrink();
              }

              final thisDate = DateTime(currentMonth.year, currentMonth.month, dayNum);
              final isSelected = thisDate.day == selectedDate.day &&
                  thisDate.month == selectedDate.month &&
                  thisDate.year == selectedDate.year;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedDate = thisDate;
                    widget.onDateSelected?.call(thisDate);
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isSelected ? widget.selectedColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '$dayNum',
                      style: widget.dateStyle ??
                          TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // --- MONTH GRID ---
  Widget _buildMonthGrid() {
    final months = List.generate(12, (i) => DateFormat.MMMM().format(DateTime(0, i + 1)));
    return SizedBox(
      key: const ValueKey('month_view'),
      height: 290,
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: months.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 2.3,
        ),
        itemBuilder: (context, index) {
          final isSelected = index + 1 == selectedDate.month &&
              currentMonth.year == selectedDate.year;

          return GestureDetector(
            onTap: () {
              setState(() {
                currentMonth = DateTime(currentMonth.year, index + 1);
                viewMode = 'date';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? widget.selectedColor : Colors.teal.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  months[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.teal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // --- YEAR GRID ---
  Widget _buildYearGrid() {
    final currentYear = DateTime.now().year;
    final startYear = currentYear - widget.yearRange;
    final years = List.generate(widget.yearRange * 2 + 1, (i) => startYear + i);

    return SizedBox(
      key: const ValueKey('year_view'),
      height: 290, // fixed height like 7x6 grid
      child: GridView.builder(
        controller: _yearScrollController,
        padding: const EdgeInsets.all(8),
        itemCount: years.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          final year = years[index];
          final isSelected = year == selectedDate.year;

          return GestureDetector(
            onTap: () {
              setState(() {
                currentMonth = DateTime(year, currentMonth.month);
                viewMode = 'month';
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? widget.selectedColor : Colors.teal.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '$year',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.teal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
