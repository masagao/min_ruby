# require "./minruby"

# pp(minruby_parse("
#     i = 0
#     while i < 10
#         p(i)
#         i = i + 1
#     end
# "))

i = 0
while i < 10
    p(i)
    i = i + 1
end
