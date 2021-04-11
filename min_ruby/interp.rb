require "./minruby"

env = {}

def evaluate(tree, env)
    case tree[0]
    when "func_call"
        p(evaluate(tree[2], env))
    when "stmts"
        i = 1
        while tree[i]
            evaluate(tree[i], env)
            i += 1
        end
    when "var_assign"
        env[tree[1]] = evaluate(tree[2], env)
    when "var_ref"
        env[tree[1]]
    when "if"
        if evaluate(tree[1], env)
            evaluate(tree[2], env)
        else
            evaluate(tree[3], env)
        end
    when "lit"
        tree[1]
    when "+"
        evaluate(tree[1], env) + evaluate(tree[2], env)
        env["plus_count"] += 1
    when "-"
        evaluate(tree[1], env) - evaluate(tree[2], env)
    when "*"
        evaluate(tree[1], env) * evaluate(tree[2], env)
    when "/"
        evaluate(tree[1], env) / evaluate(tree[2], env)
    when "%"
        evaluate(tree[1], env) % evaluate(tree[2], env)
    when "**"
        evaluate(tree[1], env) ** evaluate(tree[2], env)
    when "=="
        evaluate(tree[1], env) == evaluate(tree[2], env) ? true : false
    when "!="
        evaluate(tree[1], env) != evaluate(tree[2], env) ? true : false
    when "<"
        evaluate(tree[1], env) < evaluate(tree[2], env) ? true : false
    when ">"
        evaluate(tree[1], env) > evaluate(tree[2], env) ? true : false
    else
        pp(tree)
    end
end

str = minruby_load()
tree = minruby_parse(str)
evaluate(tree, env)