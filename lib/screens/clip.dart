import 'package:flutter/material.dart';

enum ClipMode { none, rect, rrect }

class ClipPage extends StatefulWidget {
  const ClipPage({super.key});
  @override
  State<ClipPage> createState() => _ClipPageState();
}

class _ClipPageState extends State<ClipPage> {
  ClipMode _mode = ClipMode.none;
  double _radius = 24;
  Clip _behavior = Clip.antiAlias;

  // The "content" we clip. It is deliberately LARGER than its 220x140 box,
  Widget _content() {
    return OverflowBox(
      maxWidth: 560,
      maxHeight: 420,
      child: Image.network(
        'https://picsum.photos/360/260',
        fit: BoxFit.contain,
        // Fallback so the demo still works offline.
        errorBuilder: (_, _, _) => Container(
          width: 360,
          height: 260,
          decoration: const BoxDecoration(
            color: Colors.blue
          ),
          alignment: Alignment.center,
          child: const Text('360 x 260 content',
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
      ),
    );
  }

  // The fixed-size box the content lives in.
  Widget _boxed() => SizedBox(width: 460, height: 340, child: _content());

  // Apply the currently selected clip.
  Widget _clipped() {
    switch (_mode) {
      case ClipMode.none:
        return _boxed();
      case ClipMode.rect:
        return ClipRect(clipBehavior: _behavior, child: _boxed());
      case ClipMode.rrect:
        return ClipRRect(
          borderRadius: BorderRadius.circular(_radius),
          clipBehavior: _behavior,
          child: _boxed(),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ClipRect & ClipRRect', style: TextStyle(fontWeight: FontWeight.bold),)),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue, // Change to your preferred color
              width: 2.0, // Border thickness
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // A dashed-ish reference box showing the 220x140 bounds.
              Container(
                width: 560,
                height: 420,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 5),
                ),
                child: _clipped(),
              ),
              SizedBox(height: 28),
              Text('Mode: ${_mode.name}   ·   behavior: ${_behavior.name}',
                  style: TextStyle(color: Colors.amber),
                  ),
              SizedBox(height: 26),
              // Step 1-3: switching the clip mode.
              Wrap(
                spacing: 10,
                children: [
                  _btn('No clip (overflow)', _mode == ClipMode.none,
                      () => setState(() => _mode = ClipMode.none)),
                  _btn('ClipRect', _mode == ClipMode.rect,
                      () => setState(() => _mode = ClipMode.rect)),
                  _btn('ClipRRect', _mode == ClipMode.rrect,
                      () => setState(() => _mode = ClipMode.rrect)),
                ],
              ),
              const SizedBox(height: 12),
          
              Wrap(
                spacing: 10,
                children: [
                  _btn('hardEdge', _behavior == Clip.hardEdge,
                      () => setState(() => _behavior = Clip.hardEdge)),
                  _btn('antiAlias', _behavior == Clip.antiAlias,
                      () => setState(() => _behavior = Clip.antiAlias)),
                  _btn('saveLayer', _behavior == Clip.antiAliasWithSaveLayer,
                      () => setState(() => _behavior = Clip.antiAliasWithSaveLayer)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _btn(String label, bool active, VoidCallback onTap) {
    return FilledButton.tonal(
      onPressed: onTap,
      style: active
          ? FilledButton.styleFrom(backgroundColor: const Color(0xFF1565C0),
              foregroundColor: Colors.white)
          : null,
      child: Text(label),
    );
  }
}