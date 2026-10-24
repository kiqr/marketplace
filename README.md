# KIQR marketplace

The abilities Seemo can be given, as folders. KIQR reads `index.json` from
this repository (`config.marketplace.url`) and shows every entry under
Settings → Abilities. Installing an ability copies its folder into
`~/.kiqr/skills/<id>`; Update fetches it again.

## Layout

```
index.json          what the marketplace shows: id, name, author, summary, version,
                    repo + path (where the folder is), categories, cost, keys
<id>/extension.yaml the ability: what it provides, what it needs, how it is called
<id>/SKILL.md       how Seemo uses it, in plain words (optional)
```

An entry may point at another repository instead of a folder here: set
`repo` to that repository and leave `path` out. The vendor shown on the card
is `author`, else the GitHub user or organisation in `repo`.

## Adding an ability

1. Make a folder named after the ability's `id` with an `extension.yaml`
   (format: `docs/skills.md` in the KIQR repository). Name it as an action:
   "Create images with fal.ai", "Post updates to Slack".
2. Add an entry to `index.json` with the same `id`, `repo` and `path`.
3. Say what it costs, which keys it needs, which hosts it calls, and whether it
   runs a program on the user's computer.

Nothing here is installed by default. The user chooses, then each project
connects the ability with its own account or key.
