test = {
  'name': 'Problem 8',
  'points': 2,
  'suites': [
    {
      'cases': [
        {
          'code': r"""
          >>> check_passphrase(passphrase) # Ensuring you completed design doc & changed passphrase
          '9c557774afa3f7b5670f10a5ca54be0eedb8384a780375daa0340b45'
          """,
          'hidden': False,
          'locked': False
        },
        {
          'code': r"""
          >>> score1 = score_function_final("wird", "wiry")
          >>> score2 = score_function_final("wird", "bird")
          >>> score3 = score_function_final("wird", "wire")
          >>> score3 < score1 and score3 < score2
          True
          >>> score2 > score1
          True
          >>> int(score_function_final("speling", "spelling"))
          1
          >>> int(score_function_final("used", "use"))
          1
          >>> int(score_function_final("hash", "ash"))
          1
          >>> int(score_function_final("ash", "hash"))
          1
          """,
          'hidden': False,
          'locked': False
        },
        {
          'code': r"""
          >>> autocorrect("spellin", words_list, score_function_final)
          'spelling'
          >>> autocorrect("abstrction", words_list, score_function_final)
          'abstraction'
          >>> autocorrect("wird", words_list, score_function_final)
          'wire'
          >>> autocorrect("yest", words_list, score_function_final)
          'test'
          >>> autocorrect("abreviations", words_list, score_function_final)
          'abbreviations'
          """,
          'hidden': False,
          'locked': False
        }
      ],
      'scored': True,
      'setup': r"""
      >>> try:
      ...    from typing_test import score_function_final, autocorrect, lines_from_file
      ...    from utils import *
      ...    words_list = sorted(lines_from_file('data/words.txt'))
      ... except ImportError:
      ...    raise ImportError("You probably didn't define score_function_final in typing_test.py yet!")
      """,
      'teardown': '',
      'type': 'doctest'
    }
  ]
}
