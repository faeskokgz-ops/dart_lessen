import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  final VoidCallback onToggleLanguage;
  const CalendarPage({super.key, required this.onToggleLanguage});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final Map<DateTime, List<String>> _events = {};

  List<String> _getEventsForDay(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return _events[key] ?? [];
  }

  void _addEvent() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(Localizations.localeOf(context).languageCode == 'ru' ? 'Новое событие' : 'New Event'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: Localizations.localeOf(context).languageCode == 'ru' ? 'Название события' : 'Event Title',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(Localizations.localeOf(context).languageCode == 'ru' ? 'Отмена' : 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                final key = DateTime(
                  _selectedDay.year,
                  _selectedDay.month,
                  _selectedDay.day,
                );
                setState(() {
                  _events.putIfAbsent(key, () => []);
                  _events[key]!.add(controller.text);
                });
              }
              Navigator.pop(context);
            },
            child: Text(Localizations.localeOf(context).languageCode == 'ru' ? 'Добавить' : 'Add'),
          ),
        ],
      ),
    );
  }

  void _editEvent(int index) {
    final key = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
    final controller = TextEditingController(text: _events[key]![index]);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(Localizations.localeOf(context).languageCode == 'ru' ? 'Редактировать событие' : 'Edit Event'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: Localizations.localeOf(context).languageCode == 'ru' ? 'Название события' : 'Event Title',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(Localizations.localeOf(context).languageCode == 'ru' ? 'Отмена' : 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  _events[key]![index] = controller.text;
                });
              }
              Navigator.pop(context);
            },
            child: Text(Localizations.localeOf(context).languageCode == 'ru' ? 'Сохранить' : 'Save'),
          ),
        ],
      ),
    );
  }

  void _deleteEvent(int index) {
    final key = DateTime(_selectedDay.year, _selectedDay.month, _selectedDay.day);
    setState(() {
      _events[key]!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final events = _getEventsForDay(_selectedDay);
    final isRu = Localizations.localeOf(context).languageCode == 'ru';

    return Scaffold(
      appBar: AppBar(
        title: Text(isRu ? 'Календарь' : 'Calendar'),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: widget.onToggleLanguage,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addEvent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          TableCalendar(
            locale: Localizations.localeOf(context).languageCode,
            firstDay: DateTime.utc(2020),
            lastDay: DateTime.utc(2030),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getEventsForDay,
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            isRu
                ? 'Выбрано: ${_selectedDay.day}.${_selectedDay.month}.${_selectedDay.year}'
                : 'Selected: ${_selectedDay.month}/${_selectedDay.day}/${_selectedDay.year}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: events.isEmpty
                ? Center(
                    child: Text(isRu ? 'Событий нет' : 'No events'),
                  )
                : ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (_, index) => Card(
                      child: ListTile(
                        leading: const Icon(Icons.event),
                        title: Text(events[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _editEvent(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteEvent(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}