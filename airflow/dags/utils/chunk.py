from itertools import islice
from typing import Iterable, Iterator


def chunk(it: Iterable, size: int) -> Iterator:
    """Returns spitted  by chunks iterable object"""
    it = iter(it)
    return iter(lambda: tuple(islice(it, size)), ())
