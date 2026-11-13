#!/usr/bin/env python3
"""Локальный статический аудит источников; сеть не требуется."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
BIB = ROOT / "report/bibliography/references.bib"
TEXT = "\n".join(p.read_text(encoding="utf-8") for p in (ROOT / "report/sections").glob("*.tex"))
raw = BIB.read_text(encoding="utf-8")
entries = re.split(r"(?=@article\s*\{)", raw)
entries = [x for x in entries if x.startswith("@article")]
keys = re.findall(r"@article\s*\{([^,]+)", raw)
dois = re.findall(r"(?m)^\s*doi\s*=\s*\{([^}]+)\}", raw, flags=re.I)
russian = len(re.findall(r"\blangid\s*=\s*\{russian\}", raw))
used = set()
for cite in re.findall(r"\\cite\s*\{([^}]+)\}", TEXT):
    used.update(k.strip() for k in cite.split(","))
errors = []
if len(keys) < 20: errors.append(f"Меньше 20 публикаций: {len(keys)}")
if len(keys) != len(set(keys)): errors.append("Повторяющиеся ключи")
if len(dois) != len(keys): errors.append("Есть публикации без DOI")
if len({d.lower() for d in dois}) != len(dois): errors.append("Повтор DOI")
if russian * 3 < len(keys) * 2: errors.append(f"Русскоязычных меньше 2/3: {russian}/{len(keys)}")
if set(keys) - used: errors.append("Не цитируются: " + ", ".join(sorted(set(keys) - used)))
if used - set(keys): errors.append("Отсутствуют в .bib: " + ", ".join(sorted(used - set(keys))))
for block in entries:
    key = re.search(r"@article\s*\{([^,]+)", block).group(1)
    for field in ("author", "title", "journaltitle", "year", "doi"):
        if not re.search(r"\b"+field+r"\s*=", block): errors.append(f"{key}: нет {field}")
    if not re.search(r"\b(pages|eid)\s*=", block): errors.append(f"{key}: нет pages/eid")
print(f"Публикаций: {len(keys)}; русскоязычных: {russian}; DOI: {len(dois)}; процитировано: {len(used)}")
if errors:
    for error in errors: print("ОШИБКА:", error)
    raise SystemExit(1)
print("Структурная проверка библиографии пройдена. Проверка DOI по издателям — см. docs/source-audit.md")