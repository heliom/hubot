# Description:
#   A way to interact with the DropMeme API.
#
# Commands:
#   hubot [drop]meme[ me] <slug>|<top text>|<bottom_text> - Queries DropMeme API and returns the meme
#
# Examples:
#   hubot dropmeme one-does-not-simply|One does not simply|support Hubot

# http://dropmeme.com/api/v1/templates
DROPMEME_SLUGS =
  '10-guy': 1,
  '1950s-middle-finger': 1,
  '1990s-first-world-problems': 1,
  'ancient-aliens': 1,
  'annoyed-picard': 1,
  'annoying-facebook-girl': 1,
  'asshole-ref': 1,
  'baby-godfather': 1,
  'bad-joke-eel': 1,
  'bad-luck-bear': 1,
  'bad-luck-brian': 1,
  'beard-baby': 1,
  'big-bird-and-snuffy': 1,
  'brace-yourselves-x-is-coming': 1,
  'business-cat': 1,
  'butthurt-dweller': 1,
  'chainsaw-bear': 1,
  'chavez': 1,
  'chemistry-cat': 1,
  'computer-guy': 1,
  'confession-bear': 1,
  'conspiracy-keanu': 1,
  'courage-wolf': 1,
  'cow-photobombing-horse-stuck-in-fence': 1,
  'creepy-condescending-wonka': 1,
  'disappointed-tyson': 1,
  'disaster-girl': 1,
  'drunk-baby': 1,
  'duck-face-chicks': 1,
  'dwight-schrute': 1,
  'epicurist-kid': 1,
  'ermahgerd-berks': 1,
  'evil-cows': 1,
  'evil-otter': 1,
  'evil-toddler': 1,
  'first-world-problems': 1,
  'fk-yeah': 1,
  'foal-of-mine': 1,
  'forever-alone': 1,
  'foul-bachelor-frog': 1,
  'frango': 1,
  'fuck-me-right': 1,
  'futurama-fry': 1,
  'gasp-rage-face': 1,
  'good-guy-greg': 1,
  'grandma-finds-the-internet': 1,
  'grumpy-cat': 1,
  'i-dare-you': 1,
  'i-have-no-idea-what-i-am-doing': 1,
  'i-lied-2': 1,
  'i-should-buy-a-boat': 1,
  'insanity-wolf': 1,
  'intelligent-dog': 1,
  'jehovas-witness-squirrel': 1,
  'joseph-ducreux': 1,
  'ligaf': 1,
  'lol-guy': 1,
  'mckayla-maroney-not-impressed': 1,
  'money-man': 1,
  'monkey-business': 1,
  'monkey-ooh': 1,
  'mozart-not-sure': 1,
  'nailed-it': 1,
  'oh-no': 1,
  'onde': 1,
  'one-does-not-simply': 1,
  'overly-attached-girlfriend': 1,
  'overly-manly-man': 1,
  'paul-wonder-years': 1,
  'pedobear': 1,
  'penguin-gang': 1,
  'philosoraptor': 1,
  'pickup-line-panda': 1,
  'rich-old-men': 1,
  'right-in-the-childhood': 1,
  'romney': 1,
  'romney-and-ryan': 1,
  'say-that-again-i-dare-you': 1,
  'scumbag-minecraft': 1,
  'scumbag-steve': 1,
  'spiderman-peter-parker': 1,
  'stoner-dog': 1,
  'success-kid': 1,
  'sudden-clarity-clarence': 1,
  'superior-wadsworth': 1,
  'surprised-coala': 1,
  'ted': 1,
  'the-most-interesting-cat-in-the-world': 1,
  'the-most-interesting-man-in-the-world': 1,
  'third-world-skeptical-kid': 1,
  'travelonshark': 1,
  'troll-face-colored': 1,
  'ugly-twins': 1,
  'unicorn-man': 1,
  'x-all-the-y': 1,
  'x-x-everywhere': 1,
  'y-u-no': 1,
  'yao-ming': 1,
  'yeah-thatd-be-great': 1,
  'yo-dawg-heard-you': 1

module.exports = (robot) ->
  robot.respond /(drop)?(meme)( me)? (.*)\|(.*)\|(.*)/i, (msg) ->
    slug = msg.match[4]
    topText = msg.match[5] || ''
    bottomText = msg.match[6] || ''

    return msg.send("Sorry, can’t find meme slug “#{slug}”. Type `hubot dropmeme slugs` for a complete list.") unless DROPMEME_SLUGS[slug.toLowerCase()]

    url = "http://dropmeme.com/api/v1/memes?template_slug=#{slug}&top_text=#{topText}&bottom_text=#{bottomText}".replace(/\s/g, '%20')
    msg.send("#{url}#.jpg")

  robot.respond /(drop)?(meme) slugs?/i, (msg) ->
    keys = (k for k in Object.keys(DROPMEME_SLUGS))
    msg.send(keys.join("\n"))
