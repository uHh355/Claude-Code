# 案例：EvenUp — 用"读得省、定一次、写得稳"的文书智能体，把人身伤害律所一份案件文书从 8–15 小时压到几十分钟

> **核实状态说明（第二轮，2026-09-24）**：本轮网络已放开，逐条打开了第 9 节的外部来源。
> - **已打开原页并逐句核对（✅）**：S0–S2（第一轮已核）以及 S3 Business Insider 原文（全文可见，含 EvenUp CEO 与发言人逐字回应）、S4–S9、S11–S14、S16–S21、S26、S27；本轮新增 S28–S41 共 14 个来源也全部打开核对。合计 **✅ 36 个来源**（第 9 节逐行列出）。
> - **无法访问（❌）4 个**：S10 Forbes（出网代理 EGRESS_BLOCKED / curl 403）、S22 BusinessWire 新闻稿（EGRESS_BLOCKED；但同一新闻稿全文在 EvenUp 官网 S37 找到并已核对）、S23 Glassdoor 两条评论（代理拦截，web.archive.org 快照连接被重置）、S24 StreetInsider 转载的 Reuters 稿（403；同一篇 Reuters 稿在 Yahoo Finance 的转载 S39 已核对）。
> - 第一轮若干"搜索摘要"说法与原文不符，已按原页更正，更正清单见第 7 节 D。
> - 中文检索：找到极客公园（经智源社区转载）与 OFweek 两篇 2024 年融资报道（S40/S41），没有找到中文媒体对 BI 批评报道的跟进。

- 行业：法律科技（Legal）——为美国原告方人身伤害（Personal Injury, PI）律所提供 AI 平台
- 企业规模 / 地区：Claude 页面标注 Startup / North America，内部"200+ employees use Claude Enterprise"【Claude原文 S0】。2019 年成立于旧金山【S9、S13 ✅】。2025-10 完成 1.5 亿美元 E 轮（Bessemer 领投），估值 20 亿美元以上，累计融资 3.85 亿美元；平台客户 2,000+ 家律所，含美国前 100 大 PI 律所中的 20%（以上均为公司口径）【S17/S18/S19 ✅】。到 2026-05，公司口径更新为"前 100 大 PI 律所的 30%、每周处理 1 万+ 案件"【S21 ✅】。
- Claude 产品标签：Claude Platform、Claude Enterprise、Claude Code【Claude原文 S0】
- Claude 故事发布日期：2026-08-26（claude.com 客户故事列表数据的 date 字段；页面正文没写日期）
- Claude 原文链接：https://claude.com/customers/evenup
- 落地主体（谁是"FDE"）：**没有公开信息说 Anthropic 或第三方 FDE 驻场。** 落地分两层：
  - **技术层**：EvenUp 自己的 ML 团队，Claude 原文发言人是首席机器学习工程师 Emre Yamangil【S0】。EvenUp 官网 2024-12 的员工专访称他当时负责 Case Companion【S38 ✅】。
  - **进律所这一层，EvenUp 自己扮演"前置部署"角色，现在有原页证据**：
    - 内部人工复核团队：2024 年博客写"100+ 法律专家"【S6 ✅】，现产品页写"150+ legal professionals"【S7 ✅】；
    - 招聘页有"Enterprise Onboarding & Implementation Manager"岗位，要求"到客户现场（最多 30% 出差）支持上线、培训、go-live"，汇报给"Head of Customer Onboarding"【S33 ✅】；
    - 2026-05 推出 PLAAS（诉前服务化）：EvenUp 自己的美国案件经理"直接在律所自己的系统里工作、严格按律所政策办案"【S21、S30 ✅】。这是本案最接近"驻场团队"的形态。
- 本案例推荐指数：**4.5 / 5**（第一轮 4 分，本轮上调）
  - 上调理由 1：Business Insider 原文找到，前员工逐字引语和 EvenUp CEO / 发言人的逐字回应都拿到了，反转 1 从"摘要转述"变成硬事实。
  - 上调理由 2：Claude 原文里匿名的"加州所""俄勒冈所"，在 EvenUp 官网客户案例里能对上具名律所：Batta Fulkerson Law Group、ELG Injury Lawyers（S28/S29）。其中 Batta Fulkerson 案例写了"上线有磨合期，第一单 Express 索赔函拿到 10 倍首报价，团队才服气"，这正是"破冰"桥段。
  - 仍扣分：没有 Anthropic 驻场信息；多数结果数字是公司或客户自报。

---

## 1. Claude 原文要点（事实 + 数字）

全部来自 S0 https://claude.com/customers/evenup ，第一轮已用 WebFetch 和 curl 打开，并逐句核对过下列英文原句。

**定位与规模**
1. 定位：让小所的案子不因所小而变弱。EvenUp 平台覆盖案件全生命周期，客户累计结案 20 万+ 件，为伤者争取到 100 亿美元+ 赔偿。
   > "an injury victim's case shouldn't be weaker just because their firm is smaller… have resolved more than 200,000 cases and secured more than $10 billion in damages for injury victims."
2. 分工：Claude 负责读、抽取、推理；EvenUp 在上面叠 PI 数据、领域知识和主动式自动化工作流。
   > "Claude models do the reading, extraction, and reasoning. EvenUp adds PI data, domain expertise, and proactive automated workflows on top."

**摘要区六个数字**
3. 文书起草：从每案 8–15 小时降到"几分钟"。
   > "Documents drafted in minutes, down from 8 to 15 hours of skilled work per case"
4. 和解报价提升 300%，前提是律所拿出带引证的完整损害图景。
   > "Raised settlement offers 300% for firms presenting the full damages picture with cited evidence"
5. 客户律所的索赔函（demand）产量翻三倍，一家律所清掉了 45 天积压。
   > "Tripled customer firms' demand output, with one practice clearing a 45-day backlog"
6. 证据开示（discovery）答复：从 5 小时降到 30 分钟。
   > "Reduced case discovery response time from 5 hours to 30 minutes"
7. 小案件的既往医疗费用合计，准确率提升 14%。
   > "Increased accuracy on past medical expense totals by 14% on smaller cases"
8. 草稿完整度提高 16%，缺失的病历更少。
   > "Delivers drafts with 16% greater completeness and fewer missing records"

**痛点**
9. 过去全靠手工。
   > "A paralegal with a highlighter worked through stacks of records that were weeks late and out of order… The same visit could be documented three different ways by three different providers."
10. 加州某所有 1,500+ 在办案件，其中约 250 件在诉讼阶段，整个索赔函写作只靠 1 个人，积压 45 天。俄亥俄某所的律师助理手工做病历时间线、手工合计账单，每案 8–15 小时。
    > "One California firm juggled 1,500+ active cases, 250 of them in litigation at any given time, and ran its entire demand-writing function through a single person. A 45-day backlog slowed every case behind it."
    - 本轮补充：这家"加州所"的数字与 EvenUp 官网 Batta Fulkerson Law Group（圣迭戈，40 人）案例逐项吻合（1,500 件、250 件诉讼、1 名索赔函写手、45 天积压、10 倍首报价、审阅快 75%）【S28 ✅】，见第 3 节 B 层。
11. 律所面临的两难：要么接案硬扛工时，要么把案子转出去。
    > "Firms faced a choice: take the case and eat the hours, or refer it out."

**为什么选 Claude**
12. 关键是一致性和长上下文。
    > "Other models can write one good paragraph, but Claude stands apart… Keeping a single consistent story across thirty pages is the real test."

**模型分层**
13. 按"错误会藏在哪里"分配模型：日常抽取用 Sonnet/Haiku；可能被"文笔掩盖错误"的论证环节交给 Opus。
    > "If a model gets a date wrong, that's easy to catch… If it builds an argument that's subtly wrong, that mistake looks just as confident and polished as a correct one."

**读取阶梯**
14. 一个案子常有 1,000 页以上。读法按成本逐级升：先读原生文本，读不了再上普通 OCR，还不行才用 Claude 视觉。
    > "real text, then standard OCR, then Claude's vision for the scanned bills and checkbox forms neither one can handle."
15. 先给每页分类，每条事实保留源页引证、合并重复，**整份记录先"定一次"再开始起草**。
    > "one contradiction is enough for an adjuster to discount the entire demand."

**起草**
16. Opus 先定蓝图（适用的法律规则、对方会攻击哪里、案件主线），并对全文一致性只检查一次；Sonnet 按蓝图分节写作。各州规则用白话英文写，而不是写成代码。
    > "That only works if the model obeys the fortieth instruction, buried deep in a long document, as faithfully as the first… Claude did."
17. 人工兜底：每份草稿最后都由律师通读、核对、签字。
    > "Every draft still ends with a person: an attorney reads, checks, and signs it."

**准确率与成本**
18. 低于 150 页的小案件，单次 Opus 调用打赢了更长的链路，既往医疗费用合计的准确率提升 14 个点。
    > "On smaller cases, under 150 pages, a single Opus pass beat a longer chain, lifting accuracy on past medical expense totals by 14 points."
19. 成本工程：跟踪每个任务的成本，成本突增能在一天内追到源头。
    > "EvenUp tracks the cost of every task, so a spike traces to its source within a day. 'Cost is something you engineer.'"

**结果**
20. 起草时间：
    > "Drafting that once took 8 to 15 hours of skilled work now returns as finished drafts in about 30 minutes, a 99% decrease."
21. 和解报价：
    > "Settlement offers across EvenUp's customer firms are up 300%."
22. 某全国性 PI 律所的首席案件经理说：
    > "seeing demand output that is 3x over what we've produced internally."
23. 加州所清掉了 45 天积压；律师审阅快了 75%；此后又用 AI Drafts 写调解书，帮助一起创伤性脑损伤案以"六位数高位"和解；一起早期的滑倒摔伤案，首次报价比预期高 10 倍。
    > "Demands that took a month now take about ten minutes, and attorney review moves 75% faster."
    > "In one early slip-and-fall case, the first offer came back 10x higher than expected."
24. 俄勒冈某所：起草周期从数月降到数天，营收一年增长 400%。
    > "An Oregon firm's drafting turnaround fell from months to days, and their team reported that revenue has grown 400% in one year."
    - 本轮补充：对应 EvenUp 官网 ELG Injury Lawyers 案例（波特兰 + 佛州博卡拉顿，18 人）："400% Revenue growth in one year"，创始人原话 "Rather than a couple of months, we're now talking about a matter of days."；该所是 **"EvenUp's 2nd customer in May 2021"**【S29 ✅】。

**EvenUp 内部与用户反馈**
25. 内部 200+ 员工用 Claude Enterprise；团队用 Claude 做了 AI 成本预测系统，还做了"专门调试其他智能体的智能体"。
    > "Neither project would have ever been staffed on its own… Both exist now."
26. 俄亥俄一位做了 25 年医疗账单表的律师助理：
    > "At first, I was hesitant to give up control… EvenUp has been a huge stress relief."
    - 本轮在 EvenUp 官网 40 余篇客户案例中检索"Ohio / hesitant / stress relief / 25 years"，**没有找到这位助理所在的律所**。
27. Yamangil 的方法论：
    > "Spend your expensive model where you can't verify cheaply."
    > "The case doesn't end when the demand goes out"

**其他 Claude 官方页面**
28. CEO Rami Karabibar 在 claude.com 法律行业博客（2026-05-12）和法律解决方案页上有一段更长的原话【S1、S2，已打开核实】：
    > "PI law presents some of the toughest challenges for AI: reasoning across large volumes of medical records and billing data, identifying critical facts, and executing complex workflows with consistency and accuracy… EvenUp adds proprietary PI data, domain expertise, and purpose-built workflows on top."

---

## 2. 背景与痛点（结构化）

| 维度 | 内容 | 来源 |
|---|---|---|
| 材料量 | 一个案子常有 1,000+ 页，涉及十几家医疗机构的病历、账单流水、警方报告 | 【Claude原文 S0】"A case often arrives as 1,000 pages or more, and includes records from a dozen providers, billing ledgers, and police reports." |
| 材料质量 | 病历"晚几周、顺序乱"；同一次就诊，三家机构可能记成三种写法 | 【Claude原文 S0】"records that were weeks late and out of order… The same visit could be documented three different ways by three different providers." |
| 耗时 | 手工做病历时间线、合计账单，每案 8–15 小时 | 【Claude原文 S0】"taking 8 to 15 hours for each case" |
| 人力瓶颈 | 加州所（即 Batta Fulkerson）1,500+ 在办案件、250 件在诉讼，只有 1 人写索赔函，积压 45 天 | 【Claude原文 S0】；【外部来源 S28 ✅】"With only one demand writer on staff, the firm's 45 day demand backlog slowed case resolution and created bottlenecks throughout the case workflow." |
| 行业时滞 | EvenUp 统计：全美伤害律所从最后一次治疗到发出索赔函，平均间隔 150 天 | 【外部来源 S35 ✅，公司自报】"On average, we see a 150-day gap between the last date of treatment and when a demand is sent across injury firms in the U.S." |
| 人员流动 | 大所 Lerner & Rowe（400+ 人）：案件经理一走，主管要花整整一周重新分派案卷，其他人工作量陡增 25%，招人加培训要 6 个月 | 【外部来源 S30 ✅，客户案例】"This resulted in an immediate 25% workload spike…"；"traditional hiring cycles that take up to six months to recruit and onboard" |
| 质量红线 | 一处矛盾就足以让保险理赔员（adjuster）打折整份索赔；数字读错，要么少要钱，要么信誉受损 | 【Claude原文 S0】"one contradiction is enough for an adjuster to discount the entire demand." |
| 商业两难 | 接案就得吃下工时，不接就只能转出去 | 【Claude原文 S0】"take the case and eat the hours, or refer it out." |
| 创始动机 | 联合创始人 Raymond（Ray）Mieszaniec 的父亲被一辆卷入警车追逐的汽车撞成终身残疾；家里只拿到同类事故平均赔偿的约 10%，部分原因是代理律师不清楚合理赔偿是多少。另一位联合创始人 Saam Mashhad 曾是诉讼律师。**任务线索里"Raymond 的父亲是 PI 律师"没有任何来源支持，父亲是事故受害者，不是律师。** | 【外部来源 S9 ✅ TechCrunch 2023-06-08】"Karabibar co-founded EvenUp with Ray Mieszaniec, a two-time entrepreneur, whose father was permanently disabled after being hit by a car involved in a police chase. Mieszaniec's family got just 10% of the average payout for that type of accident — partly because their lawyer didn't know what the appropriate compensation should be."；"EvenUp's third co-founder, Saam Mashhad (a former litigator)"；【S11 ✅ BVP】"When EvenUp Co-Founder and COO Raymond Mieszaniec was a child, a catastrophic car accident left his father with a permanent disability." |
| CEO 背景 | Rami Karabibar 此前做过 PE / VC / 创业公司（TechCrunch），并在 Waymo 亲眼看到大规模处理伤害理赔的低效（BVP 2025） | 【S9 ✅】"who previously worked across private equity, venture capital and venture-backed startups"；【S11 ✅】"CEO Rami Karabibar drew on his experience at Waymo, where he witnessed firsthand the inefficiencies of managing injury claims at scale." |
| 市场数据 | 99% 的伤害索赔在庭外私下和解，理赔流程常超过一年（第一轮"出处不确定"，现确认出自 Bessemer 2023-06-08 投资文） | 【外部来源 S11 ✅】"99% of cases are settled privately… the claims process often takes over a year to reach a resolution" |

---

## 3. 落地过程（FDE 怎么做的）

> 先说明：**仍没有公开信息说 Anthropic 团队驻场律所或参与实施。** 下面分两层重建：
> - A 层：EvenUp 工程团队如何把 Claude 落成产品，只用 Claude 原文，事实最硬；
> - B 层：EvenUp 如何进入律所、人机怎么分工。本轮这部分已全部换成打开核对过的原页。

### A 层：产品侧的落地步骤（【Claude原文 S0】）

**第一步：选模型的考题是"30 页不走样"，不是"写一段好文"。**
- Yamangil："Keeping a single consistent story across thirty pages is the real test."

**第二步：按"错误能不能被便宜地查出来"分配模型（人机分工的前提）。**
- 抽取类任务交给 Sonnet/Haiku。日期抽错这类错误，人翻源页就能查。
- 论证类任务交给 Opus，因为论证上的错误"看起来和正确的一样自信、一样漂亮"。
- 原句："Which Claude model gets a task depends on where a mistake could hide."

**第三步：读取阶梯。** 先分类文档（账单 / 临床记录 / 入院表），再按成本逐级升级：原生文本 → OCR → Claude 视觉。
- 原句："The system reads each page the most affordable way it can, and only climbs higher when it has to"

**第四步："先把事实定一次，再写。"**
- 每条事实挂源页引证、合并重复、全案统一定稿之后，才开始起草。
- 原因："Nothing downstream would catch two parts of the system disagreeing about the same fact"

**第五步：Opus 画蓝图，Sonnet 分节写。**
- 各州规则与惯例写成白话英文，不写成代码，方便法律专家直接维护。
- 原句："following state-by-state rules and conventions written in plain English instead of code"

**第六步：人工兜底。** 律师通读、核对、签字。
- 原句："an attorney reads, checks, and signs it."

**第七步：评测与迭代。** 在低于 150 页的小案件上做对比：单次 Opus 调用 vs 更长的链路，结果单次调用准确率 +14 个点（评测指标是既往医疗费用合计）。

**第八步：成本工程。** 每个任务单独计成本，成本突增一天内定位到源头；团队还用 Claude 做了一套"AI 成本与预测系统"，现在由它来引导模型选型。

**第九步：扩展场景。** 从索赔函（demand）扩到谈判单（negotiation sheets）、证据开示答复（discovery responses）、医疗摘要，诉讼后还用来写调解书（mediation briefs）。
- 原句："The case doesn't end when the demand goes out"

**时间线**：Claude 原文没有给出项目周期、上线时间、试点范围。EvenUp 何时开始用 Claude，**未找到公开信息**。EvenUp 在 2026-04-17 的自家博客里写过 "Claude and other leading foundation models are incorporated into our product and used extensively in development"【S34 ✅】，说明最迟 2026-04 已在产品中使用。

### B 层：进入律所、人机分工（【外部来源】本轮全部 ✅ 打开核对）

**1) 起点：先做"一个文书"（索赔函），而且一开始就是人机混合**
- 2023-06 TechCrunch：平台把原始案卷整理成模板化的"demand packages"，定位是给律所的"self-service solution"【S9 ✅】。
- 同期 Reuters：300+ 客户，年订阅费从几千到几十万美元，2023 年已超 1,000 万美元经常性收入【S39 ✅】。
  > "EvenUp currently has over 300 customers, who pay annual subscription prices in the thousands to hundreds of thousands of dollars, and has already exceeded $10 million in recurring revenue this year, Karabibar told Reuters."
- NFX（2023-06）：投资人明确写，客户不在乎你用没用 AI，卖的是"更快、更便宜、更好"的结果。
  > "EvenUp understands that the AI is not the selling point. The customers don't care that you're using AI."【S14 ✅】
- 最早的客户：ELG Injury Lawyers 称自己是 "EvenUp's 2nd customer in May 2021"【S29 ✅】。

**2) 人机双层（2024 年口径，EvenUp 自己公开的立场）**
- 博客《Leveraging AI & Human Review in Demand Letters – The EvenUp Difference》【S6 ✅】原文：
  > "Relying solely on AI for demands can be great for speed and efficiency but can also be borderline malpractice."
  > "Our proprietary AI, Piai™, is trained on hundreds of thousands of personal injury cases and works alongside a world-class team of over 100 legal experts, including lawyers, medical professionals, and paralegals. Together, they draft thousands of demands and medical chronologies every week."
  > "We've built a dedicated team of over 100+ skilled professionals, including medical professionals, paralegals, adjusters, case managers, and lawyers, who review, redraft, and refine thousands of demands and medical chronologies each week."
- 同文把自研 Piai 与 GPT-4 对比（公司自测）：医疗费用识别 95% vs 80%；治疗识别 91% vs 79%；就诊日期与机构对应 90% vs 68%【S6 ✅】。
- **日期注意**：该博客页面现显示 "February 18, 2025"（schema datePublished 2025-02-18），但正文已加入 2025-05 才发布的 AI Drafts 段落，说明页面后来改过。BI 2024-12 报道说这篇博客是 EvenUp 在 2024 年回应 BI 采访后发布的（见反转 1）；LinkedIn 分享帖【S6 ✅】显示"1y Edited"。**首发日期以"2024 年、BI 采访之后"为准，页面日期是更新日期。**

**3) 分层产品：把"哪些案子多靠 AI、哪些多靠人"做成可选档位**
- 2025-01-26 推出 Express Demands，定位是"first of many self-serve AI-powered document generators"，以 Early Access 形式上线【S35 ✅】。
- 现产品页【S7 ✅】两档并列：
  - "AI + You"：Piai 几分钟出稿，律所自己审改定稿；"Suggested for straightforward liability cases"
  - "AI + Professional Review"："Drafted by AI + EvenUp's team of 150+ legal professionals"，1–5 天交付定稿；"Suggested for complex liability cases"
- 第三方对比页【S8 ✅，ColabContent，2026-09 更新】按同样口径复述："Expert-Reviewed Demands are described as drafted by AI plus EvenUp's team of more than 150 legal professionals, and delivered in a finalized state in one to five days."

**4) 进律所：上线、磨合、破冰（本轮新补，均为 EvenUp 官网客户案例，属公司发布的客户证言）**
- **Batta Fulkerson（即 Claude 原文的"加州所"）——上线有磨合期，靠第一单破冰**【S28 ✅】：
  > "Like any major change, the implementation of EvenUp came with an adjustment period. The team had to learn when to use Demands™ — full, professionally-reviewed drafts — versus Express Demands™, which are AI-generated in minutes and typically used for simpler cases."
  > "The turning point came when the firm ran its first case using an Express Demands™ for a straightforward trip-and-fall with modest medical bills."
  > "The attorney received a first offer that was ten times higher than expected."
  - 律所管理诉讼律师 Micaela De La Cerda："I sent the EvenUp Demand to the adjuster and thought the first offer had to be a typo. I called to confirm, and we laughed — now it's a running joke in the office: 'Was that an EvenUp demand?'"
  - 之后从索赔函扩到 Case Preparation（缺失账单/病历提示）和 Case Companion（AI 助手），律师分派案件的审阅"75% Faster"。
- **上线有多快**：堪萨斯城 7 人小所 Nash & Franciskato 的律师助理说上线只开了约一小时的会【S31 ✅】：
  > "I thought the onboarding experience with EvenUp was incredibly easy. By the end of [a roughly one-hour] meeting, I was able to immediately go into the platform and start utilizing it."
- **大所的变革管理**：J&Y Law 的 COO Monica Washington Rothbaum 用 ADKAR 模型推动 AI 落地【S32 ✅】：
  > "She introduced ADKAR (awareness, desire, knowledge, ability, and reinforcement) to guide every major implementation."
- **EvenUp 侧的实施岗位**【S33 ✅，Built In 转载的 EvenUp 招聘，发布日期页面未标】：Enterprise Onboarding & Implementation Manager，负责数据迁移、系统配置、用户上线、变更管理和 go-live：
  > "Travel to customer sites (up to 30% travel) to support onboarding, training, and go-live activities."
  > "Reporting to the Head of Customer Onboarding, the Program Manager will collaborate with Product, Engineering, and customer teams"
  - 这是本案能找到的**最接近 FDE 的公开证据**：EvenUp 有专门的企业客户上线团队，会去律所现场。但没有找到具名个人、具体哪家律所驻场的记录。

**5) 产品化与全生命周期**
- 2025-05-15 推出 AI Drafts 套件、Smart Workflows、医疗账单摘要，改成按案计价【S20 ✅ Legal IT Insider；S36 ✅ EvenUp 官网新闻稿】：
  > "The AI Drafts Suite delivers document creation—including demand letters, complaints, medical summaries, negotiation sheets, and responses to interrogatories."
  > "it is introducing a new one clear per-case pricing model, without confusing feature tiers."
  > CEO："Most tools wait for the user to ask. EvenUp is built to act like a great case manager – proactive, data-driven, and able to move PI cases forward without dropping the ball."
- 投资人复盘（BCV 2025-10-08）：先靠一个高价值任务（索赔函）切入，被模仿后扩成覆盖全流程的平台【S12 ✅】：
  > "Like many AI companies in early 2023, EvenUp surprised and delighted its customers by quickly applying generative AI to one of personal injury law's most time-intensive tasks: drafting demand letters."
  > "Predictably, revenue surged — and competitors quickly followed."

**6) 从软件走向"服务"：PLAAS（2026-05）**
- LawSites 2026-05-14【S21 ✅】：
  > "EvenUp… is making a significant shift in its business model – one that extends it beyond software vendor to something closer to an outsourced operations partner for PI firms."
  > "It combines purpose-built AI with EvenUp's own U.S.-based case management staff to handle the full pre-litigation lifecycle."
  - 覆盖立案调查、治疗跟进、调取病历账单、按律所标准写索赔函、与保险公司谈判、可选的留置权处理。
- Lerner & Rowe 案例【S30 ✅】写明了驻场方式：
  > "EvenUp provides fully ramped, best-in-class case managers to Lerner & Rowe, providing immediate capacity precisely when it's needed. PLAAS™ case managers operate directly within the firm's own systems and adhere to their exact policies from claim opening to the first offer."

---

## 4. 关键反转 / 转折点（最重要）

### 反转 1（外部，最强）："AI 独角兽"被曝大量靠人工 → CEO 回应"人机结合是特性，不是缺陷"

**原本的外部叙事**
- EvenUp 以 AI 为卖点；2024-10 完成 1.35 亿美元 D 轮，估值从年初 8,500 万美元升到 10 亿美元以上【S3 ✅；D 轮见 S12 BCV 2024-10-08 ✅】。
- BI 原文："One of EvenUp's investors has described its 'AI-based approach' as representing a 'quantum leap forward.'"

**Business Insider 报道**（Ben Bergman，2024-12-13，付费墙文章，但页面 HTML 里有全文）【S3 ✅】
- 标题："EvenUp's valuation soared past $1 billion on the potential of its AI. The startup has relied on humans to do much of the work, former employees say."
- 信源：8 名前员工，采访时间是当年夏末到初秋：
  > "human staff have done a significant share of that work, and EvenUp's AI has been slow to pick up the slack, eight former EvenUp employees told Business Insider in interviews over the late summer and early fall."
- 被告知别用 AI：
  > "In practice, once you start with the company, my experience was that my managers told me not even to use the AI. They said it was unreliable and created too many errors."
- 也有前员工说法更温和：
  > "I was 100% told it's not super reliable, and I need to have a really close eye on it"
- 错误类型：
  > "missed injuries, hallucinated medical conditions, and incorrectly recorded doctor visits"
  > "It also has reported a victim suffered a shoulder injury when, in fact, their leg was hurt. The system also has mixed up which direction a car was traveling"
- 错误没有进入最终交付：
  > "BI found no instances of these errors making it into the final product. Such mistakes, if not caught by human staff, could have potentially reduced payouts, three of the employees said."
- 工作强度：
  > "A lot of my coworkers would work until 3 a.m. and on weekends to try to keep up with what was expected"
  > "EvenUp's AI could be helpful in simple cases that could be completed in as little as two hours. But more complex cases sometimes required eight hours"

**EvenUp 的逐字回应**（第一轮缺失，本轮在 BI 原文拿到）
- CEO Rami Karabibar 书面声明：
  > "The combined approach ensures maximum accuracy and the highest quality… Some demands are generated and finalized using mostly AI, with a small amount of human input needed, while other more complicated demands require extensive human input but time is still saved by using the AI."
- BI 的概括："EvenUp told BI it uses a combination of humans and AI, and this should be viewed as a feature, not a bug."
- Karabibar 谈 AI 进步：
  > "Our AI is improving every day… It saves more time today than it did a week ago, it saved more time a week ago than it did a month ago, and it saved a lot more time a month ago than it did last year."
- 发言人给的量化口径：
  > "employees spend 20% less time writing demand letters than they did at the beginning of the year. The spokesman also said 72% of demand letter content is started from an AI draft, up from 63% in June 2023."
- 发言人承认错误"可能发生过"：
  > "EvenUp's spokesman acknowledged that these problems cited by former employees 'could have happened,' especially in earlier versions of its AI, but said this is why it employs humans as a backstop."
- 关于员工：
  > "We recognize that working at a company scaling this fast is not for everyone… In addition, as our AI continues to improve, leveraging our technology will become easier and easier."

**BI 文中的客户与投资人声音**（由 EvenUp 发言人引荐）
- 客户 Simon Law Group 联合创始人 Robert Simon："I appreciate that because I would love to have an extra set of eyes on it before the product comes back to me… EvenUp is highly, highly accurate."
- BCV 合伙人 Sarah Hinkfuss 认为人工团队在生产竞争对手复制不了的数据："They're building novel datasets that did not exist before, and they are automating processes that significantly boost gross margins"

**博客与报道的先后**
- BI 写明：它当年早些时候就向 EvenUp 询问过人工角色，之后 EvenUp 发了那篇"AI + 人工复核"博客（S6）：
  > "After the outreach, the startup responded with written answers and published a blog post that clarified the roles employees play."

**之后的调整（时间线，均 ✅）**
- 2025-01-26（报道后约 6 周）：推出自助式 Express Demands【S35】。
- 2025-05-15：AI Drafts 套件 + 按案计价【S20/S36】。
- 产品页把两档写明：纯 AI 的"AI + You"（简单案件），以及"AI + 150+ 名法律专业人员"（复杂案件）【S7】。这正好对应 CEO 在 BI 里说的"有的案子主要靠 AI，复杂的需要大量人工"。
- 2026-05：推出 PLAAS，把"AI + EvenUp 自己的美国案件经理"作为服务卖【S21】。
- 2026-08 的 Claude 原文里，人工角色写成"律师最后签字"和"PI 数据与领域专长"【S0】。
- **注意**：没有来源说上述产品调整是"因为 BI 报道"。这里只是时间顺序，片中不能说成因果。

**效果**
- 没有公开数据说明这次风波对客户或营收的影响。
- 融资面：报道后约 10 个月，2025-10 完成 1.5 亿美元 E 轮，估值 20 亿美元以上【S17/S18/S19 ✅】。

**【编剧建议】** 这组素材可以讲成"钟摆"：
- 起点就是"人 + 模板 + 数据"：2023 年卖的是模板化索赔包，投资人说"客户不在乎你用没用 AI"（S9/S14）；
- 然后打着 AI 旗号被媒体质疑"其实靠人"（S3）；
- CEO 回应"人机结合是特性，不是缺陷"（S3），随后把人工占比做成可选档位：纯 AI 自助 vs AI + 150 人复核（S7/S35）；
- 最后干脆把"人 + AI"卖成服务，派案件经理进律所系统干活（S21/S30）。
- 这正好对应"FDE 的价值在于设计人机边界"。CEO 的回应原话现在可以直接引用。

### 反转 2（客户侧破冰，本轮新补）：团队不知道什么案子该用哪档 → 第一单 Express 拿到 10 倍首报价 → 全员接受
- **原本**：Batta Fulkerson 上线后有"adjustment period"，团队分不清什么时候用专家复核版、什么时候用纯 AI 版【S28 ✅】。
- **转折**：挑了一个最普通的滑倒案（"straightforward trip-and-fall with modest medical bills"），保险公司通常压价，结果首报价比预期高 10 倍。
- **效果**：成了所里的段子"Was that an EvenUp demand?"，随后扩到案件准备和 AI 助手，律师审阅和分派案件快 75%。
- 口径：这是 EvenUp 发布的客户案例；Claude 原文把同一件事写成 "slip-and-fall"（S0），EvenUp 原页写 "trip-and-fall"（S28），细节差一个词。

### 反转 3（Claude 原文隐含）：链路越长越准？→ 小案件单次 Opus 调用反而更准
- **原本做法**：更长的多步链路（"a longer chain"）。
- **发现**：低于 150 页的小案件，单次 Opus 调用胜出。
- **调整 → 效果**：小案件改为单次调用，既往医疗费用合计准确率 +14 个点。
  > "On smaller cases, under 150 pages, a single Opus pass beat a longer chain, lifting accuracy on past medical expense totals by 14 points."【S0】

### 反转 4（Claude 原文隐含）：全用最强模型？→ 把最贵的模型花在"便宜验证不了"的地方
- **直觉做法**：最强模型全程上。
- **现场认识**：日期错误律师翻源页就能查到；论证错误"看起来和正确的一样漂亮"，查起来很贵。
- **调整**：抽取用 Sonnet/Haiku，论证蓝图与一致性检查用 Opus；页面读取按"文本 → OCR → 视觉"逐级升级。
- **效果**：原文把"读得起""一天内追到成本突增"作为结果，没给具体降本数字。
  > "Spend your expensive model where you can't verify cheaply."【S0】

### 反转 5（Claude 原文隐含）：边读边写 → "先把事实定一次再写"
- **问题**：系统两个部分对同一事实说法不一，下游查不出来；一处矛盾就能让理赔员打折整份索赔。
- **调整**：带引证、去重，全案事实先统一定稿，再起草。
  > "the whole record is settled once, before drafting starts."【S0】

### 反转 6（用户侧）：老员工"不愿交出控制权" → "巨大的减压"
- 俄亥俄律师助理（25 年医疗账单表经验）：
  > "At first, I was hesitant to give up control, but with the way our firm is growing, I just don't have the time I used to. EvenUp has been a huge stress relief."【S0】
- 同类证言（官网客户案例 ✅）：
  - MVP Accident Attorneys 管理合伙人 Chelsee Sachs "was initially hesitant to use any generative AI tools at the firm"，担心 AI 取代研读后律师对案情不再了如指掌【S32 ✅】；
  - Jose Robles Jr. Law 因"past disappointments with other AI providers"一度不敢再试 AI【S32 ✅】。

### 反转 7（业务边界）：只写索赔函 → 覆盖案件全生命周期 → 卖"服务"
- Claude 原文把谈判单、证据开示答复、医疗摘要、调解书都纳入覆盖范围：
  > "The case doesn't end when the demand goes out, and neither does the opportunity to save a firm time on it."【S0】
- 投资人复盘：被模仿之后才扩成平台（"competitors quickly followed"）【S12 ✅】。
- 2026-05 进一步延伸到"诉前服务化"PLAAS【S21 ✅】。LawSites 的评语本身就是质疑："Whether PLAAS represents a genuinely new category or a repackaging of existing services with an AI wrapper will likely depend on how deeply firms integrate it"。

### 反转 8（与 Claude 的关系，本轮新补）："Claude 单靠自己不够" → 四个月后成为 Claude 标杆客户
- 2026-04-17，EvenUp 官网博客标题就是《Claude for Personal Injury: 5 Reasons It Isn't Enough on Its Own》【S34 ✅】：
  > "Claude is an impressive tool, and Claude and other leading foundation models are incorporated into our product and used extensively in development."
  > "But holding the pages and getting the record right are two different achievements. A model can process every page of a chart and still miss the two ER visits that establish causation."
  > "Automation you can't trust is the same work performed twice."
- 2026-08 的 Claude 客户故事用的是同一套分工逻辑："Claude 读和推理，EvenUp 加 PI 数据、领域专长和工作流"【S0】。
- 这不算真正的反转，但它回答了评论区"直接用 Claude 不就行了"的质疑，而且是 EvenUp 自己的原话。

### 创业早期的小反转（本轮新补，可作为片头片尾彩蛋）
- **被拒三次 YC、上百次投资人会议**（Fortune 2025-10-07）【S19 ✅】：
  > "Rami Karabibar and Ray Mieszaniec were rejected from Y Combinator at least three times."
  > "They kept saying to us: 'What are you doing? Legal tech sucks, AI sucks, personal injury sucks. Those are three negatives.'"
- **第一个客户先说"不"，两周后回头说"要"**（TechTO 2026-04-07）【S16 ✅】：
  > "Saam showed an early version to a client who said no. Two weeks later, buried in files, the same client said yes."
  - 注意：TechTO 文章标题《The Word doc that became a $2B company》，但正文**没有**解释"Word 文档"具体指什么。第一轮"起点是一份 Word 文档"的推测不能当事实用。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 每案文书起草耗时 | 8–15 小时专业人工 | 标题"15 分钟"；正文"约 30 分钟，下降 99%"；摘要区写"几分钟" | 【Claude原文 S0】 | **三个口径互相不一致**：30 分钟相对 8–15 小时只降了 93.8%–96.7%，不是 99%；"15h→15min"约降 98.3%。且"之后"是系统出草稿的时间，不含律师审阅 |
| 加州所（Batta Fulkerson）索赔函 | 约 1 个月（含 45 天积压） | 约 10 分钟；官网案例写"99% Faster demand drafting with Express Demands" | 【Claude原文 S0】【S28 ✅】 | "一个月"是日历周期（含排队），"10 分钟"是生成时间，**两者不是同一口径** |
| 律师审阅 / 分派案件速度 | 分派前要"multiple days"反复看卷 | 快 75% | 【Claude原文 S0】【S28 ✅】 | 单一律所自报 |
| 首次报价（个案） | 预期值 | 高 10 倍 | 【S0】【S28 ✅】 | 单个滑倒案，属于轶事 |
| 和解报价 | — | +300% | 【Claude原文 S0】 | 摘要区限定"presenting the full damages picture with cited evidence"，正文写"across customer firms"；**无基线、时间窗、对照组**，存在选择偏差 |
| 索赔函产量 | 律所内部产能 | 3 倍 | 【Claude原文 S0】 | 一家全国性律所案件经理的原话 |
| 证据开示答复 | 5 小时 | 30 分钟 | 【Claude原文 S0】 | 只出现在摘要区，正文无细节 |
| 既往医疗费用合计准确率 | 较长链路 | +14 个点 | 【Claude原文 S0】 | 摘要区写"14%"，正文写"14 points"，**%和百分点混用**；只适用于低于 150 页的小案件，是**两条内部流水线之间的对比**，不是和人工比 |
| 草稿完整度 | — | +16%，缺失病历更少 | 【Claude原文 S0】 | 基线未说明 |
| 俄勒冈所（ELG）营收 | — | 一年 +400%；索赔函周转"10x Faster"、从数月到数天 | 【S0】【S29 ✅】 | 律所自报，因果混杂（扩张、接案量等）；ELG 2021 年就是客户，早于 Claude 接入 |
| 索赔函中 AI 起稿占比 | 63%（2023-06） | 72%（2024-12） | 【S3 ✅ BI 引 EvenUp 发言人】 | "started from an AI draft"，不等于"AI 写完" |
| 员工写索赔函时间 | 2024 年初 | 少 20%（2024-12） | 【S3 ✅ BI 引 EvenUp 发言人】 | 公司自报 |
| Piai vs GPT-4（公司自测） | GPT-4：80% / 79% / 68% | Piai：95% / 91% / 90%（医疗费用 / 治疗识别 / 就诊日期对应） | 【S6 ✅】 | 公司自测，对比的是旧版 GPT-4，方法未公开 |
| PLAAS 早期结果 | — | 追回可得第三方保额的 95%；病历调取提前 66 天；索赔函提前 47 天；案件压桌时间最多缩短 3 个月；每案省约 1,000 美元持有成本；PLAAS 订阅已售 1,000 万美元+ | 【S21 ✅，"EvenUp says"】 | 早期、公司自报 |
| Lerner & Rowe（PLAAS） | — | 索赔函 QC 省 30 天；开案量 2 倍；和解阶段余额核对每案省 4 小时 | 【S30 ✅】 | 客户案例，公司发布 |
| 平台累计 | — | 结案 20 万+ 件，赔偿 100 亿美元+ | 【Claude原文 S0】【S18 ✅】 | 公司成立以来的累计数，**不能归因于 Claude** |
| 平台规模（时间序列） | 2023-06：300+ 客户、ARR 超 1,000 万美元【S39】；2024-10：每周 1,000+ 份文书【S12 BCV】 | 2025-10：2,000+ 律所、前 100 大 PI 所的 20%、每周 1 万案【S18】；2026-05：前 100 大的 30%、每周 1 万+ 案、涉及 140 亿美元损害【S21】 | 均 ✅ | 全部为公司口径；"文书/周"和"案件/周"不是同一单位 |
| 最大客户 | — | 年付 400 万美元以上 | 【S19 ✅ Fortune】 | 创始人口述 |
| 内部使用 | — | 200+ 员工用 Claude Enterprise | 【Claude原文 S0】 | — |
| 估值 / 融资 | 2023-06 B 轮 5,050 万美元，估值 3.25 亿美元，累计 6,500 万【S39/S9】；2024 年初估值 8,500 万美元（BI 口径）→ 2024-10 D 轮 1.35 亿美元、估值 10 亿美元+【S3/S12】 | 2025-10 E 轮 1.5 亿美元，估值 20 亿美元+，累计 3.85 亿美元【S17/S18/S19】 | 均 ✅ | **口径冲突**：BI 说"年初估值 8,500 万美元"，而 2023-06 B 轮估值已是 3.25 亿美元，BI 的"年初"数字与 B 轮估值对不上，片中不建议用"8,500 万 → 10 亿" |

---

## 6. 方法论提炼（可复用到其他行业）

1. **按"验证成本"分配模型和人力**：抽取错误便宜可查，交给小模型 + 人工抽查；论证错误又贵又隐蔽，交给强模型 + 律师终审。
   - 依据【S0】："Spend your expensive model where you can't verify cheaply."
   - 可迁移到保险理赔、医保审核、财务尽调。
2. **把"人工占比"做成客户可选的档位**：简单案件纯 AI 自助，复杂案件 AI + 专业团队复核，按案件复杂度分流【S7/S35 ✅；CEO 在 S3 的原话】。
3. **读取阶梯 / 成本分级**：能读原生文本就不做 OCR，能 OCR 就不上视觉模型；每页先分类，再"只问它能回答的问题"。【S0】
4. **事实层与写作层分离，"定一次"**：先建一份带源页引证、去过重的事实底账，再生成文书，避免前后矛盾。【S0】EvenUp 官网把这叫"Reading Layer / Writing Layer"【S34 ✅】。
5. **规则用白话写，不写成代码**：各州规则由懂业务的人直接维护。前提是模型在长文档里"第 40 条指令也听话"。【S0】
6. **别迷信长链路，用评测说话**：小样本、短文档场景里，单次强模型调用可能比多步链路更准。【S0】
7. **破冰选"最普通但最常被压价"的案子**：Batta Fulkerson 用一个普通滑倒案证明价值，比拿大案子演示更有说服力【S28 ✅】。
8. **人工签字是产品的一部分，不是遮羞布**：律师终审签字【S0】；EvenUp 公开把"AI + 人工专家双层"当作卖点【S6 ✅】。
   - Business Insider 事件说明：如果对外宣传"AI 自动化"，却不说清楚人工占比，就会被当成"靠人冒充 AI"曝光【S3 ✅】。
9. **成本是工程出来的**：逐任务记成本，一天内能定位成本突增。【S0】
10. **从一个高价值文书切入，再沿案件生命周期扩展，最后连人带 AI 一起交付**：索赔函 → 谈判 → 证据开示 → 调解书 → 诉前服务化（派案件经理进律所系统）。【S0 + S12 + S21/S30 ✅】

---

## 7. 数字严谨性 & "评论区喷子"防御

**A. Claude 原文内部口径冲突（可自查，建议片中避开或说明）**
1. **"15 小时 → 15 分钟"（标题）、"约 30 分钟、降 99%"（正文）、"约 10 分钟"（加州所）三个版本并存。**
   - 30 分钟相对 15 小时是降 96.7%，不是 99%。
   - 建议片中用"8–15 小时 → 约 30 分钟"，这是最保守、正文明示的口径。
2. **"+14%"与"+14 points"混用**，而且只适用于低于 150 页的小案件；对比对象是 EvenUp 自己的旧链路，不是人工。
3. **"和解报价 +300%"**：
   - 没有基线、样本量、时间窗；
   - 摘要区限定"拿出完整损害图景和引证的律所"，有明显选择偏差；
   - 片中应说"EvenUp 称"。
4. **"20 万件、100 亿美元"是平台成立以来的累计**，跨越 Claude 接入前后，不能说成"Claude 带来的"。
5. 律所层面的 400% 营收、10 倍首报价、六位数和解，都是单个律所 / 单案轶事，而且是自报。ELG 从 2021 年就是客户，400% 增长也不能归因于 Claude。
6. 页面没有正文日期，发布日期（2026-08-26）来自 claude.com 列表数据。

**B. 负面报道与质疑（本轮均已打开原页）**
- **Business Insider（Ben Bergman，2024-12-13）**【S3 ✅】：8 名前员工称 EvenUp 大量靠人工，被主管告知别用 AI，出现过漏伤情、"幻觉"出病症和就诊记录等错误；BI 没发现错误进入最终交付。EvenUp 的逐字回应见第 4 节反转 1。
- **转述链**：Slashdot 2024-12-13【S4 ✅】、OpenTools【S5 ✅，二手评论，不作事实依据】、Ground News 转载页【S3 附 ✅】、俄语 Habr 2024-12-17【S26 ✅】。
  - 注意：Habr 写"EvenUp 的代表否认一切"（"Представители компании EvenUp всё отрицают"），**与 BI 原文不符**。BI 里 EvenUp 承认问题"could have happened"，并说人工复核是设计。片中不要引用 Habr 的这句。
- **"72% 的索赔函内容由 AI 草稿起稿"**：出处确认是 BI 原文里 EvenUp 发言人的说法（2023-06 为 63%），不是第一轮以为的 OpenTools。原意是"从 AI 草稿开始"，不是"AI 完成 72%"。
- **人工团队规模口径不一**：2024 年博客"100+ 法律专家"【S6 ✅】，现产品页"150+ legal professionals"【S7 ✅】，属不同时间的公司口径。
- **Glassdoor 员工评论**【S23 ❌】：本轮原页被出网代理拦截，archive.org 快照也连不上。第一轮只见到两条评论标题，**本轮删除这两条标题引文**，不再使用。
- **Reddit**：WebSearch 未检索到 Reddit 上关于 EvenUp 的讨论帖，reddit.com 搜索接口返回 403，**未找到可核实的 Reddit 用户言论**。
- **"通用大模型够用了，还要垂直 AI 干嘛？"**：BI 2025-10-09《Inside the battle in legal tech to 'OpenAI-proof' its business》【S27 ✅】原句：
  > "There are whispers that junior lawyers are using Claude to draft memos and law firms are buying ChatGPT licenses."
  - EvenUp 自己的回答见反转 8（S34）和 Claude 原文分工句（S0/S1）。
- **PLAAS 是不是"给人工服务套了个 AI 壳"**：LawSites 作者 Bob Ambrogi 自己提出了这个疑问【S21 ✅】，见反转 7。
- **TechCrunch 2023 提出的伦理问题**【S9 ✅】：偏见（"One can imagine EvenUp's AI recommending artificially high or low amounts of personal injury compensation as a result of dataset imbalances"）和训练数据来源（"EvenUp hasn't disclosed where it sourced the medical and personal injury documents that it used to train its…"）。

**C. 防御话术【编剧建议】**
- 数字一律加"EvenUp 称 / 客户自报"。
- 时间对比只用"8–15 小时 → 约 30 分钟草稿"，并强调"律师仍需审阅签字"。
- 主动提 BI 报道，引用 CEO 原话"人机结合是特性不是缺陷"，把它讲成"人机边界设计"的教训，比回避更可信。
- 不用"估值 8,500 万 → 10 亿"（与 2023 年 B 轮 3.25 亿估值矛盾），改用"2023 年 3.25 亿 → 2024 年 10 亿+ → 2025 年 20 亿+"。

**D. 第一轮摘要有误，本轮已更正**
1. BI 批评报道作者是 **Ben Bergman**，不是第一轮猜测的 Melia Russell；发布日期 2024-12-13；原 URL 为 https://www.businessinsider.com/evenup-ai-errors-hallucinations-former-employees-2024-11 。
2. 错误类型的原文是 "hallucinated medical conditions"（"幻觉出的病症"）；"fabricated" 是 Slashdot 转述的用词。
3. EvenUp 回应：第一轮只有摘要"AI + 人工保证准确、AI 在改进"，本轮换成 CEO 与发言人逐字原话（见反转 1）。
4. "72%" 的出处是 BI 引 EvenUp 发言人，不是 OpenTools；原意是"72% 的索赔函内容从 AI 草稿开始"。
5. S6 博客页面日期显示 2025-02-18，与第一轮"约 2024-10-26（LinkedIn ID 推算）"不同。按 BI 原文，博客首发在 2024 年 BI 采访之后，页面日期是后来的更新日期；"报道前约 7 周"的精确推算不再使用。
6. 创始人故事：父亲是"被卷入警车追逐的汽车撞伤致残"（TechCrunch），家里只拿到同类事故平均赔偿的约 10%。**父亲不是 PI 律师**，任务线索这一条不成立；前诉讼律师是 Saam Mashhad。Rami 的前经历是 PE / VC / 创业公司（TechCrunch）和 Waymo（BVP 2025）。
7. "99% 私下和解、理赔常超一年"的出处确认为 Bessemer 2023-06-08 投资文（S11），不是 TechTO。
8. Habr 转载日期是 2024-12-17，不是 12-18。
9. BI 2025-10 那篇的页面署名显示为 "Melia Robinson"（文末联系方式为 mrussell@ / @MeliaRussell.01），发布日期 2025-10-09；所引"初级律师用 Claude 写备忘录"的句子已核对。
10. 客户引语归属不一致：Dwuan Hammond 那句"员工增长 30%、营收增长约 300%"，Legal IT Insider 写他是 "COO/CFO at Jeffcoat Injury and Car Accident Lawyers"【S20】，EvenUp 现 Express 产品页写 "CEO and President of Strategy & Finance, Global Impact Financial Solutions (GIFS)"【S7】。**片中若用，需注明头衔以哪一方为准。**
11. OFweek 中文稿把 B 轮日期写成 2023-04-06【S41】，Reuters 原稿为 2023-06-08【S39】，以 Reuters 为准。
12. 客户数口径：2025-10 "前 100 大 PI 律所中的 20%"（S18）；2026-05 "30%"（S21）。第一轮只有前者且出处不明，现两者均有出处。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下是创作建议，不是事实；每条后面标了所依据的事实来源。

- **开场钩子 A**："一个 1,000 页的伤害案卷，同一次就诊被三家医院写成三个版本。以前是一个律师助理拿着荧光笔翻 8 到 15 个小时。"（依据 S0：1,000 页、三种写法、荧光笔、8–15 小时）
- **开场钩子 B（反转先行）**："2024 年底，一家刚成为独角兽的法律 AI 公司被 8 名前员工爆料：主管让他们别用自家 AI，同事干到凌晨三点。CEO 的回答只有一句——人机结合是特性，不是缺陷。两年后，它成了 Anthropic 的标杆客户。"（依据 S3 BI 原文逐字 + S0）
- **破冰桥段**："圣迭戈一家 40 人的律所，1,500 个在办案件，只有一个人写索赔函，积压 45 天。上线头几周，团队连'什么案子该用哪一档'都搞不清。转折点是一个再普通不过的滑倒案——保险公司的首报价高到律师以为是打错了字，打电话确认，两边都笑了。"（依据 S28 原话 + S0）
- **类比**："读取阶梯"像医院分诊：普通文本走普通门诊（原生文本），看不清的拍个片（OCR），疑难杂症才请专家会诊（Claude 视觉）。（依据 S0）
- **类比**："先把事实定一次再写"像盖楼前先把地基验收签字，不能一边砌墙一边改地基。（依据 S0："settled once, before drafting starts"）
- **金句**："把最贵的模型，花在人没法便宜检查的地方。"（依据 S0，Yamangil 原话意译）
- **金句**："日期错了，一眼能看出来；论证错了，它和正确的一样漂亮。"（依据 S0）
- **金句**："读完每一页，和读对每一页，是两回事。"（依据 S34："holding the pages and getting the record right are two different achievements"）
- **反转桥段**："我们以为链条越长越稳，结果小案子里，一次调用就比整条链准 14 个百分点。"（依据 S0；注意说"百分点"，并限定"150 页以下的小案件"）
- **人物桥段**：25 年做医疗账单表的老助理，"一开始不愿交出控制权"，后来说"巨大的减压"。（依据 S0）
- **创业彩蛋**："被 YC 拒了至少三次，投资人说'法律科技烂、AI 烂、人身伤害也烂，三个负号'。"（依据 S19 Fortune 原话）
- **FDE 视角的升华**（瑞蒙特自己的观点，非 EvenUp 原话）：FDE 的核心产出不是一个智能体，而是一张"人机分工表"——哪些环节模型干、哪些环节人签字、每一步错了多久能被发现。EvenUp 走到最后，干脆把"人"也一起派进客户系统（PLAAS）。（依据 S0 模型分层 + 律师签字；S3 人机双层争议；S21/S30 PLAAS）
- **避坑提示**：
  - 片中不要说"Anthropic 派 FDE 驻场 EvenUp"，没有证据。可以说"EvenUp 有专门的上线团队去律所现场"（S33），或说 PLAAS 案件经理"在律所自己的系统里干活"（S30）。
  - 不要说"BI 报道导致 EvenUp 改产品"，只有时间先后，没有因果证据。
  - 不要引用 Habr 的"EvenUp 否认一切"。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S0 | EvenUp cuts document drafting from 15 hours to 15 minutes with Claude | https://claude.com/customers/evenup | Claude原文 | 2026-08-26（列表数据） | ✅（第一轮 WebFetch + curl，关键句逐条核对） |
| S1 | Claude for the legal industry（含 Rami Karabibar 引语） | https://claude.com/blog/claude-for-the-legal-industry | Claude官方博客 | 2026-05-12 | ✅（第一轮 curl） |
| S2 | Claude Legal Solutions（含同一引语） | https://claude.com/solutions/legal | Claude官方页 | 未标注 | ✅（第一轮 curl） |
| S3 | Business Insider（Ben Bergman）："EvenUp's valuation soared past $1 billion on the potential of its AI. The startup has relied on humans to do much of the work, former employees say." | https://www.businessinsider.com/evenup-ai-errors-hallucinations-former-employees-2024-11 （转载页：https://ground.news/article/evenups-valuation-soared-past-1-billion-on-the-potential-of-its-ai-the-startup-has-relied-on-humans-to-do-much-of-the-work-former-employees ） | 媒体（批评报道） | 2024-12-13 | ✅ 原页 HTML 含全文，逐句核对；ground.news 转载页也已打开 ✅（bestofai / biztoc 转载页不再需要） |
| S4 | Legal Tech Unicorn EvenUp Relied Heavily on Humans Despite AI Claims | https://slashdot.org/story/24/12/13/154228/legal-tech-unicorn-evenup-relied-heavily-on-humans-despite-ai-claims | 媒体转述（Slashdot） | 2024-12-13 | ✅ |
| S5 | EvenUp's AI Overpromise: Legal Tech Startup Faces Scrutiny | https://opentools.ai/news/evenups-ai-overpromise-legal-tech-startup-faces-scrutiny | 二手评论 | 2024-12（页面"Updated Dec 14"） | ✅ 已打开；二手内容，不作事实依据 |
| S6 | Leveraging AI & Human Review in Demand Letters – The EvenUp Difference（及 LinkedIn 分享帖） | https://www.evenuplaw.com/blog/leveraging-ai-human-review-in-demand-letters-the-evenup-difference/ ；https://www.linkedin.com/posts/evenup_leveraging-ai-human-review-in-demand-letters-activity-7255749100778749952-yK-z | 公司博客 | 页面显示 2025-02-18（后续有更新）；首发于 2024 年（据 S3） | ✅ 两页均已打开 |
| S7 | Expert Demands / Express Demands 产品页 | https://www.evenuplaw.com/products/demands/ ；https://www.evenuplaw.com/products/express-demands/ | 公司产品页 | 当前版本（2026-09 抓取） | ✅ |
| S8 | EvenUp Alternatives（ColabContent） | https://colabcontent.com/vs/evenup-alternatives/ | 竞品/第三方页 | 2026-09-20 更新 | ✅ |
| S9 | EvenUp wants to automate personal injury settlements — to a point（Kyle Wiggers） | https://techcrunch.com/2023/06/08/evenup-wants-to-automate-personal-injury-settlements-to-a-point/ | 媒体 | 2023-06-08 | ✅ |
| S10 | This Startup Uses AI To Save Lawyers Time—And Help Plaintiffs Get Higher Settlements | https://www.forbes.com/sites/jacobwendler/2024/08/13/this-startup-uses-ai-to-save-lawyers-time-and-help-plaintiffs-get-higher-settlements/ | 媒体 | 2024-08-13 | ❌ 无法访问（curl 403，WebFetch EGRESS_BLOCKED）；正文未引用 |
| S11 | EvenUp: Providing equal access to justice with AI；Tripling down on EvenUp to redefine justice with AI | https://www.bvp.com/news/evenup-providing-equal-access-to-justice-with-ai ；https://www.bvp.com/news/tripling-down-on-evenup-to-redefine-justice-with-ai | 投资方博客（Bessemer） | 2023-06-08；2025-10-07 | ✅ |
| S12 | What Every AI Company Can Learn From EvenUp；Leveling the Legal Playing Field Through AI: Why we continue investing in EvenUp | https://baincapitalventures.com/insight/what-every-ai-company-can-learn-from-evenup/ ；https://baincapitalventures.com/insight/leveling-the-legal-playing-field-through-ai-why-we-invested-in-evenup/ | 投资方博客（BCV） | 2025-10-08；2024-10-08 | ✅ |
| S13 | Investing in EvenUp: On a Mission to Close the Justice Gap；Our Investment in EvenUp | https://lsvp.com/stories/investing-in-evenup-on-a-mission-to-closing-the-justice-gap/ ；https://lsvp.com/stories/our-investment-in-evenup-the-ai-platform-shaping-the-future-of-legal-services/ | 投资方博客（Lightspeed） | 2024-10-08；2025-10-07 | ✅ |
| S14 | Why NFX Invested in EvenUp（Morgan Beller） | https://www.nfx.com/post/why-nfx-invested-in-evenup | 投资方博客 | 2023-06 | ✅ |
| S16 | The Word doc that became a $2B company（TechTO） | https://blog.techto.org/p/the-word-doc-that-became-a-2b-company | 第三方活动通讯 | 2026-04-07 | ✅ |
| S17 | Plaintiff Bar AI Takes Off – EvenUp Bags $150m | https://www.artificiallawyer.com/2025/10/07/plaintiff-bar-ai-takes-off-evenup-bags-150m/ | 媒体 | 2025-10-07 | ✅ |
| S18 | EvenUp, AI Platform for Personal Injury Lawyers, Raises $150M at $2B Valuation（Bob Ambrogi） | https://www.lawnext.com/2025/10/evenup-ai-platform-for-personal-injury-lawyers-raises-150m-at-2b-valuation.html | 媒体（LawSites） | 2025-10-07 | ✅ |
| S19 | Exclusive: EvenUp raises $150 million Series E at $2 billion valuation…（Allie Garfinkle） | https://fortune.com/2025/10/07/exclusive-evenup-raises-150-million-series-e-at-2-billion-valuation-as-ai-reshapes-personal-injury-law/ | 媒体 | 2025-10-07 | ✅ |
| S20 | EvenUp launches AI Drafts Suite, Smart Workflow and per case pricing model | https://legaltechnology.com/2025/05/15/evenup-launches-ai-drafts-suite-smart-workflow-and-per-case-pricing-model/ | 媒体（Legal IT Insider） | 2025-05-15 | ✅ |
| S21 | EvenUp Extends Beyond Software with Launch of 'Pre-Litigation-as-a-Service' Offering For PI Law Firms（Bob Ambrogi） | https://www.lawnext.com/2026/05/evenup-extends-beyond-software-with-launch-of-pre-litigation-as-a-service-offering-for-pi-law-firms.html | 媒体（LawSites） | 2026-05-14 | ✅ |
| S22 | EvenUp Announces First Ever Personal Injury Pioneer Awards…（BusinessWire） | https://www.businesswire.com/news/home/20250321007041/en/EvenUp-Announces-First-Ever-Personal-Injury-Pioneer-Awards-Honoring-10-Law-Firms-for-AI-Driven-Innovation | 公司新闻稿 | 2025-03-21 | ❌ 无法访问（curl 403 / WebFetch EGRESS_BLOCKED / archive.org 连接重置）；同稿全文见 S37 ✅ |
| S23 | Glassdoor 员工评论两则 | https://www.glassdoor.com/Reviews/Employee-Review-EvenUp-E6782155-RVW95267029.htm ；https://www.glassdoor.com/Reviews/Employee-Review-EvenUp-E6782155-RVW102141845.htm | 用户言论 | 未知 | ❌ 无法访问（curl 403 / WebFetch EGRESS_BLOCKED / archive.org 连接重置）；正文已删除相关引文 |
| S24 | Legal AI company EvenUp raises $50 million at $325 million valuation（StreetInsider 转载） | https://www.streetinsider.com/Reuters/Legal+AI+company+EvenUp+raises+$50+million+at+$325+million+valuation/21777266.html | 媒体 | 2023-06-08 | ❌ 无法访问（403）；同稿见 S39 ✅ |
| S26 | Стартап EvenUp обещал с помощью нейросетей анализировать медицинские карты…（Habr 转述 BI） | https://habr.com/ru/news/867432/ | 媒体转述（俄语） | 2024-12-17 | ✅（注意其"EvenUp 否认一切"与 BI 原文不符） |
| S27 | Inside the battle in legal tech to 'OpenAI-proof' its business（BI） | https://www.businessinsider.com/legal-tech-saas-openai-competition-crosby-evenup-spellbook-eve-2025-10 | 媒体 | 2025-10-09 | ✅ |
| S28 | Batta Fulkerson Law Group Achieves 75% Faster Attorney Review and Case Assignment | https://www.evenuplaw.com/customers/batta-fulkerson/ | 公司客户案例（即 Claude 原文"加州所"） | 未标注（2026-09 抓取） | ✅ |
| S29 | How ELG Injury Lawyers Went From "Firefighting" to 400% Revenue Growth with EvenUp | https://www.evenuplaw.com/customers/elg-injury-lawyers/ | 公司客户案例（即 Claude 原文"俄勒冈所"） | 未标注（2026-09 抓取） | ✅ |
| S30 | How Lerner & Rowe Injury Attorneys Saves 3 Months per Case with Pre-Litigation as a Service | https://www.evenuplaw.com/customers/lerner-and-rowe/ | 公司客户案例（PLAAS） | 未标注（2026-09 抓取） | ✅ |
| S31 | Nash & Franciskato 客户案例（上线约一小时） | https://www.evenuplaw.com/customers/nash-franciskato/ | 公司客户案例 | 未标注 | ✅ |
| S32 | J&Y Law 客户案例（ADKAR 变革管理）；另：MVP Accident Attorneys、Jose Robles Jr. Law 客户案例（"initially hesitant"） | https://www.evenuplaw.com/customers/jy-law/ ；https://www.evenuplaw.com/customers/mvp-accident-attorneys/ ；https://www.evenuplaw.com/customers/how-jose-robles-jr-law-grew-caseload-without-having-to-hire-6-employees/ | 公司客户案例 | 未标注 | ✅ |
| S33 | EvenUp 招聘：Enterprise Onboarding & Implementation Manager（Built In 转载） | https://builtin.com/job/tpm-new-products/7183885 | 招聘 | 未标注 | ✅ |
| S34 | Claude for Personal Injury: 5 Reasons It Isn't Enough on Its Own | https://www.evenuplaw.com/blog/claude-for-personal-injury-firms/ | 公司博客 | 2026-04-17 | ✅ |
| S35 | EvenUp Introduces Express Demands, the First in its Series of AI Documents | https://www.evenuplaw.com/blog/express-demands-announcement/ | 公司新闻稿/博客 | 2025-01-26 | ✅ |
| S36 | Introducing AI Drafts™, Smart Workflows, Medical Bill Summary, and Case-Based Pricing | https://www.evenuplaw.com/blog/introducing-ai-drafts-suite/ | 公司新闻稿/博客 | 新闻稿日期 2025-05-15（页面日期 2025-12-19） | ✅ |
| S37 | EvenUp Announces Inaugural Personal Injury Pioneer Awards（获奖律所名单：Omega Law Group、Sweet James、William Mattar、Avrek Law、Ponce Law、Brian White、Maxout、MVP Accident Attorneys、McCready Law 等） | https://www.evenuplaw.com/blog/inaugural-personal-injury-pioneer-awards-recap/ | 公司新闻稿 | 2025-03-21 | ✅ |
| S38 | Emre Yamangil 员工专访（human-centered AI） | https://www.evenuplaw.com/blog/emre-yamangil-human-centered-ai/ | 公司博客/招聘 | 2024-12-27 | ✅ |
| S39 | Legal AI company EvenUp raises $50 million at $325 million valuation（Reuters，Anna Tong；Yahoo Finance 转载） | https://finance.yahoo.com/news/legal-ai-company-evenup-raises-141952216.html | 媒体 | 2023-06-08 | ✅ |
| S40 | 融资1.35亿，估值超10亿美元的法律AI公司，帮1000家律所追回了15亿赔偿金（极客公园，作者吴世杰；智源社区转载） | https://hub.baai.ac.cn/view/40582 | 中文媒体 | 2024-10-27 | ✅ |
| S41 | 估值已达10亿美元，这家法律AI公司在多项任务表现上远超GPT-4（OFweek） | https://tele.ofweek.com/2024-11/ART-8320512-8460-30650925.html | 中文媒体 | 2024-11-14 | ✅（GBK 解码后核对；B 轮日期有误，见第 7 节 D-11） |

**中文检索结果**：只找到 S40、S41 两篇 2024 年 D 轮融资时的介绍稿（另有腾讯新闻同题稿 news.qq.com/rain/a/20241114A07KQC00，页面为 JS 渲染，未取得正文，未使用）。内容主要是创始故事、Piai vs GPT-4、100+ 专家团队，与英文来源一致。S40 说 Raymond 家"获得了不到 20 万美元的赔偿"，这个金额在英文原始来源中没有找到，不建议使用。**未找到 36氪、机器之心、虎嗅、雷锋网对 EvenUp 的报道，也未找到中文媒体对 BI 批评报道的跟进。**

**信息缺口 / 待办（给人工核对）**
1. Anthropic 是否参与 EvenUp 的实施、何时开始用 Claude：未找到公开信息（仅知最迟 2026-04 已在产品中使用，S34）。
2. Claude 原文里的"俄亥俄律师助理"和"全国性律所首席案件经理"：在 EvenUp 官网客户案例中未找到对应律所。
3. EvenUp 上线团队的具名人员、驻场周期、上线 SOP：只有招聘描述（S33）和客户证言（S28/S31），没有 EvenUp 自己公开的实施方法论。
4. Glassdoor / Forbes / BusinessWire 原页：出网代理拦截，未能核实（S10/S22/S23）。
5. 播客与视频逐字稿（a16z、LawNext 播客等）：本轮未检索到可打开的文字稿。
