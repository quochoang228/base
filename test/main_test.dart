import 'package:base/feature/example/ui/provider/example_provider.dart';
import 'package:test/test.dart';

import 'provider_container_test.dart';

void main() {
  // test('Some description', () {
  //   // Create a ProviderContainer for this test.
  //   // DO NOT share ProviderContainers between tests.
  //   final container = createContainer();
  //
  //   expect(
  //    container.read(categoryProvider),
  //     NotLoaded<List<CategoryDto>>(),
  //
  //   );
  // });
  test('Some description', () {
    // Create a ProviderContainer for this test.
    // DO NOT share ProviderContainers between tests.
    final container = createContainer();

    final test = container.read(testProvider);

    expect(test, 'testProvider');

    // final subscription = container.listen(categoryProvider, (previous, next) {
    //
    // });

    // final dasss = container.read(categoryProvider);
    //
    // expect(
    //   // Equivalent to `container.read(provider)`
    //   // But the provider will not be disposed unless "subscription" is disposed.
    //   dasss,
    //   NotLoaded<List<CategoryDto>>(),
    // );
  });
}
