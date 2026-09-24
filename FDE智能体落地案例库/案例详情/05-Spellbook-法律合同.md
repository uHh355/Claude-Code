# 案例：Spellbook — 在律师自己的 Word 里嵌入合同审查智能体，按每个法务团队自己的"审查手册"（Playbook）自动审合同

> **核验状态总说明（请先读）**
> - 本次运行环境的出网代理只放行 claude.com / anthropic.com 等极少数域名。spellbook.com / spellbook.legal、LawNext、Artificial Lawyer、BusinessWire、BetaKit、Substack、Sacra、X、YouTube、Apple Podcasts、Microsoft Marketplace 等**全部被拦截（403 / EGRESS_BLOCKED）**，WebFetch 和 curl 都打不开；整个会话共用的 WebSearch 额度（200 次）也在本案例做到一半时用完了。
> - 因此：**只有 [S0] Claude 原文是逐句打开核实过的**（已从线上页面抓取，并用 grep 逐句确认下文所引原句存在）。
> - 所有【外部来源】条目都标为**"仅搜索结果摘要可见，未能打开原页"**。搜索工具返回的摘要是把多个结果**混在一起转述**的，不会写明每句话出自哪条链接。下文的"可能出处"是根据那次查询返回的链接列表推断的，**用于正式脚本前必须人工逐条打开核对**。
> - 对外部来源的原句引用，只在搜索摘要本身带引号时才照录，并标注"（摘要中的引文）"。

- **行业**：法律科技，面向律所和企业法务的合同起草与审查（交易型律师，transactional lawyers）
- **企业规模 / 地区**：【Claude原文】页面标注 Company size: Medium、Location: North America；正文写 "5,000 customers and 250 employees"，覆盖 80 个国家 [S0]。多家加拿大媒体（BetaKit、Canadian Lawyer）有报道 [S18][S10]，推测是加拿大公司，但总部城市**未能打开原页确认**。
- **Claude 产品标签**：Claude Platform、Claude Code [S0]
- **Claude 故事发布日期**：2026-08-27（出自 claude.com 客户故事列表数据的 date 字段；故事页面本身没有显示日期）[S1]
- **Claude 原文链接**：https://claude.com/customers/spellbook
- **落地主体（谁是"FDE"）**：**Spellbook 自己的产品和工程团队，外加"legal engineers（法律工程师）/ 领域专家"**。它是 SaaS 产品公司，不是咨询驻场模式。Claude 原文里唯一能对上"人工专家参与落地"的描述是："do manual review with our legal engineers and domain experts" [S0]。客户侧的落地方式主要是法务团队**自己把审查标准写进 Playbook** [S0][S12]。关于"是否派人驻场、是否有 FDE / 实施团队"，**未找到公开信息**：招聘页（Lever / Greenhouse / Ashby）全部被代理拦截，搜索额度也已用完。
- **本案例推荐指数：3 / 5**（如果能补齐外部原文核验，可升到 4）
  - 数字充分度：高。530,000 次/月、10 小时→1 小时、700,000 条消息/月、5,000 客户、80 国、约 15 种智能体配置，全部是 Claude 原文，可靠。
  - 过程/反转素材：中到高。Claude 原文里已经藏了三个可用的反转：①放弃微调；②因为"律师要跑三四遍"而换模型、并加做一致性测试；③"改坏格式律师就不用"逼出 Word 格式工程。外部还有"Rally→100 个失败落地页→Spellbook"和"对话框 vs Word 里编辑"两个很好的反转，但**只有搜索摘要，未打开原页**。
  - "FDE 驻场"素材：弱。这是一家产品公司，没有公开的驻场过程。
  - 对中国听众的可迁移性：高。合同审查、Word/WPS 工作流、企业法务把"审查口径 / 谈判底线"写成手册，这些在中国法务场景里完全对得上。

---

## 1. Claude 原文要点（事实 + 数字）[S0]

1. **每月约 53 万次合同审查**（由基于 Claude 的审查智能体完成）
   > "Runs its Claude-powered review agents across about 530,000 contracts every month"
   > 页面小标题的写法是："530,000 contracts assisted per month"；正文又写："run hundreds of thousands of contract reviews every month"（口径差异见第 7 节）
2. **一份协议从约 10 小时律师工时降到约 1 小时（10 倍）**
   > "Cuts the time to complete an agreement 10x, from roughly 10 hours of lawyer work to about one"
   > CEO 的原话："a true 10x efficiency improvement."
3. **痛点的金额换算**
   > "A single agreement could absorb 10 hours of a lawyer's time, and at a top firm where a partner bills $1,000 an hour, that made it a $10,000 document."
4. **每月 70 万+ 条律师聊天消息**
   > "Handles more than 700,000 chat messages from practicing lawyers each month" / "Every single one of those is a lawyer," Weir noted, "a high-value professional whose time is worth a lot of money."
5. **自动套用每个法务团队自己的审查标准（Playbooks）**
   > "Applies each legal team's own review standards automatically, at a volume of thousands of contracts a year"
   > "Playbooks turn those reviews into enforced policy. An in-house team codifies how it reviews master service agreements and NDAs, what it negotiates and what it concedes, and Spellbook's agents apply that standard to every contract that follows."
6. **仅审查界面就有约 15 种智能体配置，按子任务难度匹配模型**
   > "Roughly 15 agent configurations just for reviewing contracts, from Opus 5 on the most complex subtasks down to Opus 4.6 and Sonnet 4.6 where speed and conversational tone count for more."
7. **评测体系：Fable 5 当"标准答案模型"（oracle），法律专家复核评测标准**
   > "We'll use Fable as an oracle model to generate a set of criteria, do manual review with our legal engineers and domain experts, and then see which other models come closest to achieving similar behaviors," Weir explained.
8. **线上核心指标是"建议采纳率"，不是跑分**
   > "For every suggestion we provide, we measure how many actually get accepted by a user," Stevenson explained. "We think that's better than an eval, because it measures the subjective preferences of the user and whether we're meeting them."
9. **一致性测试：同一份合同、同一个提示词连跑 10 次**
   > "One check runs the same contract review, same prompt and contract ten times in a row and scores how consistently issues get flagged, because a lawyer only trusts a review they don't have to repeat."
10. **产品形态：Word 插件，"合同版 Claude Code"**
    > "kind of like Claude Code, but for contracts" … "so lawyers keep their file format, formatting, and habits."
11. **Word 格式工程是护城河**
    > "much of that work goes to surviving Microsoft Word, whose formatting specification runs over 5,000 pages" / "If you mess up a lawyer's document formatting at all, they just won't use the product."
12. **不做自研模型，早期试过微调后放弃**
    > "The team tried fine-tuning early and abandoned it, betting instead on the engineering around foundation models. 'Most of the value we add is in the harness that goes around the models.'"
13. **安全与权限**
    > "Zero data retention applies across the product, and the agents' reach is deliberately narrow, with edits confined to specified paragraphs so a customer's contract can't leak."
14. **多文档联动（Spellbook Associate）**
    > "If you're editing five documents, it's easy… If you're editing 20 with a thousand other documents in context, it's harder still."
15. **合同库和存量合同**："a team holding 10,000 signed agreements can find exactly which ones to re-evaluate when the law changes."
16. **规模和客户**：自 2022 年上线，5,000 客户、80 个国家、250 名员工；客户包括 LG、Dropbox、eBay 的企业法务团队；"growth accelerating after the Claude-powered features launched"
17. **企业法务采用最快**
    > "In-house legal teams are adopting fastest… 'They were just waiting for something that actually worked,' Stevenson noted."
18. **自主合同管理（ACM）**：合同还没人打开，AI 就已经从邮件 / Slack / Salesforce 拉取合同、标出风险、起草修订
    > "By the time a lawyer opens a contract in Spellbook, the AI has often already pulled it in from email, Slack, or Salesforce, flagged the risks, and drafted the redlines."
    > 流程覆盖："from the moment a salesperson requests one, through triage, review, and negotiation, to storage and long-term monitoring."
19. **内部研发全面用 Claude Code**：Fable 写计划，Sonnet 执行，Fable 再审查结果
    > "we have it write the plan, then a smaller model, such as Sonnet, executes the plan… we have Fable review the results and flag the five or six things that need to change."

---

## 2. 背景与痛点（结构化）

| 痛点 | 内容 | 来源 |
|---|---|---|
| 全手工逐行读 | "Lawyers would be reviewing 50-page contracts in Microsoft Word, reading every line to find issues and mistakes, manually editing, copying and pasting between agreements" | 【Claude原文】[S0] |
| 单份合同贵 | 10 小时 × 合伙人 $1,000/小时，约等于一份 $10,000 的文件（按文中口径估算） | 【Claude原文】[S0] |
| 企业法务量大 | "in-house legal teams see thousands of contracts flow through them every year" | 【Claude原文】[S0] |
| 人不擅长找问题条款 | "AI is really good at issue spotting, and humans are not very good at it" | 【Claude原文】[S0] |
| 律师不愿离开 Word、容不得格式出错 | "If you mess up a lawyer's document formatting at all, they just won't use the product." | 【Claude原文】[S0] |
| 企业法务反复用同一套标准审同类合同，已有 AI 工具结果波动太大 | 搜索摘要："In-house teams were wasting time reviewing the same types of contracts over and over using the same standards, and existing AI contract review solutions gave them too much variability when they wanted personalized, consistent results to support a high volume of deals." | 【外部来源 S12/S13/S14】仅搜索结果摘要可见，未能打开原页 |
| 创始人的亲身之痛（起源故事） | 搜索结果标题："Legal fees ate up half of his startup investment, motivating founder to build AI tech tool Spellbook"；播客标题："How a Start-Up's Legal Bills Led to Spellbook, an AI Co-Pilot for Transactional Lawyers" | 【外部来源 S10/S11】仅标题可见，未能打开原页 |
| 律师对工作本身不满意 | "A lot of my lawyer friends were really not that happy with their jobs before AI. They would spend 10 hours a day copying and pasting documents." | 【Claude原文】[S0] |

---

## 3. 落地过程（FDE 怎么做的）

> 先说清楚：Spellbook 是产品公司，公开材料里**没有"派工程师去某客户现场驻场"的叙述**。下面还原的是"从发现问题到在客户侧规模化"的过程。其中 Claude 原文部分已核实，外部部分只有搜索摘要。

**第一步：创始人自己就是"被合同折磨的客户"**
- 搜索结果标题显示，起源故事是创业公司自己的法律账单："Legal fees ate up half of his startup investment…" [S10]；"How a Start-Up's Legal Bills Led to Spellbook…" [S11]。【外部来源】仅标题可见，未能打开原页。

**第二步：2017 年以 Rally 起步，做文档模板，当时没有 AI**
- 搜索摘要："The company was founded in 2017 under the name Rally, and most of their product revolved around document templating, following a thesis of making legal work more efficient, but there was no AI in 2017." 【外部来源，可能出处 S6/S7/S8】仅搜索结果摘要可见，未能打开原页。
- 旧名 "Rally Legal"。搜索摘要："Spellbook has closed a $10.9 million funding round and rebranded from its old name Rally Legal." 【外部来源 S5】仅搜索结果摘要可见。

**第三步：用 100 多个失败落地页，便宜地试"需求"**
- 搜索摘要："Scott Stevenson and his team ran over 200 growth/product experiments with over 100 landing pages… This was how they tested message-market fit very inexpensively."
- 摘要中的引文（Stevenson 口语）："almost like 100 basically failed marketing pages before over 100 before we actually arrived at Spellbook."
- 【外部来源，可能出处 S7（nextplayso 标题即 "The AI startup for lawyers that launched 100 landing pages before finding PMF"）】仅搜索结果摘要可见，未能打开原页。

**第四步：GitHub Copilot 带来"顿悟"，2022 年在 Word 里上线 Spellbook（基于 GPT-3）**
- 搜索摘要："From trying GPT2, they had an inkling… but GitHub Copilot was the real 'aha!' moment when they tried it." 【可能出处 S6】
- 搜索摘要："launched the first generative AI contract drafting tool in September 2022." 【可能出处 S9】
- 2022 年 11 月的媒体标题："Meet Spellbook the GPT-3 Generative AI Word Add-In For Contracts"（Artificial Lawyer，2022-11-09）[S3]；"Legal Tech Firm Rally Showcases GPT-3 AI Contract Writing Assistant Spellbook"（Voicebot，2022-11-10）[S2]；新闻稿标题 "Rally launches Spellbook, the first AI Contract Drafting tool Powered by GPT-3" [S4]
- 以上都是【外部来源】，只看得到标题或摘要，未能打开原页。
- 【Claude原文】"Since launching in 2022…" [S0]

**第五步：嵌入点选在"律师已经在用的 Word"，把重心放在模型外围的工程（harness）上**
- 【Claude原文】Word 插件"so lawyers keep their file format, formatting, and habits"；Word 格式规范 "runs over 5,000 pages of comments, section numbering, and tables"；"Most of the value we add is in the harness that goes around the models." [S0]
- 【外部来源】搜索摘要：Stevenson 把产品形容为 "an electric bicycle for lawyers"，强调"fit into a lawyer's existing workflow" [可能出处 S19/S20/S23]。仅搜索结果摘要可见。

**第六步：人机分工：AI 找问题、起草修订；律师做判断、接受或拒绝**
- 【Claude原文】"Spellbook's agents spot issues, negotiate terms, and revise agreements directly in the document"；聊天回答 "with citations a lawyer can check"；Stevenson 说省下的时间用来做 "judgment, negotiation, and strategy" [S0]
- 权限收窄："edits confined to specified paragraphs" [S0]

**第七步：评测：线上看采纳率，线下用标准答案模型加法律专家，另做一致性测试**
- 【Claude原文】采纳率（"how many actually get accepted by a user"）；Fable 当 oracle 生成评测标准，"manual review with our legal engineers and domain experts"；同一份合同连跑 10 次测一致性 [S0]

**第八步：从律所扩展到企业法务：用 Playbook 把"总法律顾问的谈判口径"写成规则**
- 搜索摘要（2025 年 1 月发布）："Spellbook officially expanded to support the entire in-house legal market with the launch of Playbooks. Spellbook worked with over 160 in-house teams at enterprises, including companies like Nestlé, Fender, Crocs, BDO Unibank, and WSP Global Consulting."
- 搜索摘要："Playbooks enable legal teams to codify their negotiation approach so that AI can negotiate documents the same way their GC would, using preferred language and fallback positions."
- 以上【外部来源 S12/S13/S14】（Artificial Lawyer 该文 URL 日期为 2025-01-07），仅搜索结果摘要可见，未能打开原页。
- 【Claude原文】"An in-house team codifies how it reviews master service agreements and NDAs, what it negotiates and what it concedes" [S0]
- 上线方式：搜索摘要称 "Spellbook ships with automated reviews and playbooks ready to use from day one, so legal teams can start applying consistent review standards immediately without building anything from scratch."【外部来源，可能出处为 spellbook.com 官网或 learn 页面】仅搜索结果摘要可见，发布时间不明。这说明它主打自助上手，而不是长周期实施。

**第九步：从单文档到多文档，再到"自主管理合同"**
- 【Claude原文】Spellbook Associate 做跨多文档的联动修改；autonomous contract management 从邮件 / Slack / Salesforce 自动拉取合同，覆盖分流、审查、谈判、归档、长期监控 [S0]
- 【外部来源】Artificial Lawyer 2026-06-30 有专访，标题 "Scott Stevenson Interview: Spellbook ACM" [S22]。仅标题可见。

**时间线**：2017 Rally（模板工具）→ 2022 年 9 月前后上线 Spellbook（GPT-3，Word 插件）→ 2025 年 1 月 Playbooks 进入企业法务 → 2025 年 10 月 B 轮 → 2026 年自主合同管理（ACM）和"Cursor for contracts"文档编辑器 → 2026-08-27 Claude 故事发布。
**谁去现场、观察 / 访谈了谁、单个客户上线花多久**：**未找到公开信息。**

---

## 4. 关键反转 / 转折点（最重要）

### 反转 1：放弃"自训 / 微调模型"，押注"模型外围的工程"（Claude 原文和 2022 年报道对照）
- **原本做法**：2022 年上线时对外说用法律文本微调 GPT-3。搜索摘要："Spellbook trained and fine-tuned an instance of OpenAI's GPT-3 with 'billions of lines' of legal text in a process that sounds similar to the development of Codex"【外部来源，可能出处 S2/S3/S5】仅搜索结果摘要可见，未能打开原页。
- **后来发现 / 调整**：【Claude原文】"The team tried fine-tuning early and abandoned it, betting instead on the engineering around foundation models." / "Most of the value we add is in the harness that goes around the models." [S0]
- **效果**：【Claude原文】"We've built an incredibly differentiated product by building on top of foundation models and capturing the gains of their continued improvement." [S0]
- 说明：放弃微调这件事本身是 Claude 原文，**已核实**。"早期宣传微调 GPT-3"只来自搜索摘要，放进脚本前需要核对。

### 反转 2："律师得跑三四遍才放心" → 换更强的模型，并把"一致性"变成评测指标（Claude 原文，已核实）
- **原本做法**：审查界面用 Sonnet 4.6。
- **现场反馈**：客户说 "I feel like I have to run it three or four times to find everything."
- **调整**：
  - "Earlier this year Spellbook moved the review surface from Sonnet 4.6 to Opus 4.6"
  - 新增一致性测试："runs the same contract review, same prompt and contract ten times in a row and scores how consistently issues get flagged, because a lawyer only trusts a review they don't have to repeat."
- **效果**："Fable calls out more important issues, and for the issues it calls out, it calls them out far more consistently than any of the other Opus models… It has a lower time to first issue" [S0]
- 这条本质上是一个**"用户信任"的反转**：问题不在准不准，而在每次结果一不一样。

### 反转 3：律师不要"离开 Word 的聊天框"，要在自己的文档里直接改；"改坏一个格式就弃用"
- 【Claude原文】"If you mess up a lawyer's document formatting at all, they just won't use the product."；Word 插件让律师 "keep their file format, formatting, and habits"；产品被形容为 "kind of like Claude Code, but for contracts" [S0]
- 【外部来源】Stevenson 的 X 帖子（搜索结果标题原文，未能打开原页，帖子日期按 ID 推算约为 2026-08-13）[S21]：
  > "Cursor for contracts is here. Announcing Spellbook's new AI document editor. Doc editing for lawyers is disjointed: you can edit with AI in chat, but then need to 'Open in Word' to make manual tweaks without breaking formatting. Alternatively you can use a Word add-in like…"
- 【外部来源】搜索摘要：Spellbook Associate 是一个 "shaped a little bit like ChatGPT" 的网页 / 桌面应用，主打 "surgical redlines"；但 "the original product is the Microsoft Word add-in, and that remains what most users rely on." [可能出处 S19/S20/S23] 仅搜索结果摘要可见。
- **可以这样叙述（需核对原文）**：先有 Word 插件（只能一次处理一份文档）→ 加了"像 ChatGPT 的对话式"Associate（能多文档，但在聊天里改完还要"在 Word 中打开"再手工微调，体验割裂）→ 推出"Cursor for contracts"式 AI 文档编辑器。这和我们已有脚本里"甲方要对话框 → 改成工作台"是同一类反转。

### 反转 4：Rally 做模板（没有 AI）→ 100 多个失败落地页 → 看到 Copilot 后转型 Spellbook
- 搜索摘要："Founded in 2017 as a templating tool, Spellbook pivoted repeatedly before finding product-market fit in 2022 after GPT models emerged."；摘要中的引文："almost like 100 basically failed marketing pages before over 100 before we actually arrived at Spellbook."；"GitHub Copilot was the real 'aha!' moment"【外部来源 S6/S7/S8】仅搜索结果摘要可见，未能打开原页。

### 反转 5：从"律所工具"转到"企业法务是增长最快的一群"
- **原本**：早期产品面向律所 / 交易律师（2022 年媒体称其为律师的 Word 插件）[S3]。
- **发现**：企业法务反复用同一套标准审同类合同，嫌已有 AI 工具"too much variability"（搜索摘要，S12/S13/S14）。
- **调整**：2025 年 1 月推出 Playbooks（搜索摘要，与 160+ 个企业法务团队合作过）。
- **效果**：【Claude原文】"In-house legal teams are adopting fastest… 'They were just waiting for something that actually worked.'"；客户包括 LG、Dropbox、eBay 的企业法务 [S0]

### 隐含反转 6：模型供应商从 OpenAI（GPT-3）→ OpenAI 和 Anthropic 并用 → "mostly Claude"
- 2022 年：GPT-3（S2/S3/S4 标题）。
- Microsoft Marketplace 的产品描述（搜索摘要，日期不明）："powered by multiple large language models from OpenAI and Anthropic" [S25]。
- 【Claude原文】"runs a full suite of mostly Claude models"；Weir："so I pushed a lot of features into the Anthropic bucket" [S0]
- 注意：Claude 原文用的是 "mostly"，**不是独家**。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 单份协议律师工时 | 约 10 小时 | 约 1 小时（10 倍） | 【Claude原文】S0 | CEO 自报，没有给测算方法和样本；"10x"早就出现在 Spellbook 的营销语里（见第 7 节） |
| 单份协议成本（示意） | 约 $10,000（10h × $1,000/h 合伙人费率） | 未给出 | 【Claude原文】S0 | 按顶级律所合伙人费率做的**示意换算**，不是实测 |
| 每月审查量 | — | 约 530,000 次（份）/月 | 【Claude原文】S0 | 同一页面有三种写法："contract reviews"、"contracts assisted"、"hundreds of thousands of contract reviews"。可能是智能体的运行次数，不一定是去重后的合同份数 |
| 每月律师聊天消息 | — | 700,000+ | 【Claude原文】S0 | 公司自报 |
| 客户数 | 约 2,600 个法务团队 / 60+ 国（Marketplace 描述，日期不明）→ 近 4,000 / 80 国（2025 年 10 月 B 轮） | 5,000 客户 / 80 国（2026 年 8 月） | S25（搜索摘要）/ S15–S19（搜索摘要）/ 【Claude原文】S0 | "客户"指律所或法务团队，不是用户数 |
| 累计审查合同 | — | 超过 1,000 万份（截至 2025 年 10 月） | S15–S19（搜索摘要） | 累计口径，和"每月 53 万"不能直接比 |
| 员工 | — | 250 | 【Claude原文】S0 | — |
| 审查界面的模型配置 | 单一模型（Sonnet 4.6，原文暗示） | 约 15 种配置（Opus 5 / Opus 4.6 / Sonnet 4.6，按子任务分配） | 【Claude原文】S0 | — |
| 审查一致性 | 客户"要跑三四遍才找全" | Fable 在一致性上明显领先（原文没有给具体分数） | 【Claude原文】S0 | **没有公开量化分数** |
| 融资 / 估值 | A 轮前 $10.9M（S5 标题） | B 轮 $50M，Khosla（Keith Rabois）领投，投后估值 $350M，累计融资超 $80M | S5、S15–S19（搜索摘要） | 未能打开原页 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **嵌入点选在"用户已经待着的工具"，不另起一个对话框**：律师在 Word 里干活，产品就做成 Word 插件，还把格式保真当成底线。依据：[S0] "If you mess up a lawyer's document formatting at all, they just won't use the product."
2. **价值在模型外围的工程，不在自训模型**：试过微调后放弃，把资源投到 harness（格式、权限、编排、评测）。依据：[S0]
3. **把专家的隐性标准写成可执行的规则（Playbook）**：审什么、争什么、让什么、首选措辞和退让底线，都写成机器可执行的规则。依据：[S0]；外部搜索摘要 S12–S14 的 "preferred language and fallback positions"。
4. **用"采纳率"衡量效果，比离线跑分更贴近真实用户**。依据：[S0] Stevenson 原话。
5. **专业用户要的是"不用复核"，一致性要单独测**：同一输入连跑 10 次，看结果稳不稳。依据：[S0]
6. **按子任务难度匹配模型，大模型只放在判断最集中的环节**：约 15 种配置；研发上"大模型写计划和审查，小模型执行"。依据：[S0]
7. **权限最小化 + 零数据留存，换取客户敢用**：只能改指定段落，不留存数据。依据：[S0]
8. **从"辅助单份审查"到"接管整条流程"**：先做 Word 里的单点审查，再扩到多文档，最后做从请求到长期监控的自主合同管理。依据：[S0]
9. **低成本验证需求**：先用大量落地页测需求，再重投入。依据：外部搜索摘要 S7（未打开原页）。

---

## 7. 数字严谨性 & "评论区喷子"防御

- **全部核心数字都是公司自报**，出现在 Anthropic 的客户营销页上 [S0]，没有第三方审计。
- **"530,000"的口径不统一**：同一页面有 "contract reviews"、"contracts assisted"、"hundreds of thousands of contract reviews" 三种写法 [S0]。更稳妥的说法是"每月约 53 万次合同审查任务"，不要说"53 万份不同的合同"。
- **"10 倍 / 10 小时→1 小时"**：
  - 原文没有说明怎么测、测了哪些合同类型、哪些客户。
  - "10x" 早就是 Spellbook 的营销语：Playbooks 发布稿的搜索摘要里有 "tackle their review queue up to 10x faster"（S12–S14）；Marketplace 描述的搜索摘要里有 "draft and review contracts 10x faster"（S25）。
  - 建议脚本写成"公司称"或"CEO 称"。
- **"$10,000 一份合同"是示意换算**：用的是 "a top firm where a partner bills $1,000 an hour" 的假设，不是平均成本 [S0]。
- **客户数随时间变化**：2,600+（Marketplace 描述，日期不明）→ 近 4,000（2025 年 10 月）→ 5,000（2026 年 8 月）。三处"客户"口径是"legal teams / law firms and in-house teams / customers"，都不是用户数。
- **"成立于 2022"还是"2017"**：Claude 原文写 "Since launching in 2022"，指 Spellbook 产品上线；公司主体 2017 年以 Rally 名义成立（搜索摘要）。有人质疑时可以这样解释。
- **"独家用 Claude"是错的**：原文是 "mostly Claude models"；Marketplace 描述写的是 OpenAI 和 Anthropic 多模型（搜索摘要）。
- **准确性和一致性质疑**：Claude 原文自己承认，客户曾反馈"要跑三四遍才找全" [S0]。这可以变成"我们正面回应"的素材，也可能成为评论区的攻击点。原文对改进后的一致性**没有给量化分数**。
- **幻觉 / 保密**：原文给出的对策是可核查的引用（"citations a lawyer can check"）、零数据留存、只能改指定段落 [S0]。
- **"first AI contract drafting tool"**：2022 年新闻稿标题的自称 [S4]，属于营销表述，不建议在脚本里当事实复述。
- **负面报道 / 用户吐槽**：竞品 GC AI 发过 "12 Best Spellbook Alternatives for In-House Counsel in 2026" [S26]，可能含批评，但属竞品内容，**未能打开**。Reddit / HN 讨论**未能检索**（代理拦截，搜索额度用完）。**实质性负面报道：未找到公开信息**（检索受限，不代表不存在）。
- **联合创始人**：任务线索里提到的联合创始人 Daniel Di Cicco，在本次能看到的材料里**没有出现，未能核实**。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下全部是【编剧建议】，不是事实。括号里标出每条依据的来源编号。

- **钩子 1（算账）**："一份 50 页的合同，顶级律所合伙人读 10 个小时，每小时 1000 美元——这是一份一万美元的文件。"（S0）
- **钩子 2（信任反转）**："AI 审合同最大的问题不是'不准'，是律师说：'我得跑三四遍才放心。'"接着讲同一份合同连跑 10 遍的一致性测试。（S0）
- **钩子 3（格式即生死）**："你把律师文档的一个编号弄乱，他这辈子都不会再用你——Word 的格式规范有 5000 多页。"（S0）
- **反转桥段（对话框 vs 在文档里改）**："甲方以为要个 ChatGPT；可律师在聊天框里改完，还得'在 Word 中打开'再手工调格式——于是产品回到文档本身，做成'合同版 Cursor'。"（S0 + S21；S21 需先核对原帖）
- **反转桥段（放弃微调）**："2022 年他们对外说用海量法律文本微调了 GPT-3；后来他们自己说：'微调试过，放弃了。价值在模型外面那层工程。'"（S0 + S2/S3 摘要；需核对 2022 年原文）
- **FDE 视角的类比（瑞蒙特可以讲）**："Playbook 就是把总法律顾问脑子里的'哪些条款必须争、哪些可以让、退到哪一步'写成规则。这正是 FDE 进现场要做的事：把老法务的隐性经验结构化。"（依据 S0 的 "what it negotiates and what it concedes"；类比是编剧推演，Spellbook 自己没有用 FDE 这个说法）
- **给中国听众的迁移建议**：中国企业法务和律所大量在 Word / WPS 里审合同，"不离开原工具 + 按本单位审查口径自动审 + 律师逐条接受或拒绝"的模式可以直接对照。可以强调"评价标准是律师采纳了多少条建议"，而不是模型分数。（依据 S0）
- **升华句**："AI 不是替律师读合同，而是把最好的那位律师的判断标准，复制到每一份合同上。"（依据 S0 的 Playbooks 描述；属于创作）
- **风险提示**：本案例的"驻场 / FDE 过程"几乎没有公开信息。建议定位为"产品公司怎么把 FDE 式的现场洞察产品化"，不要虚构驻场情节。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S0 | Spellbook runs 530,000 contract reviews a month with Claude | https://claude.com/customers/spellbook | Claude原文 | 2026-08-27（见 S1） | **是**（WebFetch + curl 抓取线上页面，逐句 grep 核对了引文） |
| S1 | claude.com 客户故事列表数据（Spellbook 条目 date 字段 = 2026-08-27T00:00:00Z） | https://claude.com/customers | Claude原文（元数据） | — | 是（curl 抓取线上 claude.com/customers 页面，在内嵌数据中找到 "slug":"spellbook","date":"2026-08-27T00:00:00.000Z"；故事页面本身不显示日期） |
| S2 | Legal Tech Firm Rally Showcases GPT-3 AI Contract Writing Assistant Spellbook | https://voicebot.ai/2022/11/10/legal-tech-firm-rally-showcases-gpt-3-ai-contract-writing-assistant-spellbook/ | 媒体 | 2022-11-10（按 URL） | 否：代理 403，仅搜索结果摘要可见 |
| S3 | Meet Spellbook the GPT-3 Generative AI Word Add-In For Contracts | https://www.artificiallawyer.com/2022/11/09/meet-spellbook-the-gpt-3-generative-ai-word-add-in-for-contracts/ | 媒体 | 2022-11-09（按 URL） | 否：仅搜索结果摘要可见 |
| S4 | Rally launches Spellbook, the first AI Contract Drafting tool Powered by GPT-3 | https://www.einnews.com/pr_news/588763746/rally-launches-spellbook-the-first-ai-contract-drafting-tool-powered-by-gpt-3 | 新闻稿 | 2022（推断） | 否：仅搜索结果标题可见 |
| S5 | Spellbook, the Generative AI Copilot for Lawyers, Raises $10.9 Million | https://synthedia.substack.com/p/spellbook-the-generative-ai-copilot | 媒体/Newsletter | 不明 | 否：仅搜索结果摘要可见 |
| S6 | From Musical Instruments to Legal AI Tech: The Journey of Scott Stevenson | https://www.focusedchaos.co/p/interview-scott-stevenson-spellbook | 创始人访谈 | 不明 | 否：代理 403，仅搜索结果摘要可见 |
| S7 | The AI startup for lawyers that launched 100 landing pages before finding PMF | https://nextplayso.substack.com/p/the-ai-startup-for-lawyers-that-launched | 创始人访谈/Newsletter | 不明（摘要提到"10 月 B 轮"，推测为 2025 年末或之后） | 否：代理 403，仅搜索结果摘要可见 |
| S8 | Lessons from Scott Stevenson | https://www.antoinebuteau.com/lessons-from-scott-stevenson/ | 博客整理 | 不明 | 否：仅搜索结果摘要可见 |
| S9 | Spellbook: This Legal Software Company Uses AI To Help Lawyers Work More Efficiently | https://pulse2.com/spellbook-scott-stevenson-profile/ | 媒体 | 不明 | 否：仅搜索结果摘要可见 |
| S10 | Legal fees ate up half of his startup investment, motivating founder to build AI tech tool Spellbook | https://www.canadianlawyermag.com/resources/legal-technology/legal-fees-ate-up-half-of-his-startup-investment-motivating-founder-to-build-ai-tech-tool-spellbook/378521 | 媒体（加拿大） | 不明 | 否：仅搜索结果标题可见 |
| S11 | How a Start-Up's Legal Bills Led to Spellbook, an AI Co-Pilot for Transactional Lawyers (Scott Stevenson - Co-Founder) | https://www.tlpodcast.com/how-a-start-ups-legal-bills-led-to-spellbook-an-ai-co-pilot-for-transactional-lawyers-scott-stevenson-co-founder/ ；https://podcasts.apple.com/us/podcast/how-a-start-ups-legal-bills-led-to-spellbook-an-ai/id1315450241?i=1000714653251 | 播客 | 不明 | 否：仅搜索结果标题可见 |
| S12 | In-House Team Expansion with Playbooks | https://www.spellbook.legal/blog/expanding-into-in-house-teams-with-playbooks | 公司博客 | 约 2025-01（推断） | 否：仅搜索结果摘要可见 |
| S13 | Spellbook Expands Into In-House Teams With Playbooks | https://www.artificiallawyer.com/2025/01/07/spellbook-expands-into-in-house-teams-with-playbooks/ | 媒体 | 2025-01-07（按 URL） | 否：仅搜索结果摘要可见 |
| S14 | With Launch Today of 'Playbooks,' Gen AI Company Spellbook Expands Into In-House Legal Market | https://www.lawnext.com/2025/01/with-launch-today-of-playbooks-gen-ai-company-spellbook-expands-into-in-house-legal-market.html | 媒体（LawSites） | 2025-01（按 URL） | 否：仅搜索结果摘要可见 |
| S15 | Spellbook Raises $50m Series B led by Khosla Ventures | https://spellbook.com/blog/series-b | 公司博客 | 约 2025-10 | 否：代理 403，仅搜索结果摘要可见 |
| S16 | Spellbook Raises $50M Series B to Expand AI Contract Review Platform | https://www.lawnext.com/2025/10/spellbook-raises-50m-series-b-to-expand-ai-contract-review-platform.html | 媒体 | 2025-10（按 URL） | 否：仅搜索结果摘要可见 |
| S17 | Spellbook Raises $50M Series B to Expand AI Contract Review Platform | https://www.businesswire.com/news/home/20251009110230/en/Spellbook-Raises-$50M-Series-B-to-Expand-AI-Contract-Review-Platform | 新闻稿 | 2025-10-09（按 URL） | 否：仅搜索结果摘要可见 |
| S18 | Spellbook raises $50-million USD Series B led by Khosla Ventures | https://betakit.com/spellbook-raises-50-million-usd-series-b-led-by-khosla-ventures/ | 媒体（加拿大） | 约 2025-10 | 否：仅搜索结果摘要可见 |
| S19 | Spellbook Raises $50m + CEO, Scott Stevenson Interview | https://www.artificiallawyer.com/2025/10/09/spellbook-raises-50m-ceo-scott-stevenson-interview/ | 媒体采访 | 2025-10-09（按 URL） | 否：仅搜索结果摘要可见 |
| S20 | Scott Stevenson, CEO of Spellbook, on building Cursor for contracts | https://sacra.com/research/scott-stevenson-spellbook-cursor-for-contracts/ | 研究机构访谈 | 不明 | 否：代理 403，仅搜索结果摘要可见 |
| S21 | Scott Stevenson on X: "Cursor for contracts is here. Announcing Spellbook's new AI document editor…" | https://x.com/scottastevenson/status/2087929024639054297 | 创始人社媒 | 约 2026-08-13（按帖子 ID 推算） | 否：仅搜索结果标题可见 |
| S22 | Scott Stevenson Interview: Spellbook ACM | https://www.artificiallawyer.com/2026/06/30/scott-stevenson-interview-spellbook-acm/ | 媒体采访 | 2026-06-30（按 URL） | 否：仅搜索结果标题可见 |
| S23 | Scott Stevenson, Co-Founder & CEO of Spellbook – Interview Series | https://www.unite.ai/scott-stevenson-co-founder-ceo-of-spellbook-interview-series/ | 媒体采访 | 不明 | 否：仅搜索结果标题可见 |
| S24 | Spellbook's $50m plan to prove legal AI needs real data | https://www.nonbillable.co.uk/news/spellbook-scott-stevenson-interview | 媒体采访 | 约 2025-10 之后 | 否：仅搜索结果标题可见 |
| S25 | Spellbook（Microsoft AppSource / Marketplace 产品页） | https://marketplace.microsoft.com/en-us/product/office/wa200004774?tab=overview ；https://appsource.microsoft.com/en-us/product/office/WA200004774?tab=Reviews | 应用市场产品页 | 不明 | 否：代理 403，仅搜索结果摘要可见 |
| S26 | 12 Best Spellbook Alternatives for In-House Counsel in 2026 | https://gc.ai/blog/spellbook-alternatives | 竞品博客（可能含批评） | 2026 | 否：仅搜索结果标题可见 |
| S27 | Making Legal Services Accessible: How Spellbook Transforms Law – Scott Stevenson – S8 E44 | https://legallyspeakingpodcast.com/making-legal-services-accessible-how-spellbook-transforms-law-scott-stevenson-s8-e44/ | 播客 | 不明 | 否：仅搜索结果标题可见 |
| S28 | Will AI automate legal work? The future of lawyers with Scott Stevenson, Spellbook CEO | https://peoplereign.io/podcasts/will-ai-automate-legal-work-the-future-of-lawyers-with-scott-stevenson-spellbook-ceo/ | 播客 | 不明 | 否：仅搜索结果标题可见 |

**补充说明**：
- 已查证 anthropic.com 的两场法律主题网络研讨会页面（/webinars/claude-for-legal-teams、/webinars/how-legal-teams-put-claude-to-work），以及 claude.com 的法律解决方案页和法律行业博客页，都**没有提到 Spellbook**（curl 抓取后 grep 结果为 0）。
- 下一步建议（需要在网络不受限的环境中做）：
  1. 优先打开 S7、S6、S20、S19、S22、S21、S12，核对原句。
  2. 查 Spellbook 招聘页，确认是否有 Legal Engineer / Solutions / Implementation 团队。
  3. 查 spellbook.legal 的客户案例页，找具体客户的上线过程。
  4. 查 Reddit r/Lawyertalk、r/LawFirm 上用户对 Spellbook 的评价。
