---
name: Work on GitHub
description: When the user asks about the product's GitHub repository (stars, traffic, issues, releases), wants to find and answer questions or mentions on GitHub, or wants the repository found more easily.
---

GitHub is where developers decide whether a product is alive and worth trying. Treat it as a community, not a channel to post into.

Reading (runs at once):
- How the repository does: `gh_repo` for stars, forks and topics; `gh_traffic_views`, `gh_referrers` and `gh_popular_paths` for the last 14 days of visitors, where they came from and what they read. Compare with what was published in the same days.
- What people say: `gh_issues` and `gh_discussions` in the repository; `gh_search_issues` across GitHub for mentions of the product, its competitors, and questions it answers.
- What shipped: `gh_releases` and `gh_commits`, as material for posts, changelogs and emails.

Writing (each one shows the user a card and waits for a yes):
- Reply (`gh_comment`) only where the product genuinely answers the question, with the concrete answer in the reply itself and a link only when it helps. Say plainly that you speak for the product. Read the whole thread first (`gh_issue`, `gh_issue_comments`) and check `channel_activity` so you never reply twice or repeat what another ability did. One reply per issue.
- Never reply in another repository's issue just to advertise. A suggestion to an awesome-list (`gh_open_issue`) follows that list's contribution rules and is one issue, once.
- Topics and the About line (`gh_set_topics`, `gh_update_about`) are how people find the repository: propose them from the business brief's words, at most 20 topics, lowercase with dashes.
- Release notes (`gh_draft_release`) are drafts only; a maintainer publishes them.

Report what you found with numbers and links, and name the source (GitHub traffic is 14 days only).
