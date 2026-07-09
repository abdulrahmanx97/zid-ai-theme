# Merchant-Friendly Visual Prompt Builder — chat-only image/video requests

Whenever the theme needs images or videos from the merchant (images.md Paths B/C), EVERYTHING the merchant sees lives **inside the chat**, in simple non-technical Arabic, copy-paste ready. The file formats in `prompt-packs.md` (ASSET_REQUIREMENTS/VISUAL_PROMPTS/VIDEO_PROMPTS/asset_manifest) are INTERNAL build artifacts only — never surface them.

**Banned words in merchant-facing output:** asset_manifest · JSON · manifest · markdown/ملف .md · VISUAL_PROMPTS · scripts/سكربت · paths/مسار · folder/مجلد · schema · "راجع المرفقات" · "افتح ملف". Never say "سأضعها في ملف" — say it in the chat.

The merchant only needs 7 answers: كم صورة؟ وش اسم كل وحدة؟ وش مقاسها؟ وين تنحط؟ وش البرومت اللي ألصقه في Gemini/ChatGPT؟ ضرورية أو اختيارية؟ وبعدين أرجع أرفعها هنا بنفس الأسماء.

## Mandatory order of the merchant reply

### 1) Identity summary FIRST (never write a prompt before it)
Extract in Step 0 (store-analysis.md): sector, product type, target customer, price tier, real store colors + theme palette (hex), font/style, mood (فخم/شبابي/لطيف/طبي/تقني/مانجا...), the photography style that fits (product photography / lifestyle / 3D / editorial / cinematic / clean studio), where text space must be reserved (RTL: usually the RIGHT), and IP warnings. Then open with:

```
فهمت هوية متجرك:
متجرك في قطاع: ...
الألوان التي سأبني عليها الصور: ...
ستايل الصور: ...
مهم: لا تكتب أي نص داخل الصور، لأن الثيم سيضيف النصوص فوقها.
```

### 2) Counts — scale to the theme, never one-size
| Theme size | Images |
|---|---|
| بسيط | 8–12 |
| متوسط | 14–20 |
| احترافي كامل E2E | 24–32 |
| + فيديو (اختياري) | 1–3 |

Then tell the merchant: "الحد الأدنى المقبول: X صور · النسخة الاحترافية: Y صور (+Z فيديو) · بنصحك نبدأ بـ X الأساسية وبعدها نكمل."

### 3) Image blocks — essential first, EXACTLY this shape
Group as: **الصور الأساسية (ضرورية)** — hero desktop/mobile, slider/بنرين, main category tiles, empty-cart, secure-checkout → **صور تحسينية (يفضل)** — lifestyle, offers, details → **اختيارية** — 404, no-results, footer, seasonal.

```
🖼️ ١. البنر الرئيسي
المقاس: 1500 × 700
احفظها باسم: hero-desktop.jpg
الاستخدام: أعلى الصفحة الرئيسية
الأولوية: ضرورية
ملاحظة مهمة: خلّ يمين الصورة غامق وفاضي لأن الثيم سيكتب النص فوقها.

البرومت العربي:
"..."
للنتيجة الأدق — English prompt:
"..."
تجنب:
"بدون كتابة، بدون شعارات، بدون علامة مائية، بدون شخصيات أو ماركات محمية، بدون تشويه، بدون جودة منخفضة."
```

### 4) Closing line — always, verbatim
```
خلصت؟ ارفع الصور هنا بنفس الأسماء، وأنا أركبها في الثيم وأطلع لك ZIP جاهز.
```

## Prompt anatomy — every single prompt must contain
1. **Type** (بنر/سلايدر/تصنيف/lifestyle/سلة/دفع/404) · 2. **exact size** · 3. **usage** · 4. **the store's identity**: real hex colors, sector, mood, lighting, background · 5. **composition + text space** (which side stays empty — RTL default: right) · 6. quality words (high-end ecommerce, premium, sharp, cinematic, clean composition) · 7. the avoid-list · 8. **theme compatibility** (dark theme → never white backgrounds; فاخر → no color clutter; شبابي → energy/motion; طبي → clean/calm; عطور → soft luxury light; أنمي/مانجا → halftone + speed lines + panels, never known characters) · 9. **grounding in the real store**: the live store URL ("تصفح المتجر لتفهم بضاعته") + 2–4 direct `media.zid.store` product-image URLs with "ركّب هذه الصور الفعلية داخل البنر — لا ترسمها من جديد" + fallback line "لو ما قدرت تفتح الروابط قل لي بوضوح" (per prompt-packs.md).

A generic prompt like "anime poster store banner" is FORBIDDEN.

## The three paths — merchant phrasing (decision logic in images.md)
- **A (المتجر فيه صور):** "لقيت عندك صور كافية، بستخدمها في الثيم وأجهز أماكن الصور القابلة للتغيير." Only request what's genuinely missing (hero/banners).
- **B (عنده صور بجهازه):** "ارفع لي الصور التالية بنفس الأسماء، ولو عندك صور جاهزة مختلفة عادي ارفعها وأنا أركبها." + simple table: اسم الصورة · المقاس · الاستخدام · ملاحظة.
- **C (ما عنده صور):** open with the 4 steps — "١) افتح Gemini أو ChatGPT ٢) انسخ البرومت ٣) احفظ الصورة بالاسم المكتوب ٤) ارجع ارفعها لي هنا" — then the blocks.

## Video — same treatment
"الفيديو اختياري، لكنه يخلي الثيم أفخم. إذا تقدر تسويه، هذه البرومتات:" then 🎥 blocks (المقاس 1920×1080 · المدة 8–12 ثانية · احفظه باسم hero-video.mp4 · بدون صوت، loop، بدون كتابة + عربي/English/تجنب). If video generation isn't available: "عادي، نستخدم صورة ثابتة مع حركة خفيفة داخل الثيم." (Zid limit: ≤10MB, 720p H.264 — keep internal, just tell the merchant "لو طلع الملف كبير أرسله لي وأنا أضغطه".)

## Hard rules (ممنوعات)
- Never ask "وش تبغى صور؟" — state "هذه الصور التي أحتاجها لثيمك."
- No prompt without a size. No prompt without احفظها باسم. No generic/off-identity prompts. No colors that fight the theme.
- No text inside images; no copyrighted characters/logos/watermarks.
- The theme NEVER waits for images to work: ship on-identity placeholders meanwhile and tell the merchant "الثيم شغال الحين — وصورك بترفع مستواه أول ما ترجعها."

## Fixed identity block — anime/manga sector (Manga Frame and similar)
Bake this into every prompt for this sector:
```
متجر سعودي متخصص في بوسترات الأنمي والمانجا والمقتنيات. ستايل داكن فخم سينمائي.
الألوان: أسود حبري #0E0E12، أحمر مانجا #E63946، أصفر ذهبي #FFC53D، ورقي دافئ #F5F1E8.
أسلوب بصري: manga panels، halftone dots، speed lines، إضاءة سينمائية، بوسترات مؤطرة، غرفة جامع.
ممنوع: شخصيات أنمي معروفة، شعارات، كتابة داخل الصورة، علامات مائية.
```
Core sizes: hero 1500×700 · hero mobile 900×1200 · slider 1500×640 · promo 1200×460 · category 900×900 · lifestyle 1200×1200 · states 1200×800 أو 900×900.

## Output contract per execution
Every theme build outputs to the merchant, in chat: (1) identity summary → (2) image count (min/pro) → (3) video count if any → (4) essential images first → (5) Arabic prompt per image → (6) English prompt per image → (7) avoid-list → (8) the closing line. Simple, as if explaining to a non-technical merchant.
