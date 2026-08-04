import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final dartFiles = Directory('lib')
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => file.path.endsWith('.dart'))
      .toList(growable: false);
  final packageName = RegExp(
    r'^name:\s*([^\s]+)',
    multiLine: true,
  ).firstMatch(File('pubspec.yaml').readAsStringSync())!.group(1)!;

  test('GetX is absent from source and dependencies', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    final hasGetDependency = RegExp(
      r'^\s*get\s*:',
      multiLine: true,
    ).hasMatch(pubspec);
    expect(hasGetDependency, isFalse);

    for (final file in dartFiles) {
      final source = file.readAsStringSync();
      expect(
        source,
        isNot(
          contains(
            'package:'
            'get/',
          ),
        ),
        reason: '${file.path} must not import GetX.',
      );
    }
  });

  test('feature layer dependency directions are enforced', () {
    final featureFiles = dartFiles.where(
      (file) => file.path.contains('/features/'),
    );

    for (final file in featureFiles) {
      final ownerLayer = _featureLayerFrom(file.path);
      for (final import in _importsOf(file)) {
        final importedPath = _resolveImport(
          owner: file,
          import: import,
          packageName: packageName,
        );
        final importedLayer = _featureLayerFrom(importedPath);
        final importsApp =
            importedPath.startsWith('lib/app/') ||
            importedPath.contains('/lib/app/');
        final hasInvalidLayerDependency = switch (ownerLayer) {
          'domain' => importedLayer != null && importedLayer != 'domain',
          'application' =>
            importedLayer == 'data' || importedLayer == 'presentation',
          'data' =>
            importedLayer == 'application' || importedLayer == 'presentation',
          'presentation' => importedLayer == 'data',
          _ => true,
        };

        expect(
          importsApp || hasInvalidLayerDependency,
          isFalse,
          reason: '${file.path} has an invalid layer import: $import',
        );

        if (ownerLayer == 'domain') {
          final importsFlutter =
              import.startsWith('package:flutter/') ||
              import.startsWith('package:flutter_riverpod/') ||
              import.startsWith('package:go_router/');
          expect(
            importsFlutter,
            isFalse,
            reason: '${file.path} domain must remain Flutter-independent.',
          );
        }
      }
    }
  });

  test('features do not import other features through any path style', () {
    for (final file in dartFiles.where(
      (candidate) => candidate.path.contains('/features/'),
    )) {
      final owner = _featureNameFrom(file.path);
      for (final import in _importsOf(file)) {
        final importedPath = _resolveImport(
          owner: file,
          import: import,
          packageName: packageName,
        );
        final importedFeature = _featureNameFrom(importedPath);
        final importsAnotherFeature =
            importedFeature != null && importedFeature != owner;
        expect(
          importsAnotherFeature,
          isFalse,
          reason: '${file.path} imports another feature: $import',
        );
      }
    }
  });

  test('core and shared do not depend on features', () {
    final neutralFiles = dartFiles.where(
      (file) =>
          file.path.startsWith('lib/core/') ||
          file.path.startsWith('lib/shared/'),
    );

    for (final file in neutralFiles) {
      for (final import in _importsOf(file)) {
        final importedPath = _resolveImport(
          owner: file,
          import: import,
          packageName: packageName,
        );
        expect(
          _featureNameFrom(importedPath),
          isNull,
          reason: '${file.path} must remain feature-neutral.',
        );
      }
    }
  });
}

Iterable<String> _importsOf(File file) sync* {
  final importPattern = RegExp("^import ['\"]([^'\"]+)['\"];", multiLine: true);
  for (final match in importPattern.allMatches(file.readAsStringSync())) {
    yield match.group(1)!;
  }
}

String _resolveImport({
  required File owner,
  required String import,
  required String packageName,
}) {
  final ownPackagePrefix = 'package:$packageName/';
  if (import.startsWith(ownPackagePrefix)) {
    return 'lib/${import.substring(ownPackagePrefix.length)}';
  }
  if (import.startsWith('.')) {
    return File.fromUri(owner.parent.uri.resolve(import)).path;
  }
  return import;
}

String? _featureNameFrom(String path) {
  final match = RegExp(r'(?:^|/)features/([^/]+)/').firstMatch(path);
  return match?.group(1);
}

String? _featureLayerFrom(String path) {
  return RegExp(
    r'(?:^|/)features/[^/]+/(domain|data|application|presentation)/',
  ).firstMatch(path)?.group(1);
}
