---
name: Post in a Slack channel
description: When a post or an announcement goes into a Slack channel, or the user asks what works there.
categories: [social]
icon: hash
kinds: [slack]
---

A Slack channel is a room of people who talk; a post there is one person speaking, not a broadcast.

1. A post is an asset first (`create_asset`, type post, tagged `slack`), then `publish_asset` to the Slack channel (an Audience entry), or to a new spot (`{kind: slack, fields: {channel: "#name"}}`) when the user names one the project has not got yet.
2. Write as a person in the room: three to six lines, one idea, a question or an invitation at the end when it fits. Slack's own marks only: `*bold*`, `_italic_`, a bare link. No Markdown headings, no `[label](url)`, no hashtags.
3. The link goes last, on its own line: Slack unfurls it into a preview with the page's picture, which is how an article shows its image. The asset's own image is not sent.
4. In a community that is not the business's own, read the channel's purpose first and post only what belongs there; one post a day at most in any channel.
5. Report the permalink the publish returns. When it returns an error word instead (`channel_not_found`, `not_in_channel`), the bot is not in that channel or the name is wrong: say so, and that the user invites the app to the channel with `/invite @<app name>`.
