import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_training/models/grocery_item.dart';
import 'package:flutter_training/screens/grocery_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryItemScreen extends StatefulWidget {
  //onCreate is a callback that lets you know
  // when a new item is created.
  final Function(GroceryItem) onCreate;

  //onUpdate is a callback that returns the
  // updated grocery item.
  final Function(GroceryItem) onUpdate;
  final GroceryItem originalItem;

  //isUpdating determines whether the user is
  // creating or editing an item.
  final bool isUpdating;

  const GroceryItemScreen(
      {Key key,
      this.onCreate,
      this.onUpdate,
      this.originalItem,
      }) : isUpdating = (originalItem != null), super(key: key);

  @override
  _GroceryItemScreenState createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.amber;
  int _currentSliderValue = 0;

  @override
  void initState() {
    if (widget.originalItem != null) {
      _nameController.text = widget.originalItem.name;
      _currentSliderValue = widget.originalItem.quantity;
      _importance = widget.originalItem.importance;
      _currentColor = widget.originalItem.color;
      final date = widget.originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO 12: Add GroceryItemScreen Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                    //TODO 24: ADD CALLBACK HANDLE
                final groceryItem = GroceryItem(
                  name: _nameController.text,
                  importance: _importance,
                  color: _currentColor,
                  quantity: _currentSliderValue.toInt(),
                  date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day, _timeOfDay.hour,_timeOfDay.minute)
                );
                if(widget.isUpdating){
                  widget.onUpdate(groceryItem);
                }
                else {
                  widget.onCreate(groceryItem);
                }
                  })
        ],
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // TODO 13: Add name TextField
            BuildNameField(),
            SizedBox(height: 10.0,),
            // TODO 14: Add Importance selection
            BuildImportantField(),
            SizedBox(height: 10.0,),
            // TODO 15: Add date picker
            BuildDateField(),
            SizedBox(height: 10.0,),
            // TODO 16: Add time picker
            BuildTimeField(),
            SizedBox(height: 10.0,),
            // TODO 17: Add color picker
             BuildColorPicker(),
             SizedBox(height: 10.0,),
            // TODO 18: Add slider
            BuildQuantityField(),
            SizedBox(height: 10.0,),
            // TODO: 19: Add Grocery Tile
            GroceryTitle(
              item: GroceryItem(
                name: _name,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day, _timeOfDay.hour, _timeOfDay.minute)
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget BuildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'E.g Bananas, Apples',
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: _currentColor)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: _currentColor)),
          ),
        )
      ],
    );
  }

  Widget BuildImportantField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        Wrap(
          spacing: 10.0,
          children: [
            ChoiceChip(
                label: Text(
                  'low',
                  style: TextStyle(color: Colors.white),
                ),
                selected: _importance == Importance.low,
              selectedColor: _currentColor,
              onSelected: (selected) {
                  setState(() => _importance =Importance.low);
              },
            ),
            ChoiceChip(label: Text('medium', style: TextStyle(color: Colors.white),),
              selectedColor: _currentColor,
              selected: _importance == Importance.medium,
              onSelected: (selected) {
              setState(() {
                return _importance = Importance.medium;
              });
              },),
            ChoiceChip(label: Text('high', style: TextStyle(color: Colors.white),),
              selectedColor: _currentColor,
              selected: _importance == Importance.high,
              onSelected: (selected) {
                setState(() {
                  return _importance = Importance.high;
                });
              },)
          ],
        )
      ],
    );
  }

  Widget BuildDateField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Date', style: GoogleFonts.lato(fontSize: 28.0)),
            TextButton(child: Text('Select'),
              onPressed: () async {
              final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                context: context,
                initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if(selectedDate != null) {
                  _dueDate = selectedDate;
                  }
                });
              },
            )
          ],
        ),
    if(_dueDate != null) Text('${DateFormat('yyyy-MM-dd').format(_dueDate)}')
      ],
    );

  }

  Widget BuildTimeField(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Time of Day', style: GoogleFonts.lato(fontSize: 28.0),),
            TextButton(onPressed: () async {
              final timeOfDay = await showTimePicker(context: context, initialTime: TimeOfDay.now());
              setState(() {
                if(timeOfDay != null){
                  _timeOfDay = timeOfDay;
                }
              });
            }, child: Text('Select'))
          ],
        ),
       if(_timeOfDay != null) Text('${_timeOfDay.format(context)}')
      ],
    );
  }

  Widget BuildColorPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50.0,
              width: 10.0,
              color: _currentColor,
            ),
            SizedBox(width: 8,),
            Text('Color', style: GoogleFonts.lato(fontSize: 28.0),)
          ],
        ),
        TextButton(onPressed: () {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              content: BlockPicker(
                pickerColor: Colors.white,
                onColorChanged: (color) {
                  setState(() {
                    _currentColor = color;
                  });
                },
              ),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('Save'))
              ],
            );
          });
        }, child: Text('Color Picker', style: GoogleFonts.lato(fontSize: 28.0),))
      ],
    );
  }

  Widget BuildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quantity', style: GoogleFonts.lato(fontSize: 28.0),),
            SizedBox(width: 16.0,),
            Text(
              _currentSliderValue.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            ),
          ],
        ),
        Slider(
          min: 0.0,
          max: 100.0,
          divisions: 100,
          label: _currentSliderValue.toInt().toString(),
          inactiveColor: _currentColor.withOpacity(0.5),
            activeColor: _currentColor,
            value: _currentSliderValue.toDouble(),
            onChanged: (double value) {
          setState(() {
            _currentSliderValue = value.toInt();
          });
        })
      ],
    );
  }
}
