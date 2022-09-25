package = "${PACKAGE_NAME}"
version = "${RELEASE_VERSION}-0"
source = {
    url = "git+https://github.com/${GITHUB_REPOSITORY}",
    dir = "${PACKAGE_NAME}"
}

description = {
    summary = "",
    detailed = [[]],
    homepage = "https://github.com/${GITHUB_REPOSITORY}",
    license = "Apache 2.0"
}

dependencies = {
    "luasec",
    "luasocket",
    "ltn12",
    "lua-cjson"
}

build = {
    type = "builtin",
    modules = {
        ["kong.plugins.${PACKAGE_NAME}.access"]     = "kong/plugins/${PACKAGE_NAME}/access.lua",
        ["kong.plugins.${PACKAGE_NAME}.handler"]    = "kong/plugins/${PACKAGE_NAME}/handler.lua",
        ["kong.plugins.${PACKAGE_NAME}.exceptions"] = "kong/plugins/${PACKAGE_NAME}/exceptions.lua",
        ["kong.plugins.${PACKAGE_NAME}.schema"]     = "kong/plugins/${PACKAGE_NAME}/schema.lua",
    }
}