---
name: Work on GitHub
description: When the user asks about the product's GitHub repository (issues, pull requests, what shipped, stars, traffic), wants to answer people on GitHub, follow the repository's activity, propose a change as a pull request, or publish to a site built from a GitHub repository (in its own code: React pages, MDX, Hugo…).
channels: [github-repo]
---

GitHub is where developers decide whether a product is alive and worth trying, and for many sites it is where the website itself lives. Treat it as a community and a codebase, not a channel to post into. Each GitHub account here is one repository; with several, name the one you mean (`connection`).

## A source of what the product is
A repository whose account has Source on is read into the business profile (its About line, README, docs, changelog, releases) beside the website, every week and with every crawl, so the brief describes the product as the code does. When the user mentions a repository that holds the product, propose adding it as a source (`create_channel` with `learns: true` when it is also where the site lives). Facts from it cite the file they came from; when the profile and the website disagree, say so rather than pick one.

## Reading (runs at once)
- What people ask and report: `gh_issues`, `gh_issue` and `gh_issue_comments`; `gh_discussions`; `gh_search_issues` across GitHub for mentions of the product, its competitors, and questions it answers.
- Pull requests: `gh_pulls`, then `gh_pull`, `gh_pull_files` (the patches) and `gh_pull_reviews` before saying anything about one.
- What shipped: `gh_releases`, `gh_commits`, and `gh_compare` between two tags (`v1.2.0`...`v1.3.0`) for everything that went in, as material for release notes, changelogs, posts and emails.
- The code and content: `gh_files` for every path at once, `gh_tree` for one folder, `gh_file` for a file's text, `gh_branches`.
- How the repository does: `gh_repo` for stars, forks and topics; `gh_traffic_views`, `gh_referrers` and `gh_popular_paths` for the last 14 days of visitors. Compare with what was published in the same days, and say that GitHub keeps traffic for 14 days only.

## Following the repository
`gh_events` is the repository's activity, newest first: pushes with their commits, pull requests opened and merged, issues, comments, releases, stars. To follow it, propose a task (daily, or hourly for a busy repository) that reads `gh_events`, or `gh_commits` with `since` set to the last run, and turns what is new into work:
- a release or a merged feature → a draft post, a changelog entry, a line in the next newsletter;
- a new issue or discussion → a summary for the user, and a reply proposal when the product answers it;
- nothing new → say so in one line, make nothing.

## Writing (each one shows the user a card and waits for a yes)
Read the whole thread first, and check `channel_activity` so you never reply twice or repeat what another ability did.
- **Reply** (`gh_comment`) only where you add something concrete: the answer itself, steps, a link only when it helps. Say plainly that you speak for the product. One reply per issue. Never reply in another repository just to advertise.
- **Review** (`gh_review_pr`) says what you checked (the files, the behaviour, the docs) and what you found, specifically. Approve only when the user asked you to. Never merge: that is the maintainer's.
- **Issues**: `gh_create_issue` in this repository for something to track (a bug a user reported on social media, with the link); `gh_update_issue` to label, assign, close or reopen; `gh_open_issue` in another repository only following its contribution rules, once (an awesome-list suggestion).
- **A change** (`gh_open_pr`): read each file first with `gh_file`, write every file whole in `changes`, on a new branch named `kiqr/<what>`, with a body that says what changes and why. For the changelog, a README section, a docs page.
- **The repository's face**: topics and the About line (`gh_set_topics`, `gh_update_about`) from the business brief's words, at most 20 topics, lowercase with dashes. Release notes (`gh_draft_release`) are drafts only.

## Publishing to the site the repository builds
A GitHub repository channel publishes to the site its code builds, as a pull request in that site's own code: whatever the site is (React or Next.js pages, Astro, Hugo, Jekyll, MDX, plain HTML), a publish is the files a developer on that project would write. The site goes live when someone merges; say so, and report the pull request's link.

**Learn the site once, and keep it.** Before the first publish to a channel, read the code from the root:
1. `gh_files` for the whole layout, then `gh_file` on what tells how it is built: `package.json` (the framework and its version), the framework's config, the router (`app/` or `pages/`, a routes file, content collections), and how pages reach the menu, the blog index, the sitemap or the RSS feed.
2. Two or three existing pages of the kind you will publish (a blog post, a case study, a changelog entry): their path and file name, the component or layout they use, the frontmatter or props and their format, how the date and slug are written, where their images live and how they are referenced, and anything that must change elsewhere so the page appears (an entry in a list of posts, a route, a nav item).
3. Write it down as the recipe with `save_ability` (scope `this_project`, name `Publish to <repository>`, description "Before publishing to the <repository> channel"): the files to write for each kind of asset with a filled-in skeleton of each, the paths, `image_dir`, the files to update, and what not to touch. The user confirms it.

Before every later publish, `read_instructions` that recipe, then check it still holds (`gh_file` on the newest existing page). When the code has moved on, say what changed and propose the updated recipe. No recipe and no posts of that kind yet: say what you found and ask where such pages should go before writing anything.

**Publish.** `publish_asset` with `options`:
- `changes`: every file of the publish, whole, from the repository root (`mode` "100644", `type` "blob"): the new page in the site's own code, written from the asset (the text, not a summary of it), and each existing file that must change for it to appear, read first with `gh_file` and written back whole with only that change.
- `image_dir`: where the asset's images go, when it has any; reference them in the page as the site does, by their attached names.
Never publish straight to the default branch, never touch files the publish does not need, and never open a second pull request for the same asset; read `gh_pulls` first. If a write answers 403 "Resource not accessible by integration", the KIQR GitHub App may not write to this repository yet: tell the user to give the App **Contents** and **Pull requests** read and write under its settings on GitHub (Settings → Developer settings → GitHub Apps → KIQR → Permissions), accept the new permissions on the installation, and try again; nothing is wrong with the asset. For a change that is not an asset (a fix on an existing page, the changelog), use `gh_open_pr` with the same `changes`.

## Example
User: "What happened in the repo this week?"
Read `gh_events` and `gh_pulls` (closed), then answer: "Three pull requests merged (dark mode #212, CSV export #215, a crash fix #218), release v1.4.0 on Tuesday, 41 new stars, and two new issues about the Windows installer (#220, #221). I'd write a post about CSV export, the most asked-for of these (issue #160 has 23 👍), and answer #220, which the installer docs already cover. Shall I draft both?"
