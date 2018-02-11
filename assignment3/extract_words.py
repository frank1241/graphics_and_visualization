import re

def main():
    # Initialize output files
    allWordsOuptut = open("allwords.txt", 'w')
    uniqueWordsOutput = open("uniquewords.txt", 'w')
    wordFrequencyOutput = open("wordfrequency.txt", "w")

    # Open book for reading
    filePath = r"C:\Users\Frank Wang\Documents\2018 - 2019 School Work\4. Elements of Graphics and Visualization\2-11\TheVisionOfHell.txt"
    book = open(filePath, 'r', encoding='utf8')

    # create a dictionary of words and their respective frequencies
    wordDict = {}

    # read through the book line by line
    for line in book:
        # Strip line and lowercase
        line = line.strip().lower()
        word_list = re.findall("[a-z]+", line)

        # Add words to dictionary and write to allwords.txt
        for word in word_list:
            if len(word) == 1 and (word != 'a' or word != 'i'):
                pass
            else:
                allWordsOuptut.write(word + "\n")

                if word in wordDict:
                    wordDict[word] = wordDict[word] + 1
                else:
                    wordDict[word] = 1

    # Find all unique words
    for word in wordDict:
        if wordDict[word] == 1:
            uniqueWordsOutput.write(word + "\n")

    # Calculate word frequencies
    # create a dictionary of frequencies and their number of occurences

    freqDict = {}
    for word in wordDict:
        if wordDict[word] in freqDict:
            freqDict[wordDict[word]] += 1
        else:
            freqDict[wordDict[word]] = 1

    freqSorted = sorted(freqDict.keys())
    for freq in freqSorted:
        wordFrequencyOutput.write(str(freq) + ": " + str(freqDict[freq]) + "\n")

    # close files
    book.close()
    allWordsOuptut.close()
    uniqueWordsOutput.close()
    wordFrequencyOutput.close()

main()