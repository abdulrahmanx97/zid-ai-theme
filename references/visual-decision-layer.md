# Visual decision layer — an image is a design decision, not a slot to fill

The counting/priority/desktop-mobile rules and the exact merchant-facing wording live in `merchant-prompts.md`. This file is the THINKING that runs BEFORE any prompt is written. Never emit an image request without first answering the decision block below.

## The forbidden defaults
- ❌ request an image for every category automatically
- ❌ request Desktop/Mobile for every image (or every category) automatically
- ❌ show all categories on the homepage / turn it into a category catalog
- ❌ dump 12–13 designs on the merchant at once
- ❌ repeat one prompt across categories with only the name changed
- ❌ request images the theme can't actually use

## Decision block (write it internally, then surface the rationale)
1. What is the homepage's goal? What must the visitor see first?
2. Which 4–6 categories matter most, and WHY (score below)?
3. What needs NO new image now (weak/sub/seasonal categories, slots the store's own photos already fill)?
4. Where do we reuse existing product photos / a collage instead of asking?
5. Which slots genuinely need a new image?
6. Does each slot have a real mobile field / a different composition? (check schema/template — don't assume)
7. What is the logical FIRST batch (≤5–7 images)?

## Category scoring (pick the top, never random)
Score each category by: product count · sales/orders via MCP · main-nav presence · quality of its product photos · identity fit · main vs sub-category · does the visitor need it fast. Then:
- 3–6 categories in store → may show all
- 7–12 → top 4–6 on home, rest on categories page
- >12 → top 6 on home, rest on categories page
- strong product photos → collage from them, don't request new
- weak/sub/seasonal → no dedicated image now

## Desktop / Mobile — by design, not reflex
Two files ONLY when composition truly differs (horizontal vs vertical) AND a real field exists: hero, wide slider, big background banner, media sections. One file when the slot is a responsive square/card (category tile, product image) or the theme reuses the same asset both ways. If unsure whether a mobile field exists → inspect the schema/template first. Paired slots = ONE combined prompt that outputs both (merchant-prompts.md).

## First-batch discipline
≤5–7 images that change the theme's face NOW (hero desktop + mobile-if-real, 1–2 promo banners, top 4–6 category tiles if missing, cart/checkout art only if the page is visually built on it). Everything else — remaining categories, lifestyle, 404, no-results, video — waits for batch 2 after the first returns. Never exhaust the merchant.

## Mandatory rationale before prompts
State the design decision or don't show prompts: "اخترت X صور فقط الآن لأن… الهيرو يحتاج نسختين لأن المقاس مختلف… التصنيفات المربعة صورة واحدة لأنها تشتغل على الجوال والكمبيوتر… أعرض أهم N تصنيفات والباقي في صفحة التصنيفات." Always include: "ما بطلب صور لكل شيء — بطلب فقط الصور التي تغيّر شكل الثيم فعلاً؛ الهدف تنجز بسرعة والثيم يطلع احترافي بدون زحمة."

## The theme never waits
If a slot's real art isn't ready, ship an on-identity placeholder and keep building — the theme works NOW and upgrades when the merchant returns files. A homepage that depends on `template_components` alone (empty on activation) is a FAIL (page-coverage.md Home-Must-Not-Be-Empty).
