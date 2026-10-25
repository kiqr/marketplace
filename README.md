# KIQR marketplace

The abilities Seemo can be given, as folders. KIQR reads `index.json` from
this repository (`config.marketplace.url`) and shows every entry in the
marketplace under Setup → Abilities. Installing an ability copies its folder
into `~/.kiqr/abilities/<id>`; Update fetches it again.

## Layout

```
index.json          what the marketplace shows: id, name, author, summary, version,
                    repo + path (where the folder is), categories, cost, keys
<id>/extension.yaml the ability's connection: what it provides, needs, how it is called (optional)
<id>/SKILL.md       its instructions: how Seemo does this, in plain words (optional)
<id>/avatar.svg     a 64×64 mark shown on the card and in the list (optional; `avatar` in the index is its URL)

An ability is one of these or both. Instructions on their own (a shared recipe)
are an ability too: give the index entry `transport: instructions`.
```

An entry may point at another repository instead of a folder here: set
`repo` to that repository and leave `path` out. The vendor shown on the card
is `author`, else the GitHub user or organisation in `repo`.

## Publishing an ability

An ability here is used by every KIQR installation that lists this index, so
it goes through a pull request. Five steps, and you test it in your own KIQR
before anyone else sees it.

### 1. Fork this repository

Fork `kiqr/marketplace` on GitHub and clone your fork:

```sh
git clone git@github.com:<you>/marketplace.git
cd marketplace
```

### 2. Point your KIQR at your fork

KIQR reads the index from `marketplace.url` in `~/.kiqr/config.yaml`. Set it
to the raw URL of the index in your fork, on the branch you work on, and
restart the daemon:

```yaml
marketplace:
  url: https://raw.githubusercontent.com/<you>/marketplace/<branch>/index.json
```

The index is cached for an hour; a restart reads it again. From now on the
marketplace under Setup → Abilities shows your fork. Put it back to the
default when you are done.

### 3. Add your ability

Make a folder named after the ability's `id`, lowercase letters, digits and
dashes. It holds an `extension.yaml` (a connection: what it needs, which hosts
it calls, what it provides), a `SKILL.md` (instructions Seemo reads before
doing this kind of work), or both. The formats are in `docs/abilities.md` in
the KIQR repository; the folders here are worked examples.

- Name it as an action the user would say: "Publish articles to Ghost",
  "Comment and post on LinkedIn", "Write release notes the way we do".
- Give it a `summary` of one or two sentences that says what it does, what it
  needs and what it costs, in the user's words.
- Add an `avatar.svg`, 64 by 64, on a dark background, and name it in the
  manifest (`avatar: avatar.svg`).
- Publishing to a social network? Declare the network on the channel kind
  (`name`, `icon`, `profile_hosts`, `text_limit`, `image`, `preview`,
  `writing`; see "Networks" in `docs/abilities.md`) and list `kind`, `name`,
  `icon` and `profile_hosts` under `channels` in the index entry, so KIQR
  recognises the business's profile there and can suggest your ability.
- Add an entry to `index.json` with the same `id`, your `repo` and the
  folder as `path`. Copy a neighbouring entry and change every field; the
  entry is what the card shows before the ability is installed, so it must
  match the manifest.

### 4. Test it in your own KIQR

Push the branch to your fork, restart the daemon, and go through what a user
will do:

1. Setup → Abilities: the card shows your name, summary, avatar, cost and
   keys. Install it.
2. Connect it with a real key or account on a test project. The switch
   turns on only when it is ready; if it stays off, the manifest's `auth`
   or `hosts` are wrong.
3. Ask Seemo to use it in a chat, and let a task use it once. For a
   publishing ability, publish a real draft to a test account and check the
   permalink lands on the asset. For instructions, ask for the kind of work
   they describe and read what Seemo made.
4. `kiqr abilities ls` shows it on, `kiqr abilities update <id>` fetches
   your branch again after a change.

Fix what you find before opening the pull request. Nothing is more
discouraging for the next person than an ability that installs and then does
not work.

### 5. Open a pull request

One ability per pull request, against `main`. The description says:

- what the ability lets Seemo do, in one paragraph a non-technical user
  understands;
- what it needs (keys, an account, a program on the computer) and what it
  costs per use;
- which hosts it calls and why;
- how you tested it: the service, the project, what Seemo made with it.

A maintainer installs it from your branch the same way and tries it. Expect
questions about wording and about the smallest set of keys and hosts that
works.

## What gets in

The bar is low on ceremony and high on care.

- **It improves KIQR for everyone.** A connection to a service people use,
  or instructions for a kind of work many businesses do. Something only your
  business needs stays an ability of yours, taught on the Abilities page.
- **It is honest and legal.** It calls documented APIs with the user's own
  account, within that service's terms, and says what it does on the card.
  No scraping behind logins the service forbids, no circumventing limits, no
  spam, no content the user did not ask for, nothing that sends the user's
  data anywhere the card does not name.
- **It asks for the least.** Only the keys it needs, only the hosts it
  calls, optional keys marked optional, no program on the computer unless
  there is no other way, and then the card says so.
- **The description is good.** Name, summary, help on every key, and a cost
  the user can picture. If a user has to open the yaml to understand what
  they are installing, the entry is not done.
- **Instructions are detailed.** A `SKILL.md` is read by Seemo before it
  acts, so it has to carry the craft: the steps, the shape of a good result,
  what to avoid, what to report back, with an example. "Write good posts" is
  not instructions. Read `social-posts` and `make-images` in the KIQR
  repository for the level expected.
- **You put love into it.** You used it yourself, on a real project, and it
  made something you were glad to have. That shows in the summary, in the
  help texts, in the avatar, and in the pull request. Abilities that read
  like they were generated and never run are closed without ceremony.

Nothing here is installed by default. The user chooses, then each project
connects the ability with its own account or key. What KIQR cannot do without
(writing, the business profile, web reading, the built-in renderer, tasks, the
marketing plan) ships inside the KIQR binary and is not listed here; everything
else, including abilities whose code lives in KIQR (`transport: builtin`, such
as email over SMTP or the analytics readers), is installed from this index.
