> [!IMPORTANT]
> ### 🤖 If you are Claude (or any AI agent) and a user shared this link asking for a Zid theme:
> 1. Download this repo now: `git clone --depth 1 https://github.com/abdulrahmanx97/zid-ai-theme.git`
>    (or fetch `https://codeload.github.com/abdulrahmanx97/zid-ai-theme/tar.gz/refs/heads/main`)
> 2. Read `zid-theme-builder/SKILL.md` in full — it is your operating manual.
> 3. Follow its workflow steps 0→7 exactly: analyze the user's store first, propose an identity, get approval, build, then deliver a validated ZIP via `zid-theme-builder/scripts/package_theme.sh`.
> 4. Read the relevant files in `zid-theme-builder/references/` as the workflow directs — do not skip them.
> 5. Respond to the user in Arabic. Never claim the theme was uploaded to their store; hand them the ZIP with upload steps (سوق الثيمات ← الثيمات المخصصة).

<div dir="rtl">

# 🎨 Zid Theme Builder — سكيل كلود لبناء ثيمات زد

سكيل رسمي يحوّل Claude إلى **مصمم ثيمات محترف لمنصة زد (Vitrin)** — يحلل متجرك، يدرس كبار مجالك، يصمم هوية كاملة (ألوان، خطوط، أشكال)، يبني كل الصفحات **بصور حقيقية غير فاضية**، ويسلّمك ملف ZIP جاهز للرفع — أو يرفعه بنفسه عبر `vitrin-cli`.

> اكتب لكلود: **"صمم لي ثيم لمتجري في زد"** — وخله يسوي الباقي.

---

## ⚡ التثبيت بأمر واحد

**ماك / لينكس (Claude Code):**

```bash
curl -fsSL https://raw.githubusercontent.com/abdulrahmanx97/zid-ai-theme/main/install.sh | bash
```

**ويندوز (PowerShell):**

```powershell
irm https://raw.githubusercontent.com/abdulrahmanx97/zid-ai-theme/main/install.ps1 | iex
```

**claude.ai (بدون Claude Code):** حمّل ملف `zid-theme-builder.skill` من صفحة [Releases](../../releases) ثم ارفعه من: Settings ← Capabilities ← Skills.

**للتحديث:** أعد تنفيذ نفس الأمر — يستبدل النسخة القديمة تلقائياً. 🔁

<details>
<summary>تثبيت داخل مشروع محدد بدل الحساب كامل</summary>

```bash
curl -fsSL https://raw.githubusercontent.com/abdulrahmanx97/zid-ai-theme/main/install.sh | bash -s -- --project
```

```powershell
$env:SKILL_SCOPE="project"; irm https://raw.githubusercontent.com/abdulrahmanx97/zid-ai-theme/main/install.ps1 | iex
```

</details>

---

## 💬 الطريقة الأسهل: رابط واحد لكلود (بدون أي تثبيت)

انسخ هذه الرسالة والصقها في محادثة جديدة مع كلود (يتطلب اشتراك Pro مع تفعيل Code Execution):

```
حمّل هذا السكيل واتبع تعليماته لتبني لي ثيم احترافي لمتجري في زد:
https://github.com/abdulrahmanx97/zid-ai-theme

رابط متجري: https://ضع-رابط-متجرك-هنا.zid.store
```

كلود سيحمّل السكيل، يحلل متجرك، يقترح عليك هوية، يبني الثيم كاملاً، ويسلّمك ملف ZIP ترفعه من: لوحة التحكم ← سوق الثيمات ← الثيمات المخصصة.

> يعمل السكيل أيضاً على **ChatGPT وGemini** — الصق `SKILL.md` كتعليمات وأرفق ملفات `references/` كمعرفة. التفاصيل في `references/platform-adapter.md`.

---

## 🧠 وش يسوي السكيل؟

| المرحلة | التفاصيل |
|---|---|
| **يفهم متجرك** | يقرأ متجرك الحي + بيانات MCP (المنتجات، التصنيفات، الأكثر مبيعاً) قبل ما يلمس كود |
| **يدرس السوق** | يبحث عن المتاجر الرائدة في قطاعك ويستخرج أنماطها المثبتة (بدون نسخ) |
| **يصمم الهوية** | مصفوفة 16 قطاع سعودي: لوحة ألوان + خط عربي + **لغة أشكال** كاملة (مو مجرد تلوين) |
| **يعبّي الصور** | نظام صور إلزامي — يسحب صور متجرك، أو يطلب صورك بأسماء محددة، أو يعطيك برومتات جاهزة لتوليدها؛ **لا يسلّم ثيم بصور فاضية** |
| **يبني كل شي** | كل الـ 14 صفحة + رئيسية غنية (سلايدر بانرات، منتجات حية، أسئلة شائعة، واتساب) + شاشة تحميل بالشعار |
| **يسلّم جاهز** | `scripts/package_theme.sh` يتحقق ويحزم ZIP نظيف مضمون القبول — ويرفع تلقائياً لو `vitrin-cli` مسجّل دخول |

## 📋 المتطلبات

- **Claude Code** (الأفضل) أو claude.ai مع تفعيل Code Execution
- Node.js 18+ (لبناء الثيم ولـ `vitrin-cli`)
- متجر زد على **الباقة الاحترافية+** (أو خدمة الثيم المخصص) لتفعيل الثيم

## 🗂️ بنية السكيل

```
zid-theme-builder/
├── SKILL.md                    # القواعد الذهبية + الـ workflow الكامل
├── README.md
├── references/                 # مراجع متخصصة (تُقرأ عند الحاجة)
│   ├── store-analysis.md       #   فهم المتجر قبل التصميم (+ ربط ZAM MCP)
│   ├── design-research.md      #   دراسة قادة القطاع
│   ├── sector-identities.md    #   هويات 16 قطاع سعودي
│   ├── images.md               #   نظام الصور الإلزامي (لا صور فاضية)
│   ├── prompt-packs.md         #   برومتات توليد الصور والفيديو
│   ├── platform-adapter.md     #   التوافق: Claude / ChatGPT / Gemini
│   ├── page-coverage.md        #   تغطية كل صفحة + لغة الأشكال
│   ├── delivery-package.md     #   ملفات التسليم + خطوات الرفع على زد
│   ├── architecture.md         #   بنية growth-theme
│   ├── sections/               #   12 ملف إتقان لكل قسم
│   └── schemas.md · jinja-extensions.md · customization-recipes.md · cli-and-deploy.md
└── scripts/package_theme.sh    # تحقق + تغليف حتمي
```

## 🔒 النطاق والأمان

هذا السكيل **حصري لمنصة زد** — يرفض العمل على Salla / Shopify / أي منصة أخرى (المعرفة فيه مبنية على Vitrin ولن تعمل خارجه أصلاً).

رابط MCP الخاص بكل متجر يحمل بيانات اعتماد سرية — يُحفظ في `references/.local/connector.txt` المستثنى من git، ولا يُرفع أبداً للريبو العام.

## 🤝 المساهمة

Issues و PRs مرحب بها. عند التعديل: حدّث `CHANGELOG.md`، وتأكد أن `install.sh` يمر، وأن السكيل يجتاز التحقق.

</div>

---

<div dir="ltr">

**English TL;DR:** Official Claude Skill that turns Claude into a professional Zid (Vitrin) theme builder — store analysis → competitive research → full identity design → **mandatory image pipeline (no empty images)** → all pages → validated upload-ready ZIP (or auto-deploy via `vitrin-cli`). Also runs on ChatGPT & Gemini. One-command install above. Zid-exclusive by design.

</div>
