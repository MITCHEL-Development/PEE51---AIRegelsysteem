"""Unittests voor berekeningen."""

import unittest
import mijn_package.berekeningen as b


class TestBerekeningen(unittest.TestCase):
    """Testcase voor de berekeningen module."""

    def test_tel_op(self) -> None:
        """Test of de optelling correct werkt."""
        self.assertEqual(b.tel_op(2, 3), 5)
        self.assertEqual(b.tel_op(-1, 1), 0)
        self.assertEqual(b.tel_op(0, 0), 0)


if __name__ == "__main__":
    unittest.main()
