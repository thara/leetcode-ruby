# @param {String} s
# @return {Boolean}
def is_valid(s)
    return true if s.empty?

    stack = []
    s.each_char do |c|
        case c
        when '(', '{', '['
            stack.push(c)
        when ')'
            return false if stack.pop() != '('
        when '}'
            return false if stack.pop() != '{'
        when ']'
            return false if stack.pop() != '['
        end
    end
    return stack.empty?
end

# Runtime 59 ms Beats 100%
# Memory 211 MB Beats 60.39%
