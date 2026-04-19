"""Run this script to sort the ``seed.txt`` file."""

from pathlib import Path

HERE = Path(__file__).parent.resolve()
ROOT = HERE.parent.resolve()
SEED_PATH = ROOT.joinpath("seed.txt")


def main():
    curies = set(SEED_PATH.read_text().splitlines())
    SEED_PATH.write_text("\n".join(sorted(curies)))


if __name__ == "__main__":
    main()
