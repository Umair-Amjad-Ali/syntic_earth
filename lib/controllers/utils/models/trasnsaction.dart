Map<String, List<Transaction>> groupTransactionsByDate(
  List<Transaction> transactions,
) {
  Map<String, List<Transaction>> grouped = {};
  for (var tx in transactions) {
    grouped.putIfAbsent(tx.date, () => []).add(tx);
  }
  return grouped;
}

// Transaction Model
class Transaction {
  final String name;
  final int amount;
  final String time;
  final bool isIncoming;
  final String date;

  Transaction({
    required this.name,
    required this.amount,
    required this.time,
    required this.isIncoming,
    required this.date,
  });
}
