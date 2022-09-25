local typedefs = require "kong.db.schema.typedefs"


return {
  name = "github-auth",
  fields = {
    { consumer = typedefs.no_consumer },
    { protocols = typedefs.protocols_http },
    { config = {
      type = "record",
      fields = {
        { github_api_addr = { type = "string", required = true, default = "https://api.github.com" } },
        { organization = { type = "string", required = true } },
        { hide_credentials = { type = "boolean", required = true, default = false }, },
        { allowed_methods = { type = "array", elements = typedefs.http_method, default = {} }, },
        { allowed_origins = { type = "array", elements = typedefs.ip , default = {} }, },
        { allowed_paths = { type = "array", elements = typedefs.path, default = {} }, },
    }, }, },
  },
}
