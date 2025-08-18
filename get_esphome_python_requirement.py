import re
import requests
from bs4 import BeautifulSoup
from packaging.version import parse as parse_version

CHANGELOG_URL = "https://esphome.io/changelog/"

def fetch_changelog():
    response = requests.get(CHANGELOG_URL)
    response.raise_for_status()
    return response.text

def extract_python_versions(html):
    soup = BeautifulSoup(html, "html.parser")
    candidates = set()

    for tag in soup.find_all(["p", "li", "div", "strong", "em", "code"]):
        text = tag.get_text(strip=True)
        # Look for things like "Python 3.10", "Python >= 3.11", etc.
        matches = re.findall(r'Python\s*[>=]*\s*3\.\d+', text, flags=re.IGNORECASE)
        for match in matches:
            version_match = re.search(r'3\.\d+', match)
            if version_match:
                candidates.add(version_match.group())

    return sorted(candidates, key=parse_version, reverse=True)

def main():
    print("Fetching ESPHome changelog...")
    html = fetch_changelog()
    print("Scanning for Python version requirement...")
    versions = extract_python_versions(html)
    if versions:
        print(f"ESPHome requires Python >= {versions[0]}")
    else:
        print("Could not determine required Python version from changelog.")

if __name__ == "__main__":
    main()

