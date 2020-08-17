require("compiler.compile")

local str = [[
    кляйнер напиши = print

    лутмейнер ТрапПоехавший(arg)
        кляйнер ответ
        поясни_за_лут arg == "да" тогда
            ответ = бля_буду
        ну_или
            ответ = бля_нет
        умри
        раздать_лут ответ
    умри

    напиши(ТрапПоехавший("да"))
    напиши(ТрапПоехавший("хуй"))
    ]]

local code = compiler.CompileString(str)
local f, err = loadstring(code)
if err then 
    print(err)
    print()
    print(code)
else
    f()
end
