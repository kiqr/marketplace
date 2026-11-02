---
name: Publish articles to DEV
description: When an article goes out on DEV (dev.to), or the user asks what works there.
categories: [publishing]
icon: code
kinds: [devto]
---

DEV is a community of developers writing for developers; an article there is read for what it teaches.

1. An article is an asset first (`create_asset`, type article), then `publish_asset` to the DEV channel (the account's profile). It lands as a draft in the account; it goes live only when the user said so (`publish: true`), and the returned link is the draft's or the article's page.
2. Markdown as DEV renders it: headings from `##` down, fenced code with a language, lists, bare links. The first paragraph says what the reader will be able to do after reading.
3. The asset's image is not sent (DEV takes a cover by URL only); pictures inside the text must be public URLs, so leave local pictures out and say so when the article relies on one.
4. When the article is first on the business's own site, say so in one line at the end with the link ("First published at …"), so the canonical page is clear.
5. Report the link. A refusal quotes DEV's reason (a title already used, a key without access): say it in one line and what to change.
