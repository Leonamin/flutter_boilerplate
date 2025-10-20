#!/bin/zsh

# Flutter Boilerplate 프로젝트 생성 스크립트
# 사용법: ./create_project.sh <패키지_ID> <목적지_경로> [앱_이름]

set -e

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 함수: 에러 메시지 출력
error() {
    echo "${RED}❌ 에러: $1${NC}" >&2
    exit 1
}

# 함수: 성공 메시지 출력
success() {
    echo "${GREEN}✅ $1${NC}"
}

# 함수: 정보 메시지 출력
info() {
    echo "${BLUE}ℹ️  $1${NC}"
}

# 함수: 경고 메시지 출력
warning() {
    echo "${YELLOW}⚠️  $1${NC}"
}

# 함수: 패키지 ID 유효성 검사
validate_package_id() {
    local package_id=$1
    
    # 패키지 ID는 도메인 형식 (예: com.example.app, kr.zestcorp.app)
    if [[ ! $package_id =~ ^[a-z][a-z0-9_]*(\.[a-z][a-z0-9_]*)+$ ]]; then
        error "패키지 ID는 도메인 형식이어야 합니다 (예: com.example.app, kr.company.myapp)"
    fi
    
    # 각 세그먼트가 Dart 예약어가 아닌지 체크
    local reserved_words=("abstract" "as" "assert" "async" "await" "break" "case" "catch" "class" "const" "continue" "covariant" "default" "deferred" "do" "dynamic" "else" "enum" "export" "extends" "extension" "external" "factory" "false" "final" "finally" "for" "Function" "get" "hide" "if" "implements" "import" "in" "interface" "is" "late" "library" "mixin" "new" "null" "on" "operator" "part" "required" "rethrow" "return" "set" "show" "static" "super" "switch" "sync" "this" "throw" "true" "try" "typedef" "var" "void" "while" "with" "yield")
    
    # zsh에서 문자열을 배열로 분할
    local -a SEGMENTS
    SEGMENTS=("${(@s/./)package_id}")
    
    for segment in "${SEGMENTS[@]}"; do
        for word in "${reserved_words[@]}"; do
            if [[ $segment == $word ]]; then
                error "패키지 ID의 세그먼트로 Dart 예약어를 사용할 수 없습니다: $word"
            fi
        done
    done
}

# 함수: 패키지 ID에서 패키지명 추출 (마지막 세그먼트)
extract_package_name() {
    local package_id=$1
    echo "$package_id" | awk -F'.' '{print $NF}'
}

# 함수: 앱 이름 생성 (snake_case -> PascalCase)
generate_app_name() {
    local package_name=$1
    echo "$package_name" | awk -F'_' '{for(i=1;i<=NF;i++){$i=toupper(substr($i,1,1)) substr($i,2)}}1' OFS=''
}

# 함수: 패키지 경로 생성 (com.example.my_app -> com/example/my_app)
generate_package_path() {
    local package_id=$1
    echo "$package_id" | tr '.' '/'
}

# 인자 확인
if [[ $# -lt 2 ]]; then
    echo "사용법: $0 <패키지_ID> <목적지_경로> [앱_이름]"
    echo ""
    echo "예시:"
    echo "  $0 com.example.myapp ~/projects/my_app"
    echo "  $0 kr.zestcorp.seoulution ./my_app MyApp"
    echo "  $0 io.github.username.app /Users/dev/app"
    echo ""
    echo "인자:"
    echo "  패키지_ID      - Flutter 프로젝트 패키지 ID (예: com.example.app, kr.company.myapp)"
    echo "  목적지_경로    - 프로젝트를 복사할 경로 (절대경로 또는 상대경로)"
    echo "  앱_이름        - (선택) 앱 표시 이름 (예: MyApp). 생략시 패키지 ID에서 자동 생성"
    exit 1
fi

# 변수 설정
NEW_PACKAGE_ID=$1
DEST_PATH=$2
NEW_PACKAGE_NAME=$(extract_package_name "$NEW_PACKAGE_ID")
NEW_APP_NAME=${3:-$(generate_app_name "$NEW_PACKAGE_NAME")}

# 현재 스크립트의 디렉토리 (보일러플레이트 위치)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# 기존 패키지 정보
OLD_PACKAGE_NAME="flutter_boilerplate"
OLD_APP_NAME="Flutter_boilerplate"
OLD_PACKAGE_ID="com.example.flutter_boilerplate"

# 새 패키지 경로 생성
NEW_PACKAGE_PATH=$(generate_package_path "$NEW_PACKAGE_ID")
OLD_PACKAGE_PATH=$(generate_package_path "$OLD_PACKAGE_ID")

info "Flutter 보일러플레이트 프로젝트 생성 시작..."
echo ""
echo "설정 정보:"
echo "  - 패키지 ID: ${BLUE}${NEW_PACKAGE_ID}${NC}"
echo "  - 패키지명: ${BLUE}${NEW_PACKAGE_NAME}${NC}"
echo "  - 앱 이름: ${BLUE}${NEW_APP_NAME}${NC}"
echo "  - 목적지: ${BLUE}${DEST_PATH}${NC}"
echo ""

# 패키지 ID 유효성 검사
validate_package_id "$NEW_PACKAGE_ID"

# 목적지 경로를 절대경로로 변환
if [[ "$DEST_PATH" = /* ]]; then
    # 이미 절대경로
    DEST_ABS_PATH="$DEST_PATH"
else
    # 상대경로를 절대경로로 변환
    DEST_ABS_PATH="$(cd "$(dirname "$DEST_PATH")" 2>/dev/null && pwd)/$(basename "$DEST_PATH")" || {
        # 부모 디렉토리가 없는 경우
        PARENT_DIR="$(dirname "$DEST_PATH")"
        if [[ ! -d "$PARENT_DIR" ]]; then
            error "목적지의 부모 디렉토리가 존재하지 않습니다: $PARENT_DIR"
        fi
        DEST_ABS_PATH="$(cd "$PARENT_DIR" && pwd)/$(basename "$DEST_PATH")"
    }
fi

# 목적지가 이미 존재하는지 확인
if [[ -e "$DEST_ABS_PATH" ]]; then
    error "목적지가 이미 존재합니다: $DEST_ABS_PATH"
fi

# 1단계: 프로젝트 복사
info "1/6 프로젝트 파일 복사 중..."
rsync -a --exclude='.git' \
         --exclude='.dart_tool' \
         --exclude='build' \
         --exclude='.flutter-plugins' \
         --exclude='.flutter-plugins-dependencies' \
         --exclude='.packages' \
         --exclude='pubspec.lock' \
         --exclude='.vscode' \
         --exclude='.idea' \
         --exclude='*.iml' \
         --exclude='create_project.sh' \
         "$SCRIPT_DIR/" "$DEST_ABS_PATH/" || error "프로젝트 복사 실패"
success "프로젝트 파일 복사 완료"

cd "$DEST_ABS_PATH"

# 2단계: pubspec.yaml 수정
info "2/6 pubspec.yaml 수정 중..."
if [[ -f "pubspec.yaml" ]]; then
    sed -i '' "s/name: ${OLD_PACKAGE_NAME}/name: ${NEW_PACKAGE_NAME}/g" pubspec.yaml
    sed -i '' "s/description: \"Flutter Boilerplate\"/description: \"${NEW_APP_NAME}\"/g" pubspec.yaml
    success "pubspec.yaml 수정 완료"
else
    warning "pubspec.yaml 파일을 찾을 수 없습니다"
fi

# 3단계: Dart/Flutter 파일 내용 수정
info "3/6 Dart/Flutter 파일 수정 중..."
find . -type f \( -name "*.dart" -o -name "*.yaml" -o -name "*.json" -o -name "*.html" \) -not -path "*/.*" -exec sed -i '' "s/${OLD_PACKAGE_NAME}/${NEW_PACKAGE_NAME}/g" {} +
success "Dart/Flutter 파일 수정 완료"

# 4단계: Android 설정 수정
info "4/6 Android 설정 수정 중..."
if [[ -d "android" ]]; then
    # build.gradle.kts 수정
    if [[ -f "android/app/build.gradle.kts" ]]; then
        sed -i '' "s/namespace = \"${OLD_PACKAGE_ID}\"/namespace = \"${NEW_PACKAGE_ID}\"/g" android/app/build.gradle.kts
        sed -i '' "s/applicationId = \"${OLD_PACKAGE_ID}\"/applicationId = \"${NEW_PACKAGE_ID}\"/g" android/app/build.gradle.kts
    fi
    
    # AndroidManifest.xml 수정
    if [[ -f "android/app/src/main/AndroidManifest.xml" ]]; then
        sed -i '' "s/android:label=\"${OLD_PACKAGE_NAME}\"/android:label=\"${NEW_APP_NAME}\"/g" android/app/src/main/AndroidManifest.xml
    fi
    
    # MainActivity.kt 패키지 경로 수정
    # 실제 Kotlin 파일 찾기 (경로가 다를 수 있음)
    MAIN_ACTIVITY_FILE=$(find android/app/src/main/kotlin -name "MainActivity.kt" 2>/dev/null | head -n 1)
    
    if [[ -n "$MAIN_ACTIVITY_FILE" ]]; then
        # 임시 파일에 내용 저장
        TEMP_MAIN_ACTIVITY="/tmp/MainActivity_temp_$$.kt"
        sed "s/package com\.example\.[a-z_]*/package ${NEW_PACKAGE_ID}/g" "$MAIN_ACTIVITY_FILE" > "$TEMP_MAIN_ACTIVITY"
        
        # 기존 kotlin 디렉토리 전체 삭제
        find android/app/src/main/kotlin -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
        
        # 새 디렉토리 구조 생성 및 파일 복사
        NEW_KOTLIN_PATH="android/app/src/main/kotlin/${NEW_PACKAGE_PATH}"
        mkdir -p "$NEW_KOTLIN_PATH"
        mv "$TEMP_MAIN_ACTIVITY" "${NEW_KOTLIN_PATH}/MainActivity.kt"
    fi
    
    success "Android 설정 수정 완료"
else
    warning "android 디렉토리를 찾을 수 없습니다"
fi

# 5단계: iOS 설정 수정
info "5/6 iOS 설정 수정 중..."
if [[ -d "ios" ]]; then
    # Info.plist 수정
    if [[ -f "ios/Runner/Info.plist" ]]; then
        sed -i '' "s/<string>${OLD_APP_NAME}<\/string>/<string>${NEW_APP_NAME}<\/string>/g" ios/Runner/Info.plist
        sed -i '' "s/<string>${OLD_PACKAGE_NAME}<\/string>/<string>${NEW_PACKAGE_NAME}<\/string>/g" ios/Runner/Info.plist
    fi
    
    # project.pbxproj 수정
    if [[ -f "ios/Runner.xcodeproj/project.pbxproj" ]]; then
        sed -i '' "s/${OLD_PACKAGE_NAME}/${NEW_PACKAGE_NAME}/g" ios/Runner.xcodeproj/project.pbxproj
    fi
    
    success "iOS 설정 수정 완료"
else
    warning "ios 디렉토리를 찾을 수 없습니다"
fi

# 6단계: 기타 플랫폼 설정 수정
info "6/6 기타 플랫폼 설정 수정 중..."

# macOS
if [[ -d "macos" ]]; then
    find macos -type f \( -name "*.xcconfig" -o -name "*.pbxproj" -o -name "*.xcscheme" \) -exec sed -i '' "s/${OLD_PACKAGE_NAME}/${NEW_PACKAGE_NAME}/g" {} +
fi

# Linux
if [[ -d "linux" ]]; then
    find linux -type f \( -name "CMakeLists.txt" -o -name "*.cc" \) -exec sed -i '' "s/${OLD_PACKAGE_NAME}/${NEW_PACKAGE_NAME}/g" {} +
fi

# Windows
if [[ -d "windows" ]]; then
    find windows -type f \( -name "CMakeLists.txt" -o -name "*.rc" \) -exec sed -i '' "s/${OLD_PACKAGE_NAME}/${NEW_PACKAGE_NAME}/g" {} +
fi

# Web
if [[ -d "web" ]]; then
    find web -type f \( -name "*.html" -o -name "*.json" \) -exec sed -i '' "s/${OLD_PACKAGE_NAME}/${NEW_PACKAGE_NAME}/g" {} +
    find web -type f \( -name "*.html" -o -name "*.json" \) -exec sed -i '' "s/Flutter Boilerplate/${NEW_APP_NAME}/g" {} +
fi

success "기타 플랫폼 설정 수정 완료"

echo ""
success "🎉 프로젝트 생성 완료!"
echo ""
echo "다음 단계:"
echo "  1. cd ${DEST_ABS_PATH}"
echo "  2. flutter pub get"
echo "  3. flutter run"
echo ""
info "프로젝트 위치: ${DEST_ABS_PATH}"
