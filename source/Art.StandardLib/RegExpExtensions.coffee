module.exports = class RegExpExtensions
  # http://stackoverflow.com/questions/201323/using-a-regular-expression-to-validate-an-email-address
  @escapeRegExp: (string) -> string.replace /[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g, "\\$&"

  @findUrlProtocolRegExp: /([\w-]+)(:\/\/)/
  @findDomainRegExp:      /localhost|[\w]+(?:-[\w]+)*(?:\.[\w]+(?:-[\w]+)*)*(?:\.[a-z]{2,20})/
  @urlQueryParamsRegExp:  /(?:[-+=&*._\w]|%[a-f\d]{2})+/i

  # https://stackoverflow.com/questions/4669692/valid-characters-for-directory-part-of-a-url-for-short-links
  # https://tools.ietf.org/html/rfc3986#section-3.3
  @findUrlPathRegExp:     /(?:\/(?:[-._~!$&'()*+,;=:@\w]|%[a-f\d]{2})*)*/
  @findUrlPortRegExp:     /(\:)(\d+)/

  @findEmailRegExp:       ///([_\w-]+(?:\.[_\w]+)*)@(#{@findDomainRegExp.source})///i

  @emailRegExp:           ///^#{@findEmailRegExp.source}$///i

  @numberRegExp:          /([-]?\.[0-9]+)|([-]?[0-9]+(\.[0-9]+)?)/

  @urlProtocolRegExp:     ///^#{@findUrlProtocolRegExp.source}$///i
  @domainRegExp:          ///^#{@findDomainRegExp.source}$///i
  @urlPathRegExp:         ///^#{@findUrlPathRegExp.source}$///i
  @urlQueryRegExp:        ///^#{@urlQueryParamsRegExp.source}$///i

  @isoDateRegExp:         /^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24\:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$/

  @hex16ColorRegExp:      /^#([a-f0-9])([a-f0-9])([a-f0-9])([a-f0-9])?$/i
  @hex256ColorRegExp:     /^#([a-f0-9]{2})([a-f0-9]{2})([a-f0-9]{2})([a-f0-9]{2})?$/i
  @rgbColorRegExp:        /rgb *\( *(\d+%?) *, *(\d+%?) *, *(\d+%?) *\)/
  @rgbaColorRegExp:       /rgba *\( *(\d+%?) *, *(\d+%?) *, *(\d+%?) *, *(\d*\.?\d*)\)/

  @colorRegExp:  new RegExp "(#{@hex16ColorRegExp.source})|(#{@hex256ColorRegExp.source})|(#{@rgbColorRegExp.source})|(#{@rgbaColorRegExp.source})"

  @wordsRegExp: /[^\s]+/g
  @exactlyOneWordRegExp: /^[^\s]+$/

  ###
  match OUTPUT: [url, protocol, '://', domain, ':', port, path, '?', query]

  USAGE:
    [__, protocol, __, domain, __, port, path, __, query] = str.match findUrlRegExp

  DESIGN NOTE:
    The reason why I included the fixed strings ('://', ':' and '?') was so that
    you can take the matchResult, alter individual elements and create a value url easily by:

      matchResult.slice(1).join ''
  ###
  @findUrlRegExp:  ///
    (?:#{@findUrlProtocolRegExp.source})
    (#{@findDomainRegExp.source})
    (?:#{@findUrlPortRegExp.source})?
    (#{@findUrlPathRegExp.source})?
    (?:(\?)(#{@urlQueryParamsRegExp.source})?)?
    ///i

  @findSourceReferenceUrlRegExp: ///
    (#{@findUrlProtocolRegExp.source})
    (#{@findDomainRegExp.source})?
    (?:#{@findUrlPortRegExp.source})?
    (#{@findUrlPathRegExp.source})?
    (?:(\?)(#{@urlQueryParamsRegExp.source})?)?
    (?:\:(\d+))?
    (?:\:(\d+))?
    ///i

  # OUT: see findUrlRegExp
  @urlRegExp: ///^#{@findUrlRegExp.source}$///i

  # *Regexp names DEPRICATED
  # *Regex names - maybe DEPRICATED... ?
  for k, v of @ when /RegExp$/.test k
    @[k.replace /RegExp/, "Regexp"] = v
    @[k.replace /RegExp/, "Regex"] = v