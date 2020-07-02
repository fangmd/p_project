import 'dart:math';

import 'package:flutter/scheduler.dart';
import 'package:p_project/utils/logger.dart';

/// 利用动画的 Tinker 计算 fps
class FPSUtils {
  int _lastCalcTime;
  Ticker _ticker;
  double _ticks = 0;
  double _fps;

  int get nowMs => DateTime.now().millisecondsSinceEpoch;

  double get totalTimeMs => (15 * 1000).toDouble(); // 15s

  double get sampleTimeMs => (0.5) * 1000; // 0.5s

  double get fps => _fps;

  int maxFps = 60;

  start() {
    _ticker = Ticker(_handleTick);
    _ticker.start();
    _lastCalcTime = nowMs;
  }

  _handleTick(Duration d) {
    // Tick
    _ticks++;
    Logger.d(msg: '$_ticks');
    // Calculate
    if (nowMs - _lastCalcTime > sampleTimeMs) {
      int remainder = (nowMs - _lastCalcTime - sampleTimeMs).round();
      _lastCalcTime = nowMs - remainder;
      _fps = min(
          (_ticks * 1000 / sampleTimeMs).roundToDouble(), maxFps.toDouble());
      _ticks = 0;
      //Add new entry, remove old ones
      // _entries.add(FpsEntry(_lastCalcTime, _fps));
      // _entries.removeWhere((e) => nowMs - e.time > totalTimeMs);
      // notifyListeners();
      Logger.d(msg: '=== $_fps');
    }
  }
}
