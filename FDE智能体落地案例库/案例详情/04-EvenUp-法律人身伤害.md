# 案例：EvenUp — 用"读得省、定一次、写得稳"的文书智能体，把人身伤害律所一份案件文书从 8–15 小时压到几十分钟

> **本次研究环境限制（先读）**：本会话的出网代理只放行 claude.com / anthropic.com 等少数域名。evenuplaw.com、Business Insider、TechCrunch、Forbes、LawSites、BVP/Lightspeed/Bain 等外部站点，WebFetch 与 curl 都被代理拦截（EGRESS_BLOCKED / CONNECT 403）。另外，会话共享的 WebSearch 额度（200 次）在本案研究途中用完，**中文检索没有做成**。
> 所以：**【Claude原文】部分全部亲自打开并逐句核对过**；**【外部来源】部分都是"仅搜索结果摘要可见，未能打开原页"**。外部引文多为搜索引擎摘要里的英文转述，**不一定是原文逐字**，上片前必须人工打开原页核对。

- 行业：法律科技（Legal）——为美国原告方人身伤害（Personal Injury, PI）律所提供 AI 平台
- 企业规模 / 地区：Claude 页面标注 Startup / North America。页面称内部"200+ employees use Claude Enterprise"【Claude原文 S0】。外部摘要：2019 年成立；2025-10 完成 1.5 亿美元 E 轮，估值 20 亿美元以上，累计融资 3.85 亿美元；客户 2,000+ 家律所【外部来源 S11/S16/S17，仅搜索摘要】
- Claude 产品标签：Claude Platform、Claude Enterprise、Claude Code【Claude原文 S0】
- Claude 故事发布日期：2026-08-26（claude.com 客户故事列表数据的 date 字段；页面正文没写日期）
- Claude 原文链接：https://claude.com/customers/evenup
- 落地主体（谁是"FDE"）：**没找到任何公开信息说有 Anthropic 或第三方 FDE 驻场。**
  - Claude 原文里讲技术落地的是 EvenUp 自己的 ML 团队，发言人是首席机器学习工程师 Emre Yamangil【S0】。
  - EvenUp 本身扮演了"给律所做前置部署"的角色：据搜索摘要，它有 100+（2024 年博客口径）/ 150+（后来产品页口径）名内部法律与医疗专家做人工复核【S6、S8，仅搜索摘要】。
  - EvenUp 进律所时怎么做 onboarding、实施团队叫什么，**未找到公开信息**（招聘页也没能打开）。
- 本案例推荐指数：**4 / 5（有条件）**
  - 数字很足：原文就有 10 个以上数字，还有 3 家具名州别的律所。
  - 反转素材很强：2024-12 Business Insider 报道称"独角兽 AI 公司其实大量靠人干活"，而 EvenUp 自己一直主张"AI + 人工专家双层"；Claude 原文里还有"单次 Opus 调用打赢长链路"这类技术反转。
  - 对中国听众好迁移：保险理赔、交通事故索赔、医疗费用核算、诉讼文书都是同构场景。
  - 扣分原因：外部来源本次一个都没能打开核实；FDE 驻场过程的信息基本空白。

---

## 1. Claude 原文要点（事实 + 数字）

全部来自 S0 https://claude.com/customers/evenup ，已用 WebFetch 和 curl 打开，并逐句核对过下列英文原句。

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

**EvenUp 内部与用户反馈**
25. 内部 200+ 员工用 Claude Enterprise；团队用 Claude 做了 AI 成本预测系统，还做了"专门调试其他智能体的智能体"。
    > "Neither project would have ever been staffed on its own… Both exist now."
26. 俄亥俄一位做了 25 年医疗账单表的律师助理：
    > "At first, I was hesitant to give up control… EvenUp has been a huge stress relief."
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
| 人力瓶颈 | 加州所 1,500+ 在办案件、250 件在诉讼，只有 1 人写索赔函，积压 45 天 | 【Claude原文 S0】 |
| 质量红线 | 一处矛盾就足以让保险理赔员（adjuster）打折整份索赔；数字读错，要么少要钱，要么信誉受损 | 【Claude原文 S0】"one contradiction is enough for an adjuster to discount the entire demand." |
| 商业两难 | 接案就得吃下工时，不接就只能转出去 | 【Claude原文 S0】"take the case and eat the hours, or refer it out." |
| 行业结构 | 创始人动机：Raymond Mieszaniec 的父亲被车撞后终身残疾，一家人亲历了理赔的缓慢和不公；联合创始人 Saam Mashhad 曾是诉讼律师，看着有真实案情的 PI 当事人因文书负担放弃 | 【外部来源，仅搜索结果摘要可见，未能打开原页；摘要未标明出自哪一页，候选为 S16 techto 博客 / S11 BVP / S13 Lightspeed】摘要英文："Raymond's father was permanently disabled after being hit by a car, and the family lived through how slow and unfair the process is." |
| 市场数据 | 99% 的伤害索赔在庭外私下和解，理赔流程常超过一年 | 【外部来源，仅搜索结果摘要可见，未能打开原页，出处同上不确定】"99% of cases are settled privately, and the claims process often takes over a year to reach a resolution" |

---

## 3. 落地过程（FDE 怎么做的）

> 先说明：**没找到公开信息说有 FDE 驻场律所，或 Anthropic 团队参与实施。** 下面分两层重建：
> - A 层：EvenUp 工程团队如何把 Claude 落成产品，只用 Claude 原文，事实最硬；
> - B 层：EvenUp 如何进入律所、人机怎么分工，只有搜索摘要。

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

**时间线**：Claude 原文没有给出项目周期、上线时间、试点范围。**未找到公开信息。**

### B 层：进入律所、人机分工（【外部来源】全部仅搜索结果摘要可见，未能打开原页）

**人机双层（2024 年口径）**
- EvenUp 博客《Leveraging AI & Human Review in Demand Letters – The EvenUp Difference》【S6】的摘要称：自研模型 Piai™ 在"几十万件 PI 案件"上训练，配合 100+ 名法律专家（律师、医疗专业人员、律师助理）组成双层流程。
- 同一文的摘要转述："LLMs … often struggle with data extraction and categorization and can miss subtle but crucial details that only trained experts can catch."
- 该文在 EvenUp LinkedIn 的分享帖 ID 为 activity-7255749100778749952。按 LinkedIn ID 编码推算，发帖时间约为 **2024-10-26**，这是推算结果，页面本身未确认。

**分层产品**
- 产品页标题显示有两种形态：
  - "Demands™ | Settlement Demand Letters Crafted with AI & In-House Expertise"（AI + 内部专家）
  - "Express Demands™ | Eliminate Bottlenecks with AI Demand Letters"（偏纯 AI、快速）
  - 【S7，仅标题可见】
- 另一条搜索摘要称，"Expert-Reviewed"档是明确的人机混合：AI 起草 + 150+ 名法律专业人员，附前律师助理、律师、理赔员的审阅意见【S8，摘要疑似出自 colabcontent 页，未能打开】。

**产品化**
- 2025-05-15，Legal IT Insider 标题："EvenUp launches AI Drafts Suite, Smart Workflow and per case pricing model"【S20，仅标题可见】。
- 这显示 2025 年推出了 AI Drafts 套件，并改成按案计价。

**再向服务延伸**
- 2026-05，LawSites 标题："EvenUp Extends Beyond Software with Launch of 'Pre-Litigation-as-a-Service' Offering For PI Law Firms"【S21，仅标题可见】。

**律所端 onboarding / 驻场细节**：**未找到公开信息。**

---

## 4. 关键反转 / 转折点（最重要）

### 反转 1（外部，最强）："AI 独角兽"被曝大量靠人工 → 公司回应"人机双层本来就是设计"
- **原本的外部叙事**：EvenUp 以 AI 为卖点，2024 年 10 月估值升到 10 亿美元以上。
  - Business Insider 原标题（经 ground.news / bestofai / biztoc 转载页标题可见）："EvenUp's valuation soared past $1 billion on the potential of its AI. The startup has relied on humans to do much of the work, former employees say."【S3，仅搜索结果摘要/标题可见，未能打开原页】
- **报道揭示的问题**（Slashdot 2024-12-13 转述 BI，仅搜索摘要）：
  - 前员工说主管让他们别用 AI 系统，因为不可靠；有人手工干到凌晨 3 点。
    > 摘要转述："supervisors instructed them not to use the AI system due to its unreliability, with some working until 3 a.m. to complete tasks manually."
  - AI 错误类型：漏掉伤情、"编造"病症、就诊记录错误。
    > 摘要转述："missed injuries, fabricated medical conditions, and incorrectly recorded doctor visits."
  - 前员工也承认错误没有进入最终交付，但如果没被人工拦下，可能压低伤者的赔偿。
    > 摘要转述："While no errors made it into final products, such mistakes could have reduced victim payouts if not caught by human reviewers"
  - 估值从 8,500 万美元涨到 10 亿美元（摘要称发生在当年 10 月）。
  - 【S4 Slashdot、S5 opentools，均仅搜索摘要可见】
- **EvenUp 的回应 / 立场**：
  - 搜索摘要称 EvenUp 表示"用 AI 和人工结合来保证准确性，且 AI 在持续改进"（英文转述："EvenUp says it uses a combination of AI and humans to ensure accuracy, and its AI is improving."）。**BI 原文里发言人的逐字回应没能拿到。**
  - 报道前约 7 周（推算），EvenUp 自己的博客就公开写过"单靠 LLM 不可靠，人工专家复核是差异点"【S6】。
- **之后的调整**（时间线，外部均仅标题/摘要）：
  - 2025-05：推出 AI Drafts 套件 + 按案计价【S20】；
  - 产品分成"专家复核版"和"Express 纯 AI 版"【S7/S8】；
  - 2026-05：推出"Pre-Litigation-as-a-Service"，把"人 + AI 的服务"正式产品化【S21】；
  - 2026-08 的 Claude 原文中，人工角色写成"律师最后签字"和"PI 数据与领域专长"【S0】。
- **效果**：没有公开数据说明这次风波对客户或营收的影响。
  - 融资面：风波后约 10 个月，2025-10 完成 1.5 亿美元 E 轮，估值 20 亿美元以上【S17/S19，仅摘要】。
- **【编剧建议】** 这组素材可以讲成"钟摆"：
  - 先是"人肉 + 模板"起步（S16 标题《The Word doc that became a $2B company》暗示起点是一份 Word 文档，**内容未核实**）；
  - 然后打着 AI 旗号被媒体质疑"其实靠人"；
  - 再到公开承认"人机双层"、按"错误能否便宜验证"分配人和模型；
  - 最后干脆把"人 + AI"卖成服务。
  - 这正好对应"FDE 的价值在于设计人机边界"。**注意**：公司回应的原话缺失，片中不要替 EvenUp 编台词。

### 反转 2（Claude 原文隐含）：链路越长越准？→ 小案件单次 Opus 调用反而更准
- **原本做法**：更长的多步链路（"a longer chain"）。
- **发现**：低于 150 页的小案件，单次 Opus 调用胜出。
- **调整 → 效果**：小案件改为单次调用，既往医疗费用合计准确率 +14 个点。
  > "On smaller cases, under 150 pages, a single Opus pass beat a longer chain, lifting accuracy on past medical expense totals by 14 points."【S0】

### 反转 3（Claude 原文隐含）：全用最强模型？→ 把最贵的模型花在"便宜验证不了"的地方
- **直觉做法**：最强模型全程上。
- **现场认识**：日期错误律师翻源页就能查到；论证错误"看起来和正确的一样漂亮"，查起来很贵。
- **调整**：抽取用 Sonnet/Haiku，论证蓝图与一致性检查用 Opus；页面读取按"文本 → OCR → 视觉"逐级升级。
- **效果**：原文把"读得起""一天内追到成本突增"作为结果，没给具体降本数字。
  > "Spend your expensive model where you can't verify cheaply."【S0】

### 反转 4（Claude 原文隐含）：边读边写 → "先把事实定一次再写"
- **问题**：系统两个部分对同一事实说法不一，下游查不出来；一处矛盾就能让理赔员打折整份索赔。
- **调整**：带引证、去重，全案事实先统一定稿，再起草。
  > "the whole record is settled once, before drafting starts."【S0】

### 反转 5（用户侧）：老员工"不愿交出控制权" → "巨大的减压"
- 俄亥俄律师助理（25 年医疗账单表经验）：
  > "At first, I was hesitant to give up control, but with the way our firm is growing, I just don't have the time I used to. EvenUp has been a huge stress relief."【S0】

### 反转 6（业务边界）：只写索赔函 → 覆盖案件全生命周期
- 原文把谈判单、证据开示答复、医疗摘要、调解书都纳入了覆盖范围。
  > "The case doesn't end when the demand goes out, and neither does the opportunity to save a firm time on it."【S0】
- 外部标题显示 2026-05 进一步延伸到"诉前服务化"【S21，仅标题】。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 每案文书起草耗时 | 8–15 小时专业人工 | 标题"15 分钟"；正文"约 30 分钟，下降 99%"；摘要区写"几分钟" | 【Claude原文 S0】 | **三个口径互相不一致**：30 分钟相对 8–15 小时只降了 93.8%–96.7%，不是 99%；"15h→15min"约降 98.3%。且"之后"是系统出草稿的时间，不含律师审阅 |
| 加州所索赔函周期 | 约 1 个月（含 45 天积压） | 约 10 分钟 | 【Claude原文 S0】 | "一个月"是日历周期（含排队），"10 分钟"是生成时间，**两者不是同一口径** |
| 律师审阅速度 | — | 快 75% | 【Claude原文 S0】 | 单一律所自报，无基线细节 |
| 和解报价 | — | +300% | 【Claude原文 S0】 | 摘要区限定"presenting the full damages picture with cited evidence"，正文写"across customer firms"；**无基线、时间窗、对照组**，存在选择偏差 |
| 索赔函产量 | 律所内部产能 | 3 倍 | 【Claude原文 S0】 | 一家全国性律所案件经理的原话 |
| 证据开示答复 | 5 小时 | 30 分钟 | 【Claude原文 S0】 | 只出现在摘要区，正文无细节 |
| 既往医疗费用合计准确率 | 较长链路 | +14 个点 | 【Claude原文 S0】 | 摘要区写"14%"，正文写"14 points"，**%和百分点混用**；只适用于低于 150 页的小案件，是**两条内部流水线之间的对比**，不是和人工比 |
| 草稿完整度 | — | +16%，缺失病历更少 | 【Claude原文 S0】 | 基线未说明 |
| 首次报价（个案） | 预期值 | 高 10 倍 | 【Claude原文 S0】 | 单个早期滑倒摔伤案，属于轶事 |
| 俄勒冈所营收 | — | 一年 +400% | 【Claude原文 S0】 | 律所自报，因果混杂（扩张、接案量等） |
| 平台累计 | — | 结案 20 万+ 件，赔偿 100 亿美元+ | 【Claude原文 S0】 | 公司成立以来的累计数，**不能归因于 Claude** |
| 内部使用 | — | 200+ 员工用 Claude Enterprise | 【Claude原文 S0】 | — |
| 估值 | 8,500 万美元 → 10 亿美元+（2024-10） | 20 亿美元+（2025-10，E 轮 1.5 亿美元，累计 3.85 亿美元） | 【外部来源 S4/S17/S19，仅搜索摘要】 | 未能打开核实 |
| 客户数 | — | 2,000+ 律所，含美国前 100 大 PI 律所中的 20% | 【外部来源，仅搜索摘要，出处不确定】 | 未能打开核实 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **按"验证成本"分配模型和人力**：抽取错误便宜可查，交给小模型 + 人工抽查；论证错误又贵又隐蔽，交给强模型 + 律师终审。
   - 依据【S0】："Spend your expensive model where you can't verify cheaply."
   - 可迁移到保险理赔、医保审核、财务尽调。
2. **读取阶梯 / 成本分级**：能读原生文本就不做 OCR，能 OCR 就不上视觉模型；每页先分类，再"只问它能回答的问题"。【S0】
3. **事实层与写作层分离，"定一次"**：先建一份带源页引证、去过重的事实底账，再生成文书，避免前后矛盾。【S0】
4. **规则用白话写，不写成代码**：各州规则由懂业务的人直接维护。前提是模型在长文档里"第 40 条指令也听话"。【S0】
5. **别迷信长链路，用评测说话**：小样本、短文档场景里，单次强模型调用可能比多步链路更准。【S0】
6. **人工签字是产品的一部分，不是遮羞布**：律师终审签字【S0】；EvenUp 公开把"AI + 人工专家双层"当作卖点【S6，仅摘要】。
   - Business Insider 事件说明：如果对外宣传"AI 自动化"，却不说清楚人工占比，就会被当成"伪 AI"曝光【S3/S4，仅摘要】。
7. **成本是工程出来的**：逐任务记成本，一天内能定位成本突增。【S0】
8. **从一个高价值文书切入，再沿案件生命周期扩展**：索赔函 → 谈判 → 证据开示 → 调解书 → 诉前服务化。【S0 + S21 仅标题】

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
5. 律所层面的 400% 营收、10 倍首报价、六位数和解，都是单个律所 / 单案轶事，而且是自报。
6. 页面没有正文日期，发布日期（2026-08-26）来自 claude.com 列表数据。

**B. 负面报道与质疑（外部，均仅搜索结果摘要可见，未能打开原页）**
- **Business Insider（2024-12，作者疑为 Melia Russell，未核实）**：前员工称 EvenUp 大量靠人工，AI 不可靠，出现过"编造病症"等错误【S3/S4/S5】。俄语科技媒体 Habr 于 2024-12-18 转载报道（经 GitHub 上一个新闻聚合仓库的快照片段可见）【S26】。
- **EvenUp 的回应**：只有摘要转述"AI + 人工结合保证准确性、AI 在改进"，**逐字回应待人工在 BI 原文核对**。
- **"72% 的索赔函内容由 AI 草稿生成"**：搜索摘要（疑出自 opentools）称这是 EvenUp 自己的说法，而前员工说人工修改频繁得多【S5】。**来源与原始出处都未核实，慎用。**
- **人工团队规模口径不一**：2024 年博客摘要写"100+ 法律专家"【S6】，后来的摘要写"150+ 法律专业人员"【S8】，可能是时间不同或口径不同。
- **Glassdoor 员工评论（用户言论）**：搜索结果里有两条评论标题，"A fundamentally toxic and unserious AI company. Stay away." 和 "An absolute mess of a company – A sign of the times in the AI era"【S23，仅标题可见】。这是个人言论，只能当"评论区质疑"素材。
- **"通用大模型够用了，还要垂直 AI 干嘛？"**：Business Insider 2025-10 有一篇讨论 legal tech SaaS 面对 OpenAI 竞争的文章，URL 含 crosby / evenup / spellbook / eve，文中提到"有传言说初级律师在用 Claude 起草备忘录"【S27，仅经 GitHub 仓库快照片段可见，未能打开原页】。
  - 这正是评论区会问的问题。Claude 原文的回答是"Claude 做读和推理，EvenUp 加 PI 数据、领域专长和工作流"【S0/S1】。

**C. 防御话术【编剧建议】**
- 数字一律加"EvenUp 称 / 客户自报"。
- 时间对比只用"8–15 小时 → 约 30 分钟草稿"，并强调"律师仍需审阅签字"。
- 主动提 BI 报道，把它讲成"人机边界设计"的教训，比回避更可信。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下是创作建议，不是事实；每条后面标了所依据的事实来源。

- **开场钩子 A**："一个 1,000 页的伤害案卷，同一次就诊被三家医院写成三个版本。以前是一个律师助理拿着荧光笔翻 8 到 15 个小时。"（依据 S0：1,000 页、三种写法、荧光笔、8–15 小时）
- **开场钩子 B（反转先行）**："2024 年底，一家刚成为独角兽的法律 AI 公司被媒体曝出：员工被告知别用自家 AI，手工干到凌晨三点。两年后，它成了 Anthropic 的标杆客户。它做对了什么？"（依据 S3/S4 仅摘要 + S0；**上片前务必人工核对 BI 原文**）
- **类比**："读取阶梯"像医院分诊：普通文本走普通门诊（原生文本），看不清的拍个片（OCR），疑难杂症才请专家会诊（Claude 视觉）。（依据 S0）
- **类比**："先把事实定一次再写"像盖楼前先把地基验收签字，不能一边砌墙一边改地基。（依据 S0："settled once, before drafting starts"）
- **金句**："把最贵的模型，花在人没法便宜检查的地方。"（依据 S0，Yamangil 原话意译）
- **金句**："日期错了，一眼能看出来；论证错了，它和正确的一样漂亮。"（依据 S0）
- **反转桥段**："我们以为链条越长越稳，结果小案子里，一次调用就比整条链准 14 个百分点。"（依据 S0；注意说"百分点"，并限定"150 页以下的小案件"）
- **人物桥段**：25 年做医疗账单表的老助理，"一开始不愿交出控制权"，后来说"巨大的减压"。（依据 S0）
- **FDE 视角的升华**（瑞蒙特自己的观点，非 EvenUp 原话）：FDE 的核心产出不是一个智能体，而是一张"人机分工表"——哪些环节模型干、哪些环节人签字、每一步错了多久能被发现。（依据 S0 模型分层 + 律师签字；S3/S6 人机双层争议）
- **避坑提示**：片中不要说"EvenUp 用 FDE 驻场"，因为没有证据；也不要替 EvenUp 编它对 BI 报道的回应原话。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S0 | EvenUp cuts document drafting from 15 hours to 15 minutes with Claude | https://claude.com/customers/evenup | Claude原文 | 2026-08-26（列表数据） | **是**（WebFetch + curl，关键句逐条核对） |
| S1 | Claude for the legal industry（含 Rami Karabibar 引语） | https://claude.com/blog/claude-for-the-legal-industry | Claude官方博客 | 2026-05-12 | **是**（curl） |
| S2 | Claude Legal Solutions（含同一引语） | https://claude.com/solutions/legal | Claude官方页 | 未标注 | **是**（curl） |
| S3 | Business Insider："EvenUp's valuation soared past $1 billion on the potential of its AI. The startup has relied on humans to do much of the work, former employees say."（BI 原 URL 未取得；以下为转载页） | https://ground.news/article/evenups-valuation-soared-past-1-billion-on-the-potential-of-its-ai-the-startup-has-relied-on-humans-to-do-much-of-the-work-former-employees ；https://bestofai.com/article/evenups-valuation-soared-past-1-billion-on-the-potential-of-its-ai-the-startup-has-relied-on-humans-to-do-much-of-the-work-former-employees-say ；https://biztoc.com/x/6197107405acac36 | 媒体（批评报道） | 约 2024-12 | 否，仅搜索结果摘要/标题可见（代理拦截） |
| S4 | Legal Tech Unicorn EvenUp Relied Heavily on Humans Despite AI Claims | https://slashdot.org/story/24/12/13/154228/legal-tech-unicorn-evenup-relied-heavily-on-humans-despite-ai-claims | 媒体转述（Slashdot） | 2024-12-13 | 否，仅搜索结果摘要可见 |
| S5 | EvenUp's AI Overpromise: Legal Tech Startup Faces Scrutiny | https://opentools.ai/news/evenups-ai-overpromise-legal-tech-startup-faces-scrutiny | 媒体转述 | 未知 | 否，仅搜索结果摘要可见 |
| S6 | Leveraging AI & Human Review in Demand Letters – The EvenUp Difference（及 LinkedIn 分享帖） | https://www.evenuplaw.com/blog/leveraging-ai-human-review-in-demand-letters-the-evenup-difference/ ；https://www.linkedin.com/posts/evenup_leveraging-ai-human-review-in-demand-letters-activity-7255749100778749952-yK-z | 公司博客 | 约 2024-10-26（由 LinkedIn ID 推算） | 否，仅搜索结果摘要可见 |
| S7 | Demands™ / Express Demands™ 产品页 | https://www.evenuplaw.com/products/demands/ ；https://www.evenuplaw.com/products/express-demands/ | 公司产品页 | 未知 | 否，仅标题可见 |
| S8 | EvenUp Alternatives: What a Demand Package Costs When Part of It Is People（"Expert-Reviewed 档 150+ 法律专业人员"的疑似出处） | https://colabcontent.com/vs/evenup-alternatives/ | 竞品/第三方页 | 未知 | 否，仅搜索结果摘要可见 |
| S9 | EvenUp wants to automate personal injury settlements, to a point（URL slug） | https://techcrunch.com/2023/06/08/evenup-wants-to-automate-personal-injury-settlements-to-a-point | 媒体 | 2023-06-08 | 否，仅 URL/标题可见 |
| S10 | This Startup Uses AI To Save Lawyers Time—And Help Plaintiffs Get Higher Settlements | https://www.forbes.com/sites/jacobwendler/2024/08/13/this-startup-uses-ai-to-save-lawyers-time-and-help-plaintiffs-get-higher-settlements/ | 媒体 | 2024-08-13 | 否，仅标题可见 |
| S11 | EvenUp: Providing equal access to justice with AI；Tripling down on EvenUp to redefine justice with AI | https://www.bvp.com/news/evenup-providing-equal-access-to-justice-with-ai ；https://www.bvp.com/news/tripling-down-on-evenup-to-redefine-justice-with-ai | 投资方博客（Bessemer） | 未知 | 否，仅搜索结果摘要可见 |
| S12 | What Every AI Company Can Learn From EvenUp；Leveling the legal playing field through AI: why we invested in EvenUp | https://baincapitalventures.com/insight/what-every-ai-company-can-learn-from-evenup/ ；https://baincapitalventures.com/insight/leveling-the-legal-playing-field-through-ai-why-we-invested-in-evenup/ | 投资方博客（BCV） | 未知 | 否，仅标题可见 |
| S13 | Investing in EvenUp…；Our Investment in EvenUp… | https://lsvp.com/stories/investing-in-evenup-on-a-mission-to-closing-the-justice-gap/ ；https://lsvp.com/stories/our-investment-in-evenup-the-ai-platform-shaping-the-future-of-legal-services/ | 投资方博客（Lightspeed） | 未知 | 否，仅标题可见 |
| S14 | Why NFX Invested in EvenUp | https://www.nfx.com/post/why-nfx-invested-in-evenup | 投资方博客 | 未知 | 否，仅标题可见 |
| S16 | The Word doc that became a $2B company | https://blog.techto.org/p/the-word-doc-that-became-a-2b-company | 第三方博客 | 未知 | 否，仅搜索结果摘要可见（创始人故事疑出于此，未确认） |
| S17 | Plaintiff Bar AI Takes Off – EvenUp Bags $150m | https://www.artificiallawyer.com/2025/10/07/plaintiff-bar-ai-takes-off-evenup-bags-150m/ | 媒体 | 2025-10-07 | 否，仅搜索结果摘要可见（E 轮、Bessemer 领投、RELX 旗下 REV 参投、累计 3.85 亿美元） |
| S18 | EvenUp, AI Platform for Personal Injury Lawyers, Raises $150M at $2B Valuation | https://www.lawnext.com/2025/10/evenup-ai-platform-for-personal-injury-lawyers-raises-150m-at-2b-valuation.html | 媒体（LawSites） | 2025-10 | 否，仅标题可见 |
| S19 | Exclusive: EvenUp raises $150 million Series E at $2 billion valuation… | https://fortune.com/2025/10/07/exclusive-evenup-raises-150-million-series-e-at-2-billion-valuation-as-ai-reshapes-personal-injury-law/ | 媒体 | 2025-10-07 | 否，仅标题可见 |
| S20 | EvenUp launches AI Drafts Suite, Smart Workflow and per case pricing model | https://legaltechnology.com/2025/05/15/evenup-launches-ai-drafts-suite-smart-workflow-and-per-case-pricing-model/ | 媒体（Legal IT Insider） | 2025-05-15 | 否，仅标题可见 |
| S21 | EvenUp Extends Beyond Software with Launch of 'Pre-Litigation-as-a-Service' Offering For PI Law Firms | https://www.lawnext.com/2026/05/evenup-extends-beyond-software-with-launch-of-pre-litigation-as-a-service-offering-for-pi-law-firms.html | 媒体（LawSites） | 2026-05 | 否，仅标题可见 |
| S22 | EvenUp Announces First Ever Personal Injury Pioneer Awards Honoring 10 Law Firms… | https://www.businesswire.com/news/home/20250321007041/en/EvenUp-Announces-First-Ever-Personal-Injury-Pioneer-Awards-Honoring-10-Law-Firms-for-AI-Driven-Innovation | 公司新闻稿（可能有具名客户律所） | 2025-03-21 | 否，仅标题可见 |
| S23 | Glassdoor 员工评论两则 | https://www.glassdoor.com/Reviews/Employee-Review-EvenUp-E6782155-RVW95267029.htm ；https://www.glassdoor.com/Reviews/Employee-Review-EvenUp-E6782155-RVW102141845.htm | 用户言论 | 未知 | 否，仅标题可见 |
| S24 | Legal AI company EvenUp raises $50 million at $325 million valuation（Reuters 转载） | https://www.streetinsider.com/Reuters/Legal+AI+company+EvenUp+raises+$50+million+at+$325+million+valuation/21777266.html | 媒体 | 未知 | 否，仅标题可见 |
| S26 | Стартап EvenUp: Неисполненные обещания нейросетей（Habr 转述 BI） | https://habr.com/ru/news/867432/ （片段经 GitHub 仓库 Vadimber2/xpertnetz_framer 的新闻快照可见） | 媒体转述（俄语） | 2024-12-18 | 否，仅 GitHub 快照片段可见 |
| S27 | Business Insider：legal tech SaaS vs OpenAI competition（Crosby / EvenUp / Spellbook / Eve） | https://www.businessinsider.com/legal-tech-saas-openai-competition-crosby-evenup-spellbook-eve-2025-10 （片段经 GitHub 仓库 VittorioC13/tmtbot 快照可见） | 媒体 | 2025-10 | 否，仅 GitHub 快照片段可见 |

**信息缺口 / 待办（给人工核对）**
1. Business Insider 2024-12 原文的 URL、作者、EvenUp 发言人逐字回应、员工具体引语：必须人工打开核对。
2. EvenUp 进律所的实施方式（onboarding、客户成功、是否有驻场或前置部署岗位）：本次未找到，招聘页也打不开。
3. 创始人故事（Raymond 父亲车祸致残、Rami 的前雇主、Saam 的律师背景）：仅搜索摘要可见，出处不确定。
   - 任务线索里的 "Rayfe Gaspar-Asaoka" 在检索到的资料中**没有**以联合创始人身份出现；检索摘要列出的联合创始人是 Rami Karabibar（CEO）、Raymond Mieszaniec（COO）、Saam Mashhad（CPO，前诉讼律师）。**待核实。**
4. 具名客户律所：Claude 原文只给了州别（加州、俄亥俄、俄勒冈）和"全国性律所"；S22 获奖的 10 家律所名单未能打开。
5. a16z / BCV / Lightspeed 播客与采访逐字稿：未能访问。
6. 中文检索：因搜索额度耗尽未执行。
