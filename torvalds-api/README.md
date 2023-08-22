# Torvalds API

- "WHAT THE F**K" - Linus Torvalds

A API written in Flask that features the best rants from Linus Torvalds while developing Linux.

## Installation
You will need to use the Poetry dependency manager (https://python-poetry.org/)
```bash
git clone https://gitlab.com/jocadbz/torvalds-api.git
cd torvalds-api
poetry update
poetry run python3 torvalds_api/__init__.py 
```

## Usage

If you are on Linux or Mac, use:
`curl http://127.0.0.1:5000/ai-quotes/`

While Windows, if you don't have curl, you can just open the URL above on your browser to see the results.



### **Big hat tip to [Albert](https://github.com/corollari) for creating the [Linus Rants repo](https://github.com/corollari/linusrants), from which most of the rants here come from.**