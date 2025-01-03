import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {},
          ),
        ],
      ),
      body: const ExpenseScreenBody(),
    );
  }
}

class ExpenseScreenBody extends HookWidget {
  const ExpenseScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final moneyText = useState<int>(0);
    final descriptionText = useState<String>('');
    final pickedDate = useState<DateTime>(DateTime.now());

    void updateMoneyText(String text) {
      moneyText.value = int.tryParse(text) ?? 0;
      print(moneyText.value);
    }

    void updateDescriptionText(String text) {
      descriptionText.value = text;
      print(descriptionText.value);
    }

    void updateDate(DateTime date) {
      pickedDate.value = date;
      print(pickedDate.value);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '支出を追加',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 24),
          ExpenseForm(
            onMoneyChanged: updateMoneyText,
            onDescriptionChanged: updateDescriptionText,
          ),
          const SizedBox(height: 16),
          DatePicker(onDateChanged: updateDate),
          const SizedBox(height: 24),
          const SubmitButtton(),
        ],
      ),
    );
  }
}

class ExpenseForm extends HookWidget {
  ExpenseForm({
    super.key,
    required this.onMoneyChanged,
    required this.onDescriptionChanged,
  });

  final _textMoneyController = useTextEditingController();
  final _textDescriptionController = useTextEditingController();
  final void Function(String) onMoneyChanged;
  final void Function(String) onDescriptionChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '金額',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _textMoneyController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            hintText: '金額を入力してください',
            filled: true,
          ),
          onChanged: onMoneyChanged,
        ),
        const SizedBox(height: 16),
        const Text(
          '項目',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: _textDescriptionController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            hintText: '項目を入力してください',
            filled: true,
          ),
          onChanged: onDescriptionChanged,
        ),
      ],
    );
  }
}

class DatePicker extends HookWidget {
  DatePicker({super.key, required this.onDateChanged});

  final _date = useState<DateTime>(DateTime.now());
  final void Function(DateTime) onDateChanged;

  Future<void> onElevatedButtonPressed(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: _date.value,
      firstDate: DateTime(_date.value.year - 1),
      lastDate: DateTime(_date.value.year + 1),
    );
    if (date != null) {
      _date.value = date;
      onDateChanged(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '日付',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () => onElevatedButtonPressed(context),
                icon: const Icon(
                  Icons.calendar_today,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${_date.value.year}/${_date.value.month}/${_date.value.day}',
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
        ),
      ],
    );
  }
}

class SubmitButtton extends StatelessWidget {
  const SubmitButtton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 36,
      child: ElevatedButton(
        //TODO: Implement onPressed
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: const Text('追加'),
      ),
    );
  }
}
