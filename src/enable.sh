#!/bin/bash
# --------------------------------------------------
#
# Package: devenv
# Author: Josh Grancell <josh@joshgrancell.com>
# Description: Devenv command runner
# File Version: 1.0.0
#
# --------------------------------------------------
function enable() {
    TARGET_PATH="$BASE_DIRECTORY/templates/compose_parts/$TARGET"

    if [[ -d "$TARGET_PATH" ]]; then
        if [[ -f "$TARGET_PATH/$ENABLE_VERSION.yml" ]]; then
            cp "$TARGET_PATH/$ENABLE_VERSION.yml" "$ENABLED_PROJECTS_DIRECTORY/"
        else
            echo "The specified version for $TARGET ($ENABLE_VERSION) is not supported."
            echo "Supported versions are:"
            for FILE in $(find "$TARGET_PATH" -type f -name "*.yml" | $SED_BINARY 's/.yml//g'); do
                echo "  - $FILE"
            done
            exit 1
        fi
    else
        echo "$TARGET is not a supported service. Supported services are:"
        echo "  - mariadb"
        echo "  - postgres"
        echo "  - phpmyadmin"
        exit 1
    fi
}
