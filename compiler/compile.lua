compiler = {}

local lua_table = {
    "";
    "local";
    "function";
    "do";
    "return";
    "end";
    "table";
    "require";
    "for";
    "while";
    "until";
    "break";
    "in";
    "then";
    "if";
    "else";
    "elseif";
    "true";
    "false";
    "or";
    "and";
}


local translation_table = {
    --global
    {"god", "год"};

    --local
    {"kleiner", "кляйнер"};



    --function
    {"lootmainer", "лутмейнер"};

    --do
    {"leave_cade", "выйти_из_кейда"};

    --return
    {"giveaway_loot", "раздать_лут"};

    --end
    {"die", "умри"};



    --table
    {"inventory", "инвентарь"};

    --require
    {"steal_loots", "стырить_луты"};



    --for
    {"farm", "фарм"};

    --while
    {"zmain_while", "змейни_пока"};

    --until
    {"zmain_before", "змейни_до"};

    --break
    {"hide_from_zmainers", "спрятаться_от_змейнеров"};
    
    --in
    {"in", "в"};
    
    --then
    {"then", "тогда"};



    --if
    {"if", "поясни_за_лут"};

    --else
    {"else", "ну_или"};

    --elseif
    {"elseif", "elseif"}; --wip

    --true
    {"fuck_yeah", "бля_буду"};

    --false
    {"fuck_no", "бля_нет"};

    --or
    {"or", "или"};

    --and
    {"and", "и"};
}



function compiler.CompileFile(filepath)
    local contents = love.filesystem.read(filepath)

    local tbl = {}
    for str in string.gmatch(contents, "([^".."%s".."]+)") do
        table.insert(tbl, str)
    end

    for i, str in ipairs(tbl) do
        for _, trans in ipairs(translation_table) do
            for _, var in ipairs(trans) do
                if str == var then
                    tbl[i] = lua_table[i]
                end
            end
        end
    end

    local output = ""
    for _, var in ipairs(tbl) do
        output = output.." "..var
    end

    return output
end



function compiler.CompileString(str)
    local tbl = {}
    for str in string.gmatch(str, "([^".."%s".."]+)") do
        table.insert(tbl, str)
    end

    for line, str in ipairs(tbl) do
        for newline, trans in ipairs(translation_table) do
            for _, var in ipairs(trans) do
                if str == var then
                    tbl[line] = lua_table[newline]
                end
            end
        end
    end

    local output = ""
    for _, var in ipairs(tbl) do
        output = output.." "..var
    end

    return output
end