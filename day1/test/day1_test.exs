defmodule Day1Test do
  use ExUnit.Case

  # Task 1

  test "Task 1: Sample input 1122 returns expected result of 3" do
    assert Day1.solution1("1122") == 3
  end

  test "Task 1: Sample input 1111 returns expected result of 4" do
    assert Day1.solution1("1111") == 4
  end

  test "Task 1: Sample input 1234 returns expected result of 0" do
    assert Day1.solution1("1234") == 0
  end

  test "Task 1: Sample input 91212129 returns expected result of 9" do
    assert Day1.solution1("91212129") == 9
  end


  # Task 2

  test "Task 2: Sample input 1212 returns expected result of 6" do
    assert Day1.solution2("1212") == 6
  end

  test "Task 2: Sample input 1221 returns expected result of 0" do
    assert Day1.solution2("1221") == 0
  end

  test "Task 2: Sample input 123425 returns expected result of 4" do
    assert Day1.solution2("123425") == 4
  end

  test "Task 2:Sample input 123123 returns expected result of 12" do
    assert Day1.solution2("123123") == 12
  end

  test "Task 2:Sample input 12131415 returns expected result of 4" do
    assert Day1.solution2("12131415") == 4
  end
end
