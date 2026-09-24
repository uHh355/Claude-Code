# 案例：Spellbook — 在律师自己的 Word 里嵌入合同审查智能体，按每个法务团队自己的"审查手册"（Playbook）自动审合同

> **核实状态说明（第二轮，2026-09-24 更新）**
> - 本轮网络已放开。第一轮 27 个外部来源（S2–S28）逐个用 curl 抓取原页、去标签后 grep 原句核对：**24 个已打开核对（✅）**，其中 S8 打开后判定为**不可靠的二手整理**（引文与原始出处对不上），不再作为事实依据；**3 个无法访问（❌）**：S4 EIN Presswire（Cloudflare 403，WebFetch 也被出网代理拦截）、S17 BusinessWire（403，WebFetch 被拦截；但同一新闻稿全文已在 S16 LawSites 转载并核对）、S28 PeopleReign 播客页（Sucuri JS 验证页，无法取得正文）。web.archive.org 在本环境连接被重置，快照也取不到。
> - 本轮**新增 18 个来源（S29–S46）**：Spellbook 官网客户故事（Dropbox、Panasonic、Herzog、McInnes Cooper、Kennedys）、产品博客、安全页、新闻页、招聘页（含一个 **Forward Deployed Engineer 职位**）、竞品评测与用户评论。其中 17 个 ✅，1 个 ❌（Reddit，出网被拦截）。
> - [S0] Claude 原文、[S1] 元数据在第一轮已逐句核实，本轮沿用。
> - **第一轮摘要有误、本轮已更正的要点**（详见第 7 节）：①联合创始人叫 **Daniel Di Maria**（不是 "Daniel Di Cicco"），另一位联合创始人是 Matt Mayers；②"用'数十亿行'法律文本微调 GPT-3"出自 S5 Synthedia（2023-05），不是 S2/S3；③"100 多个落地页"原话是"整个公司历程里做过 200 多次增长/产品实验、100 多个落地页"，"基本失败的营销页"是播客口语（S27）；④Microsoft Marketplace 当前描述是 "Powered by GPT-5 and other large language models"，**没有**"OpenAI and Anthropic"的字样，"2,600 个法务团队 / 60+ 国"也不在当前页面上，已删除；"OpenAI 和 Anthropic"的出处改为 Spellbook 安全页和招聘页；⑤公司成立年份各来源说法不一（2017 / 2018），已并列列出。

- **行业**：法律科技，面向律所和企业法务的合同起草与审查（交易型律师，transactional lawyers）
- **企业规模 / 地区**：【Claude原文】Company size: Medium、Location: North America；"5,000 customers and 250 employees"，覆盖 80 个国家 [S0]。【外部来源】总部在加拿大：2022 年报道称 "Toronto-based Rally" [S3]；BetaKit 称 "Founded as Rally out of St. John's, NL in 2018"，2025 年 10 月时员工 115 人（110 人在加拿大）[S18]；CEO 本人住在纽芬兰圣约翰斯，"We also have an office in Toronto" [S6]。✅
- **Claude 产品标签**：Claude Platform、Claude Code [S0]
- **Claude 故事发布日期**：2026-08-27（claude.com 客户故事列表数据的 date 字段；故事页面本身不显示日期）[S1]
- **Claude 原文链接**：https://claude.com/customers/spellbook
- **落地主体（谁是"FDE"）**：**Spellbook 自己的团队**。它是 SaaS 产品公司，以自助上手为主，但大客户侧有三类人参与落地（均已打开原页核对）：
  1. **Forward Deployed Engineer（前置部署工程师）**：Spellbook 招聘页有这个职位（2026-05-07 发布）："you'll work directly with large law firms and in-house legal teams to integrate Spellbook into real-world enterprise environments and workflows" / "Lead end-to-end implementation of Spellbook in complex enterprise organizations and translate ambiguous requirements into production-ready systems" / "Feed insights back into the platform… turning custom work into scalable features" [S38]。✅
  2. **Legal Solutions Architect（执业律师出身的售前法律专家）**：职责包括 "Develop playbooks and training materials for in-house legal teams" 和 "Translate real-world transactional workflows into actionable product features" [S39]。✅
  3. **Customer Success Manager**："Lead onboarding and training for new customers, ensuring effective adoption" [S40]；Claude 原文里的 "legal engineers and domain experts" 负责复核评测标准 [S0]。
  - 客户侧：法务团队**自己把审查口径写进 Playbook**，常见做法是上传自家模板让 AI 生成初稿（见第 3 节第八步，Dropbox / Panasonic 案例 [S29][S30]）。
  - **仍缺**：没有找到"某位 FDE 驻场某客户"的具名叙述。FDE 职位是 2026 年才出现的，早期（2022–2025）的落地主要靠自助试用、直播 onboarding 和小组培训 [S9][S12][S27]。
- **本案例推荐指数：4 / 5**（上一轮 3/5，上调原因：外部来源已基本核实；新找到一批带原话的"反转"素材；找到了具名客户的前后对比数字；证实 Spellbook 设有 FDE 岗位）
  - 数字充分度：高。Claude 原文数字之外，又核实到"建议采纳率 5% → 近 60%" [S19]、Dropbox"两个季度做一套 playbook → 同样时间做 8–10 套" [S29]、Panasonic"3 周 → 4 天""20 分钟 → 2 分钟" [S30]、每周 demo 200 → 450 [S20]。
  - 过程/反转素材：高。已核实的反转有：DIY 绕开律师 → 转向服务律师；模板 → AI；"营销引流小工具"变成主营收；放弃大所自上而下销售；"说好不做企业法务"→ 企业法务占 60% 营收；2022 年"还没有 Playbook"→ 2025 年 Playbook 成为核心；微调 → "微调是个糟糕的方法"。
  - "FDE 驻场"素材：中。有 FDE 职位描述，但没有具名驻场故事。
  - 对中国听众的可迁移性：高。

---

## 1. Claude 原文要点（事实 + 数字）[S0]

1. **每月约 53 万次合同审查**（由基于 Claude 的审查智能体完成）
   > "Runs its Claude-powered review agents across about 530,000 contracts every month"
   > 页面小标题写作 "530,000 contracts assisted per month"；正文又写 "run hundreds of thousands of contract reviews every month"（口径差异见第 7 节）
2. **一份协议从约 10 小时律师工时降到约 1 小时（10 倍）**
   > "Cuts the time to complete an agreement 10x, from roughly 10 hours of lawyer work to about one"
   > CEO 原话："a true 10x efficiency improvement."
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
| 企业法务量大 | "in-house legal teams see thousands of contracts flow through them every year"；Sacra 访谈："Many of the customers we sell to are processing sometimes 100,000 contracts a year" | 【Claude原文】[S0]；【外部来源 S20】✅ |
| 人不擅长找问题条款 | "AI is really good at issue spotting, and humans are not very good at it"；CEO："Reading through 60 pages and finding every mistake or issue is basically an impossible task. Literally every public contract we look at, we almost always find a mistake or issue." | 【Claude原文】[S0]；【外部来源 S20】✅ |
| 律师没有"代码检查器" | "as an engineer, when I write code I have all these tools telling me if something is wrong, tests to catch bugs, linters to surface potential issues. Lawyers have none of that." | 【外部来源 S20】✅ |
| 律师不愿离开 Word、容不得格式出错 | "If you mess up a lawyer's document formatting at all, they just won't use the product."；"We saw time and time again that even getting a lawyer to go to a web app and enter their password was very difficult." | 【Claude原文】[S0]；【外部来源 S20】✅ |
| 企业法务反复用同一套标准审同类合同，现有 AI 工具结果波动大 | "We found that in-house teams were wasting time reviewing the same types of contracts over and over using the same standards. Existing AI contract review solutions gave them too much variability when they wanted personalized, consistent results to support a high volume of deals." | 【外部来源 S12】✅（S13、S14 同文） |
| 标准口径散落在人脑和模板里 | Dropbox："The standard positions lived in people's heads and in template documents that were hard to search."；Panasonic："Their standard positions and alternative clauses lived in template Word documents on a shared drive" | 【外部来源 S29/S30】✅（Spellbook 官网客户故事，属公司自有营销内容） |
| 创始人的亲身之痛（起源故事） | "I raised a small $20k angel cheque, and before I knew it half of that was spent on legal fees to set up the company, bring on our first employees, issue shares and protect our IP (we had a design patent)." | 【外部来源 S6】✅；S10、S7 同样说法 |
| 律师对工作本身不满意 | "A lot of my lawyer friends were really not that happy with their jobs before AI. They would spend 10 hours a day copying and pasting documents."；联合创始人 Daniel Di Maria 刚做律师时的感受："Is this really what I went to law school for?" | 【Claude原文】[S0]；【外部来源 S7】✅ |

---

## 3. 落地过程（FDE 怎么做的）

> 先说清楚：Spellbook 是产品公司。公开材料里**没有"某位工程师驻场某客户"的具名叙述**。但 2026 年它开始招 Forward Deployed Engineer 做大客户的端到端部署 [S38]。下面还原的是"从发现问题到在客户侧规模化"的过程。本轮所有外部引文都已打开原页逐字核对。

**第一步：创始人自己就是"被法律账单折磨的客户"，另一位创始人是"不想再复制粘贴的律师"**
- CEO Scott Stevenson 是计算机工程师，第一家公司做电子乐器 Mune："I raised a small $20k angel cheque, and before I knew it half of that was spent on legal fees…" [S6] ✅
- 联合创始人：律师 **Daniel Di Maria** 和设计师 **Matt Mayers**。"Two years later, you connect with Daniel Di Maria (lawyer) and Matt Mayers (designer) and start Spellbook." [S6] ✅；"my co-founder and COO, Daniel Di Maria, who attended law school, was unsatisfied with the reality of the job, which consists of an immense amount of tedious document editing." [S9] ✅；Canadian Lawyer："Stevenson co-founded Spellbook with Daniel Di Maria and Matt Mayers." [S10] ✅

**第二步：第一个产品想"绕开律师"，失败，转向"服务律师"**（反转 0）
- "Very early on we tried to build a legal automation system that small businesses could use to bypass lawyers… However, we quickly realized: People were still super nervous about doing legal work on their own, valuing the opinion of a trusted lawyer. Lawyers were seriously hungry to end drudgery in their own work." [S6] ✅
- "Then a law firm approached us after seeing our automation technology… After that, we were 100% on servicing lawyers" [S6] ✅
- 2026 年 CEO 回看："We called it 'DIY anxiety.'… People really struggle to trust these outputs without a human in the loop." [S20] ✅

**第三步：以 Rally 名义做模板和文档自动化，没有 AI；律师反复说"模板抓不住我的定制细节"**
- "The original product (Rally) was built around document templating technology… Lawyers loved the promise, but in practice we would often get the same piece of feedback: 'this is great for junior lawyers, but templates don't capture the bespoke nuances of my drafting.' At first we never took that feedback seriously. Then we heard it again, and again." [S6] ✅
- 成立年份说法不一：Next Play 写 "founded in 2017 under the name Rally" [S7]；BetaKit 写 "Founded as Rally out of St. John's, NL in 2018" [S18]；CEO 在 2025 年说 "we launched a doc automation product called Rally back in 2018" [S19]；2022 年 11 月 CEO 说 "Rally is five years old" [S3]。全部 ✅。
- Rally 的规模：2022 年 "provides its core legal management platform to 110 law firms" [S3]；"Rally counts 110 law firms and 3000 legal entities as clients" [S2] ✅

**第四步：用 100 多个落地页、200 多次实验，低成本测"说法"对不对**
- CEO 原话（2023-08）："Through the course of the company, we've run over 200 growth/product experiments with over 100 landing pages. That's how we often test message-market fit very inexpensively." [S6] ✅
- 播客里的口语说法（自动转录）："With our Dock [doc] automation product, we launched over 100 different web pages with different messages and angles on that. So literally we had almost like 100 basically failed marketing pages before over 100 before we actually arrived at Spellbook… every two weeks we would take a new angle on what we were doing" [S27] ✅
- Next Play（2025-12，Spellbook 赞助内容）："More than 100 landing pages and 200 growth experiments later, Spellbook took off in 2023." [S7] ✅
- 另一个旁证：融资也很难。"When we first went to raise money, we got 80 nos from investors because every investor said they didn't think lawyers wanted to buy software." [S20] ✅

**第五步：GitHub Copilot 带来"顿悟"；Spellbook 本来只是给 Rally 引流的"小工具"**
- "From trying GPT2, we had an inkling that something might be coming down the pipe to help our customers, but GitHub Copilot was the real 'aha!' moment. We tried GitHub Copilot when it launched and boom, inspiration struck. 'Oh! This is what our customers are looking for!'" [S6] ✅
- "Originally Spellbook was actually just going to be a fun little marketing lead magnet for us. It ended up becoming our main source of revenue in just a few short months." [S6] ✅；播客简介："it was originally conceived as a marketing idea to generate leads for Rally." [S11] ✅
- 验证方式：先给少数客户看原型——"we showed our first prototype to a handful of customers and got a kind of reaction we had never seen before. Pupils dilating, leaning in…" [S6] ✅

**第六步：2022 年 9 月 1 日正式上线，GPT-3 驱动的 Word 插件**
- "Spellbook is our new GPT-3 based drafting and review tool that we officially launched on September 1st this year." [S3]（Artificial Lawyer，2022-11-09）✅
- 为什么放在 Word："One unintuitive insight we had was that lawyers worked in Word all day, and really didn't like leaving it. This made us bet on putting Spellbook in Word, just like GitHub Copilot was in the software developer's environment (VS Code)." [S6] ✅
- 当时的技术路线（微调 + 少样本 + 提示工程）："We have a proprietary set of documents, built using open-source documents, our own legal team, and our own templating technology… We use these for fine-tuning, few-shot examples and prompt engineering" [S3] ✅
- 当时的定位很谦虚："we don't think lawyers should trust Spellbook. It is more like a muse that gives marble to carve where you didn't have any." [S3] ✅
- 当时**还没有 Playbook**：记者问 "Do you use playbooks for the new text?"，CEO 答 "Currently, no, but this is a highly requested feature that is on our roadmap." [S3] ✅
- 需求爆发：2023 年 5 月 "more than 34,000 lawyers have signed up for the early access waitlist, with 8,000 added in April alone… Currently, we are onboarding 50 legal teams a week." [S5] ✅；同月融资 $10.9M，公司从 Rally Legal 改名为 Spellbook [S5] ✅

**第七步：上线方式——自助试用 + 直播 onboarding + 小组培训**
- 2023 年："Spellbook is committed to providing live onboarding sessions to ensure lawyers are set up for success" [S9] ✅
- 播客（约 2023 年末）："you can go to our website… sign up for a trial and you can just book it on boarding and you'll within 20 minutes be set up with a trial" [S27] ✅（自动转录，有口误）
- 自下而上销售："One of our first users was a single lawyer at a Fortune 10 company who put Spellbook on his personal credit card and used it on his own to improve his work… Our NRR in December was 130%, so we are expanding into these organizations, often starting with a single seat." [S20] ✅
- 律所的推广：Herzog Fox & Neeman（以色列最大律所，450+ 律师）"began by piloting Spellbook in their Tech Division… From there, it expanded across the firm"，并做了 "a phased rollout and dedicated training" [S31] ✅；McInnes Cooper："From the moment we started a very short pilot, the most impressive thing is it was ready to be used." [S32] ✅

**第八步：从律所扩展到企业法务——Playbook 把"总法律顾问的谈判口径"写成规则**
- 2025-01-07 发布（CEO 博客）："This past year, we've worked with over 160 in-house teams at enterprises, including companies like Nestlé, Fender, Crocs, BDO Unibank, and WSP Global Consulting, identifying challenges and opportunities." / "we created Playbooks to enable legal teams to codify their negotiation approach so that AI can negotiate documents the same way their GC would, using preferred language and fallback positions." [S12] ✅（S13 Artificial Lawyer 版本标注为 "sponsored article by Spellbook"；S14 LawSites 独立报道同样内容 ✅）
- Playbook 的结构 [S12] ✅：
  - 规则："Rules are at the core of Playbooks: instructions about what should be permitted in a contract. When you run a playbook, your rules will either pass or fail."
  - 首选与退让措辞："you can provide fallback language that Spellbook can suggest"
  - 预设问题："a list of pre-set questions which will be automatically answered, with citations"
  - 起步方式："Playbooks comes out of the box with 12 common rule sets, but you can easily build your own from scratch, or using AI."
  - 培训："We'll also offer Playbooks-focused sessions in our group trainings over the coming weeks."
- 之后的升级 [S34] ✅："You can now add up to 3 fallback positions within a single rule" / "You can now generate a playbook directly from an open Word document or by uploading a file" / "Spellbook can suggest rules based on your current document or selected text"
- **客户怎么写 Playbook（具名案例）**：
  - Dropbox（约 10 人团队，每月 200+ 份合同，高峰 300–400 份）：法务运营经理 Cassidy Storer 入职时 "the team had no playbooks in place"，从 NDA 开始——"I tried to make the NDA playbook one of the first days I got into the system, and I just uploaded our form and it made it within minutes."；负责人 John Walker："refining a template and turning it into a working playbook was once a two-quarter effort… We're talking probably eight, nine, ten templates that we're going to be able to do in the time that it took to do one." [S29] ✅
  - Panasonic Automotive："The first job was to take the standard language out of their template documents and build it into Playbooks, so the right position was used on every review instead of buried in a file someone had to go look for." [S30] ✅
- 企业部署现在有专人：Legal Solutions Architect "Develop playbooks and training materials for in-house legal teams" [S39]；FDE "Integrate Spellbook with document management systems (e.g. iManage, NetDocuments), identity systems, and internal APIs… Tune model inference, augment context, and adapt the product experience to meet specific customer needs across deployments" [S38] ✅
- 【Claude原文】"An in-house team codifies how it reviews master service agreements and NDAs, what it negotiates and what it concedes" [S0]

**第九步：人机分工：AI 找问题、起草修订；律师做判断、接受或拒绝**
- 【Claude原文】"Spellbook's agents spot issues, negotiate terms, and revise agreements directly in the document"；聊天回答 "with citations a lawyer can check"；权限收窄 "edits confined to specified paragraphs" [S0]
- 【外部来源】"Our approach to AI is called 'Assistive AI': we always keep the lawyer in the driver's seat, and they need to review any suggestions before they are acted upon." [S23] ✅；"electric bicycle for transactional lawyers… We're keeping lawyers at the steering wheel" [S12] ✅

**第十步：评测：线上看采纳率，线下用标准答案模型加法律专家，另做一致性测试**
- 【Claude原文】采纳率、Fable 当 oracle 生成评测标准、"manual review with our legal engineers and domain experts"、同一份合同连跑 10 次 [S0]
- 【外部来源】采纳率的历史数字："When we launched AI contract review in early 2023, our suggestion acceptance rate was 5%. Today it is nearly 60%." [S19]（2025-10-09）✅

**第十一步：从单文档到多文档，再到"自主管理合同"（ACM）**
- Spellbook Associate："a web and desktop app 'shaped a little bit like ChatGPT' but tuned for multi-document drafting and what Stevenson calls 'surgical redlines' across deal documents"；但 "The original product is the Microsoft Word add-in, and that remains what most users rely on" [S24] ✅
- ACM 上线（2026-06-30 专访）：配置方式是 "pre built agent definitions, which are really just documents or text files describing how, okay, if you know, a new sales agreement comes in… Who should it escalate to? What's the playbook?… we have lots of defaults that are available on day one." [S22] ✅；ACM 博客："Spellbook ACM is rolling out to a few select teams today." [S36] ✅
- 【Claude原文】从邮件 / Slack / Salesforce 自动拉取合同，覆盖分流、审查、谈判、归档、长期监控 [S0]

**时间线**：约 2017/2018 以 Rally 名义成立（DIY 法律自动化 → 律所模板工具）→ 2022-09-01 上线 Spellbook（GPT-3，Word 插件）→ 2023-05 $10.9M 融资并改名 Spellbook [S5] → 2024-01 A 轮 $20M（Inovia 领投）[S18] → 2024-08 推出 Associate 智能体 [S14] → 2025-01-07 Playbooks 进入企业法务 [S12][S14] → 2025-10-09 B 轮 $50M [S15][S16] → 2026-05 招 FDE [S38] → 2026-06-30 ACM [S22] → 2026-08-13 AI 文档编辑器（"Cursor for contracts"）[S21][S35] → 2026-08-27 Claude 故事发布 [S1]。
**谁去现场、单个客户上线花多久**：没有具名驻场叙述。上线速度的公开说法：试用"20 分钟"开通 [S27]；Dropbox"within days"产生价值、NDA playbook"within minutes"生成 [S29]；McInnes Cooper "a very short pilot" [S32]。均为公司营销内容或 CEO 口述。

---

## 4. 关键反转 / 转折点（最重要）

### 反转 0：想"绕开律师"做 DIY 法律工具 → 用户有"DIY 焦虑" → 转向"给律师装电动自行车"（✅ 已核实）
- **原本做法**："Very early on we tried to build a legal automation system that small businesses could use to bypass lawyers" [S6]
- **现场发现**："People were still super nervous about doing legal work on their own, valuing the opinion of a trusted lawyer." [S6]；"We called it 'DIY anxiety.'" [S20]
- **调整**：一家律所主动找上门后，"we were 100% on servicing lawyers, and that was a great decision." [S6]
- **意义**：这是整个产品"律师始终在驾驶位"（Assistive AI）理念的来源。

### 反转 1：从"微调 GPT-3"到"微调是个糟糕的方法"，押注模型外围的工程（✅ 已核实，时间线完整）
- **原本做法（2022–2023）**：
  - 2022-11："Spellbook's use of OpenAI's GPT-3… is further 'tuned' on legal datasets" / "We use these for fine-tuning, few-shot examples and prompt engineering" [S3] ✅；"fine-tunes GPT-3 on legal datasets" [S2] ✅
  - 2023-05："Spellbook trained and fine-tuned an instance of OpenAI's GPT-3 with 'billions of lines' of legal text in a process that sounds similar to the development of Codex… The company now employs a mix of GPT-3.5 and GPT-4 depending on the feature being employed." [S5] ✅（**第一轮把出处写成 S2/S3，有误，实际出自 S5 Synthedia**）
  - 2023-10：已经在转向 RAG——"we think that RAG-based approaches are the best way to incorporate accurate legal data into generated text" / "We generally shouldn't treat LLMs as 'databases'" [S23] ✅
- **后来的判断**：
  - 2025-11："We were one of the first companies in the world to fine-tune large language models for legal work when we launched in 2022… However, I've developed a contrary opinion that training and fine-tuning language models has become a horrible approach."；理由是把文档塞进模型的长期记忆 "encourages hallucinations"，改为 "grounding"——"If you teach the model to go and fetch real-time trusted information and to cite it, you get much, much more accurate answers" [S24] ✅
  - 【Claude原文】"The team tried fine-tuning early and abandoned it… 'Most of the value we add is in the harness that goes around the models.'" [S0]
  - 更早的伏笔（2023-08）：CEO 批评 "companies that are overly focused on prestigious R&D (eg. training their own LLMs from scratch with proprietary data sets)"，并提到上线时被问 "Is that too easy? Where is your 10 person machine learning team?" [S6] ✅
- **注意（给评论区防御用）**：Spellbook 官网新闻页的公司简介**至今仍写着** "Trained on billions of lines of legal text" [S41] ✅；Dropbox 客户故事里也有 "Spellbook is trained on contracts, including Dropbox's own library" [S29] ✅。这些说法和"放弃微调"并存，可能指检索和偏好学习，不一定是模型训练。脚本里不要说"他们从没训练过模型"。

### 反转 2："律师得跑三四遍才放心" → 换更强的模型，并把"一致性"变成评测指标（Claude 原文，✅）
- **原本做法**：审查界面用 Sonnet 4.6。
- **现场反馈**：客户说 "I feel like I have to run it three or four times to find everything."
- **调整**："Earlier this year Spellbook moved the review surface from Sonnet 4.6 to Opus 4.6"；新增一致性测试 "runs the same contract review, same prompt and contract ten times in a row…"
- **效果**："Fable calls out more important issues, and for the issues it calls out, it calls them out far more consistently than any of the other Opus models… It has a lower time to first issue" [S0]
- **外部佐证**：采纳率从 2023 年初的 5% 到 2025 年 10 月的近 60% [S19] ✅。这是本案例最有冲击力的**过程数字**。

### 反转 3：律师不要"离开 Word 的聊天框"，要在自己的文档里直接改（✅ 已核实，含原帖）
- 【Claude原文】"If you mess up a lawyer's document formatting at all, they just won't use the product."；产品被形容为 "kind of like Claude Code, but for contracts" [S0]
- 【外部来源】Sacra 访谈（2026-03-26）："We also had a thesis that there are way too many apps shaped like a chat box. ChatGPT already exists, Claude already exists. If all you build is a chat box, that's not going to be very differentiated." [S20] ✅
- 【外部来源】Stevenson 的 X 帖子（2026-08-13 3:47 PM，页面显示 57.2K 次浏览）[S21] ✅ 原文：
  > "Cursor for contracts is here. Announcing Spellbook's new AI document editor. Doc editing for lawyers is disjointed: you can edit with AI in chat, but then need to "Open in Word" to make manual tweaks without breaking formatting. Alternatively you can use a Word add-in like Spellbook's, but this only allows you to work on one document at a time. For a long time, @mitchellhynes and I talked about getting to a real "Cursor for Contracts" experience. With a lot of blood and sweat, we're finally there."
- 【外部来源】配套博客："It brings the complete Word experience right into Associate, with full formatting support… Let's say you want to edit four financing documents based on a term sheet. Just ask Spellbook, and it'll make hundreds of edits across the set." [S35] ✅
- **叙事线（均有出处）**：Word 插件（只能一次一份）→ 像 ChatGPT 的 Associate（能多文档，但聊天里改完还要"在 Word 中打开"再手工微调）→ 带完整 Word 格式的 AI 文档编辑器。

### 反转 4：Rally 做模板（没有 AI）→ 100 多个落地页 → 看到 Copilot → "引流小工具"变成主营收（✅ 已核实）
- 模板被律师反复吐槽："templates don't capture the bespoke nuances of my drafting." "At first we never took that feedback seriously. Then we heard it again, and again." [S6]
- "over 200 growth/product experiments with over 100 landing pages" [S6]；播客口语 "almost like 100 basically failed marketing pages" [S27]
- "GitHub Copilot was the real 'aha!' moment" [S6]
- "Originally Spellbook was actually just going to be a fun little marketing lead magnet for us. It ended up becoming our main source of revenue in just a few short months." [S6]

### 反转 5：大所"创新委员会"自上而下采购 → 发现他们更在意新闻稿 → 改为自下而上卖给一线律师（✅ 新增，Sacra 2026-03-26）
- "Some of our first customers were big law, and what we realized was that purchase decisions at these firms were made by innovation committees, very top-down… We also learned that those innovation committees cared heavily about how big the press release was going to be." [S20]
- 原因："At a big law firm, everything is based on the billable hour. Cutting your billable hours in half is not actually exciting for a large law firm." [S20]
- 调整："So we made the decision early on not to sell top-down to large firms unless they were authentically committed to improving how they work. Instead, we sold bottom-up." [S20]

### 反转 6："说好不做企业法务" → 企业法务成了最大客户群（✅ 已核实）
- **原本**："We actually started selling to law firms and said we were never going to sell in-house. Then in-house just kept coming to us, again and again." [S20]
- **做法**：2024 年与 160+ 个企业法务团队合作，2025-01 推出 Playbooks [S12]
- **效果**："About 60% of our revenue today comes from corporate in-house"；"in-house is growing three times faster than our law firm segments, and honestly we did not expect that." [S20]；2025-10："We began selling to solo and small firms, but now half our revenue comes from large firms and enterprises." [S15]；【Claude原文】"They were just waiting for something that actually worked." [S0]
- **伏笔**：2022 年记者问是否用 playbook，答 "Currently, no, but this is a highly requested feature" [S3]。

### 隐含反转 7：模型供应商从 OpenAI 单一 → OpenAI + Anthropic → Claude 故事里的 "mostly Claude"（✅ 已核实，但对外口径不一致）
- 2022：GPT-3 [S2][S3]；2023-05：GPT-3.5 和 GPT-4 混用 [S5]；2025-08：新闻页列有 "Spellbook Becomes One of the First Legal AI Platforms to Launch GPT-5" [S41]；2025-10 新闻稿："Powered by large language models like OpenAI's GPT-5" [S16]
- 当前 Microsoft Marketplace："Powered by GPT-5 and other large language models" [S25] ✅（**第一轮摘要里的 "OpenAI and Anthropic" 不在该页面上，已更正**）；About 页："Powered by OpenAI's GPT-5 and other large language models (LLMs)" [S42] ✅；首页 meta 描述："It uses GPT-5, Claude, and other LLMs" [S43] ✅
- 安全页："Spellbook has negotiated agreements with both OpenAI and Anthropic for zero data retention (ZDR)." [S37] ✅；FDE 招聘页技术栈："LLM providers (OpenAI, Anthropic, and others)" [S38] ✅
- 【Claude原文】"runs a full suite of mostly Claude models"；Weir："so I pushed a lot of features into the Anthropic bucket" [S0]
- 注意：Claude 原文用的是 "mostly"；Spellbook 自己的多个页面仍把 GPT-5 放在首位。脚本里只能说"多模型，其中大量用 Claude"。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 单份协议律师工时 | 约 10 小时 | 约 1 小时（10 倍） | 【Claude原文】S0 | CEO 自报，没有测算方法；"10x" 早就是营销语（见第 7 节） |
| 单份协议成本（示意） | 约 $10,000（10h × $1,000/h） | 未给出 | 【Claude原文】S0 | 按顶级律所合伙人费率做的**示意换算** |
| 建议采纳率 | 5%（2023 年初刚推出 AI 审查时） | 近 60%（2025-10） | S19 ✅ | CEO 在媒体专访中自报；未说明分母 |
| 公司自称提速倍数 | "2x to 4x"（2023-05）[S5]；"up to 4x"（2023-07）[S9] | "up to 10x"（2025-01 Playbooks）[S12]；"10x"（2026 Claude 原文）[S0] | S5、S9、S12、S0 ✅ | 同一家公司三年内说法从 2–4 倍升到 10 倍，口径不同（审查速度 / 队列处理 / 完成一份协议） |
| 每月审查量 | — | 约 530,000 次/月 | 【Claude原文】S0 | 同页三种写法，可能是智能体运行次数 |
| 每月律师聊天消息 | — | 700,000+ | 【Claude原文】S0 | 公司自报 |
| 客户数 | 700 个活跃法务团队（2023-07）[S9] → 约 4,000（2025-10）[S15][S16] → 4,500（客户故事页页脚）[S29] | 5,000（2026-08）[S0]；官网 "5,000+ teams" [S37] | 均 ✅ | "客户"指律所或法务团队，不是用户数；第一轮的"2,600（Marketplace）"在当前页面上找不到，已删除；新闻页公司简介里仍有过时的 "more than 2,700" [S41] |
| 累计审查合同 | — | 超过 1,000 万份（截至 2025-10） | S16、S18、S19 ✅ | S16/S19 原文拼写为 "10 million contacts reviewed"（笔误）；累计口径 |
| 员工 | 115 人（2025-10）[S18] | 250 人（2026-08）[S0] | ✅ | BetaKit 当时说计划 1–2 年内扩到 230 人 |
| 收入结构 | 早期以小型/独立律所为主 [S9] | 企业法务约 60% 营收 [S20]；"half our revenue comes from large firms and enterprises" [S15] | ✅ | CEO 自报 |
| 净收入留存（NRR） | — | 130%（2025 年 12 月） | S20 ✅ | CEO 自报 |
| 每周 demo 量 | 约 200/周（2025-12） | 约 450/周（"Claude for legal" 新闻后两个月内） | S20 ✅ | CEO 自报，他把增长归因于 Claude 法律相关新闻带来的关注 |
| 融资 / 估值 | $10.9M（2023-05，Moxxie 领投，Thomson Reuters Ventures 参投，累计 $12.4M）[S5]；A 轮 $20M（2024-01，Inovia 领投）[S18] | B 轮 $50M（2025-10-09，Khosla 的 Keith Rabois 领投），投后估值 $350M，累计超 $80M | S5、S15、S16、S18、S19 ✅ | — |
| Dropbox：做一套 playbook | 约两个季度（一季度改模板、一季度落地） | NDA playbook 上传模板后"几分钟"生成；同样时间可做 8–10 套 | S29 ✅ | Spellbook 官网客户故事，客户口述 |
| Dropbox：表格排版 / 首读 | 排版 15–20 分钟；首读约 1 小时 | 排版几秒；首读从风险摘要开始 | S29 ✅ | 同上 |
| Panasonic：建立外部律所 RFP 流程 | 最快约 3 周 | 4 天 | S30 ✅ | 同上 |
| Panasonic：合同摘要 | 20 分钟 | 2 分钟 | S30 ✅ | 同上；此前一份合同曾耗时 3 天 |
| 审查一致性 | 客户"要跑三四遍才找全" | Fable 在一致性上明显领先（无具体分数） | 【Claude原文】S0 | **没有公开量化分数** |

---

## 6. 方法论提炼（可复用到其他行业）

1. **嵌入点选在"用户已经待着的工具"，不另起一个对话框**：律师在 Word 里干活，产品就做成 Word 插件，还把格式保真当成底线。依据：[S0]；[S6] "lawyers worked in Word all day, and really didn't like leaving it"；[S20] "there are way too many apps shaped like a chat box"。
2. **价值在模型外围的工程，不在自训模型**：2022 年微调，2025 年 CEO 称微调"a horrible approach"，改为检索 + 引用（grounding）。依据：[S0][S3][S5][S24]。
3. **把专家的隐性标准写成可执行的规则（Playbook）**：规则通过/不通过、首选措辞、最多 3 个退让位置、预设问题带引用；从自家模板一键生成初稿。依据：[S0][S12][S34]；客户实例 [S29][S30]。
4. **用"采纳率"衡量效果，比离线跑分更贴近真实用户**：5% → 近 60%。依据：[S0][S19]。
5. **专业用户要的是"不用复核"，一致性要单独测**。依据：[S0]。
6. **按子任务难度匹配模型**。依据：[S0]。
7. **权限最小化 + 零数据留存，换取客户敢用**。依据：[S0][S37]。
8. **反复出现的用户抱怨是信号**：模板"抓不住定制细节"的反馈"we heard it again, and again"，最终导向 AI 产品。依据：[S6]。
9. **低成本验证需求**：100+ 落地页、200+ 实验测"说法"，再给少数客户看原型看反应。依据：[S6][S27]。
10. **卖给真正的使用者，而不是采购委员会**：绕开大所创新委员会，从单个律师单席位扩展，NRR 130%。依据：[S20]。
11. **FDE 把定制工作变成平台功能**：FDE 职责明确写 "identify repeatable patterns across deployments… turning custom work into scalable features"。依据：[S38]。

---

## 7. 数字严谨性 & "评论区喷子"防御

- **全部核心数字都是公司自报**：Claude 客户页 [S0]、Spellbook 官网客户故事 [S29–S33]、CEO 访谈 [S19][S20][S24]。没有第三方审计。
- **赞助内容要打折**：S13（Artificial Lawyer 的 Playbooks 文章）末尾写着 "[ This is a sponsored article by Spellbook for Artificial Lawyer. ]"；S7（Next Play）结尾写着 "Thank you to Spellbook for supporting Next Play"。两者内容已核对，但属于付费/合作内容。
- **"530,000"的口径不统一**：同一页面三种写法 [S0]。建议说"每月约 53 万次合同审查任务"。
- **"10 倍"是一路涨上来的营销语**：2023-05 "2x to 4x" [S5] → 2023-07 "up to four times faster" [S9] → 2025-01 Playbooks "up to 10x faster" [S12] → Marketplace / 招聘页 "10x faster" [S25][S38] → 2026 Claude 原文"10 小时 → 1 小时" [S0]。建议脚本写"公司称"。
- **"$10,000 一份合同"是示意换算**：假设 "a top firm where a partner bills $1,000 an hour" [S0]。
- **客户数随时间变化，且官网自己也不统一**：700（2023-07）→ 约 4,000（2025-10）→ 4,500（客户故事页页脚）→ 5,000（2026-08）。新闻页的公司简介仍写 "more than 2,700"、"GPT-4" [S41]，是没更新的旧文案。
- **成立年份**：2017 [S7]、2018 [S18][S19][S20]、"five years old"（2022-11，[S3]）。Claude 原文 "Since launching in 2022" 指 Spellbook 产品上线（2022-09-01，[S3]）。
- **"PMF 在 2022 年"还是"2023 年起飞"**：Next Play 同一篇文章里两种说法都有（"finding product-market fit in 2022" 和 "Spellbook took off in 2023"）[S7]。
- **"独家用 Claude"是错的**：Claude 原文是 "mostly Claude models" [S0]；Spellbook 自己的 About 页和 Marketplace 写的是 "Powered by (OpenAI's) GPT-5 and other large language models" [S25][S42]；首页写 "GPT-5, Claude, and other LLMs" [S43]。**这是一个明显的口径冲突点**：Claude 客户页说以 Claude 为主，Spellbook 官网仍把 GPT-5 放在首位。
- **"放弃微调"和"用数十亿行法律文本训练"并存**：Claude 原文说放弃了微调 [S0]，CEO 说微调 "a horrible approach" [S24]，但 Spellbook 新闻页公司简介仍写 "Trained on billions of lines of legal text" [S41]。脚本别把话说死。
- **准确性与一致性质疑**：
  - Claude 原文自己承认客户曾反馈"要跑三四遍才找全" [S0]。
  - 用户评论（Software Finder，2026 年 4 月，4 星）："One major frustration for me is the incorrect legal citations it sometimes provides. When there isn't a clear source, it still inserts one which leads me down the wrong path and wastes time." [S45] ✅（单个用户言论）
  - Dropbox 客户故事也提到法务团队过去对法律 AI 的顾虑："the legal AI they'd seen before had a habit of missing obvious issues and flagging things that weren't there" [S29]（说的是之前用过的其他工具）
  - Herzog 客户故事承认 "some advanced capabilities like multi-document review are still evolving" [S31] ✅
- **竞品批评（注意立场）**：
  - GC AI（竞品，2026-07-21）："Pricing is not published; every purchase starts with a sales demo."；"Spellbook's Ask feature answers questions about contracts you have uploaded. It does not reach case law, statutes, or regulations." [S26] ✅
  - Hyperstart（竞品，2026-05-12）列出"Hallucinated legal citations"、单文档上限等 [S44] ✅；它引用的 Reddit AMA 帖子无法打开 [S46] ❌
- **幻觉 / 保密的对策**：可核查引用（"citations a lawyer can check"）、零数据留存、只能改指定段落 [S0]；与 OpenAI、Anthropic 签了 ZDR 协议 [S37]。
- **"first AI contract drafting tool / first GenAI tool for lawyers"**：公司一贯自称 [S9][S15][S20]，属营销表述。
- **中文报道**：检索 36氪、机器之心、虎嗅等，**未找到中文媒体报道**，只有 AI 工具导航站的产品介绍页（如 xmsumi.com、ai-kit.cn），不作为来源。
- **第一轮摘要有误、本轮已更正**：
  1. 联合创始人不是 "Daniel Di Cicco"，是 **Daniel Di Maria**（律师，2023 年时任 COO）和 **Matt Mayers**（设计师）[S6][S9][S10]。
  2. "fine-tuned GPT-3 with 'billions of lines' of legal text" 出自 **S5 Synthedia（2023-05-26）**，不是 S2/S3。
  3. "100 多个落地页"：原句是 "Through the course of the company, we've run over 200 growth/product experiments with over 100 landing pages"[S6]，说的是整个公司历程中的低成本测试；"failed marketing pages" 是播客口语 [S27]。
  4. Microsoft Marketplace 描述当前为 "Powered by GPT-5 and other large language models"，没有 "OpenAI and Anthropic"；"约 2,600 个法务团队 / 60+ 国"在页面上找不到，已删除。
  5. Stevenson "Cursor for contracts" X 帖子日期确认为 **2026-08-13**；帖子还点名了合作者 @mitchellhynes，全文见第 4 节。
  6. S11 播客：tlpodcast.com 上的发布日期是 2024-02-15，Apple Podcasts 上显示 2025-06-26（重新发布）。
  7. S8（antoinebuteau.com）打开后发现是二手"语录汇编"，其中引用与原始出处对不上（例如称 TL Podcast 里说 "a $30,000 legal bill for a $5,000 startup"，与 S6/S10 的"2 万美元天使投资花掉一半"矛盾）。**已从正文所有依据中移除**。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下全部是【编剧建议】，不是事实。括号里标出每条依据的来源编号。

- **钩子 1（算账）**："一份 50 页的合同，顶级律所合伙人读 10 个小时，每小时 1000 美元——这是一份一万美元的文件。"（S0）
- **钩子 2（采纳率）**："AI 给律师提 100 条修改建议，刚上线时律师只接受 5 条；两年半后，接受将近 60 条。中间发生了什么？"（S19）
- **钩子 3（信任反转）**："AI 审合同最大的问题不是'不准'，是律师说：'我得跑三四遍才放心。'"接着讲同一份合同连跑 10 遍的一致性测试。（S0）
- **钩子 4（格式即生死）**："你把律师文档的一个编号弄乱，他就再也不用你了——Word 的格式规范有 5000 多页。"（S0）
- **反转桥段（想绕开律师 → 为律师服务）**："他们第一个产品想让小企业不用请律师。结果用户不敢用——他们管这叫'DIY 焦虑'。最后一家律所找上门：'我们想要这个。'"（S6、S20）
- **反转桥段（引流小工具变主业）**："Spellbook 原本只是给老产品引流的一个小玩意儿，几个月后成了公司主要收入。"（S6、S11）
- **反转桥段（对话框 vs 在文档里改）**："律师在聊天框里改完，还得'在 Word 中打开'再手工调格式——于是产品回到文档本身，做成'合同版 Cursor'。"（S0、S20、S21）
- **反转桥段（放弃微调）**："2022 年他们对外说用法律文本微调了 GPT-3；2025 年 CEO 自己说：'微调已经是个糟糕的方法。'价值在模型外面那层工程。"（S3、S5、S24、S0）
- **反转桥段（大所只要新闻稿）**："他们发现，大律所的'创新委员会'最在乎的是新闻稿有多大——因为按小时计费，帮律师省一半时间并不让律所兴奋。于是他们转头去卖给一线律师，一个席位一个席位地卖。"（S20）
- **FDE 视角（瑞蒙特可以讲）**："Playbook 就是把总法律顾问脑子里的'哪些条款必须争、哪些可以让、退到哪一步'写成规则。Dropbox 以前做一套要两个季度，现在上传模板几分钟出初稿。连 Spellbook 这样的产品公司，也在 2026 年开始招 Forward Deployed Engineer，专门去大客户那里把定制需求变成产品功能。"（S29、S38；类比部分为编剧推演）
- **给中国听众的迁移建议**：中国企业法务和律所大量在 Word / WPS 里审合同，"不离开原工具 + 按本单位审查口径自动审 + 律师逐条接受或拒绝 + 用采纳率衡量"可以直接对照。（S0、S12、S19）
- **升华句**："AI 不是替律师读合同，而是把最好的那位律师的判断标准，复制到每一份合同上。"（依据 S0 的 Playbooks 描述；属于创作）
- **风险提示**：没有具名驻场故事，不要虚构驻场情节；可以用"产品公司也在招 FDE"作为结尾的行业信号（S38）。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S0 | Spellbook runs 530,000 contract reviews a month with Claude | https://claude.com/customers/spellbook | Claude原文 | 2026-08-27（见 S1） | ✅（第一轮 WebFetch + curl 抓取，逐句 grep 核对） |
| S1 | claude.com 客户故事列表数据（Spellbook 条目 date 字段） | https://claude.com/customers | Claude原文（元数据） | — | ✅（第一轮） |
| S2 | Legal Tech Firm Rally Showcases GPT-3 AI Contract Writing Assistant Spellbook | https://voicebot.ai/2022/11/10/legal-tech-firm-rally-showcases-gpt-3-ai-contract-writing-assistant-spellbook/ | 媒体 | 2022-11-10 | ✅ |
| S3 | Meet Spellbook the GPT-3 Generative AI Word Add-In For Contracts | https://www.artificiallawyer.com/2022/11/09/meet-spellbook-the-gpt-3-generative-ai-word-add-in-for-contracts/ | 媒体（含 CEO 问答） | 2022-11-09 | ✅ |
| S4 | Rally launches Spellbook, the first AI Contract Drafting tool Powered by GPT-3 | https://www.einnews.com/pr_news/588763746/rally-launches-spellbook-the-first-ai-contract-drafting-tool-powered-by-gpt-3 | 新闻稿 | 2022（推断） | ❌ 无法访问（Cloudflare 403；WebFetch 被出网代理拦截；archive.org 连接被重置）。正文不再引用其内容 |
| S5 | Spellbook, the Generative AI Copilot for Lawyers, Raises $10.9 Million | https://synthedia.substack.com/p/spellbook-the-generative-ai-copilot | Newsletter | 2023-05-26 | ✅（"billions of lines" 原句出处） |
| S6 | From Musical Instruments to Legal AI Tech: The Journey of Scott Stevenson | https://www.focusedchaos.co/p/interview-scott-stevenson-spellbook | 创始人访谈 | 2023-08-22 | ✅ |
| S7 | The AI startup for lawyers that launched 100 landing pages before finding PMF | https://nextplayso.substack.com/p/the-ai-startup-for-lawyers-that-launched | Newsletter（Spellbook 赞助） | 2025-12-11 | ✅ |
| S8 | Lessons from Scott Stevenson | https://www.antoinebuteau.com/lessons-from-scott-stevenson/ | 博客语录汇编 | 不明 | ✅ 已打开，但判定为**不可靠**（引文与原出处不符），不作依据 |
| S9 | Spellbook: This Legal Software Company Uses AI To Help Lawyers Work More Efficiently | https://pulse2.com/spellbook-scott-stevenson-profile/ | 媒体采访 | 2023-07-31 | ✅ |
| S10 | Legal fees ate up half of his startup investment, motivating founder to build AI tech tool Spellbook | https://www.canadianlawyermag.com/resources/legal-technology/legal-fees-ate-up-half-of-his-startup-investment-motivating-founder-to-build-ai-tech-tool-spellbook/378521 | 媒体（加拿大） | 2023-08-04 | ✅ |
| S11 | How a Start-Up's Legal Bills Led to Spellbook… (Scott Stevenson - Co-Founder) | https://www.tlpodcast.com/how-a-start-ups-legal-bills-led-to-spellbook-an-ai-co-pilot-for-transactional-lawyers-scott-stevenson-co-founder/ ；https://podcasts.apple.com/us/podcast/how-a-start-ups-legal-bills-led-to-spellbook-an-ai/id1315450241?i=1000714653251 | 播客节目页 | 2024-02-15（tlpodcast）；Apple 显示 2025-06-26 | ✅（节目简介；未听音频） |
| S12 | In-House Team Expansion with Playbooks | https://www.spellbook.legal/blog/expanding-into-in-house-teams-with-playbooks | 公司博客（CEO 署名） | 2025-01-07（与 S13/S14 同日） | ✅ |
| S13 | Spellbook Expands Into In-House Teams With Playbooks | https://www.artificiallawyer.com/2025/01/07/spellbook-expands-into-in-house-teams-with-playbooks/ | 媒体（**赞助文章**） | 2025-01-07 | ✅ |
| S14 | With Launch Today of 'Playbooks,' Gen AI Company Spellbook Expands Into In-House Legal Market | https://www.lawnext.com/2025/01/with-launch-today-of-playbooks-gen-ai-company-spellbook-expands-into-in-house-legal-market.html | 媒体（LawSites） | 2025-01-07 | ✅ |
| S15 | Spellbook Raises $50m Series B led by Khosla Ventures | https://spellbook.com/blog/series-b | 公司博客 | 2025-10-09 | ✅ |
| S16 | Spellbook Raises $50M Series B to Expand AI Contract Review Platform | https://www.lawnext.com/2025/10/spellbook-raises-50m-series-b-to-expand-ai-contract-review-platform.html | 媒体（转载新闻稿全文） | 2025-10-09 | ✅ |
| S17 | Spellbook Raises $50M Series B to Expand AI Contract Review Platform | https://www.businesswire.com/news/home/20251009110230/en/Spellbook-Raises-$50M-Series-B-to-Expand-AI-Contract-Review-Platform | 新闻稿 | 2025-10-09 | ❌ 无法访问（403；WebFetch 被拦截）。同一新闻稿已在 S16 核对 |
| S18 | Spellbook raises $50-million USD Series B led by Khosla Ventures | https://betakit.com/spellbook-raises-50-million-usd-series-b-led-by-khosla-ventures/ | 媒体（加拿大） | 2025-10 | ✅ |
| S19 | Spellbook Raises $50m + CEO, Scott Stevenson Interview | https://www.artificiallawyer.com/2025/10/09/spellbook-raises-50m-ceo-scott-stevenson-interview/ | 媒体采访 | 2025-10-09 | ✅（采纳率 5% → 近 60% 出处） |
| S20 | Scott Stevenson, CEO of Spellbook, on building Cursor for contracts | https://sacra.com/research/scott-stevenson-spellbook-cursor-for-contracts/ | 研究机构访谈 | 2026-03-26 | ✅ |
| S21 | Scott Stevenson on X: "Cursor for contracts is here…" | https://x.com/scottastevenson/status/2087929024639054297 | 创始人社媒 | 2026-08-13 | ✅（curl 直接取得帖子全文与日期） |
| S22 | Scott Stevenson Interview: Spellbook ACM | https://www.artificiallawyer.com/2026/06/30/scott-stevenson-interview-spellbook-acm/ | 媒体视频采访（附文字稿） | 2026-06-30 | ✅ |
| S23 | Scott Stevenson, Co-Founder & CEO of Spellbook – Interview Series | https://www.unite.ai/scott-stevenson-co-founder-ceo-of-spellbook-interview-series/ | 媒体采访 | 2023-10-30 | ✅ |
| S24 | Spellbook's $50m plan to prove legal AI needs real data | https://www.nonbillable.co.uk/news/spellbook-scott-stevenson-interview | 媒体采访 | 2025-11-13 | ✅（"fine-tuning… a horrible approach" 出处） |
| S25 | Spellbook（Microsoft Marketplace 产品页） | https://marketplace.microsoft.com/en-us/product/office/wa200004774?tab=overview | 应用市场产品页 | 当前版本（2026-09 抓取） | ✅（描述为 "Powered by GPT-5 and other large language models"，5.0 分 / 9 个评分；**无** "OpenAI and Anthropic"） |
| S26 | 12 Best Spellbook Alternatives for In-House Counsel in 2026 | https://gc.ai/blog/spellbook-alternatives | 竞品博客 | 2026-07-21 | ✅（竞品立场） |
| S27 | Making Legal Services Accessible: How Spellbook Transforms Law – Scott Stevenson – S8 E44 | https://legallyspeakingpodcast.com/making-legal-services-accessible-how-spellbook-transforms-law-scott-stevenson-s8-e44/ | 播客（页面带自动转录） | 约 2023-12（按页面图片上传目录推断） | ✅（"100 basically failed marketing pages" 原话出处；转录有口误） |
| S28 | Will AI automate legal work? The future of lawyers with Scott Stevenson, Spellbook CEO | https://peoplereign.io/podcasts/will-ai-automate-legal-work-the-future-of-lawyers-with-scott-stevenson-spellbook-ceo/ | 播客 | 2025-05-26（据 S41 新闻页列表） | ❌ 无法访问（Sucuri JS 验证页，取不到正文）。正文不引用 |
| S29 | How Dropbox's legal team keeps more work in-house with Spellbook | https://spellbook.com/stories/dropbox | 公司客户故事 | 页面未显示日期 | ✅ |
| S30 | How Panasonic saved three weeks building a formal RFP process with Spellbook Associate | https://spellbook.com/stories/panasonic | 公司客户故事 | 页面未显示日期 | ✅ |
| S31 | Herzog's 450-lawyer firm delivers faster with Spellbook | https://spellbook.com/stories/herzog | 公司客户故事 | 页面未显示日期 | ✅ |
| S32 | McInnes Cooper on why the future of law won't exist without AI | https://spellbook.com/stories/mcinnes-cooper | 公司客户故事 | 页面未显示日期 | ✅ |
| S33 | Preparing the Next Generation of AI-Fluent Lawyers: Spellbook Partners with Kennedys | https://spellbook.com/stories/kennedys | 公司客户故事（律所培训合作） | 约 2025-10（S41 新闻页列 Law360 2025-10-02 报道） | ✅ |
| S34 | Faster, Smarter Playbooks | https://spellbook.com/blog/faster-smarter-playbooks | 公司产品博客 | 页面未显示日期 | ✅ |
| S35 | Introducing Spellbook's AI Document Editor | https://spellbook.com/blog/introducing-spellbooks-ai-document-editor | 公司产品博客 | 约 2026-08-13（S21 链接到此文） | ✅ |
| S36 | Introducing Autonomous Contract Management | https://spellbook.com/blog/introducing-acm | 公司产品博客 | 约 2026-06-30 | ✅ |
| S37 | Security & Compliance（安全页 FAQ） | https://spellbook.com/security | 公司官网 | 当前版本 | ✅（"agreements with both OpenAI and Anthropic for zero data retention"） |
| S38 | Forward Deployed Engineer @ Spellbook | https://jobs.ashbyhq.com/spellbook.com/d92285f3-73a5-4ad1-8b1a-df1d2ab034df | 招聘页 | 2026-05-07 | ✅（通过 Ashby 公开职位接口取得全文） |
| S39 | Legal Solutions Architect, Pre Sales @ Spellbook | https://jobs.ashbyhq.com/spellbook.com/3ab656f3-6285-4871-8134-b0b40e929a55 | 招聘页 | 2026-09-23 | ✅ |
| S40 | Customer Success Manager @ Spellbook | https://jobs.ashbyhq.com/spellbook.com/c53f284e-e0bd-4d17-8c9b-e96050bfb213 | 招聘页 | 2026-07-28 | ✅ |
| S41 | Spellbook Press（新闻页 / 公司简介 / 报道列表） | https://spellbook.com/press | 公司官网 | 当前版本 | ✅（简介仍写 "Trained on billions of lines of legal text"、"more than 2,700"） |
| S42 | Spellbook About（公司介绍） | https://spellbook.com/about | 公司官网 | 当前版本 | ✅（"Powered by OpenAI's GPT-5 and other large language models"） |
| S43 | Spellbook 首页（meta 描述） | https://spellbook.com/ | 公司官网 | 当前版本 | ✅（"It uses GPT-5, Claude, and other LLMs"） |
| S44 | Spellbook alternatives: Best AI Contract Review Tools to Move Beyond Drafting in 2026 | https://www.hyperstart.com/blog/spellbook-alternatives/ | 竞品博客 | 2026-05-12 | ✅（竞品立场） |
| S45 | Spellbook Reviews（Software Finder 用户评论） | https://softwarefinder.com/legal/spellbook/reviews | 第三方点评站 | 评论 2026-04 | ✅（Courtney H. 关于错误引用的原句） |
| S46 | H2H AMA: We are the founders of Spellbook, Ivo… (r/legaltech) | https://www.reddit.com/r/legaltech/comments/1sz7gg8/h2h_ama_we_are_the_founders_of_spellbook_ivo/ | 社区讨论 | 2026 | ❌ 无法访问（Reddit 返回拦截页 / 403；WebFetch 不支持 reddit.com）。正文不引用 |

**补充说明**：
- 第一轮已查证 anthropic.com 两场法律主题网络研讨会页面，以及 claude.com 的法律解决方案页和法律行业博客页，都**没有提到 Spellbook**。
- 中文检索（36氪、机器之心、虎嗅及通用中文搜索）：**未找到中文媒体报道**，只有 AI 工具导航站的产品介绍。
- 仍存在的缺口：①没有具名的"FDE 驻场某客户"过程叙述；②Claude 原文中"从 Sonnet 4.6 换到 Opus 4.6"的具体时间和一致性分数没有公开；③Reddit / HN 上的一线用户讨论无法访问；④Spellbook 官网客户故事都没有标注发布日期。
