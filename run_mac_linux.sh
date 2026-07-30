#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
python3 -m venv .venv
. .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
waitress-serve --listen=127.0.0.1:5000 wsgi:app
