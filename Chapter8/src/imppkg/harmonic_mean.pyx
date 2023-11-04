def harmonic_mean(someList: list):
    """https://en.wikipedia.org/wiki/Harmonic_mean"""
    return len(someList) / sum(1 / x for x in someList)
