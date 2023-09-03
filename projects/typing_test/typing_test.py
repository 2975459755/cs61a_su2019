'''
Score function is interesting
'''

""" Typing Test implementation """

from utils import *
from ucb import main

# BEGIN Q1-5
"*** YOUR CODE HERE ***"
def lines_from_file(path):
    with open(path) as file:
        return [strip(line) for line in readlines(file)]
        # return [strip(line) for line in \
        #     sum([split(line, '\n') for line in readlines(file)], [])]

def new_sample(path, i):
    return lines_from_file(path)[i]

def analyze(sample_paragraph, typed_string, start_time, end_time):
    # both time are measured in second
    duration = (end_time - start_time) / 60

    def analyze_WPM(typed_string = typed_string, duration = duration):
        return len(typed_string) / 5 / duration

    def analyze_Acc(sample_paragraph = sample_paragraph, typed_string = typed_string):
        # in terms of number of /words/
        # if typed > sample: extra words don't count
        # if typed < sample: only typed words are counted
        # extraneous whitespace is ignored
        sample, typed = str_to_words(sample_paragraph.split(), []),\
                        str_to_words(typed_string.split(), []) 
        # ↑↑↑ delete the second argument [] to eliminate the punctuations
        length = min(len(sample), len(typed))
        acc = length

        for i in range(length):
            if sample[i] != typed[i]:
                acc -= 1

        if length:
            return acc / length * 100
        else:
            return 0.0

    return [analyze_WPM(), analyze_Acc()]

def str_to_words(string, puncs = [',', '.', '!', '?', '"']):
    # utils function for analyze_Acc
    # takes in a list of strings(without whitespace)
    if puncs == []:
        return string
    else:
        return str_to_words([w for w in sum([word.split(puncs[0]) for\
            word in string], []) if w != ''], puncs[1:])

def pig_latin(word):
    # starts with consonant: dog -> og + d + ay
    # starts with vowel: elephant -> elephant + way
    # does not contain a vowel: nth -> nth + ay
    # upper-case is not considered
    # non-alphabetic charaters are considered consonants
    vowels = ['a', 'e', 'i', 'o', 'u']
    if word[0] in vowels:
        return word + 'way'
    else:
        # (lambda f: lambda w: f(f, w))(lambda f, w: w[0] in vowels if len(w) == 1 else w[0] in vowels or f(f, w[1:]))(word)
        # ↑↑↑ a one-line function that returns whether a word contains vowels (inspired by hw02)
        prefix = ''
        while word != '' and word[0] not in vowels:
            prefix += word[0]
            word = word[1:]
        return word + prefix + 'ay'

def autocorrect(user_input, words_list, score_function):
    if user_input in words_list:
        return user_input
    else:
        return min(words_list, key = lambda w: score_function(user_input, w))

def swap_score(s1, s2):
    if min(s1, s2) == '':
        return 0
    elif s1[0] != s2[0]:
        return 1 + swap_score(s1[1:], s2[1:])
    else:
        return swap_score(s1[1:], s2[1:])
# END Q1-5

# Question 6

'''
def score_function(word1, word2):
    """A score_function that computes the edit distance between word1 and word2."""

    # tetng -> te's'tng -> test'i'ng
    # rlogcul -> logcul -> logicul -> logical
    # misspelled -> isspelled -> spelled -> spellied
    #   -> spellind -> spelling
    l1, l2 = len(word1), len(word2)

    if word1 == word2: # Fill in the condition
        # BEGIN Q6
        "*** YOUR CODE HERE ***"
        return 0 
        # END Q6

    elif word1[0] == word2[0]: # Feel free to remove or add additional cases
        # BEGIN Q6
        "*** YOUR CODE HERE ***"
        return score_function(word1[1:], word2[1:])

        # END Q6
        # min([score_function(word1[i:], word2[j:]) + score_function(word1[i:], word1)\
        # + score_function(word2[j:], word2) for i in range(l1) for j in range(l2)])

    else:
        add_char = add_weight + score_function(word1, word2[1:])  # Fill in these lines
        remove_char =  del_weight + score_function(word1[1:], word2)
        substitute_char = subs_weight + score_function(word1[1:], word2[1:]) 
        # BEGIN Q6
        "*** YOUR CODE HERE ***"
        return min(add_char, remove_char, substitute_char)
        # END Q6
'''

subs_weight = 1
del_weight = 1
add_weight = 1

def score_function(word1, word2):

    if find(word1, word2):
        return abs(len(word1) - len(word2))
    
    if word1[0] == word2[0]:
        return score_function(word1[1:], word2[1:])

    return min(subs_weight + score_function(word2[0] + word1[1:], word2),\
                del_weight + score_function(word1[1:], word2))

'''
def find(w1, w2):
    # recursive find; runs slower
    l1, l2 = len(w1), len(w2)
    if w1 in w2:
        return True
    elif l1 > l2:
        return find(w2, w1)
    elif l1 == l2 or l2 <= 2:
        return False
    else:
        return max([find(w1, w2[:i] + w2[i+1:]) for i in range(l2-2)])
'''

# find: check substring
def find(w1, w2, f = True):
    l1, l2 = len(w1), len(w2)
    if w1 in w2:
        return True
    elif l1 > l2 and f:
        return find(w2, w1, False)
    elif l1 == l2 or l2 <= 2:
        return False
    else:
        i = 1
        while i < l2 and w1[0] != w2[i]:
            i += 1
        return i != l2 and find(w1[1:], w2[i+1:], False)

KEY_DISTANCES = get_key_distances()

# BEGIN Q7-8
"*** YOUR CODE HERE ***"
def score_function_accurate(word1, word2):

    if find(word1, word2):
        return abs(len(word1) - len(word2))
    
    if word1[0] == word2[0]:
        return score_function_accurate(word1[1:], word2[1:])

    subs_weight = KEY_DISTANCES[word1[0], word2[0]]

    return min(subs_weight + score_function_accurate(word2[0] + word1[1:], word2),\
                del_weight + score_function_accurate(word1[1:], word2))

memory = {}

def score_function_final(word1, word2):

    if (word1, word2) in memory.keys():
        return memory[word1, word2]

    if find(word1, word2):
        res = abs(len(word1) - len(word2))
        memory[word1, word2], memory[word2, word1] = res, res
        return res
    
    if word1[0] == word2[0]:
        res = score_function_final(word1[1:], word2[1:])
        memory[word1, word2], memory[word2, word1] = res, res
        return res

    subs_weight = KEY_DISTANCES[word1[0], word2[0]]

    memory[word2[0] + word1[1:], word2] = score_function_final(word2[0] + word1[1:], word2)
    memory[word2, word2[0] + word1[1:]] = memory[word2[0] + word1[1:], word2]
    memory[word1[1:], word2] = score_function_final(word1[1:], word2)
    memory[word2, word1[1:]] = memory[word1[1:], word2]
    return min(subs_weight + memory[word2[0] + word1[1:], word2],\
                del_weight + memory[word1[1:], word2])    
# END Q7-8
