
--# CommonFunctions


--Counter Function
function counter()
    local i = 0
    return function()
        i = i+1
        return i
        end
end
--------------------------------

--Dump a Table
function dump(t,indent)
    local names = {}
    if not indent then indent = "" end
    for n,g in pairs(t) do
        table.insert(names,n)
    end
    table.sort(names)
    for i,n in pairs(names) do
        local v = t[n]
        if type(v) == "table" then
            if(v==t) then -- prevent endless loop if table contains reference to itself
                print(indent..tostring(n)..": <-")
            else
                print(indent..tostring(n)..":")
                dump(v,indent.."   ")
            end
        else
            if type(v) == "function" then
                print(indent..tostring(n).."()")
            else
                print(indent..tostring(n)..": "..tostring(v))
            end
        end
    end
end
-------------------------------------------------

--Debug Functions
function debug(d,str)
   if d == true then print("---DEBUG Print---"); print(str) end 
end

function debugf(d,f, ...)
    if d == true then print("---debugf---"); return f(unpack(arg)) end
end
function debugd(d,t)
    if d == true then dump(t) end
end
------------------------------------------------









--# FileIO
local DEBUG = false
f = 0
        
function readCSV(data)
   local  m = data
    local t = {}                   -- table to store the indices
    local idx = 0
    local idx2 = 0
    local i = 0
    local brk = 0
    
    while true do
        brk = string.find(m,"\n",idx2)
        i= string.find(m, ",",idx)    -- find 'next' newline
          if i == nil then 

            if brk == string.find(m,"\n",#m) then
                local txt = string.sub(m,idx,#m -1)
                table.insert(t,txt)
                break
            end
        local txt = string.sub(m,idx,#m)
        table.insert(t,txt)
        break 
        end
            if brk >=idx and brk <= i then
                --print("loaded")
                idx2 = brk+1
                local txt = string.sub(m,idx,brk-1)
                table.insert(t,txt)
                idx = brk+1
                txt = "brk"
                table.insert(t,txt)
                txt = string.sub(m,idx,i-1)
                table.insert(t,txt) 
            idx=i+1 
        else
            local txt = string.sub(m,idx,i-1)
              table.insert(t, txt)
            idx = i+1
            
        end
    end
    --table.insert(t,"brk")
    debugf(DEBUG,dump,t)
    return t
end

function getFile(file)
    
    
    http.request(file,didGetData)
    print("f is "..f)
    
    print("returning F")
    return f
end

function didGetData(data,status,head)
    print(status)
        f = data
        print("File Request Sucess!")
        
    end
