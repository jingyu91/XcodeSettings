#! /bin/sh

function print_example() {
    echo "Example"
    echo "  icons ios ~/AppIcon.png ~/Icons/"
}
    
function print_usage() {
    echo "Usage"
    echo "  icons <ios|watch|macos> in-file.png (out-dir)"
}

function command_exists() {
    if type "$1" >/dev/null 2>&1; then
        return 1
    else
        return 0
    fi
}

if command_exists "sips" == 0 ; then
    echo "sips tool not found"
    exit 1
fi

if [ "$1" = "--help" ] || [ "$1" = "-h" ] ; then
    print_usage
    exit 0
fi

PLATFORM="$1"
FILE="$2"
if [ -z "$PLATFORM" ] || [ -z "$FILE" ] ; then
    echo "Error: missing arguments"
    echo ""
    print_usage
    echo ""
    print_example
    exit 1
fi

DIR="$3"
if [ -z "$DIR" ] ; then
    DIR=$(dirname $FILE)
fi

# Create directory if needed
mkdir -p "$DIR"

if [[ "$PLATFORM" == *"ios"* ]] ; then # iOS
    sips -Z '120'  "${FILE}" --out "${DIR}"/iPhone@2x.png
    sips -Z '180'  "${FILE}" --out "${DIR}"/iPhone@3x.png
    sips -Z '29'   "${FILE}" --out "${DIR}"/iPadSettings.png
    sips -Z '58'   "${FILE}" --out "${DIR}"/iPadSettings@2x.png
    sips -Z '58'   "${FILE}" --out "${DIR}"/iPhoneSettings@2x.png
    sips -Z '87'   "${FILE}" --out "${DIR}"/iPhoneSettings@3x.png
    sips -Z '40'   "${FILE}" --out "${DIR}"/iPadSpotlight.png
    sips -Z '80'   "${FILE}" --out "${DIR}"/iPadSpotlight@2x.png
    sips -Z '80'   "${FILE}" --out "${DIR}"/iPhoneSpotlight@2x.png
    sips -Z '120'  "${FILE}" --out "${DIR}"/iPhoneSpotlight@3x.png
    sips -Z '76'   "${FILE}" --out "${DIR}"/iPad.png
    sips -Z '152'  "${FILE}" --out "${DIR}"/iPad@2x.png
    sips -Z '167'  "${FILE}" --out "${DIR}"/iPadPro@2x.png
    sips -Z '40'   "${FILE}" --out "${DIR}"/iPhoneNotification@2x.png
    sips -Z '60'   "${FILE}" --out "${DIR}"/iPhoneNotification@3x.png
    sips -Z '20'   "${FILE}" --out "${DIR}"/iPadNotification.png
    sips -Z '40'   "${FILE}" --out "${DIR}"/iPadNotification@2x.png
    sips -Z '1024' "${FILE}" --out "${DIR}"/AppStoreMarketing.png
    
    # https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/AppIconType.html
    contents_json='{"images":[{"size":"20x20","idiom":"iphone","filename":"iPhoneNotification@2x.png","scale":"2x"},{"size":"20x20","idiom":"iphone","filename":"iPhoneNotification@3x.png","scale":"3x"},{"size":"29x29","idiom":"iphone","filename":"iPhoneSettings@2x.png","scale":"2x"},{"size":"29x29","idiom":"iphone","filename":"iPhoneSettings@3x.png","scale":"3x"},{"size":"40x40","idiom":"iphone","filename":"iPhoneSpotlight@2x.png","scale":"2x"},{"size":"40x40","idiom":"iphone","filename":"iPhoneSpotlight@3x.png","scale":"3x"},{"size":"60x60","idiom":"iphone","filename":"iPhone@2x.png","scale":"2x"},{"size":"60x60","idiom":"iphone","filename":"iPhone@3x.png","scale":"3x"},{"size":"20x20","idiom":"ipad","filename":"iPadNotification.png","scale":"1x"},{"size":"20x20","idiom":"ipad","filename":"iPadNotification@2x.png","scale":"2x"},{"size":"29x29","idiom":"ipad","filename":"iPadSettings.png","scale":"1x"},{"size":"29x29","idiom":"ipad","filename":"iPadSettings@2x.png","scale":"2x"},{"size":"40x40","idiom":"ipad","filename":"iPadSpotlight.png","scale":"1x"},{"size":"40x40","idiom":"ipad","filename":"iPadSpotlight@2x.png","scale":"2x"},{"size":"76x76","idiom":"ipad","filename":"iPad.png","scale":"1x"},{"size":"76x76","idiom":"ipad","filename":"iPad@2x.png","scale":"2x"},{"size":"83.5x83.5","idiom":"ipad","filename":"iPadPro@2x.png","scale":"2x"},{"size":"1024x1024","idiom":"ios-marketing","filename":"AppStoreMarketing.png","scale":"1x"}],"info":{"version":1,"author":"xcode"}}'
    echo $contents_json > "${DIR}"/Contents.json
fi

if [[ "$PLATFORM" == *"watch"* ]] ; then # Apple Watch
    # complication
    # modular
    sips -Z '52'  "${FILE}" --out "${DIR}"/Watch38mmComplicationModular@2x.png
    sips -Z '58'  "${FILE}" --out "${DIR}"/Watch40mm42mmComplicationModular@2x.png
    sips -Z '64'  "${FILE}" --out "${DIR}"/Watch44mmComplicationModular@2x.png
    
    # circular
    sips -Z '32'  "${FILE}" --out "${DIR}"/Watch38mmComplicationCircular@2x.png
    sips -Z '36'  "${FILE}" --out "${DIR}"/Watch40mm42mmComplicationCircular@2x.png
    sips -Z '40'  "${FILE}" --out "${DIR}"/Watch44mmComplicationCircular@2x.png
    
    # utility
    sips -Z '40'  "${FILE}" --out "${DIR}"/Watch38mmComplicationUtility@2x.png
    sips -Z '44'  "${FILE}" --out "${DIR}"/Watch40mm42mmComplicationUtility@2x.png
    sips -Z '50'  "${FILE}" --out "${DIR}"/Watch44mmComplicationUtility@2x.png

    # Extra Large
    sips -Z '182'  "${FILE}" --out "${DIR}"/Watch38mmComplicationExtraLarge@2x.png
    sips -Z '203'  "${FILE}" --out "${DIR}"/Watch40mm42mmComplicationExtraLarge@2x.png
    sips -Z '224'  "${FILE}" --out "${DIR}"/Watch44mmComplicationExtraLarge@2x.png

    # Graphic Corner
    sips -Z '40'  "${FILE}" --out "${DIR}"/Watch38mmComplicationGraphicCorner@2x.png
    sips -Z '40'  "${FILE}" --out "${DIR}"/Watch40mm42mmComplicationGraphicCorner@2x.png
    sips -Z '44'  "${FILE}" --out "${DIR}"/Watch44mmComplicationGraphicCorner@2x.png

    # Graphic Circular
    sips -Z '84'  "${FILE}" --out "${DIR}"/Watch38mmComplicationGraphicCircular@2x.png
    sips -Z '84'  "${FILE}" --out "${DIR}"/Watch40mm42mmComplicationGraphicCircular@2x.png
    sips -Z '94'  "${FILE}" --out "${DIR}"/Watch44mmComplicationGraphicCircular@2x.png

    sips -Z '48'  "${FILE}" --out "${DIR}"/Watch38mmNotificationCenter.png
    sips -Z '55'  "${FILE}" --out "${DIR}"/Watch42mmNotificationCenter.png
    sips -Z '58'  "${FILE}" --out "${DIR}"/WatchCompanionSettings@2x.png
    sips -Z '87'  "${FILE}" --out "${DIR}"/WatchCompanionSettings@3x.png
    sips -Z '80'  "${FILE}" --out "${DIR}"/Watch38MM42MMHomeScreen.png
    sips -Z '88'  "${FILE}" --out "${DIR}"/Watch40MMHomeScreen.png
    sips -Z '100' "${FILE}" --out "${DIR}"/Watch44MMHomeScreen.png
    sips -Z '172' "${FILE}" --out "${DIR}"/Watch38MMShortLook.png
    sips -Z '196' "${FILE}" --out "${DIR}"/Watch40MM42MMShortLook.png
    sips -Z '216' "${FILE}" --out "${DIR}"/Watch44MMShortLook.png
    sips -Z '1024' "${FILE}" --out "${DIR}"/WatchAppStore.png

    # https://developer.apple.com/library/archive/documentation/Xcode/Reference/xcode_ref-Asset_Catalog_Format/AppIconType.html
    contents_json='{"images":[{"size":"24x24","idiom":"watch","scale":"2x","filename":"Watch38mmNotificationCenter.png","role":"notificationCenter","subtype":"38mm"},{"size":"27.5x27.5","idiom":"watch","scale":"2x","filename":"Watch42mmNotificationCenter.png","role":"notificationCenter","subtype":"42mm"},{"size":"29x29","idiom":"watch","filename":"WatchCompanionSettings@2x.png","role":"companionSettings","scale":"2x"},{"size":"29x29","idiom":"watch","filename":"WatchCompanionSettings@3x.png","role":"companionSettings","scale":"3x"},{"size":"40x40","idiom":"watch","filename":"Watch38MM42MMHomeScreen.png","scale":"2x","role":"appLauncher","subtype":"38mm"},{"size":"44x44","idiom":"watch","scale":"2x","filename":"Watch40MMHomeScreen.png","role":"appLauncher","subtype":"40mm"},{"size":"50x50","idiom":"watch","scale":"2x","filename":"Watch44MMHomeScreen.png","role":"appLauncher","subtype":"44mm"},{"size":"86x86","idiom":"watch","scale":"2x","filename":"Watch38MMShortLook.png","role":"quickLook","subtype":"38mm"},{"size":"98x98","idiom":"watch","scale":"2x","filename":"Watch40MM42MMShortLook.png","role":"quickLook","subtype":"42mm"},{"size":"108x108","idiom":"watch","scale":"2x","filename":"Watch44MMShortLook.png","role":"quickLook","subtype":"44mm"},{"idiom":"watch-marketing","filename":"WatchAppStore.png","size":"1024x1024","scale":"1x"}],"info":{"version":1,"author":"xcode"}}'
    echo $contents_json > "${DIR}"/Contents.json
fi

if [[ "$PLATFORM" == *"macos"* ]] ; then # macOS
    sips -Z '1024' "${FILE}" --out "${DIR}"/icon_512x512@2x.png
    sips -Z '512'  "${FILE}" --out "${DIR}"/icon_512x512.png
    sips -Z '512'  "${FILE}" --out "${DIR}"/icon_256x256@2x.png
    sips -Z '256'  "${FILE}" --out "${DIR}"/icon_256x256.png
    sips -Z '256'  "${FILE}" --out "${DIR}"/icon_128x128@2x.png
    sips -Z '128'  "${FILE}" --out "${DIR}"/icon_128x128.png
    sips -Z '64'   "${FILE}" --out "${DIR}"/icon_32x32@2x.png
    sips -Z '32'   "${FILE}" --out "${DIR}"/icon_32x32.png
    sips -Z '32'   "${FILE}" --out "${DIR}"/icon_16x16@2x.png
    sips -Z '16'   "${FILE}" --out "${DIR}"/icon_16x16.png
fi