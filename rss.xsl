<?xml version="1.0" encoding="UTF-8"?>
<!--
  给 rss.xml 挂的样式表：订阅器会忽略它，浏览器直接打开 /rss.xml 时则渲染成可读页面，
  避免把 XML 源码当成"坏掉的网页"。
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="zh-CN">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>法途前行 · RSS 订阅源</title>
        <style>
          :root { color-scheme: light dark; }
          body {
            margin: 0;
            padding: 3rem 1.25rem;
            background: #faf9f6;
            color: #26241e;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "PingFang SC", "Microsoft YaHei", sans-serif;
            line-height: 1.75;
          }
          .wrap { max-width: 42rem; margin: 0 auto; }
          .kicker { font-size: .72rem; letter-spacing: .35em; color: #8a857a; margin: 0 0 1rem; }
          h1 { font-size: 1.6rem; margin: 0 0 .75rem; line-height: 1.3; }
          .desc { color: #6b665c; margin: 0 0 1.75rem; }
          .hint {
            background: #f3f0e9; border: 1px solid #e8e4da; border-radius: .6rem;
            padding: .9rem 1.1rem; font-size: .92rem; color: #555047; margin: 0 0 2rem;
          }
          .hint a { color: #1f3a5f; font-weight: 600; }
          ul { list-style: none; padding: 0; margin: 0; }
          li { padding: .85rem 0; border-bottom: 1px solid #e8e4da; }
          li a { color: #1f3a5f; text-decoration: none; font-weight: 600; }
          li a:hover { text-decoration: underline; }
          .meta { display: block; font-size: .78rem; color: #8a857a; margin-top: .2rem; }
          @media (prefers-color-scheme: dark) {
            body { background: #131519; color: #d9d6cd; }
            .kicker, .meta { color: #8b8e96; }
            .desc { color: #a5a29a; }
            .hint { background: #1b1e24; border-color: #272b33; color: #b8b5ad; }
            .hint a, li a { color: #9db8dd; }
            li { border-color: #272b33; }
          }
        </style>
      </head>
      <body>
        <div class="wrap">
          <p class="kicker">RSS 订阅源</p>
          <h1><xsl:value-of select="rss/channel/title" /></h1>
          <p class="desc"><xsl:value-of select="rss/channel/description" /></p>

          <p class="hint">
            这是一个给订阅器用的地址，直接打开看到的是源码，属正常现象。
            把它复制到 RSS 阅读器里，就能每天自动收到更新。<a href="/subscribe/">查看订阅方法 →</a>
          </p>

          <ul>
            <xsl:for-each select="rss/channel/item">
              <li>
                <a href="{link}"><xsl:value-of select="title" /></a>
                <span class="meta">
                  <xsl:value-of select="category" /> ·
                  <xsl:value-of select="pubDate" />
                </span>
              </li>
            </xsl:for-each>
          </ul>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
