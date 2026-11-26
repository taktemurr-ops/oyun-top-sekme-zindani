import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_top_sekme_zindani/oyun_top_sekme_zindani.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(topSekmeZindaniConfig.title.length, 33);
    expect(topSekmeZindaniConfig.tagline.length, 33);
    for (final s in topSekmeZindaniConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(topSekmeZindaniConfig.gameId, topSekmeZindaniId);
    expect(topSekmeZindaniRules.gameId, topSekmeZindaniId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(topSekmeZindaniRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: topSekmeZindaniId, optionalMechanics: topSekmeZindaniRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(topSekmeZindaniRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
