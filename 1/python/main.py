
def findFirstDigit(line):
    numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ]
    for c in line:
        for i, n in enumerate(numbers):
            if (c == n):
                return i
    return 0

def findFirstDigit2(line, inverted = False):
    numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9' ]
    words = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    for pos, c in enumerate(line):
        for i, n in enumerate(numbers):
            if (c == n):
                return i + 1
        for i, word in enumerate(words):
            if (not inverted) and line[pos:].startswith(word):
                return i + 1
            elif inverted and line[pos:].startswith(word[::-1]):
                return i + 1

    return 0

def part2(data):
    sum = 0
    
    for line in data:
        sum += 10 * findFirstDigit2(line)
        sum += findFirstDigit2(line[::-1], True)

    return sum

def part1(data):
    sum = 0

    for line in data:
        sum += 10 * findFirstDigit(line)
        sum += findFirstDigit(line[::-1])
    return sum





def main():
    data = open('../input.txt', 'r').read().split('\n')
    print(part1(data))
    print(part2(data))

    return 0







if __name__ == "__main__":
    main()
