import 'package:flutter/material.dart';

class CartBottom extends StatefulWidget {
  int count;

  CartBottom({Key? key, required this.count}) : super(key: key);

  @override
  State<CartBottom> createState() => _CartBottomState();
}

class _CartBottomState extends State<CartBottom>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  late Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    offset = Tween<Offset>(
      begin: const Offset(0, 100),
      end: Offset.zero,
    ).animate(controller);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SlideTransition(
                  position: offset,
                  child: Text(
                    '${widget.count} Items',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Text(
                  '|',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const Text(
                  '1000',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                  'View Cart',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
