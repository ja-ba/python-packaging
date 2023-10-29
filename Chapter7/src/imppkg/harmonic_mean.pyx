def harmonic_mean(someList: list):
    return len(someList) / sum(1 / x for x in someList)
