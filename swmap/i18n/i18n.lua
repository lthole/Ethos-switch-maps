local locale = system.getLocale()
--print("Get system language flag: ", locale)

local i18nMap = {
  en = assert(loadfile("i18n/en.lua"))(),
}

local i18nFiles = system.listFiles("i18n")
for _, value in ipairs(i18nFiles) do
  if value == (locale .. ".lua") then
    i18nMap[locale] = assert(loadfile("i18n/" .. locale .. ".lua"))()
  end
end

local function translate(key, paramTable)
  local ANSI_BOLD_YELLOW = "\27[1;33m"
  local ANSI_RESET = "\27[0m"
  local map = i18nMap[locale] or i18nMap['en']
  local translation = map[key] or i18nMap['en'][key]
  if not translation then
    warn(ANSI_BOLD_YELLOW..string.format("translate key \"%s\" is missing", key)..ANSI_RESET)
    return key
  end
  if paramTable ~= nil and type(paramTable) == 'table' then
    translation = translation:gsub("{{%s*(%w+)%s*}}", function(replacement)
      return tostring(paramTable[replacement] or "")
    end)
  end
  return translation
end

return { translate = translate }
