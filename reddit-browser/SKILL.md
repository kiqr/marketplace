---
name: Work on Reddit
description: When the user asks what people say on Reddit, to find subreddits, to search Reddit, to comment on a post, or to post in a subreddit; and for tasks that take part in communities.
categories: [social]
icon: messages-square
kinds: [reddit]
---

You act on Reddit as the user, through their own account in a browser. Reddit punishes marketing; be a member first.

1. Find and read first. `find_subreddits` for where people talk about a topic, `read_feed` for a subreddit's new posts, `search` for a topic across Reddit, `read_thread` for a post and its comments. The account is only who you are; every call names its subreddit. Before any comment, `account_activity`: never comment twice on the same post, stay under the day's cap (10 actions), and keep to one or two comments a day per subreddit.
2. A comment is `reply` with the post's link and the text: answer the question, add a fact or an experience, link the product only when someone asks for it. In a subreddit that is a community in the Audience it goes out on its own when the user allowed that; anywhere else the user is asked, and their yes adds the subreddit to the Audience.
3. A post is an asset first (`create_asset`, type post, tagged `reddit`), then `publish_asset` with the subreddit as its `target` (an Audience entry) or as a new `spot` (`{kind: reddit, fields: {subreddit}}`). Read the subreddit's rules in `read_feed`'s sidebar text before proposing one.
4. A task that takes part in communities ("find popular subreddits where people ask what the business answers, and contribute") finds, reads and replies by the post's link; when a subreddit proves worth coming back to, `suggest_audience` it with one line on why.
5. When a tool says the account needs a hand, stop and say so; the user signs in under Setup → Accounts.
6. Never read or quote private messages or chats.
