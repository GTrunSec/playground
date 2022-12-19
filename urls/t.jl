using JSON3, DataFrames
using StaticCompiler, StaticTools
# json_string = """{"a": 1, "b": "hello, world"}"""
# hello_world = JSON3.read(json_string)
# println(hello_world)

using
function grades_2020()
    name = ["Sally", "Bob", "Alice", "Hank"]
    grade_2020 = [1, 5, 8.5, 4]
    DataFrame(; name, grade_2020)
end
compile_executable(grades_2020, (), "./")
