---
name: Post in a Telegram channel
description: When a post goes out in a Telegram channel, or the user asks what works there.
categories: [social]
icon: send
kinds: [telegram]
---

A Telegram channel is a one-way feed its subscribers chose: short posts, one idea each, read on a phone.

1. A post is an asset first (`create_asset`, type post, tagged `telegram`), then `publish_asset` to the Telegram channel (an Audience entry), or to a new spot (`{kind: telegram, fields: {chat: "@name"}}`) when the user names a channel the project has not got yet.
2. Plain text, no Markdown, up to 1000 characters: with an image the text is the photo's caption, and Telegram stops captions at 1024. Short paragraphs, a blank line between them.
3. One link at most, on its own line at the end. A post without an image gets a large preview of that link; a post with an image shows the image instead, so say in the text what the link is.
4. The link the publish returns is right for a public channel (one with a @username). For a private channel (a numeric id) it is not, and that is expected; say the post went out.
5. A refusal quotes Telegram's reason: "chat not found" means the channel name is wrong or the bot is not in it; "not enough rights" means the bot is not an administrator. Say which and what to do.
