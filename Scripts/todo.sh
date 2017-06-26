# if you don't use swiftlint add this script
KEYWORDS="TODO:|FIXME:|\?\?\?:|\!\!\!:"
FILE_EXTENSIONS="swift|h|m|mm|c|cpp"
find -E "${SRCROOT}" -ipath "${SRCROOT}/Carthage" -prune -o -ipath "${SRCROOT}/pods" -prune -o \( -regex ".*\.($FILE_EXTENSIONS
