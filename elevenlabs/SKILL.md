---
name: Make voice-overs, sound effects and music with ElevenLabs
description: "Before making a voice-over, a sound effect, a jingle or a music bed for a video, an ad or an audio piece: the voice, writing for the ear, what each file is for and where it lands, and what it costs."
categories: [media]
icon: audio-lines
author: KIQR
---

# Sound for the business's videos, ads and audio

A video without sound is half made. This ability gives a video, an ad or an audio piece its voice-over, its sound effects and its music, through ElevenLabs, and saves each as an mp3 on the asset it belongs to. ElevenLabs makes the sound; KIQR keeps it with the rest of the asset, where the user hears it in the chat and in the library. Nothing here cuts or mixes: the files are the parts, and a cue sheet in the asset says where each goes. The user, or their editor, assembles them.

## The tools, and what each is for

- **`speak`** reads a script in one of the account's voices: a voice-over for a video or a reel, a radio or podcast ad, the spoken line of an explainer. One credit per character.
- **`sound_effect`** makes one effect from a description: a door, footsteps, a whoosh for a transition, a room tone to sit under a scene. 40 credits per second of the length you set, 200 when the length is left to the model.
- **`create_music`** (the core "Make music", served by ElevenLabs when it is the connected generator) makes a music bed, a jingle or a stinger from a prompt and a length. About 900 credits a minute.
- **`list_voices`** shows the voices the key can speak with, with their labels; **`credits`** shows the balance.

The asset is where everything meets. Create it first, then make the sound onto it with `asset` set; a sound made without an asset has nowhere to go.

## How it fits with the rest

- **A video** (`create_asset` with `type: video`): the script is the asset's text, in the body, scene by scene. Then, onto that asset: the voice-over (`speak`, `name: voiceover`), the music bed (`create_music`, `name: music`), each effect (`sound_effect`, `name: sfx-<what>`), the clip from `create_video` when a video generator is connected, and a poster from `create_image`. The video type keeps the clip, the script and the poster in their own slots and the audio files beside them as media.
- **An audio piece** (`type: audio`): a radio spot, a podcast ad, a voice message. The script is the text, the voice-over lands in the audio slot, a bed and effects beside it.
- **An ad campaign** (`type: ad-campaign`): the campaign file and the creatives are the asset; a voice-over for a video ad or an audio ad lands beside them, named for the ad it belongs to (`name: ad-spring-15s`).
- **A post or an article** does not take audio; a video post is a video asset.

Then the **cue sheet**: after the files are made, add a section to the asset's text that says where each one goes, so anyone opening the asset can assemble it without asking.

```
## Cue sheet
| at | file | note |
| 0.0 s | music.mp3 | bed, under everything, down 12 dB under the voice |
| 0.5 s | sfx-door.mp3 | the door, once |
| 1.5 s | voiceover.mp3 | the whole script, 14 s |
| 16.0 s | music.mp3 | ends on the last chord |
```

Order of work: the script first, approved in your head against the brief; the voice-over; then the music written to fit under it; effects last, only where the picture needs them. One sound per call. Everything lands on the asset at once, in a chat as in a task run; the user hears it there. Never ask whether a sound is wanted or liked: make it, say in one line what you made, and if they want another they will say so.

## Credits, the plan and what may be used

ElevenLabs counts credits. The free plan has 10,000 a month, which is about 10,000 characters of speech (a 30-second spot is about 450 characters), or 50 sound effects of 5 seconds, or about 11 minutes of music. Paid plans start at 30,000 a month. `credits` shows what is used and when it resets; check it before a batch, and say what the batch will cost before making more than a few files.

The free plan is for trying things out: **using the audio commercially, in a published ad or video, needs a paid plan**, and music has its own terms. Say so in the report the first time a sound is made for something that will be published, and whenever the plan shown by `credits` is `free`. Never clone a voice, and never ask for a voice that imitates a real person: ElevenLabs' terms forbid it without that person's consent, and so does honesty. The account's own voices (`category: cloned`) are ones the user made in ElevenLabs with consent; use them when the user says so.

## The voice

The business speaks with one voice, the way it writes in one tone. Pick it once and keep it.

1. `list_voices` shows ElevenLabs' premade voices with their labels: gender, age, accent, use case ("narration", "conversational", "advertisement"), and a short description. The account's own voices come with `category: cloned` or `professional`.
2. Pick for the brand, not for taste: the brief's `tone_of_voice` says whether it is warm or crisp, calm or energetic; the `audiences` say who is listening. A premium service wants a measured, lower voice; a youth brand a lighter, quicker one. Accent follows the audience: a British voice for a British audience, a neutral American one for an international one.
3. Any voice speaks every language of `eleven_multilingual_v2`; the accent carries over. For a Swedish, German or Spanish script, prefer a voice whose labels or description name that language, or the account's own voice in it; say in the report when the only voices available are English ones reading another language with an accent.
4. Tell the user which voice you picked and why, and that the project's **Default voice** setting (Setup → Abilities → ElevenLabs) is where they fix it for every voice-over to come. Until they do, name the voice in every `speak` call.

Voice settings: `stability` 0.5 is the default and right for narration; lower (0.3) for an emotional or conversational read, higher (0.7) for a steady announcer. `style` 0 unless the voice's own character should come forward. `speed` stays at 1 unless the brief's rhythm says otherwise; 0.9 for a calm premium read, 1.1 for a brisk reel, never outside 0.7 to 1.2.

## Writing for the ear

A script is heard once, at speaking pace, by someone who cannot scroll back. Write it as speech, in the brief's `language` and `tone_of_voice`, with its `brand_terms` spelled so the voice says them right.

- **Length by time.** Speech runs about two and a half words a second. A 6-second bumper is about 15 words; 15 seconds, 35 words; 30 seconds, 75 words; 60 seconds, 150 words. Write to the time the format gives and cut until it fits; a script that runs long is not a slightly long script, it is one that does not fit the video.
- **Short sentences, one idea each.** Subject, verb, object. No subordinate clauses a listener has to hold in their head.
- **Say it the way it is said.** Numbers as they are spoken ("two hundred and fifty", "the fifteenth of May"); abbreviations spelled out or spaced ("K I Q R" if the brand is said letter by letter, "kicker" if it is said as a word); URLs as a person says them ("kiqr dot com"); currency and units in words.
- **Punctuation is the performance.** A full stop is a pause and a drop; a comma a breath; an ellipsis a longer pause with weight; a question mark lifts the line; capitals add emphasis to a word, sparingly. No SSML, no `<break>` tags: `eleven_v3` and `eleven_multilingual_v2` do not take them.
- **Audio tags on `eleven_v3` only**, in square brackets where the performance needs them: `[whispers]`, `[laughs]`, `[sighs]`, `[excited]`, `[curious]`, `[sarcastic]`, or a description of the voice such as `[low, gravelly voice]`. One or two per script, never on an advertisement that should sound like an announcer. Tags describe the voice, not a sound cue: effects are `sound_effect`'s job.
- **Open on the listener, not the brand.** The first line is their situation or their question; the brand arrives when it answers it. No "Welcome to", no "At <brand> we believe".
- **End on one thing to do.** The call to action is one short sentence, said once, with where to go said as it is spoken.
- **Nothing invented.** Every claim, number and name comes from the brief or a page you read, as for any writing. A voice saying a false price is still a false price.
- **Long reads in parts.** Over about 2,500 characters (a minute and a half), split at a scene or a paragraph and read each part with `previous_text` and `next_text` set to the neighbouring parts, so the voice keeps its pace and tone across the join. Name them `voiceover-1`, `voiceover-2`.

Before `speak`, read the script aloud in your head once at pace. A line you stumble on, the voice will too.

## Sound effects

Describe what happens, where, and how it feels, not a category. "Heavy wooden door creaking open, then footsteps on gravel" over "door sound". The model follows the whole sentence, in order.

- **One effect per call**, named for what it is (`sfx-door`, `sfx-whoosh`, `sfx-cafe-ambience`). A sequence of events can go in one effect when it belongs together (a door, then steps); two things the editor will place separately are two calls.
- **Length**: set `seconds` for anything the picture times (a 0.8-second whoosh, a 2-second impact); leave it out for a texture and let the prompt decide. The range is 0.5 to 30 seconds.
- **`loop: true`** for ambience that sits under a scene (rain, a café, traffic, a room hum, a soft drone): it repeats without a seam, so a 10-second loop covers any scene.
- **Words the model knows**: impact, whoosh, ambience, one-shot, loop, braam (the cinematic low brass hit), glitch, drone, riser, stinger. Foley is the small real sounds (cloth, cups, keys): name the material and the action.
- **`influence`** 0.3 by default; 0.6 or more when the text must be followed literally (a count of three knocks), lower for variation.
- Effects are royalty-free on every plan, but the plan rule above still applies to the video they go into.

## Music

`create_music` takes a `prompt` and `seconds`. The lengths that work are 5, 10, 15, 20, 30, 45, 60, 90, 120 and 180 seconds; another number becomes 30. Write the prompt from five answers: genre, mood, instrumentation, tempo, era.

- **A bed under a voice-over**: say so. "Instrumental only. Warm, unhurried acoustic bed for a voice-over: soft piano, light brushed drums, upright bass, 80 BPM, no melody in the midrange so a voice can sit over it, gentle ending on a held chord." The model holds tempo cues ("130 BPM") and keys ("in A minor") precisely.
- **A jingle or a stinger**: the length of the logo moment (5 or 10 seconds), the brand's mood, "ends on a clear final hit". With sung words, write the lyric in the prompt from the brand's own words, and keep it to one line; the model times "lyrics begin at 3 seconds" if you say it.
- **"Instrumental only"** whenever no singing is wanted; left unsaid, the model may add vocals.
- **Exclusions work**: "no vocals", "no drums", "no melody, just rhythm".
- Make the bed after the voice-over, to its length plus a second at each end, and at a tempo that matches the read.
- Commercial use of the music needs a paid plan and ElevenLabs' music terms; the report says so until the plan is paid.

## The procedure

1. **Read** the brief (`get_brief`): language, tone of voice, brand terms, audiences, offerings with their facts. In a chat, what the user asked for comes first. `credits` once per session before the first sound.
2. **Decide the format**: the length in seconds, where it will play (a reel, a pre-roll, a radio spot, an explainer), and so how many words, whether there is a bed, which effects the picture needs.
3. **The asset**: `create_asset` of the right type with the script as its text (scene by scene for a video, with the on-screen text separate from the spoken lines), `title` as the piece is called, `tags` with the channel's kind when it has one.
4. **The voice**: the default voice, or `list_voices` and a pick explained in the report.
5. **`speak`** the script onto the asset, `name: voiceover`. Listen in your head to its length; redo a script that runs long rather than speed the voice up.
6. **`create_music`** for the bed at the matching length, `name: music`, when the format wants one.
7. **`sound_effect`** for each cue the picture needs, named for what it is.
8. **The cue sheet** into the asset's text (`update_asset`), with times, files and notes, including the mix notes (the bed down under the voice).
9. **Report** (next section). The draft waits for the user; nothing here publishes.

## What to tell the user

One short paragraph, no tool names:

- what was made and onto which asset: the voice-over (which voice, how long), the bed, the effects, as a short list with file names;
- the script's length against the format ("14 seconds for a 15-second reel");
- the voice you picked and why, and that the Default voice setting fixes it for the project;
- what it cost in credits and what is left, from the balance;
- that the files are parts to assemble by the cue sheet; nothing here mixes them;
- when the plan is free: that publishing the result commercially needs a paid ElevenLabs plan, and music its own terms;
- what you could not do: a language no available voice speaks natively, a length the format does not allow, a claim the brief does not support.

## A worked example

The business: a bicycle shop in Malmö. The brief: warm, direct tone, Swedish, audiences "commuters" and "families"; offering "spring service", 495 kr, "ready in two days"; brand term "Cykelhuset". The user asks for the sound for a 15-second Instagram reel about the spring service, from a clip they will shoot themselves.

- **Format**: 15 seconds, vertical reel, music under a voice, one effect at the start. About 35 words of Swedish.
- **Asset**: `create_asset`, `type: video`, title "Vårservice: reel 15 s", text with the three scenes (the bike in the hallway; the mechanic's hands; the bike rolling out) and the spoken lines under each.
- **Script** (the voice-over, 33 words): "Står cykeln kvar i hallen sen i höstas? ... Lämna in den hos Cykelhuset. Vi går igenom bromsar, växlar och kedja, för fyra hundra nittiofem kronor. Klar på två dagar. Boka på cykelhuset punkt se."
- **Voice**: `list_voices` shows no Swedish-native premade voice; the account has a cloned Swedish voice the user made, "Cykelhuset Maria" (`category: cloned`). Picked, and the report says so; with no such voice, the report would say the premade voices read Swedish with an English accent and suggest the user make one.
- **`speak`**: `asset` the reel, `name: voiceover`, `model: eleven_multilingual_v2`, `stability: 0.5`, `speed: 1`. Lands as `voiceover.mp3`, about 13 seconds.
- **`create_music`**: `seconds: 15`, prompt "Instrumental only. Bright, friendly spring bed for a short video with a voice-over: acoustic guitar, hand claps, light shaker, 112 BPM, no melody in the midrange so a voice sits over it, ends on a clean final strum at 15 seconds." Lands as `music.mp3`.
- **`sound_effect`**: `name: sfx-bell`, text "A single bicycle bell ring, bright and close, in a quiet hallway", `seconds: 1`. Lands as `sfx-bell.mp3`.
- **Cue sheet** added to the asset's text: 0.0 s music (bed, down under the voice); 0.3 s sfx-bell once; 1.0 s voiceover; 15.0 s music ends.
- **Report**: "The sound for the 15-second spring-service reel is on the video asset: a 13-second Swedish voice-over in your own voice Cykelhuset Maria (voiceover.mp3), a 15-second acoustic bed written to sit under it (music.mp3) and a single bell for the opening (sfx-bell.mp3); the cue sheet in the asset says where each goes, and your editor lays them under the clip. It used about 1,100 credits; 8,400 are left this month on the free plan, which allows trying this out but not publishing it commercially: a Starter plan does. The price and the two-day promise are from your spring-service page."
