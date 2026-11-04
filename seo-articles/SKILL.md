---
name: Write SEO-friendly articles for websites
description: "Before writing an article, blog post, guide or announcement for a website (a draft article asset): how to make it rank for the search it answers and read as the work of people who know, E-E-A-T first."
categories: [writing]
icon: search-check
author: KIQR
---

# Writing articles for a website

An article on the business's website is read by two readers. A person who searched for something and clicked, and Google, which decides whether the page deserves to be found. Both are served by one and the same thing: a page that helps the person who landed on it more than anything else they could have clicked. Everything below follows from that. It condenses Google's own documents (the Search Essentials and spam policies, "Creating helpful, reliable, people-first content", the guidance on AI-generated content, the title link, snippet, image, link and Article structured-data pages, and the Search Quality Rater Guidelines of September 2025) into what changes how you write. Google's terms are kept so the user can look any of it up.

E-E-A-T is the yardstick: Experience, Expertise, Authoritativeness and Trust. Trust is the most important of the four; the other three exist to support it, and a page that is untrustworthy has low E-E-A-T however expert it looks. E-E-A-T is not a ranking factor you can switch on; it is what Google's systems try to recognise, and what a reader feels.

## How an article is made in KIQR

The mechanics the rest of this text assumes.

1. Read `get_brief` first, not only the compact brief in the prompt. It holds `content_gaps` (each with `topic`, `rationale` and `intent`), `topic_clusters` with the site's real page URLs, `offerings` with their URLs, `audiences` and their needs, `tone_of_voice` (traits, example sentences, what to avoid), `brand_terms`, `differentiators`, `language`. `get_section` with `seo` gives the keywords and title patterns the site already uses; `get_section` with the relevant section (offerings, trust, content) gives the facts with their quotes and source pages. Those quotes and pages are the only evidence an article may rest on.
2. `read_metrics` when a Search Console source exists: its top queries and top pages say what people already search for and which pages already answer them. Do not write what an existing page already ranks for; link to it instead.
3. Save with `create_asset`, `type: article`. For an article, **`title` is the headline exactly as it will be published**: a publish sends `title` as the page title to WordPress and DEV, so it is the title link in Google, not an internal label. (The "3 to 7 words, an internal label" rule for posts does not apply to articles.) The body starts with the first paragraph; headings are `##` and below; never a `# Title` line, because the publisher adds the title itself and a repeated top heading becomes a second H1. **`summary` is the meta description**, one or two true sentences about this page: a publish passes it as the article's description where the service takes one (DEV) and as the pull request body for a site built from a repository. `tags`: the channel's kind first, as `list_channels` names it, then the topic in one or two words.
4. The cover comes right after the asset, by the `make-images` instructions (`create_image` with `asset` set): the editorial layout with the headline legible, or picture-led when Library → Media holds a real picture of the subject. Pictures inside the body only from `brand_kit`'s media, each with alt text that says what it shows.
5. Links only to URLs that exist: the site's pages from `get_brief` (`topic_clusters[].urls`, `offerings[].url`), the source pages in the evidence, or a page you read with `read_url` in this session. Never a guessed path, never a page you have not seen.
6. It is a draft. The user approves it in the chat, the library or To do; a publish is their yes on a card, and a publisher's `status: publish` (WordPress) only when they asked for it to go live.
7. In a task run nobody is reading along: do all of this, then report (see the last section).

## The Search Essentials

Google's Search Essentials are three things: technical requirements, spam policies and key best practices. Meeting them makes a page eligible; nothing guarantees it is crawled, indexed or shown.

**Technical requirements** are the site's job, not the writer's. Google lists three: Googlebot is not blocked (by robots.txt, a login or a paywall it cannot see through), the page works (a successful HTTP response, not an error page), and the page has indexable content (text in a supported format that does not violate the spam policies). The one consequence for you: everything that matters is in the text. A number, a claim or a step that exists only inside an image does not exist for search or for a screen reader.

**AI Overviews and AI Mode** have no requirements of their own. Google: "There are no additional requirements to appear in AI Overviews or AI Mode, nor other special optimizations necessary", and "You don't need to create new machine readable files, AI text files, or markup". To be cited there a page has to be indexed and eligible for a snippet, that is all. The fundamentals it lists are the same ones that matter here:

- crawling allowed, by robots.txt and by whatever hosts the site;
- the page findable through the site's own internal links (which is why an article links and gets linked);
- a great page experience;
- the important content available as text;
- text supported by good images and video where they help;
- structured data that matches the visible text;
- business information up to date where Google holds it (Business Profile, Merchant Center).

**Key best practices**, Google's list, as they bear on an article:

- Create helpful, reliable, people-first content (the whole next section).
- Use the words people would use to search for the content, and put them in prominent places: the title and the main heading, and descriptive places such as alt text and link text.
- Make links crawlable: ordinary Markdown links to real URLs.
- Tell people about the site: an article worth sharing is how; posts from the library can point to it.
- Images, video and structured data have their own best practices (below).
- Enhance how the page appears in Search with the features that make sense; nothing extra is needed for AI Overviews or AI Mode (above).

**What Google says not to focus on.** The SEO starter guide closes with the misconceptions, and they decide a lot of what you do not do:

- *Meta keywords*: Google Search does not use the keywords meta tag. Never write one.
- *Keyword stuffing*: "tiring for users" and against the spam policies, even in variations.
- *Keywords in the domain or URL path*: hardly any effect beyond breadcrumbs; the slug is for people.
- *Minimum or maximum content length*: "the length of the content alone doesn't matter for ranking purposes (there's no magical word count target, minimum or maximum)". Varying the words naturally is what gives a page more ways to match.
- *Duplicate content "penalty"*: the same content at several URLs is inefficient, not a manual action; copying others' content "is a different story".
- *Number and order of headings*: semantic order is for screen readers; Google does not mind the order, and there is no ideal count.
- *PageRank*: links matter, "there's much more to Google Search than just links".
- *Thinking E-E-A-T is a ranking factor*: "No, it's not." It is what the systems try to recognise, which is why you write for it rather than at it.

**Spam policies.** Google defines spam as techniques that deceive users or manipulate Search systems, including manipulating generative AI responses in Search. A site that does these ranks lower or disappears. Every policy, as it would look in an article you write, and the rule that keeps you clear of it:

- **Cloaking**: showing search engines different content than people see. You write one text for everyone.
- **Doorway abuse**: many near-identical pages for similar queries ("plumber in Malmö", "plumber in Lund", …) funnelling to one destination. One article per real question. A locations series is only honest when each page says something true and different about that place.
- **Expired domain abuse**: content unrelated to a domain's past, to borrow its standing. Not a writer's matter; the site is the business's own.
- **Hacked content**: not yours to cause; if a page you read on the site looks spammed, tell the user.
- **Hidden text and link abuse**: text or links people cannot see. Nothing in the article is for Google only.
- **Keyword stuffing**: repeating words or phrases until the text sounds unnatural, lists of cities or phone numbers, blocks of search terms. The query appears where a reader expects it (title, first paragraph, a heading) and then you write normally. Google's language matching does not need the exact phrase repeated; it needs the page to be about the thing.
- **Link spam**: links bought, exchanged or planted to pass ranking credit, keyword-rich anchors in guest posts and press releases, links required by a contract. You link because the reader needs the page. Paid or sponsored links are allowed only qualified (`rel="sponsored"`, below).
- **Machine-generated traffic**: not a writer's matter.
- **Malicious practices** and **misleading functionality**: promising a tool, a download or a service the page does not deliver. An article promises in its title only what its body delivers.
- **Scaled content abuse**: many pages made mainly to rank, with little or no value for the reader, "no matter how it's created"; Google names generative AI tools explicitly as one way to do it. The rater guidelines rate such pages Lowest even when unsure how they were made. For you: ten articles on ten content gaps in one task are fine when each rests on the brief's evidence and answers a different question. Ten variations of one idea, or one article for every synonym of a query, is this policy.
- **Scraped content**: republishing other sites' content, even slightly reworded, even with credit. Your source is the business's own pages and your own explanation; a quotation is short, attributed and linked.
- **Site reputation abuse**: third-party content placed on a site mainly to ride its ranking. Not what you do; an article written for the business, in its voice, with its editorial responsibility, is first-party.
- **Sneaky redirects**: not a writer's matter.
- **Thin affiliation**: product descriptions copied from a merchant with nothing added. A comparison or a review you write carries the business's own experience, criteria and conclusions, or it is not written.
- **User-generated spam**: comments and forum posts; the site's job.
- **Other practices that lead to demotion or removal**: legal and personal-information removals, policy circumvention, scam and fraud (impersonating a business, false information about one). Never write anything about a competitor or a person that the evidence does not support.

## People-first content

Google's own test, from "Creating helpful, reliable, people-first content". Its automated systems try to reward content "created to benefit people, and not content that's created to manipulate search engine rankings". Run every article through the questions. A "yes" to every one is the standard; a "no" is a rewrite, not a footnote.

**Content and quality**

- Does it provide original information, reporting, research or analysis?
- Does it provide a substantial, complete or comprehensive description of the topic?
- Does it provide insightful analysis or interesting information beyond the obvious?
- If it draws on other sources, does it avoid simply copying or rewriting them and instead provide substantial additional value and originality?
- Does the main heading or page title provide a descriptive, helpful summary of the content?
- Does the main heading or page title avoid exaggerating or being shocking?
- Is this the sort of page you'd want to bookmark, share with a friend or recommend?
- Would you expect to see this content in, or referenced by, a printed magazine, encyclopedia or book?
- Does it provide substantial value when compared to other pages in search results?
- Does it have any spelling or stylistic issues?
- Is it produced well, or does it appear sloppy or hastily produced?
- Is it mass-produced or spread across many sites, so that pages do not get much attention or care?

**Expertise**

- Does it present information in a way that makes you want to trust it: clear sourcing, evidence of the expertise involved, background about the author or the site (an author page, an About page)?
- If someone researched the site, would they come away with the impression that it is well-trusted or widely recognised as an authority on its topic?
- Is it written or reviewed by an expert or enthusiast who demonstrably knows the topic well?
- Does it have any easily verified factual errors?

**People-first** (yes means you are on the right track)

- Is there an existing or intended audience for the business that would find this useful if they came to the site directly?
- Does it clearly demonstrate first-hand expertise and depth of knowledge (from having actually done the work, used the product, visited the place)?
- Does the site have a primary purpose or focus, and is this within it?
- After reading, will someone leave feeling they've learned enough about the topic to help achieve their goal?
- Will they leave feeling they've had a satisfying experience?

**Page experience**: Google's systems reward "a good page experience", and it asks site owners to look at it as a whole rather than one metric. For the writer that is readable structure, pictures that earn their weight, nothing that pushes the content down.

**Search-engine-first** (yes is the warning sign; Google's list)

- Is the content primarily made to attract visits from search engines?
- Is it one of lots of pieces on many different topics in the hope that some perform?
- Is extensive automation producing content on many topics?
- Is it mainly summarising what others say without adding much value?
- Is the topic there because it is trending, not because the business would write about it for its audience?
- Will readers feel they need to search again to get better information elsewhere?
- Is it written to a word count because Google is said to prefer one? (Google: "No, we don't.")
- Is it a niche topic the business has no real expertise in, chosen for traffic?
- Does it promise to answer a question that has no answer (a date nobody has confirmed)?
- Is a date being changed to make a page seem fresh without substantial change?
- Is a lot of content being added or removed to make the site seem "fresh" for rankings? (Google: "No, it won't.")

Google's own note on SEO: things that help search engines discover and understand content are fine and useful when applied to people-first content; they are not a substitute for it.

**Main content.** Google defines main content as every part of the page that directly helps it achieve its purpose: the primary text and media, interactive features, user contributions when they fulfil the purpose, content behind tabs, and the visible title and headings. Raters evaluate four attributes of it, and so should you:

- **Effort**: how much human work went into the content or the systems behind it. Original analysis is high effort; generating text at volume without oversight or curation is "little to no effort". Attribution does not replace original effort.
- **Originality**: unique information or perspective not already available on other websites.
- **Talent or skill**: enough to give a satisfying experience: clear writing, correct steps. Not every topic needs specialised expertise; someone sharing a better way to clear a driveway of snow needs none.
- **Accuracy**: factually accurate for informational pages; for YMYL topics, highly accurate and consistent with established expert consensus.

**Who, how and why.** Google asks three questions of every piece.

- *Who* created it: is it self-evident, is there a byline where a reader expects one, does the byline lead to background about the author? Google "strongly encourage[s] adding accurate authorship information". And: fabricating creator profiles (AI-generated headshots, made-up names, false credentials) "is a form of deception" and a signal of a low-quality page. You never invent an author. The byline is a real person the user names, with the background they confirm, or there is none and the report asks who signs it.
- *How* it was made: readers should be able to tell. For a review, how many products were tested and how; for AI-assisted content, whether the use of automation is self-evident, what background is given, why it was useful. Google: disclosures "are useful for content where someone might think 'How was this created?'", so add one where it would reasonably be expected. In practice: the report tells the user the article was drafted by Seemo from the business's own pages and asks them to review it as the person who signs it; it is their call, and their site's convention, how the page says so.
- *Why* it exists: "perhaps the most important question". To help people who would come to the site directly, yes. Primarily to attract search visits, no, and using automation for that purpose is a spam-policy violation.

## E-E-A-T, from the rater guidelines

The Search Quality Rater Guidelines are not a ranking manual; raters' scores do not feed ranking directly. They are Google's description of what a good page is, and the best self-assessment available. The guidelines say:

- **Trust**: "the extent to which the page is accurate, honest, safe, and reliable". The most important member; "untrustworthy pages have low E-E-A-T no matter how Experienced, Expert, or Authoritative they may seem". How much trust a page needs depends on the page: an online store needs secure payment and reliable customer service; a product review must be written to help a buyer decide, not solely to sell; an informational page on a clear YMYL topic must be accurate; an entertaining post needs little.
- **Experience**: "the necessary first-hand or life experience for the topic". A review by someone who used the product, over one by someone who did not. In KIQR, experience is only what the business's own pages and the user say: its case studies, its "how we work" pages, the numbers and years it publishes, the places it is. You write that experience into the article as the business's, in its words, with its evidence. You never invent a first-person anecdote, a customer story, a test or a visit.
- **Expertise**: "the necessary knowledge or skill for the topic". Rewiring advice from a skilled electrician, not from an antiques enthusiast. Expertise shows in specifics: the correct terms, the real trade-offs, the step people get wrong, what depends on what. It does not show in adjectives ("expert", "leading", "trusted") and never in invented credentials.
- **Authoritativeness**: being "known as a go-to source for the topic". Most topics have no single official source; a local business's own profile is the authoritative source for what it sells now. An article earns authority by being about what the site is about, linking the site's own relevant pages, and being worth linking to.

Raters assess E-E-A-T from three places, and a reader does too: what the site says about itself (About, author pages), what others say about it (independent reviews, references, news), and what is visible on the page itself (the main content, whether it shows experience and expertise). A clear conflict of interest lowers trust: "reviews" by a manufacturer of its own product are not reviews. So an article that compares the business's offering with alternatives states the business's position openly and keeps the comparison honest, or it is a sales page and should be called one.

**Who is responsible.** Raters are told to find who is responsible for the website and who created the content, and to look for About, contact and customer-service information; a complete lack of it on a page that needs trust is Lowest, an unsatisfying amount is Low, and for a store or any site that takes money the customer-service information is examined. The trust chapter adds other aspects beyond E-E-A: customer service for a store, peer review for an academic author. None of this is in the article's body, but it is the ground it stands on. When the site has no About page, no named people and no contact details, say so in the report: the best article cannot make up for a site that will not say who it is.

**What a byline can and cannot do.** A byline with a real person behind it, linked to a page about them, is what Google asks for where a reader expects one; an article "by the team" is honest when it is true. A byline is never a device: no borrowed names, no titles the person does not hold, no "reviewed by a specialist" unless a named specialist reviewed it. When the user wants a professional's review on a YMYL piece, the report asks for it and the article is published only after it.

**YMYL.** "Your Money or Your Life" topics could significantly impact "the health, financial stability, or safety of people, or the welfare or well-being of society": health or safety; financial security; government, civics and society (voting, public institutions); and other topics that could hurt people. Clear YMYL: when to go to the emergency room, how to invest, who can vote. Not YMYL: how often to wash jeans, the weather, music award winners. Advice is YMYL when poor advice could cause significant harm. For a YMYL article:

- the bar is accuracy and consistency with well-established expert consensus; a mild inaccuracy that would be Low quality elsewhere makes a YMYL page untrustworthy;
- information or advice that must come from experts (medications, treatments, tax forms, how to invest, eligibility to vote) is written only where the business is that expert, cited to its own pages, and still says when a professional's assessment is needed;
- first-hand experience on a YMYL topic has high E-E-A-T when it is trustworthy, safe and consistent with expert consensus (how people cope, practical non-medical tips), and that is the register when the business is not the expert;
- the report says the topic is YMYL and that the user, or the professional who signs it, must review every factual claim before it goes live.

The guidelines' own examples of where experience is valuable and where only expertise will do, which is the line an article must not cross unless the business is the expert:

- *Sleep in pregnancy*: tips from people who struggled with it (how to use pillows safely) are valuable experience; which sleep medications are safe is for experts.
- *Liver cancer*: a sincere discussion of how people cope is experience; treatment options and life expectancies are for experts.
- *Taxes*: a humorous take on the frustration is experience; instructions on filling out the forms are for experts.
- *Retirement*: reviews of saving services by people who used them are experience; how much to save and what to invest in is for experts.
- *Voting*: why someone votes is experience; who is eligible and how to register is for experts.

**The three kinds of Lowest page** are harmful, untrustworthy and spammy. Harmful: content that encourages or causes harm to people, that promotes violence or hatred against a group, or that misinforms in a way that could cause harm ("harmfully misleading information": harmful and clearly inaccurate claims, claims that contradict well-established expert consensus, harmful unsubstantiated theories). None of these is a risk in an honest article, with one exception: a health, safety, legal or financial claim stated with confidence and without a source is how a well-meant page becomes harmfully misleading. Untrustworthy: deceptive purpose, deceptive information about who is behind the page, deceptive design, obstructed content, suspected malice. Spammy: hacked, gibberish, no main content, copied or generated content with nothing added, scaled content abuse.

**Lowest quality**, in the guidelines, any one of: a harmful or deceptive purpose, or deception about who is responsible for the page; content harmful to people or groups, or harmfully misleading; a page made to benefit the owner with little or no attempt to benefit visitors; a complete lack of information about who is responsible, for pages needing trust; a very negative reputation; highly untrustworthy; main content obstructed by ads; an extremely misleading, shocking or exaggerated title; hacked or gibberish; main content "created with little to no effort, has little to no originality and ... adds no value compared to similar pages on the web", which the guidelines spell out to include copied, paraphrased, embedded, "auto or AI generated" content with nothing added, even with credit given. And explicitly: generative AI tools "may be used for high quality and low quality content creation"; the tool does not decide the rating, the effort, originality and added value do.

**Low quality**, any one of: main content without adequate effort, originality, talent or skill; a slightly misleading, shocking or exaggerated title; ads that distract; an unsatisfying amount of information about the site or the creator; a mildly negative reputation; an inadequate level of E-E-A-T for the page's purpose ("a restaurant review written by someone who has never eaten at the restaurant"; "an article about how to skydive written by someone with no expertise"), which "no other considerations such as positive reputation ... can overcome". The guidelines' examples of Low main content are worth keeping in mind: a tutorial with "filler" on top and the instructions at the bottom; a "best vacuum cleaners" list paraphrased from other reviews; a top-ten slideshow of other people's pictures; a one-fact page padded with off-topic text; a list of the tallest mountains missing Everest. **Filler** gets its own section in the guidelines: the most helpful content goes near the top; low-effort text that inflates the page and pushes the answer down is a poor experience and a Low rating.

**High and Highest quality**: main content made with a high (very high) level of effort, originality, talent or skill, so the page achieves its purpose well (very well); a positive (very positive) reputation for the topic; a high (very high) level of E-E-A-T. High originality is content "unique or original to the website", original photos, "a personal perspective based on first-hand life experience". Very high quality informational content is "original, accurate, comprehensive, clearly communicated, and should reflect expert consensus as appropriate". "Typical" and "average" pages on a topic are Medium, not High. Have high standards: before you call an article done, picture the best page on the web for that question and ask what yours offers that it does not. If the answer is nothing, the article needs the business's own experience in it, or it needs a different question.

**Copied, paraphrased, added value.** The guidelines distinguish content copied exactly, copied with minimal alteration (a few words swapped to defeat a search), copied from a changing source, and paraphrased from one or many sources "by people or generative AI tools", and say paraphrasing "may be valuable, for example when an expert paraphrases the contents of a government policy in easy-to-understand language". The test is always added value and effort. For you: explaining a regulation, a standard or a method in the customer's language, from the business's experience of applying it, is the valuable kind; restating another site's article is the other kind, and the fact that the words differ changes nothing.

**Reputation** is what others say about the business, found outside its site; it is not something an article can assert. Raters are told to "be skeptical of claims that websites make about themselves". So: no "award-winning", "trusted by thousands", "number one" unless the brief holds the award, the number and its source; testimonials only when the site publishes them, quoted exactly, with where they are from; awards named with the year and the body that gave them.

## AI-generated content

Google's guidance: generative AI is "particularly useful when researching a topic, and to add structure to original content"; using it "to generate many pages without adding value for users" is scaled content abuse. Appropriate use "is not against our guidelines"; the question is always whether the result is helpful, original and accurate. Google also warns that generative models "don't retrieve facts, but predict a likely sequence of words" and asks for a manual fact check of everything before publishing, including the title, the meta description, structured data and alt text, which all appear in Search.

What this means here. You are the automation. Every fact in the article is one you can point to in the brief, the evidence or a page you read; everything else is explanation, structure and the business's voice. You add the value Google asks for by answering the one question completely, from the business's own experience, better organised than what exists. You never produce the same article twice with the words moved around, never fill a gap with plausible numbers, never attribute the piece to a person who did not write it. The report says what was drafted automatically and asks the signing person to check it. That is the disclosure Google asks for, placed where the decision is made.

## The query and the intent

An article answers one search. Pick it before you outline.

- **The query** is the content gap's `topic`, sharpened into the words a customer would type, in the brief's `language`. Search Console's top queries, when there are any, show the vocabulary people actually use for this business. Google's starter guide: expect the readers' search terms, and remember that beginners and experts use different words ("charcuterie" and "cheese board"); write for the reader you want, and do not chase every variant, Google's language matching handles that.
- **The intent** is the gap's `intent`, and it decides the shape:
  - *informational*: teach. The answer in the first paragraph, then the depth, the reasons, the exceptions, what to do next.
  - *commercial*: compare honestly. Criteria first, the alternatives as they really are, the business's offering in its place with the trade-offs the brief states, the business's position declared. A comparison that always ends at the business is a sales page; write it as one, or make it honest.
  - *transactional*: say what it is, what it costs if the brief says, how to get it, what happens next, in that order, no padding.
  - *navigational*: rarely an article at all; say so and suggest the page that should answer it.
- **One query, one page.** A second question big enough for its own article gets its own article, and a link.
- **Words where people look for them**: in the title, in the first paragraph, in a heading or two, in alt text when a picture shows the thing, and then written naturally. Synonyms because readers use them, not for coverage.
- **Freshness is honesty.** A true publication date. "Updated" only when something changed, and then the change is real. No year in the title unless the content is about that year.

## Title links and snippets

The title is the headline, the `title` of the asset, and Google's title link in results, "often the primary piece of information people use to decide which result to click". Google's best practices for it:

- Descriptive and concise. No vague descriptors; nothing "unnecessarily long or verbose". There is no character limit, but Google truncates to fit the device, so the point comes first; a headline that stays whole on a phone is about 50 to 60 characters, a guide, not a target.
- No keyword stuffing: the same words do not appear twice ("Foobar, foo bar, foobars" is Google's example of what looks spammy).
- No boilerplate: distinct for every page; not a template that varies by one word.
- Brand concisely, if at all: the site name at the end after a delimiter, when the publisher does not add it already; never the brand in every headline for its own sake.
- One clear main title: the headline is the only H1-weight text; sections are `##`.
- The language and writing system of the page.
- Google takes the title link from several sources (the `<title>`, the visible main title, headings, `og:title`, prominent text, anchor text from other pages, structured data) and rewrites it when it finds an issue. Its list of issues is a checklist of what not to produce:
  - *half-empty*: a title that is only the site name or a separator;
  - *obsolete*: a year or a date in the title that the page itself contradicts;
  - *inaccurate*: a title that does not reflect the content ("Giant stuffed animals, teddy bears, polar bears" over a page about one thing);
  - *micro-boilerplate*: identical titles across pages that differ by a season or a number;
  - *no clear main title*: several headings of equal weight, so Google picks the first;
  - *writing-system mismatch*: a title in a different language or script than the page;
  - *a duplicated site name*: the brand twice, so Google drops one.
  A headline that says what the page says, once, in the page's language, is what it keeps.
- The rater guidelines on the same point: a Medium or better page has a title that summarises the page; "slightly misleading, shocking, or exaggerated" is Low; "extremely" so is Lowest.

The meta description is the `summary` of the asset. Google uses it for the snippet "if we think it gives users a more accurate description than would be possible purely from the on-page content". Its rules:

- Unique to this page; never a site-level sentence reused.
- Truly descriptive of this page: what the reader will learn or be able to do, the key facts (for an article, Google suggests the author, the date or the byline can belong here), written as a sentence or two, not a keyword list ("long strings of keywords ... are less likely to be displayed").
- A pitch that convinces the reader the page is what they searched for, and keeps the promise.
- No length limit, truncated to the device; around 150 characters stays whole.
- Google's own pairs, worth keeping in mind:
  - bad, a keyword list: "Sewing supplies, yarn, colored pencils, sewing machines, threads, bobbins, needles"; better: "Get everything you need to sew your next garment. Open Monday-Friday 8-5pm, located in the Fashion District."
  - bad, the same line on every article: "Local news in Whoville, delivered to your doorstep. Find out what happened today."; better, from the article itself: "Upsetting the small town of Whoville, a local elderly man steals everyone's presents the night before an important event."
  - bad, not a summary of the page: "Eggs are a source of joy in everyone's life. When I was a small child, I remember picking eggs from the hen house …"; better: "Learn how to cook eggs with this complete guide in 1 hour or less. We cover all the methods, including: over-easy, sunny side up, boiled, and poached."
  - bad, too short: "Mechanical pencil"; better, specific: "Self-sharpening mechanical pencil that autocorrects your penmanship. Includes 2B auto-replenishing lead. …"

## Structure and headings

- **The first paragraph answers or frames the query** in two to four sentences. A reader from a search decides in seconds whether this is the page; Google's snippet may be taken from it. The guidelines on filler: the most helpful content near the top, supporting content lower. No throat-clearing, no "in this article we will", no restating the question at length.
- **`##` sections in the order a reader needs them**, each heading saying what the section says (a reader scanning headings should get the gist; Google reads them as main content). `###` for steps and sub-points. Google says heading order and count do not matter to ranking, "but if you think it's too much, then it probably is".
- **Short paragraphs, plain sentences.** Lists for steps and options, a table for a comparison with the criteria as columns. Bold rarely, for the one thing a scanner must not miss.
- **Length is whatever completeness takes.** Google: "there's no magical word count target, minimum or maximum". A page that leaves the reader needing to search again is too short; a page with sections the question did not ask for is too long. Cut what the brief cannot support rather than pad it.
- **Specifics over generalities**: a number with its source, a named step, the exact term the trade uses, the exception that bites. This is where expertise becomes visible.
- **An honest end**: what to do next, which may be "ask us", "read this other page", or "this depends on X, here is how to find out". Not a sales close on every piece.
- **FAQ sections only for questions people actually ask**, each with a real answer; never as a way to place more keywords. A question already answered in the body is not repeated.
- **Dates and facts stay checkable**: "in 2024 we …" only when the brief says so; "most", "many", "studies show" only with the study, linked.

## Links

Google's starter guide: links connect readers and Google to other pages, most new pages are discovered through them, and a link "can also add value by connecting users (and Google) to another resource that corroborates what you're writing about".

- **Internal links** to the site's own relevant pages: the offering the article is about, the page that goes deeper, the contact or booking page where that is the honest next step. Real URLs only, from the brief or the evidence. Anchor text that says what the page is ("our pricing for small teams"), not "click here" or "read more"; Google reads the anchor as a description of the target.
- **Outbound links** when a claim rests on a source: an official body, a standard, a study, a documentation page. Read it with `read_url` first and link only if it says what you say it says. Trust the resource; Google: if you cannot trust it and still link, qualify the link.
- **Qualified links.** Google's `rel` values: `sponsored` for advertisements and paid placements (including a product sent in exchange for coverage), `ugc` for user-generated content, `nofollow` when neither applies and the site should not be associated with the target. Unqualified paid links are link spam. Markdown cannot set `rel`, so when the article carries an affiliate, sponsored or partner link, the report names it so the user can qualify it on the site.
- **No link schemes**: no reciprocal linking, no links in exchange for anything, no keyword-rich anchors placed for ranking, no links to pages you have not read.

## Images

Google reads images through the text around them, their alt text and their file names.

- **Real pictures of the subject** from Library → Media (`brand_kit`), placed next to the text they illustrate; Google: "place them near text that's relevant to the image", because that text tells it what the image is about.
- **Alt text** that describes the image in one plain sentence as it relates to the page ("Dalmatian puppy playing fetch" is Google's best example; a list of keywords is its worst). It is what a screen reader says and what a slow connection shows. Never stuffed, never empty on a picture that carries meaning.
- **File names** short and descriptive when you name a file (Google: `my-new-black-kitten.jpg` is better than `IMG00023.JPG`; avoid `image1.jpg`, `pic.gif`); `media` files keep theirs. Google calls the filename a "very light" clue, so never bend a name for it.
- **Captions and the text around a picture** are how Google learns what it shows; a picture placed under the heading it belongs to, with a caption that says what it is, does more than any alt text alone.
- **Sharp, not heavy**: images are usually the largest part of a page; the renderer and the publisher size them, but you do not add a picture that adds nothing.
- **Nothing that must be read lives only in an image.**
- **The cover** by `make-images`: the headline legible, the editorial layout or picture-led with a real picture; a generated picture only for a mood or a concept, never shown as the business's product, place or people. Google's rule for the representative image of a page: relevant to the page, not a logo, not text-on-colour where a real picture exists, not an extreme aspect ratio, high resolution. A publisher that takes the cover (WordPress) uses it as the featured image; one that takes a cover by URL only (DEV) gets none, and the article is written to stand without it.

## Structured data and the page around the article

Article structured data (`Article`, `NewsArticle`, `BlogPosting`) helps Google "show better title text, images, and date information". Its recommended properties are `headline` (concise), `image` (relevant, crawlable, ideally in 16:9, 4:3 and 1:1), `datePublished` and `dateModified` in ISO 8601 with a timezone, and `author` as a `Person` or `Organization` with `name` (only the name, no "posted by", no title or honorific in it) and `url` to a page that identifies the author. Google: "Make sure your structured data matches the visible text on the page."

Google's author rules for that markup are worth knowing because they describe what an honest byline looks like in data: every author shown on the page is in the markup; each author in their own `author` entry, never "Willow Lane, Regula Felix" in one; the `name` holds the name only (no "posted by", no job title, no honorific; those have their own properties); the type is `Person` for a person and `Organization` for an organisation, never the wrong one or `Thing`; a `url` that identifies the author (a staff page, an "about me" page, a profile), so the byline leads somewhere, which is exactly what the helpful-content page asks of a byline.

This is the site's job, not the article's: WordPress and most themes emit it, a site built from a repository puts it in frontmatter by its own recipe (the `github` ability's instructions say what the recipe takes), DEV does its own. What the article supplies is the truth it is built from: the headline, the real author, the real date, the cover. When the user asks why an article does not rank, the things around the article are the first place to look: an author page the byline can link to, an About page, contact details, dates, a canonical URL, and whether the page is indexed at all (Search Console says).

## Writing in the business's voice

- The brief's `language`. Its `tone_of_voice`: the traits, the example sentences as a tuning fork for rhythm and vocabulary, and never what `avoid` lists. `brand_terms` spelled exactly. Differentiators as the site states them, not inflated.
- **Every claim from the brief or a read source.** No invented prices, numbers, dates, customers, awards, quotes, studies or "industry averages". Where the article needs a fact the brief does not hold, write around it or leave a plain placeholder in the report ("needs: the average turnaround time"), never a plausible value.
- **Honesty**: nothing the business does not do or sell; no result it does not promise on its own pages; no comparison claim about a competitor the evidence does not support; no fake urgency.
- **No hollow openers or fillers**: "In today's fast-paced world", "In this article we will explore", "It's no secret that", "Whether you're a … or a …". Start with the answer.
- **No hype**: no "ultimate", "game-changing", "best-in-class", "seamless"; no exclamation marks unless the brand's own examples use them; no emoji in an article.
- **Plain words** over jargon unless the audience is the trade and the brief says so, in which case the trade's exact terms, used correctly, are the expertise.
- **The reader is a person** with a question, not "users" or "customers" in the third person. "You" is right in most tones; the brief decides.

## The procedure

1. **Read**: `get_brief`; `get_section` with `seo` and with the sections the topic touches; `read_metrics` for queries and pages when a source exists; `brand_kit` for the pictures. In a chat, what the user said about the piece comes first.
2. **Pick** the content gap (the one named, or the biggest one tied to an offering) and write down, for yourself, the query in the customer's words and its intent. Check nothing on the site already answers it; if a page does, write the next question or improve that page instead, and say so.
3. **Gather the evidence** the article may use: quotes and facts from the sections with their source pages, the offering URLs, the real pictures, a source page read with `read_url` for any outside claim. Note what the article would need that the business has not said; that list goes in the report.
4. **Outline** against the intent: the first paragraph's answer, the `##` sections in reading order, where each piece of evidence lands, which internal links go where, what the honest end is.
5. **Draft** in the voice, specifics first, no filler. Headline and meta description last, from what the article turned out to say.
6. **Self-check** (next section). Fix, do not annotate.
7. **Save**: `create_asset` with `type: article`, `title` the headline, `summary` the meta description, `text` the Markdown body (first paragraph first, `##` sections, no `# Title`), `tags` (channel kind, topic), `campaign` when it belongs to one.
8. **The cover**: `create_image` with `asset` set, by `make-images`.
9. **Report** (last section). In a task run, the report is the only thing the user sees.

## The self-check

Before saving, every line must be true. One false line is a rewrite of that part.

- The article answers one query, named, with one intent, and the first paragraph answers or frames it.
- A reader finishes knowing enough to act, without needing to search again.
- It says something the best existing page on the question does not: the business's own experience, specifics, or a clearer explanation.
- Every fact, number, date, name, price and quote is in the brief, the evidence or a page I read; none is invented or "typical".
- Experience and expertise are shown in specifics from the business's own material, not asserted with adjectives.
- Nothing is claimed about the business's reputation, awards, customers or results that the brief does not hold with a source.
- No competitor or person is described beyond what the evidence supports.
- If the topic is YMYL: the claims are consistent with expert consensus, it says when a professional is needed, and the report flags the review.
- The headline describes the page, once, with the point first, no stuffing, no exaggeration, no boilerplate, and it is unique on the site.
- The meta description is one or two true, specific sentences about this page that would make the right reader click, not a keyword list.
- Headings say what their sections say; the order is the reader's order; the helpful content is at the top, not under filler.
- The length is what completeness took; no section exists to make it longer; no FAQ repeats the body.
- Every link goes to a URL that exists and says what I say; anchors describe their targets; any paid or affiliate link is named for qualification in the report.
- Every picture is a real one of the subject with one-sentence alt text; nothing that must be read is only in an image.
- The voice is the brief's: language, tone, brand terms, nothing from `avoid`, no hollow openers, no hype, no exclamation unless the brand's.
- The byline is a real person the user named, or there is none and the report asks.
- The body has no `# Title` line; the title is in `title`, the meta description in `summary`.
- I would be glad to put my own name to this page.

## A worked example

The business: a dental clinic in Gothenburg. The brief's content gaps include "Is teeth whitening safe for sensitive teeth?" (`intent: informational`, rationale: supports the whitening offering; the audience "adults considering cosmetic treatment" asks it). The site has a whitening service page with its method, a price range and the line "we always examine your teeth before whitening"; a page on sensitive teeth; a dentist's About page. Search Console's queries include "whitening sensitive teeth" and "does teeth whitening hurt".

- **YMYL**: yes (health). The clinic is the expert here; still, the article cites its own pages, stays with consensus (whitening can cause temporary sensitivity; an examination comes first; some conditions make whitening unsuitable), and says plainly that only an examination can tell for a given mouth.
- **Query**: "is teeth whitening safe for sensitive teeth"; variants from the metrics: "does whitening hurt".
- **Headline** (`title`): `Teeth whitening with sensitive teeth: what is safe and what to expect`
- **Meta description** (`summary`): `Whitening can be done with sensitive teeth when your dentist checks them first. What causes the sting, which methods are gentler, and when to wait.`
- **Headlines considered and dropped**: "Teeth whitening and sensitive teeth" (says nothing a reader can act on); "Is teeth whitening safe? The ultimate guide for sensitive teeth" (hype, and a promise the body cannot keep); "Whitening sensitive teeth Gothenburg dentist whitening" (stuffing).
- **First paragraph**, as drafted: "Yes, most people with sensitive teeth can whiten them, as long as a dentist has looked first. Whitening gel opens the enamel briefly, which is why it can sting, and some conditions (worn enamel, exposed roots, untreated cavities) make it a bad idea until they are treated. At our clinic every whitening starts with an examination for exactly that reason. Here is what causes the sting, which methods are gentler, and when it is better to wait."
- **Outline**: first paragraph with the answer (above); `## Why whitening can sting` (the mechanism, in plain words, consistent with consensus); `## What we check before we whiten` (from the service page, quoted; links to it); `## Methods that are gentler on sensitive teeth` (only the ones the clinic's page names, with its own description, no invented products); `## When whitening is not the right step` (conditions the site names; "a dentist has to look"); `## What to expect afterwards` (from the site's aftercare text); an honest end: book an examination, linked, or read the sensitive-teeth page, linked.
- **Evidence used**: the service page (method, examination line, price range if used), the sensitive-teeth page, the About page for the byline. **Missing**: how long the clinic's patients typically report sensitivity after treatment (not on the site; not invented), whether the clinic offers a desensitising gel (the report asks).
- **Byline**: the dentist on the About page, pending the user's confirmation; the report asks them to review the article as its author.
- **Cover**: editorial layout, kicker GUIDE, the headline, the clinic's mark; or picture-led if Media holds a real picture of the clinic's treatment room (never a stock smile presented as a patient).
- **Report**: "Drafted the article answering 'is teeth whitening safe for sensitive teeth' (informational, a health topic, so please review every claim before it goes live). Headline and description are in the draft; it links your whitening page, your sensitive-teeth page and the booking page. It rests on what those pages say. Two things it could not say: how long sensitivity usually lasts for your patients, and whether you offer a desensitising gel; add either and I will work it in. It needs a byline: your About page names Dr … as the dentist; is that who signs it?"

## What to tell the user

After the article, one short paragraph, no tool names:

- the query it answers and its intent, in a few words;
- that the headline and meta description are set, quoting the headline;
- which of the site's pages it links;
- what evidence it rests on, in a phrase ("your service page and your About page");
- what it could not claim and why, as a short list the user can answer;
- that the topic is YMYL and needs a professional's review, when it is;
- any link that must be qualified as sponsored or affiliate on the site;
- the byline question when no author was named;
- when the user asks why an article is not ranking: what the page around it needs (an author page, dates, a canonical, indexing), and that `read_metrics` will show whether it is being searched for at all.

The draft waits for their approval; you never publish it on your own.
