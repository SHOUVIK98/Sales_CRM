import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../../../common_components/forms/form_screen/event_management_form_widget.dart';
// import '../../../common_components/forms/widgets/event_management_form_widget.dart';
import '../controller/calender_controller.dart';
import '../forms/form_screen/event_management_form_widget.dart';
import '../widgets/calender_widgets.dart';


class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalendarControllerX calendarControllerX = Get.put(CalendarControllerX()); // Initialize the controller

    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (view) {
              calendarControllerX.changeView(view);
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: "Month", child: Text("Month View")),
              PopupMenuItem(value: "Week", child: Text("Week View")),
              PopupMenuItem(value: "Day", child: Text("Day View")),
            ],
          ),
          // Icon button to select a date
          IconButton(
            icon: Icon(Icons.calendar_month),
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: calendarControllerX.selectedDate.value,
                firstDate: DateTime(2000, 1),
                lastDate: DateTime(2100, 12),
                initialDatePickerMode: DatePickerMode.year,
              );
              if (picked != null) {
                calendarControllerX.changeDate(picked);
              }
            },
          ),
        ],
      ),
      body: CalendarWidget(), // Display the calendar view
      floatingActionButton: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.72,
            right: MediaQuery.of(context).size.width * 0.01,
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return EventFormModal();
                      }
                  );
                },
              ),
          )
        ],
      ),
    );
  }
}





