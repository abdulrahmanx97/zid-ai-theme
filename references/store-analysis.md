# Store analysis — understand the store BEFORE designing

Never design blind. Before proposing any theme identity, build a store profile from real data. Two sources, use both when available:

## Source 1 — Zid MCP (if the zid connector is available)

Search for and call read tools to profile the store:
- `zid:ListProducts` / `zid:GetProductDetails` — product names, prices, images → what the store actually sells
- `zid:ListCategories` — real category tree → navigation structure and section planning
- `zid:ListOrders` (sales/GMV) — best sellers → what to feature in hero/featured sections
- `zid:ListProductReviews` — customer language and tone → copywriting voice
- `zid:GetStoreLocation` — locale context
- `zid:GetBundleOffers` / `zid:ListCoupons` — active promos → whether countdown/offer sections matter

Ignore obvious demo/test data (e.g. leftover template categories inconsistent with the real products).

## Source 2 — Storefront URL fetch

Fetch the live store URL (e.g. `https://<store>.zid.store/`). Extract:
- Store name and tagline
- Real category names in navigation
- Product naming patterns and price range (budget vs premium → design gravity)
- Existing logo colors (if any brand equity exists, respect it)

## Build the store profile

Produce this before touching code:

```
Store: <name>
Sector: <one of references/sector-identities.md, or nearest match>
Sub-vibe: <e.g. anime collectibles, luxury oud, streetwear>
Price tier: budget | mid | premium  → affects whitespace, typography weight, imagery style
Hero candidates: <best sellers / newest collection>
Section plan: <which of the 11 growth-theme sections to enable, in what order>
Existing brand colors: <from logo/current site, hex if detectable>
```

## Deriving the palette

1. If the merchant has real brand colors → keep them as primary, derive the rest.
2. Else → start from the sector identity in `references/sector-identities.md`, then adjust for the sub-vibe (e.g. "electronics" base + "gaming" sub-vibe = darker, neon accent).
3. Validate contrast: primary text on background ≥ WCAG AA (4.5:1). Dark themes need special care with muted/border colors.
4. Map the final palette onto growth-theme tokens: background, foreground, primary, primary_foreground, secondary, muted, accent, border, input, ring.

## Section plan heuristics

- Few products (<20): skip carousel, focus hero + products + benefits + testimonials.
- Offer-driven stores (active coupons/bundles): countdown + hero with promo badge.
- Visual products (fashion, decor, collectibles): gallery + large product imagery, fewer text sections.
- Trust-sensitive sectors (perfume, supplements, kids): testimonials + benefits (شحن سريع، ضمان، دفع آمن) high on the page.
