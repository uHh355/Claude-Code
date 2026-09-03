#!/bin/sh
cd "$(dirname "$0")"
for v in A B C; do
  { cat _head.html; echo '</head><body>'; cat _header.html; echo '<section id="method" class="method-section scene-section section-space is-scene-active" data-scene><div class="method-contours" aria-hidden="true"></div><div class="shell">'; cat _heading.html; cat $v.body.html; echo '</div>'; cat _footer.html; echo '</section></body></html>'; } > 版式$v.html
done
