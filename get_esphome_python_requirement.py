import re
import requests
from bs4 import BeautifulSoup

# URL of the ESPHome changelog
CHANGELOG_URL = "https://esphome.io/changelog/"

def fetch_changelog():
    response = requests.get(CHANGELOG_URL)
    response.raise_for_status()
    return response.text

def extract_python_version(html):
    soup = BeautifulSoup(html, 'html.parser')
    version_blocks = soup.find_all(['p', 'li'])

    for block in version_blocks:
        text = block.get_text(strip=True)
        # Match "Python 3.x" or "Python >= 3.x"
        match = re.search(r'Python\s*(>=|=>|=)?\s*3\.(\d+)', text, re.IGNORECASE)
        if match:
            return f"3.{match.group(2)} (found in text: '{text}')"
    return "Could not determine required Python version from changelog."

def main():
    print("Fetching ESPHome changelog...")
    html = fetch_changelog()
    print("Scanning for Python version requirement...")
    version = extract_python_version(html)
    print(f"ESPHome requires Python >= {version}")

if __name__ == "__main__":
    main()
