#!/usr/bin/env bash

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
readonly OLD_PROJECT_NAME='flutter_boilerplate'
readonly REQUIRED_FLUTTER_VERSION='3.44.7'

fail() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

usage() {
  printf 'Usage: %s <package-id> <destination> [app-name]\n' "$0"
  printf 'Example: %s com.example.my_app ../my_app "My App"\n' "$0"
}

if (( $# < 2 || $# > 3 )); then
  usage
  exit 64
fi

readonly PACKAGE_ID="$1"
readonly DESTINATION="$2"
readonly PROJECT_NAME="${PACKAGE_ID##*.}"
readonly ORGANIZATION="${PACKAGE_ID%.*}"
readonly APP_NAME="${3:-$PROJECT_NAME}"

if [[ ! "$PACKAGE_ID" =~ ^[a-z][a-z0-9_]*(\.[a-z][a-z0-9_]*)+$ ]]; then
  fail 'package-id must use reverse-domain lowercase form, such as com.example.my_app.'
fi

if [[ "$APP_NAME" == *'"'* || "$APP_NAME" == *$'\n'* ]]; then
  fail 'app-name cannot contain a double quote or newline.'
fi

command -v rsync >/dev/null 2>&1 || fail 'rsync is required.'
command -v perl >/dev/null 2>&1 || fail 'perl is required.'

declare -a FLUTTER_COMMAND
declare -a DART_COMMAND
if command -v fvm >/dev/null 2>&1; then
  FLUTTER_COMMAND=(fvm flutter)
  DART_COMMAND=(fvm dart)
elif command -v flutter >/dev/null 2>&1 && command -v dart >/dev/null 2>&1; then
  FLUTTER_COMMAND=(flutter)
  DART_COMMAND=(dart)
else
  fail 'Flutter is required. Prefer: dart pub global activate fvm'
fi

readonly FLUTTER_VERSION_OUTPUT="$("${FLUTTER_COMMAND[@]}" --version | head -n 1)"
if [[ "$FLUTTER_VERSION_OUTPUT" != *"Flutter $REQUIRED_FLUTTER_VERSION "* ]]; then
  fail "Flutter $REQUIRED_FLUTTER_VERSION is required: $FLUTTER_VERSION_OUTPUT"
fi

readonly DESTINATION_PARENT="$(cd "$(dirname "$DESTINATION")" && pwd)"
readonly DESTINATION_PATH="${DESTINATION_PARENT}/$(basename "$DESTINATION")"

if [[ -e "$DESTINATION_PATH" ]]; then
  fail "destination already exists: $DESTINATION_PATH"
fi

printf 'Creating %s at %s\n' "$PROJECT_NAME" "$DESTINATION_PATH"

cd "$SCRIPT_DIR"
"${FLUTTER_COMMAND[@]}" create \
  --org "$ORGANIZATION" \
  --project-name "$PROJECT_NAME" \
  --description "$APP_NAME" \
  --platforms android,ios,web,linux,macos,windows \
  "$DESTINATION_PATH"

for directory in lib test docs .github .vscode; do
  rsync -a --delete "$SCRIPT_DIR/$directory/" "$DESTINATION_PATH/$directory/"
done

for file in \
  .fvmrc \
  .gitignore \
  AGENTS.md \
  README.md \
  analysis_options.yaml \
  l10n.yaml \
  pubspec.lock \
  pubspec.yaml; do
  cp "$SCRIPT_DIR/$file" "$DESTINATION_PATH/$file"
done

export OLD_PROJECT_NAME PROJECT_NAME APP_NAME
perl -0pi -e \
  's/^name:.*$/name: $ENV{PROJECT_NAME}/m; s/^description:.*$/description: "$ENV{APP_NAME}"/m' \
  "$DESTINATION_PATH/pubspec.yaml"

find "$DESTINATION_PATH/lib" "$DESTINATION_PATH/test" \
  -type f -name '*.dart' \
  -exec perl -pi -e \
    's/\Q$ENV{OLD_PROJECT_NAME}\E/$ENV{PROJECT_NAME}/g' {} +

perl -0pi -e \
  's#(<key>CFBundleDisplayName</key>\s*<string>)[^<]*(</string>)#${1}$ENV{APP_NAME}${2}#' \
  "$DESTINATION_PATH/ios/Runner/Info.plist"
perl -pi -e \
  's/android:label="[^"]*"/android:label="$ENV{APP_NAME}"/' \
  "$DESTINATION_PATH/android/app/src/main/AndroidManifest.xml"

cd "$DESTINATION_PATH"
"${FLUTTER_COMMAND[@]}" pub get
"${FLUTTER_COMMAND[@]}" gen-l10n
"${DART_COMMAND[@]}" run build_runner build
"${DART_COMMAND[@]}" fix --apply --code=directives_ordering
"${DART_COMMAND[@]}" format lib test
"${FLUTTER_COMMAND[@]}" analyze --fatal-infos
"${FLUTTER_COMMAND[@]}" test

printf 'Created and verified: %s\n' "$DESTINATION_PATH"
printf "Run with: cd '%s' && fvm flutter run\n" "$DESTINATION_PATH"
