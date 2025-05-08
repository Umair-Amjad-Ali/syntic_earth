enum MessageStatus { sent, delivered, seen }

class ChatItem {
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final bool isTyping;
  final bool isSelected;
  final String avatar;
  final MessageStatus messageStatus; // NEW: Message Status

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
    required this.isTyping,
    required this.isSelected,
    required this.avatar,
    required this.messageStatus, // NEW
  });
}
