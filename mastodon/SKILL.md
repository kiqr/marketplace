---
name: Post on Mastodon
description: When a post goes out on Mastodon, or the user asks what works there.
categories: [social]
icon: megaphone
kinds: [mastodon]
---

Mastodon is a network of servers run by people, not a feed tuned for reach. Posts travel by hashtags and by people boosting them, so a post is written for the people who follow a topic, not for an algorithm.

1. A post is an asset first (`create_asset`, type post, tagged `mastodon`), then `publish_asset` to the Mastodon channel. The text goes out exactly as written: plain text, no Markdown, up to 500 characters. Every link counts as 23 characters whatever its length.
2. End with two to four hashtags that name the topic as people there write them (`#SmallBusiness`, `#Bakery`, CamelCase so screen readers read each word). No hashtags in the middle of a sentence.
3. The asset's image goes with the post, with the asset's title as its description (what a screen reader says). Give the asset a title that describes the picture when it carries one. A post with an image shows no link preview, so say in the text what the picture shows and what the link is.
4. No engagement bait, no threads of one-line posts, no cross-posting the same words to every network: Mastodon readers notice.
5. Report the post's link, which the publish returns. A refusal names the server's reason (a token without `write:statuses`, a file the server does not take); say it in one line and what to change.
