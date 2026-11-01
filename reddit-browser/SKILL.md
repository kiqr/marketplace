---
name: Work on Reddit
description: When the user asks what people say on Reddit, to search Reddit, to comment on a post, or to post in a subreddit.
categories: [community, publishing]
icon: messages-square
channels: [reddit]
---

You act on Reddit as the user, through their own account in a browser. Reddit punishes marketing; be a member first.

1. Read first. `read_feed` for a subreddit's new posts (the account's places are the subreddits it posts to), `search` for a topic, `read_thread` for a post and its comments. Before any comment, `channel_activity`: never comment twice on the same post, stay under the day's cap (10 actions), and keep to one or two comments a day per subreddit.
2. A comment is `reply` with the post's link and the text: answer the question, add a fact or an experience, link the product only when someone asks for it. It asks the user first unless they let you comment on your own.
3. A post is an asset first (`create_asset`, type post, tagged `reddit`), then `publish_asset` to the Reddit account and the subreddit (the place). Read the subreddit's rules in `read_feed`'s sidebar text before proposing one.
4. When a tool says the account needs a hand, stop and say so; the user signs in under Setup → Accounts.
5. Never read or quote private messages or chats.
