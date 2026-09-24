# 案例：Duvo × Rohlik Group — 用"跨系统操作的 AI 智能体"把没人干的采购/供应链长尾工作干起来，三个月年化节省 €2.8M+

- **行业**：零售 / 生鲜电商的采购、供应链、品类管理（Duvo 本身是软件公司，客户是零售和 CPG 企业）
- **企业规模 / 地区**：
  - Duvo：初创公司。工程团队在布拉格（捷克）[S3]，注册主体在美国（种子轮博客："The company is based in the United States" [S15]；官网页脚为 taskcrew Inc.（美国特拉华）和 Duvo Ltd（英国）[S27]）。2025-12-02 宣布 1500 万美元种子轮 [S15]，此前还有 150 万美元 pre-seed [S41]。官网"关于我们"页现写 "~50 people across Europe & the US"、"$16M raised" [S35]
  - Rohlik Group：生鲜电商，覆盖 5 个市场（捷克、德国、奥地利、匈牙利、罗马尼亚 [S29]），营收口径不一：Claude 原文写"超过 15 亿欧元"[S1]，其他口径见第 7 节第 6 条
- **Claude 产品标签**：Claude Platform（故事标题标注为 "Case study | Claude Agent SDK"），还用到 MCP、computer use、Zero Data Retention [S1]
- **Claude 故事发布日期**：2026-04-03（取自 claude.com/customers 页面数据中的 `date` 字段）[S1b]。Duvo 自己博客的同题文章发布于 2026-04-07 [S30]
- **Claude 原文链接**：https://claude.com/customers/duvo
- **落地主体（谁是"FDE"）**：由供应商 Duvo 自己的团队落地，不是 Rohlik 内部 IT，也不是咨询合作伙伴。证据链如下：
  1. Duvo 三位联合创始人 Tomáš Čupr（CEO）、Marek Paris（CPTO）、Martin Pecha（COO）都来自 Rohlik [S15][S41]。Paris 在 Rohlik 时就是 AI 自动化负责人："My co-founder, Marek Paris, came from Rossum, the AI document automation pioneer. He led AI Automation at Rohlik." [S16] ✅
  2. **Čupr 兼任 Rohlik Group CEO，已由一手来源确认**。他本人的 Substack："Alongside my role as Founder & CEO of Rohlik, I've co-founded duvo.ai." [S17] ✅；Lupa.cz："Čupr zůstává zároveň v roli zakladatele a CEO Rohlik Group."（Čupr 同时继续担任 Rohlik Group 创始人兼 CEO。）[S15] ✅；Omni Talk 播客里他自己说 "I'm still a group CEO" [S6] ✅。所以这是一个"关联方客户"案例。
  3. Duvo 在 Rohlik 的第一批部署走的是正式企业采购流程："Duvo's first deployments went into production at Rohlik through full enterprise procurement." [S16] ✅
  4. Duvo 在招 **Forward Deployed Engineer**，官网职位描述写明以驻场/混合方式派驻客户处："You will be deployed directly with our clients, mostly in onsite/hybrid mode of work, you will travel a lot." [S14] ✅。Čupr 还写道，Duvo 除了派工程师，也派咨询顾问驻场："So we forward-deploy consultants, not just engineers. Ex-MBB or Big-4." [S16] ✅
  5. **仍没有公开信息**写明 Rohlik 项目具体由哪位工程师驻场、待了多久。
- **本案例推荐指数：4 / 5**（第一轮为 3.5，本轮上调，理由如下）
  - 数字充分度：5 分。Duvo 官网有十几篇 Rohlik 单流程案例，每篇都有前后对比和"证据状态"说明 [S27–S29][S38]。
  - 过程/反转素材：4 分（第一轮 3 分）。本轮新找到创始人一手说法：①"我们的第一个 agent 是盯大宗商品价格"[S32]；②"我以为我懂公司每个流程，后来发现连我手下的人都不懂"[S6]；③"有些 agent 做到一半卡住，有些 demo 很漂亮但碰到真实权限和例外就不行，Duvo 就是从这些错误里长出来的"[S31]；④从"业务人员自己描述需求、无需改流程"转向"先测绘、再重设计、派顾问驻场"[S17→S16]。仍缺驻场人名和驻场时长。
  - 对中国听众的可迁移性：4 分。采购年度谈判、大宗原料调价、供应商催确认、促销配置，这些国内商超和生鲜电商都有。
  - 主要扣分项：**Rohlik 是 Duvo CEO 自己执掌的公司**，外界容易质疑"自己人给自己背书"（见第 7 节）。

> **核实状态说明（第二轮，2026-09-24）**：本轮网络已放开，第 9 节来源逐条重新打开原页核对。
> - 来源清单共 **44 条**（S1–S42，另有 S1b、S14b、S38b；S19 空号；S42 是中文检索记录）。其中 **✅ 已打开原页核对 38 条**（S1b、S2–S4、S24、S25 沿用第一轮核对结果，本轮没有重新打开；其余 ✅ 均为本轮打开原站核对）；**❌ 无法访问 2 个**：S18 Oton Technology 原文 404，Wayback 无快照（但同一句话已在原始出处 Modern Retail [S33] 核实到）；S21 LinkedIn 返回 HTTP 999 登录墙（相关事实已改用 S17、S15、S6 一手来源支撑）。
> - **降级 3 个**：S22（第三方研究笔记）、S23（第三方仿站）、S14b（第三方职位聚合表）。它们原本转述的 duvo.ai 内容，本轮已在 duvo.ai 原页直接核对，正文不再引用这三个镜像；仿站中与原页冲突的说法（如 "surfaced"）已按原页更正。
> - 第一轮的 🟡（GitHub 镜像）和 ⚪（仅搜索摘要）标注已全部清除：要么升为 ✅ 并换成原站链接，要么标 ❌。
> - Omni Talk 两期节目页（S6、S7）带有**自动生成的逐字稿**（人名、公司名会被听错，比如 "Duo"、"Rohli"），本文引用的是逐字稿原句，已做过人工比对。
> - **中文检索**：用 WebSearch 查了 36氪、机器之心、虎嗅、雷锋网、网易、知乎等站点，**未找到 Duvo 或 Duvo × Rohlik 的中文报道**。

---

## 1. Claude 原文要点（事实 + 数字）

以下全部为【Claude原文】[S1]，本轮再次用 curl 打开 https://claude.com/customers/duvo 核实。

1. **Duvo 做什么**：用 AI 智能体替零售和 CPG 企业跑采购、供应链、品类管理流程，覆盖 ERP、供应商门户、表格、邮件，甚至电话。
   > "Duvo builds AI agents that run procurement, supply chain, and category management processes for multi-billion-euro retail and CPG companies. The agents work across every system involved: ERPs, supplier portals, spreadsheets, email, even phone calls."
2. **技术栈**：全部构建在 Claude 上，用 Agent SDK 编排，每次 API 调用都在 Zero Data Retention（零数据留存）模式下运行。默认模型是 Sonnet 4.6，浏览器操作类 agent 常用 Opus 4.6。
   > "Duvo is built entirely on Claude, using the Agent SDK to orchestrate across workflows, with every API call running under Anthropic's Zero Data Retention mode."
   > "The product defaults to Sonnet 4.6, with browser-use agents often using Opus 4.6."
3. **核心数字（页首汇总）**：
   > "€2.8M+ in annualized savings within three months for its customer Rohlik Group, across processes that had never been systematically run"
   > "Annual supplier negotiations shortened by one month at Rohlik Group, with approximately 80% automated from preparation through contract generation to ERP write-back"
   > "40%+ of team capacity freed up on average across enterprise procurement, supply chain, and retail operations by reducing manual work"
   > "Eight weeks on average from first conversation to production deployment with measured savings"
   > "Production deployment within days of adopting the Claude Agent SDK"
4. **"被放弃的工作"（abandoned work）**：团队只顾得上前 20 大供应商和最急的事，长尾的几百个小动作加起来值几百万，却从来没人碰。
   > "These teams cover the top 20 suppliers and the most urgent issues. But the long tail, hundreds of smaller actions worth millions in aggregate, never get touched."
5. **旗舰流程：大宗商品挂钩 SKU 的价格监控和供应商谈判**：Rohlik 在 5 个市场跟踪几千个与大宗商品挂钩的 SKU。以前最多一个季度查一次，经常干脆不查。现在持续监控、自动组织谈判材料、主动联系供应商。第一周就产生 €1.45M 年化节省（120+ 个 SKU、15+ 家供应商）。
   > "Before Duvo, this happened quarterly at best, often not at all. Duvo now monitors continuously, builds negotiation cases, and initiates supplier outreach. The result: €1.45M in annualized savings in the first week, from continuous price monitoring and automated supplier outreach across 120+ SKUs and 15+ suppliers."
   > "Not from a process that was slow, but from one the company had never been able to run."
6. **客户方原话（Rohlik CRO Olin Novák）**：
   > "That was one process," said Olin Novák, CRO at Rohlik Group. "We're now running dozens." Across three months, that number grew to €2.8M+ in annualized savings.
7. **Rohlik 其他流程的结果**：
   > "promotional setup dropped 65-70%, supplier onboarding chasing fell 50-70%, and supply chain planning moved product availability from 78% to 93% in two weeks."
   > "Inbound delivery confirmations jumped from 52% to 90%, covering every supplier daily."
8. **单 agent 贯穿全程**：一次运行可以登录供应商门户、提取 50 张采购订单的交付状态、和 SAP 核对、找出差异、查合同条款、决定升级还是自动纠正、发跟进邮件、记录结果，全部在一个会话里完成。
9. **人机协作机制**：高风险动作需要人工审批；人的决定会被保存下来，供以后的运行复用。
   > "High-risk actions require human approval. When a human responds, the agent persists that decision for future runs. Over time, the system accumulates the operational judgment that used to exist only in people's heads."
10. **账户内扩展**：
   > "Automated ordering surfaces supplier lead-time issues that the returns team can act on. Cost monitoring reveals pricing discrepancies that ordering can prevent upstream."
11. **下一步**：继续深耕零售和 CPG，之后进入制造和物流。

---

## 2. 背景与痛点（结构化）

| 痛点 | 具体表现 | 来源 |
|---|---|---|
| 流程只存在于人的脑子里 | "The real process lives in people's heads: which supplier needs chasing, which portal field actually matters, which exception to escalate and which to just fix." —— Marek Paris | 【Claude原文】S1 |
| 跨系统搬运 | 采购员在 SAP、供应商门户、邮件之间下单；品类经理在自建表格里跟踪大宗商品价格；采购协调员在系统之间复制状态、追确认 | 【Claude原文】S1 |
| 只顾得上头部 | 只盯前 20 大供应商，长尾"几百个小动作、合计值几百万"从来没人碰 | 【Claude原文】S1 |
| 传统自动化卡住了 | "no clean APIs, the IT backlog is years long, and every exception requires judgment" | 【Claude原文】S1 |
| 调价监控基本缺位 | 几千个与大宗商品挂钩的 SKU，"quarterly at best, often not at all"。Duvo 官网案例补充：乳制品、咖啡、可可、油脂等品类；"Ten category managers spent days pulling data from separate sources before they could see where prices had moved and start supplier negotiations."（10 位品类经理要先花好几天从不同来源拉数据，才看得出哪里价格变了、才能开始谈。） | 【Claude原文】S1；【外部来源 S28】✅ |
| 供应商涨价函多到看不过来 | Duvo 官方 Shoptalk 活动回顾里 Čupr 的说法："At Rohlik's scale, thousands of price proposal files arrive every month. No buying team on earth researches every SKU in every one of them, so the negotiation becomes a shortcut: the supplier asks for seven percent, the buyer counters with five, everyone moves on." | 【外部来源 S34】✅ |
| 年度谈判决定全年毛利，却被人工拖慢 | "The annual negotiation determines the year's margin, but rebates and volume incentives were buried across thousands of email threads."（年度谈判决定全年毛利，但返利和量级激励条款埋在成千上万封邮件里。）G2 上的案例 PDF 补充：年度谈判覆盖 "3,900 suppliers" | 【外部来源 S10】✅；【S11】✅ |
| 缺货预警人手不够 | "Planners (Rohlik calls them disponents) could manually triage roughly 8 products per day per market, business hours only."（计划员每个市场每天只能人工处理约 8 个商品，而且只在工作时间。） | 【外部来源 S29】✅ |
| 员工充当"人肉 API" | Omni Talk 节目简介："Why retail employees spend too much time acting as "human APIs" between disconnected systems"；Čupr 在节目里说："at least half of the time super smart people spend time on is this is being human API between systems that don't talk to each other." | 【外部来源 S7】✅ |
| 管理层并不真正了解自己的流程 | Omni Talk 时间轴 "The reality that most leaders don't actually know their own processes"；逐字稿原话见第 4 节反转 4 | 【外部来源 S6】✅ |
| 创始人的亲身经历 | Čupr 的 Substack："For years at Rohlik I've watched brilliant people spend most of their week not on negotiations, ideas or customer experience, but on: Moving data between internal systems, spreadsheets, emails and supplier portals"；"We hire people for judgment and relationships — and then we bury them in copy-paste." | 【外部来源 S17】✅ |
| Rohlik 自己的 IT 也排不过来 | Čupr："At Rohlik, every serious automation idea ran into the same constraints: scarce engineering capacity and long integration roadmaps."；播客里说自己作为 CEO 去推自动化，"I was looking at 6, 12, 18 months projects" | 【外部来源 S17】✅；【S6】✅ |
| Duvo 本身就源于 Rohlik 的经验 | Lupa.cz："Duvo staví AI agenty, kteří dokážou vykonávat práci přímo ve firemních systémech, a vzniklo na základě zkušeností v Rohlíku."（Duvo 构建能直接在企业系统里干活的 AI 智能体，它是基于在 Rohlík 的经验而创立的。） | 【外部来源 S8】✅ |

---

## 3. 落地过程（FDE 怎么做的）

> 说明：Claude 原文和外部来源都**没有**逐周描述 Rohlik 项目的驻场过程。下面按"公开信息能支撑到的程度"来还原，每一步都标了来源；拼不出来的地方明确写"未找到公开信息"。

**第 0 步：谁来落地，以及为什么他们懂业务**
- Duvo 三位联合创始人都来自 Rohlik。CzechCrunch："Startup Duvo.ai, který založil spolu s bývalými top manažery Rohlíku Markem Parisem a Martinem Pechou…"（Čupr 和 Rohlik 前高管 Marek Paris、Martin Pecha 一起创办了 Duvo.ai）；"Paris před příchodem do Rohlíku, kde se věnoval AI automatizaci, působil přes tři roky v jiném českém startupu Rossum"（Paris 加入 Rohlik 负责 AI 自动化之前，在捷克另一家创业公司 Rossum 干了三年多）。【外部来源 S41】✅
- Čupr 明确把 Rohlik 当作试验场："Rohlik is my life's work - and at the same time, it's the perfect proving ground to battle-test Duvo in one of the toughest environments: time-critical, low-margin, high-complexity grocery operations." 【S17】✅ CzechCrunch 也写他 "nový projekt intenzivně testuje i v rámci Rohlik Group"（在 Rohlik Group 内部密集测试这个新项目）。【S41】✅
- 为什么不直接在 Rohlik 内部做，而要单独开一家公司？Čupr 在 CzechCrunch 播客里说："Rohlík vyrostl do takových rozměrů, že už s ním nejde jen tak třást… Rohlík je firma, která má tisíce lidí a logicky ne každý je v ní technologický nadšenec"（Rohlik 已经大到不能随便折腾，几千名员工里不是每个人都是技术爱好者）。【S9】✅
- 采购方式：第一批部署走的是 Rohlik 的正式企业采购流程（"through full enterprise procurement"）。【S16】✅
- 所以这个案例里的"FDE"对客户业务几乎是内部人级别的熟悉。这一点对叙事有利，但也是被质疑的焦点。

**第 1 步：第一个 agent，盯大宗商品价格（破冰场景）**
- Čupr 在德勤"零售的未来"大会上的原话（Newstream 报道）："Náš první agent sledoval ceny komodit a prováděl audit položek – za jediný týden jsme našli dva miliony eur. Druhý kontroloval zboží mířící do promočních akcí a zvedli jsme promoční marži o deset procent."（我们的第一个 agent 盯大宗商品价格、逐项审计，一周就找出了两百万欧元。第二个 agent 检查要进促销的商品，把促销毛利提高了十个点。）【外部来源 S32】✅
  - 口径提醒：这段话没有明说"在 Rohlik"，但两个流程和数字都和 Duvo 官网上的 Rohlik 案例对得上（大宗商品 €1.45M [S28]、促销毛利 17%→27% [S38]），所以判断指的是 Rohlik。"两百万"和"€1.45M"口径不同，见第 5、7 节。
- 这个流程在 Duvo 官网案例里的拆解 【S28】✅：
  1. "Duvo's commodity price monitor built a real-time view across all five markets, identifying where prices were out of line."（先建一个覆盖五个市场的实时价格视图）
  2. 自动组织谈判材料："The work that used to consume their time (gathering data, comparing across markets, building the case) was already done before the first call."
  3. 各国团队拿到同一份商品证据
  4. 品类经理当周就能开谈
  5. 持续监控
  6. "Duvo starts the negotiation, reaching out to suppliers with the data-backed case and routing to a human buyer when needed."（Duvo 带着数据主动发起谈判，需要时转给人类采购员）
  - 客户方原话（Rohlik 采购负责人，未具名）："It was data-backed information, not just gut feeling. Which made us immediately ready to act on it."
- Claude 原文："That was one process… We're now running dozens."（Rohlik CRO）【S1】
- 对供应商涨价函的处理逻辑，Čupr 在 Modern Retail 的采访里讲过："It will analyze commodity costs, manufacturing costs, labor rates, transport, packaging and the supplier's acceptable margin, and get a range of what the retailer would want to buy the SKU for. Duvo.ai will respond to the supplier on behalf of the retailer and let the supplier know whether it accepts or rejects proposals for each SKU." 【S33】✅（原文是对 Duvo 做法的一般描述，没有点名 Rohlik）
- Duvo 官网现在有独立的 "Commodity Price Monitoring" 方案页，写法是："Duvo checks the proposed price against market indices, contractual lags, and currency rules, calculates the difference across your purchase volumes, and gives procurement the evidence to challenge the change before approving the new price." 【S38b】✅（第一轮只在搜索摘要里看到的 "Commodity Price Tracker" 说法未找到出处页，改用此页）

**第 2 步：先把"真实流程"画出来，再谈自动化（创始人自己踩出来的）**
- Čupr 在 Omni Talk 里讲 Clarity 的由来（逐字稿原句）："I am a founder of a retail company, so I, I thought I knew every process… I realized that not only I do not know the real processes, but people below me do not know the real processes and people below the people also don't know that." 【S6】✅ 他接着说，自己同时是"想被自动化的公司"和"提供自动化的公司"的 CEO，两边却对不上，"because nobody knows the real process. So we built this agentic process mapping"。完整反转见第 4 节。
- Clarity 的做法（同一期逐字稿）：让带语音的 agent 去访谈一线专员，再叠加他们操作屏幕的录屏，"in less than a week, we can map hundred or hundreds of people in the organization"。【S6】✅ Duvo 官方的 Shoptalk 回顾里说法是："operators share their screen, talk through how they actually work, and within half an hour the process is mapped, exceptions, contradictions and all. Then the same context powers the automation." 【S34】✅
- Duvo 创始产品工程师 Daniel Bukac 在 Lisbon AI 2026 讲者页的自我介绍：
  > "I was the second engineer to join Duvo AI, where I led our browsing and computer-use work before taking on Duvo Clarity - a process mapping engine that helps companies understand how they actually operate before they try to automate it." 【S5】✅（本轮已在活动官网 lisbonai.org/speakers 核对）
- Duvo 自己的博客（2026-04-07）写明部署顺序："Duvo maps the real process first using Duvo Clarity, then deploys agents against the actual workflow." 【S30】✅
- 在新客户那里也是同样的顺序。Lupa.cz 报道 Duvo 拿下 Alza：
  > "V Alze se má nejdřív začít s mapováním, jak jednotlivé procesy skutečně fungují, informovala firma. Pak má nastoupit jejich přestavba s využitím AI."（据公司介绍，在 Alza 要先摸清各个流程实际怎么运转，然后再用 AI 重构这些流程。）【S8】✅
- 定价也体现了这个顺序：首个流程免费测绘。"Your first business process is free: AI interviews and screen walkthroughs produce a process map and improvement recommendations." 【S36】✅

**第 3 步：不等 IT 接口，直接操作现有界面**
- 【Claude原文 S1】"Duvo's agents operate these systems through their actual interfaces, not through APIs that may not exist." Ondrej Romancov（产品工程负责人）："Claude's computer use and MCP integrations are what made this technically possible… Before that, the heterogeneity of enterprise stacks was an unsolvable problem for automation."
- Marek Paris："Not because someone built an integration… Duvo works through the same screens the team was using." 【S1】
- Čupr 在 Shoptalk 现场采访中说明了为什么必须这样做："we always knew we have to work on top of existing systems, Right. Because once you talk about some SAP integration change of erp, no sane enterprise will touch you." 【S7】✅

**第 4 步：人机分工，高风险动作设审批闸口，人的判断沉淀下来**
- 【Claude原文 S1】高风险动作要人工审批，人的回复会被持久化，供之后的运行复用。
- Duvo 官方开源的 CLI 技能文档里写明了 agent 运行中途暂停、等人批准的机制：
  > "Some agents pause for human approval mid-run." 支持 `duvo runs respond "$run_id" --approve / --deny` 【外部来源 S4】✅（duvoai 官方 GitHub）
- 供应商情绪由人来兜底（Modern Retail 原文，第一轮引自的 Oton 转载页已 404）："There is still a human in the loop; if a supplier is angry or rejecting too many of the offers, Duvo.ai will notify the retailer and have them respond. 'You cannot expect this to be fully autonomous,' he added." 【S33】✅
- Rohlik 各流程的"控制点"在 Duvo 官网案例里都写了。例如年度谈判："Terms are checked against internal margin and payment-window rules before contract generation."【S10】✅；缺货预防："Planners only receive exceptions that require a human decision, and every action is logged back to the SKU state."【S29】✅

**第 5 步：上线速度与评测方式**
- 【Claude原文 S1】从第一次沟通到带"实测节省"的生产部署，平均 8 周；采用 Agent SDK 后，几天内就进入生产。
- Duvo 自己把 8 周说成承诺，还带退款条款："We guarantee time-to-value: eight weeks from first conversation to production deployment with measured savings. If the savings aren't there, full refund." 【S30】✅ 现行定价页换成了"5 倍 ROI 保证"："If the measured result is below five times the total contract price for the agreed scope, the whole contract is free." 【S36】✅ Čupr 在捷克大会上的说法："Pokud návratnost investice (ROI) není pětinásobná, máte to zdarma, jako u borůvek na Rohlíku"（ROI 不到五倍就免费，就像 Rohlik 卖的蓝莓一样）。【S32】✅
- 评测口径：Duvo 官网每篇案例都标了"证据状态"，分为 "Customer-approved result"（客户确认）、"Measured result"（实测）、"Measured result with modelled impact"（实测 + 模型推算影响）、"Modelled from operational data"（按运营数据推算）四档。【S27】✅ 例如促销毛利案例写明对比窗口是 "ISO weeks 9-13 of 2025 versus 2026"【S38】✅。**未找到公开信息**说明 €2.8M+ 这个汇总数用了什么基线。
- Čupr 给管理者的三条原则（Newstream）："Špatně nastavený proces převedený na agenty je pouze špatný proces vykonávaný rychleji."（把设计糟糕的流程交给 agent，只会让糟糕的流程跑得更快。）"Každý autonomní agent musí mít jasně stanovená KPI a sledovanou metriku úspěšnosti."（每个自主 agent 都必须有明确的 KPI 和被跟踪的成功指标。）【S32】✅

**第 6 步：从一个流程扩展到几十个**
- 【Claude原文 S1】"That was one process… We're now running dozens."；"Automated ordering surfaces supplier lead-time issues that the returns team can act on."
- Duvo 官网上已公开的 Rohlik 流程案例（均已打开核对）【S27】【S10】【S12】【S28】【S29】【S38】：大宗商品调价（€1.45M+）、年度谈判（缩短 1 个月）、缺货预防/入库确认（52%→90%）、发票对账（保护 €2.1M 营收、€1.4M 毛利/年）、促销管理（毛利 17%→27%）、新品上架（8 周→1 周）、临期商品决策（模型推算保护 €336K–€560K 毛利）、年返利跟踪（回收 €240K/年）、月结差异报表（100% 自动取数，月结约 -10%）、仓间调拨记账（释放 20% 财务时间）。
- 缺货预防流程的做法（和第 4 节反转 4 里"没人跟进送货"的发现正好对应）："The agent chases delivery confirmation before warehouse cut-off through the supplier channel already in use"；覆盖范围 "The loop runs 24/7 across CZ, DE, AT, HU, and RO"。【S29】✅
- 截至 2026-05，Čupr 说已有五套在生产环境运行的"打法"："Five playbooks already run in production: supplier onboarding, out-of-stock exception triage, chargeback resolution, commodity renegotiation, promo setup quality. Each one was built through a real deployment and captured in Clarity." 【S16】✅

**第 7 步：FDE 这个岗位在 Duvo 具体做什么（招聘原页）**
- 以下引自 duvo.ai 官网招聘页和 Ashby 招聘数据（英国岗位，Ashby 上发布于 2026-05-21，2026-09-24 仍在招）【S14】【S37】✅：
  > "FDEs are how Duvo brings AI to life inside our customers. You sit at the front line, map their workflows on the Duvo platform, improve the underlying processes, and turn the result into running agents that deliver tangible business impact. Scoping, build, debug, handover, expansion. You own the customer outcome end to end and you own the relationship that goes with it."
  > "You won't write the core product. You will write the glue: integration scripts, agent configurations, data transformations, prototypes, whatever it takes to get an agent running against a customer's actual systems. You'll spend real time inside their stack and inside their team."
  > "Improve the underlying processes where it matters. Don't automate broken flows, redesign them"
  > "Capture reusable patterns, templates, and runbooks so the next deployment is faster"
  > "Transformation Managers want you on their hardest accounts"
- 招聘流程里有一道 "Case study ( ~4 hours). Ship something small to production with us and see how we work together. Fully compensated"。【S14】✅
- 美国 FDE 岗位：第一轮看到的职位现已下线（fwddeploy.com 返回 410 "This job posting has expired"；Ashby 当前职位列表里已没有这个岗位）【S14】【S37】。
- 组织分工：Čupr 描述的是"转型经理 + FDE"的搭档模式："Together with our FDEs, one transformation manager does what a partner-led engagement at Big-4 does, at a fraction of the cost." 【S16】✅ Duvo 与德勤签了销售和交付合作："Deloitte signed as a sales and delivery partner." 【S16】✅
- 旁证（非官方）：GitHub 上有一位应聘者公开了自己的 "Duvo Forward Deployed Engineer exercise" 仓库。从内容看，笔试是 60 分钟录屏，任务是给一家虚构零售商搭一个补货工具服务器；他的设计原则是"业务规则和计算不交给大模型，由服务端确定性执行" 【S24】✅。这只能说明应聘者怎么理解这个岗位，**不代表 Duvo 官方做法**。

**时间线（已知部分）**
- 2024 年 11 月到 2025 年 5 月：Čupr 自述这段时间沉迷 AI、重新写代码，想用 agent 改造 Rohlik 运营，但碰上"流程太乱 + 老系统没接口"两个障碍，于是有了 Duvo 【S6】✅
- 2025 年：pre-seed 150 万美元（含 Credo Ventures）【S41】✅
- 2025-12-02：宣布 1500 万美元种子轮（Index Ventures 领投；Credo、Northzone、Puzzle 跟投），团队 15 人 【S15】【S40】【S41】✅
- 2026-01：开始对外销售（"We started selling in January"）【S16】✅
- 2026-03-30：Omni Talk 播客，Čupr 讲流程测绘和 Clarity 【S6】✅
- 2026-04-03：Claude 客户故事发布 【S1b】✅；2026-04-07 Duvo 博客同步发布 【S30】✅
- 2026-05-13：Čupr 发文 "What the hell does Duvo do?"，称营收已超 100 万美元，德勤签约 【S16】✅
- 2026-06-14（节目发布日期，Shoptalk Europe 现场录制）：现场采访，节目页头衔 "Co-Founder and CEO of duvo.ai and CEO of the Rohlik Group" 【S7】✅；Duvo 官方活动回顾 2026-06-10 【S34】✅
- 2026-06-22：Modern Retail 报道，列出客户 Holland & Barrett（英国）、Heureka（捷克）【S33】✅
- 2026-07-24：Lupa.cz 报道拿下 Alza；已知客户包括 Rohlik Group 和 Notino 【S8】✅
- 2026-09-10：Newstream 报道 Čupr 在德勤大会上的演讲 【S32】✅
- 2026-11-05 至 06（尚未举行）：Czech Retail Days 分会场，"Rohlik Group and duvo.ai: Artificial Intelligence in Category Management" 【S20】✅

---

## 4. 关键反转 / 转折点（最重要）

**反转 1：多 agent 接力 → 一个 agent 从头干到尾（【Claude原文】S1，最硬的一条）**
- 原本做法：多个 agent 分工，一个接一个传递任务。
- 遇到的问题：关键上下文在交接中丢失。
- 调整后：借助 Agent SDK，"一个工作一个 agent"，这个 agent 能用上它需要的全部工具。
- 效果：上下文贯穿整个操作。采用 SDK 后几天内就上了生产。
- 原句：
  > "Before the SDK, critical context disappeared between agent handovers," Romancov said. "Now we run one capable agent per job with access to all the tools it needs. Context stays intact across the entire operation."
  > "Production deployment within days of adopting the Claude Agent SDK"
- 归属提醒：Duvo 自己的博客 [S30] 把这句话归给了 Marek Paris（"…Paris said"），和 Claude 原文（Romancov）不一致。上屏时建议写"Duvo 团队说"，不点具体人名。Duvo 博客还补充了一个背景："We adopted the Claude Agent SDK before it was officially named, building production workflows while the SDK was still in early development." 【S30】✅

**反转 2：等 IT 做接口集成 → 让 AI 像人一样操作现有屏幕（【Claude原文】S1）**
- 原本以为：自动化需要干净的 API 和 IT 集成。
- 现场情况：没有干净的 API，IT 排期"要好几年"，每家公司技术栈都不一样。Čupr 作为 Rohlik CEO 亲自去推自动化，得到的也是"6、12、18 个月的项目"[S6] ✅。
- 调整后：通过 computer use + MCP，直接在 SAP GUI、供应商门户这些现有界面上操作。
- 效果：Claude 原文写可得率两周内从 78% 升到 93%，"不是因为有人做了集成"。
- 原句：
  > "Traditional automation stalls because there are no clean APIs, the IT backlog is years long, and every exception requires judgment."
  > "Not because someone built an integration," Paris said. "Duvo works through the same screens the team was using. It just doesn't forget, doesn't deprioritize, and doesn't stop at the top 20 suppliers."
- 外部同类案例（**客户是 Pilulka，不是 Rohlik**，本轮已在 Duvo 原页确认）：Pilulka 两周可得率 +15%，全程走界面，不做 API。供应链经理 Petr Marek 的原话最能说明"为什么走界面"："We did consider fixing the ordering process inside our internal tools, but IT simply didn't have the capacity to take it on. Duvo gave us a practical shortcut… Once we approve, Duvo executes the change directly in our internal system through the UI." 【S13】✅

**反转 3：价值不在"把慢的变快"，而在"把没人干的干起来"（【Claude原文】S1，认知反转）**
- 原本以为：AI 的价值是给现有流程提速。
- 实际发现：最大的钱藏在从来没被系统执行过的流程里。调价监控以前"最多一季度一次，经常不做"，头部 20 家供应商之外根本没人管。
- 调整后：让 agent 持续监控，自动发起沟通。
- 效果：第一周 €1.45M 年化节省，三个月 €2.8M+。
- 原句：
  > "Not from a process that was slow, but from one the company had never been able to run. 'This is the clearest example of "abandoned work" becoming real value,' Paris said."
- 创始人的补充（Omni Talk 逐字稿）：他做了 12 年零售，才知道这叫 should-cost 分析（应当成本分析）："I run a retailer for 12 years. I didn't know. It's apparently called should cost analysis. I didn't know that term." 以及："I guarantee that for 95% retailers, this should, should cost analysis is not happening… they do it maybe four or five biggest suppliers because that's their bandwidth." 【S6】✅

**反转 4：CEO 以为自己最懂流程 → 测绘发现"该有的跟进根本没人做"（【外部来源 S6】，本轮新增，创始人一手说法）**
- 原本以为：Čupr 是 Rohlik 创始人，"I thought I knew every process"。
- 现场发现：流程测绘之后，他发现不仅自己不懂，"people below me do not know the real processes"；真正懂的只有一线专员，而且每人只懂一部分。
- 最具体的例子，供应商错过送货窗口后的跟进（逐字稿原句）："there is a process that, you know, we thought was happening which is when a supplier misses the delivery Window to our fulfillment center, somebody follows up… When we did the process mapping, we actually realized nobody is following up. Basically that part of the SOP isn't happening… They were just talking about we look at the dashboards and then do reports two days later to the management how poor the supplier's otif is."
- 调整后："when we did the transformation of that process, the phone call was a part of it. But guess what? Now the duvo agent is making the phone call."
- 效果：Duvo 官网 Rohlik 缺货预防案例：入库确认率在截单前从 52% 升到 90%，覆盖 5 个市场、24/7 运行 【S29】✅。（播客没有直接说这两件事是同一个项目，关联是【编剧推断】，但流程内容一致："The agent chases delivery confirmation before warehouse cut-off"。）
- 同一段里还有促销的例子："our promo process is ironclad… But then in some other country it's not the same process. And actually when we did this exercise, we were leaving so much margin on the table just by not following the original process." 【S6】✅
- 这个发现直接催生了产品 Clarity："So we built this agentic process mapping"。

**反转 5：从"业务人员自己描述、无需改流程" → "先测绘、再重设计、派顾问和 FDE 驻场"（产品和交付模式的转向；"转向"这个判断是【编剧推断】，但两端都有一手原文）**
- 2025-12 种子轮时的说法：
  - "Business users describe what they want to achieve in natural language, and Duvo's AI agents execute it end-to-end… with no coding required."；"Commercial, supply chain and finance teams can create and improve assistants themselves, without waiting for large IT projects or specialist engineering support." 【S15】✅
  - Čupr 的 Substack："That means teams can start in weeks, without big integration projects or workflow redesign." 【S17】✅
  - TechFundingNews 标题："Rohlik founder's Duvo nabs $15M from Index Ventures for no-code retail AI" 【S15】✅
- 2026 年的说法：
  - "Duvo maps how operations actually run, identifies the work that should run, redesigns the process, and then runs the improved version with AI agents."；"The documented process is usually fiction." 【S16】✅
  - "The default AI playbook now is forward-deployed engineers… But operational transformation is not only an engineering problem. So we forward-deploy consultants, not just engineers. Ex-MBB or Big-4." 【S16】✅
  - FDE 招聘页："Don't automate broken flows, redesign them" 【S14】✅
  - 公司"关于我们"页："We hire operators, builders, and forward-deployed teams who want to solve live operational problems with customers." 【S35】✅
- 【编剧建议】可以讲成"一开始卖的是'业务人员自己搭 agent'的工具，后来发现得先派人把流程摸清、改对，再交给 agent 跑"。原文里 Čupr 没有用 "pivot" 这个词，上屏请用"后来他们越来越强调"这类措辞。

**反转 6：Rohlik 内部 agent 的"昂贵错误" → 才有了 Duvo（【外部来源 S31】，本轮新增）**
- Čupr 在 2026-08 的文章里回顾 Rohlik 的 AI 历程，把 Duvo 说成从错误里长出来的：
  > "The mistakes became more expensive. Some agents stalled halfway through a process. Some produced a good answer when the business needed completed work. Others looked great in a demo and struggled with real permissions, exceptions and handovers."
  > "Duvo.ai came out of those mistakes. It gave us an operating layer for agents that cross systems, preserve state, handle exceptions and verify the result… It also wasn't a smooth journey"
  > "Every failure created useful data: where the process broke, when a human stepped in and what the next version needed to learn."
- 【编剧建议】这是本案例最好用的"踩坑"素材：卡在半路、只给答案不干活、demo 好看上线就挂。三种失败，国内做过 agent 项目的人都会有共鸣。但原文**没有**说这些失败具体发生在哪个流程。

**反转 7：人批准一次，系统就记住一次（【Claude原文】S1，人机协作设计）**
- 原本：例外处理全靠老员工的经验判断，人一走经验就没了。
- 设计：高风险动作必须人工审批；人的决定被持久化，下次同类情况直接复用。
- 效果：原句是 "Over time, the system accumulates the operational judgment that used to exist only in people's heads." 原文没有给出这个机制本身的量化效果。

**反转 8：选型，多家模型对比 → 押注单一供应商（【Claude原文】S1）**
- 原句："After evaluating multiple model providers, Duvo committed to a single-provider architecture on Claude."
- 理由是在混乱、模糊任务上的表现。Claude 原文归给 Čupr："Parsing a supplier email that half-confirms a delivery while raising a pricing dispute. Navigating a SAP GUI screen with dozens of fields. Making judgment calls on exceptions without hallucinating business rules."（Duvo 博客 [S30] 把同一句话归给了 Paris。）
- 【编剧建议】"一封邮件里一半在确认交货、一半在跟你吵价格"，这句画面感很强，可以直接用。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 年化节省（Rohlik，3 个月累计） | 这些流程"从未被系统性执行" | €2.8M+ 年化 | 【Claude原文】S1；S30 ✅ | "annualized"指按年推算的数字，不是已入账现金；Duvo/Rohlik 自报。Duvo 官网提醒 "Financial figures may overlap and are not a combined benefit total"（各案例金额可能重叠，不能相加）【S27】 |
| 首周年化节省（大宗商品调价监控） | 最多一季度查一次，经常不查 | 首周 €1.45M+ 年化；120+ SKU、15+ 供应商 | 【Claude原文】S1；S28 ✅ | Duvo 原页写 "€1.45M+ in annualized savings **closed**"，证据状态为客户确认（"Rohlik approved the closed-savings result"）。第一轮引用的仿站文本写 "surfaced"，与原页不符，已更正。Čupr 口头说法是"一周找出两百万欧元"（našli dva miliony eur）【S32】，是"找到"的口径，不是"谈成" |
| 年度供应商谈判周期 | —— | 缩短约 1 个月；约 80% 自动化（准备→合同生成→写回 ERP） | 【Claude原文】S1；S10 ✅；S11 ✅ | Duvo 原页标题数字是 "~80%"，证据说明写 "70–80% workflow automation"；G2 PDF 写 "70–80%"。另据 G2 PDF：覆盖 3,900 家供应商，"This efficiency came at a cost of just $30,000 for deploying three Duvo agents"（三个 agent 的部署成本仅 3 万美元） |
| 谈判相关人力 | —— | 约 60 FTE（全职人力当量） | S10 ✅；S11 ✅；S30 ✅ | 三种说法：G2 PDF "roughly 60 FTE can focus on creating more value"；Duvo 案例页 "capacity equivalent to ~60 FTEs"；Duvo 博客 "60+ FTEs shifted from data entry to strategic negotiation"。**不是裁掉 60 人**。Claude 原文没有这个数字 |
| 品类管理整体 | —— | 效率 +40%，几周内释放 10 FTE | 【外部来源 S20】✅ | 会议议程预告（活动在 2026-11 举行），口径不明，和上面的 60 FTE 是不同范围 |
| 促销配置工作量 | 基线 | 下降 65–70% | 【Claude原文】S1；S30 ✅ | 没说是时间还是人工量。Duvo 博客写 "Promotion setup time cut 65 to 70%"，是时间口径 |
| 促销毛利 | 17% | 27%（4 个履约中心） | 【外部来源 S38】✅ | Duvo 标为 "Measured result"，对比 2025 与 2026 年 ISO 第 9–13 周，其中 2026 年第 13 周含复活节提前消费；促销收入占比 7.6%→24.0% |
| 供应商入驻催办 | 基线 | 下降 50–70% | 【Claude原文】S1 | 只见于 Claude 原文，Duvo 官网没有对应案例 |
| 商品可得率（供应链计划） | 78% | 93%（两周内） | 【Claude原文】S1；S30 ✅ | Duvo 博客也归给 Rohlik（"by reconciling demand signals, stock levels, and supplier lead times"），但 Duvo 官网案例库里**没有** Rohlik 的独立可得率案例；"两周 +15%、不用 API"那篇的客户确认是 **Pilulka**（A+B 类商品，6,225 个产品）【S13】。见第 7 节 |
| 入库交货确认率 | 52% | 90%（截单前），每天覆盖所有供应商 | 【Claude原文】S1；S29 ✅ | Duvo 原页写 "before cut-off"，证据状态为客户认可；页面上另有 €10M–€27M 营收影响，是按行业缺货基准"modelled"（模型推算）的，不是实测 |
| 缺货信号处理 | 每市场每天约 8 个，仅工作时间 | 100% 信号处理，24/7，5 个市场 | 【外部来源 S29】✅ | 客户认可口径 |
| 发票对账 | 计划员 18 小时/天 | 3.4 小时/天；保护 €2.1M 营收和 €1.4M 毛利/年 | 【外部来源 S38】✅ | 客户确认；原页注明营收和毛利是同一流程的两种度量，"must not be added together" |
| 新品上架周期 | 约 8 周 | 1 周 | 【外部来源 S38】✅ | 周期是实测；€400K–€1.5M 营收影响是模型推算，"The average-revenue assumption is pending validation" |
| 月结差异报表 | 人工取数 | 100% 自动取数，月结时间约 -10% | 【外部来源 S12】✅ | 客户确认；Rohlik CFO Jiří Machala 有署名引语 |
| 年返利跟踪 | 买手凭记忆选档，年底才发现偏差 | 回收 €240K/年毛利；每周释放 250 小时 | 【外部来源 S38】✅ | 客户确认；涉及 17 位捷克品类经理 |
| 利润复盘 | —— | 交易周前 48 小时交付；商业团队每周省 120 小时 | 【外部来源 S30】✅ | 只见于 Duvo 博客 |
| 团队产能释放（跨客户平均） | —— | 40%+ | 【Claude原文】S1 | 原文写明 "The team also estimates"，是 Duvo 的估算；种子轮时的说法是 "In early deployments, this has translated into roughly a 40% reduction in manual work"【S15】✅ |
| 从首次沟通到生产部署（跨客户平均） | —— | 平均 8 周 | 【Claude原文】S1 | Duvo 博客把它说成承诺并附退款条款【S30】；Čupr 在 Shoptalk 上说 "you're getting benefits in six weeks instead of two years"【S34】；Pilulka 案例 "Live in just 2 weeks"【S13】。第一轮引自第三方快照的 "4 weeks first live process" 在 duvo.ai 现行页面上找不到，已删除 |
| 采用 Agent SDK 后上线 | —— | 几天内进入生产 | 【Claude原文】S1 | 这是 Duvo 自身的工程指标，不是 Rohlik 的 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **先找"被放弃的工作"，而不是"慢的工作"。** 依据：【Claude原文 S1】中 "abandoned work" 和 "Not from a process that was slow…" 两处；Čupr："maybe deploy AI on processes you've never run because you didn't have enough people"【S7】✅。
   - 好处一：没有基线，任何产出都是增量，ROI 好算。
   - 好处二：不会威胁到现有岗位，阻力小。Čupr 甚至说在零售业拿裁员算 ROI 是个伪命题："inherently trying to find ROI in headcount savings is a false pretense here."【S7】✅
2. **先测绘真实流程，再改流程，最后自动化。** 依据：S6（CEO 自己都不懂流程）、S5（Clarity 的定位）、S16（"The documented process is usually fiction"）、S8（Alza 从测绘开始）、S32（"糟糕的流程交给 agent 只会跑得更快"）。
3. **从一个痛点、相对独立的流程开始，六周见效再扩。** Čupr："Give us something painful, fairly isolated. We prove it works, and then it becomes a very easy conversation about larger-scale deployment."【S34】✅ Newstream 版本："Začněte tam, kde leží velké peníze a hodně výjimek"（从钱多、例外多的地方开始）【S32】✅。
4. **不等接口，走现有界面。** computer use 和浏览器操作绕开"IT 排期要好几年"的瓶颈。依据：【Claude原文 S1】；S7（"no sane enterprise will touch you"）；S13（Pilulka：IT 没空，直接走界面）。
5. **一个任务一个 agent，把工具都给它，避免交接丢上下文。** 依据：【Claude原文 S1】。
6. **高风险动作设人工闸口，把人的每次决定沉淀为规则。** 依据：【Claude原文 S1】；S4（官方 CLI 的人工审批接口）；S33（供应商情绪升级给人处理；"You cannot expect this to be fully autonomous"）。
7. **每个 agent 都要有 KPI，结果分"实测 / 客户确认 / 模型推算"标注。** 依据：S32（每个 agent 要有 KPI）；S27（Duvo 案例的"证据状态"分档）。
8. **FDE 对结果负全责：scoping → build → debug → handover → expansion；再配一个懂业务转型的顾问。** 依据：S14（官网招聘页）；S16（"forward-deploy consultants, not just engineers"）。
9. **按"完成的流程运行次数"计费，不按席位或 token。** 依据：S36 原文："A predictable price for each agreed process run… Token usage is Duvo's cost to manage, not a customer billing line, and there is no per-seat fee." ✅

---

## 7. 数字严谨性 & "评论区喷子"防御

1. **关联方问题（最大的风险点）**
   - Rohlik Group 的 CEO 就是 Duvo 的 CEO Tomáš Čupr（一手来源已确认）：
     - Čupr 本人 Substack："Alongside my role as Founder & CEO of Rohlik, I've co-founded duvo.ai." 【S17】✅
     - Omni Talk 节目简介："Tomáš Čupr, Co-Founder and CEO of duvo.ai and CEO of the Rohlik Group" 【S7】✅
     - Duvo 官方博客："Tomáš Čupr, founder and Group CEO of Rohlik Group and co-founder and CEO of duvo.ai" 【S34】✅
     - CzechCrunch：他"bude většinu času i nadále věnovat Rohlíku"（大部分时间仍放在 Rohlik）【S41】✅
     - Newstream 称他为 "majitel Rohlík Group"（Rohlik Group 的所有者）【S32】✅
     - LinkedIn 标题（第一轮只见于搜索结果）本轮无法打开（HTTP 999），已不再作为依据 【S21】❌
   - 另一个客户 Pilulka 也和 Čupr 有关：CzechCrunch 写 TCF Capital（Čupr 的投资公司）的投资组合里 "Do portfolia spadá také společnosti Pilulka"（也包括 Pilulka）【S26】✅。所以 Duvo 官网上 Rohlik 和 Pilulka 这两个案例最多的客户，都和 Čupr 有关联。
   - **与 Čupr 无已知关联的外部客户**（均已打开原页核对）：Notino（Lupa.cz [S8]；Duvo 官网有 Notino CCO Bartosz Kliś 的署名引语 [S39]；Newstream [S32]）、Alza（Lupa.cz [S8]，只说"拿下 Alza、先从测绘开始"，**没有结果数字**，Duvo 官网案例库里也没有 Alza）、Heureka Group（Duvo 官网 [S27]；Modern Retail [S33]）、Holland & Barrett（Modern Retail [S33]；Newstream [S32]，**没有结果数字**）。
   - 防御话术（【编剧建议】）：主动承认这一点，把它讲成"创始人先拿自己的公司试刀（dogfooding）"，Čupr 自己就称 Rohlik 为 "the perfect proving ground"【S17】。再用 Notino（奖金对账 70 天→15 天，有署名高管引语 [S39]）作为"走出自家公司"的证据。**不要**把 Rohlik 说成"一个陌生的大客户"。
2. **"年化节省"不等于"已实现节省"。** €1.45M 和 €2.8M+ 都是 annualized。Duvo 原页对 €1.45M 用的是 "closed"（谈成），并标注为客户确认 [S28]；Čupr 口头说"一周找出两百万欧元"[S32]。上屏建议写成"年化节省 €280 万+（公司口径）"。
3. **40% 是公司估算。** 原文写 "The team also estimates that 40%…"，而且是跨客户平均，不是 Rohlik 单独的数字。
4. **80% 和 70–80% 并存。** Claude 原文写 "approximately 80%"，Duvo 案例页标题写 "~80%"、证据说明写 "70–80%"【S10】，G2 PDF 写 "70–80%"【S11】。建议上屏用"约七到八成"。
5. **60 FTE 的口径容易被说成"裁员 60 人"。** 三处原文分别是 "can focus on creating more value"【S11】、"capacity equivalent to ~60 FTEs"【S10】、"shifted from data entry to strategic negotiation"【S30】，都是"产能折算"，不是减员。另一个会议预告写"几周内释放 10 FTE"【S20】，范围不同。
6. **营收口径。** Claude 原文写 Rohlik "more than €1.5 billion in revenue"；Omni Talk 节目页写 "$1.5B+ pan-European e-grocer"【S6】；G2 PDF 写 "$1.5 billion in revenue"【S11】；Čupr 的 Substack 写 "over $1.6 billion in revenue"【S16】；Shoptalk 采访和 Duvo "关于我们"页写 "$2 billion"【S7】【S35】；Lupa.cz 报道的是上一财年实际营收 1.114 billion 欧元（"tržby meziročně vyrostly o 34 procent na 1,114 miliardy eur"）【S15】。币种、年份、口径都不同。建议上屏用"十几亿欧元"。
7. **78%→93% 的归属。** Claude 原文和 Duvo 自己的博客 [S30] 都把"两周可得率 78%→93%"归到 Rohlik。但 Duvo 官网案例库里没有 Rohlik 的可得率案例；"两周可得率 +15%、不用 API、不靠 IT"那篇的客户明确是 **Pilulka**，而且是 Pilulka 确认的数字【S13】✅（第一轮怀疑的归属，本轮已在原页确认是 Pilulka）。78→93 恰好也是 +15 个百分点，两者是否同一件事仍无法判断。**建议不要把"78%→93%"当主数字**，要用就用有 Duvo 原页支撑的 52%→90%。
8. **引语归属不一致。** "Before the SDK, critical context disappeared…" 这句，Claude 原文归给 Ondrej Romancov，Duvo 博客归给 Marek Paris；"What set Claude apart…" 这句，Claude 原文归给 Čupr，Duvo 博客归给 Paris【S1 vs S30】。上屏建议写"Duvo 团队"。
9. **"8 周"的口径。** 这是跨客户平均，样本量没有披露。Duvo 把它当承诺，并附退款/5 倍 ROI 条款【S30】【S36】。
10. **来源性质。** Claude 客户故事是 Anthropic 的营销内容，Duvo "built entirely on Claude"，双方利益一致；Duvo 官网案例是自家营销，但每篇都标了证据状态（客户确认 / 实测 / 模型推算），可以直接引用这个分档来防御。**未找到**独立审计或第三方复核。
11. **负面报道 / 质疑。** 本轮在英文、捷克语、中文检索中**都没有找到**针对 Duvo 的负面报道；Reddit/HN 讨论也没有找到。Newstream 那篇文章旁边挂着一条关于 Claude 安全测试事故的新闻，但和 Duvo 无关，不能用作质疑素材。
12. **可能的评论区问题（【编剧建议】，需要准备回答）**
    - "AI 跟供应商谈价，供应商不会反感吗？"——引用 Modern Retail 原文："if a supplier is angry or rejecting too many of the offers, Duvo.ai will notify the retailer and have them respond. 'You cannot expect this to be fully autonomous'"【S33】✅
    - "AI 打电话合规吗？"——**未找到公开信息**。只知道 Čupr 说 agent 会"follow governed scripts"【S17】。
    - "数据安全？"——Claude 原文说每次 API 调用都在 Zero Data Retention 下运行【S1】；Duvo 定价页列出的评估项包括 "Data residency, SSO, RBAC, and security requirements"【S36】✅；Čupr 称公司通过 ISO 42001 认证【S16】✅；Rohlik 月结案例写明 "Session data is destroyed after execution and is not used to train public models"【S12】✅。
    - "这不就是 RPA 吗？"——Pilulka 的例子：agent 先独立重算订单、提建议、人在 Slack 上批准，再走界面执行【S13】，不是固定脚本回放。

> **第一轮摘要有误、本轮已更正的地方**：
> - €1.45M 的口径：第一轮引用的仿站文本写 "surfaced"（识别出），Duvo 原页写 "closed"（谈成）并标客户确认 [S28]。
> - 60 FTE：第一轮写成"freeing ~60 FTE / 释放人力"。原页口径是"产能折算 / 转去做更有价值的事"[S10][S11]。
> - Duvo 案例页 URL：S10、S12 的旧链接已 404，已换成现行链接；S13 旧链接会跳转到 /customer-stories/availability-recovery。
> - Lupa.cz 的 Alza 报道标题已从 "…kde má začít automatizovat" 改为 "…kde má pomáhat s AI trasformací"（原页现行标题，含原文拼写 "trasformací"）；关键句原文是 "…informovala firma. Pak má nastoupit jejich přestavba s využitím AI."，第一轮写的"Pak má podle Duvo nastoupit"措辞不准，已改。
> - "Duvo 官网 compare 页写 'A builder is half the job'"：duvo.ai/compare 现在跳转到 /platform，找不到这句话，已删除。
> - "4 weeks first live process"：在 duvo.ai 现行页面上找不到，已删除。
> - pre-seed 投资方：第一轮只有低可信度数据集，本轮由 CzechCrunch 确认是 150 万美元、含 Credo Ventures [S41]。
> - 美国 FDE 岗位：第一轮写"2026-08-26 仍在招"，本轮核对已下线（fwddeploy 410，Ashby 列表里没有）；英国 FDE 岗位仍在招。
> - "Pilulka 被 Čupr 控制"：第一轮引自 GitHub 上的 Lupa 转载，本轮在 CzechCrunch 原文核对，措辞是 TCF Capital 投资组合"也包括 Pilulka"，比"控制"弱，已按原文改写。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下全部是**创作建议**，依据的事实都标了来源编号。

- **开场钩子 A（反常识）**："一家营收十几亿欧元的生鲜电商，几千个跟大宗商品挂钩的商品，调价这件事以前最多一个季度查一次，经常一次都没查。AI 上线第一周，谈成了年化 145 万欧元的降价。"〔S1、S28〕
- **开场钩子 B（CEO 不懂自己的公司）**："他创办这家公司 12 年，以为每个流程都门儿清。直到让 AI 去访谈一线员工，才发现：供应商送货迟到，本该有人马上打电话追，结果根本没人打。"〔S6〕
- **开场钩子 C（被放弃的工作）**："采购团队只顾得上前 20 大供应商。剩下几百个小动作，每个都不起眼，加起来值几百万欧元，但从来没人碰过。"〔S1〕
- **中国化类比**：可以类比国内商超、生鲜电商的"年框谈判"和"原料涨价函"：供应商发来涨价函要涨 7%，采购还价 5%，大家就这么过去了；没人去查这个 SKU 的原料其实跌了 10%。〔事实部分依据 S34、S6；类比属于编剧建议〕
- **反转桥段 1（接力赛 → 全能选手）**："一开始他们让几个 AI 像接力赛一样传棒，结果棒传着传着就掉了，上下文丢了。后来改成一个 AI 从头跑到尾，工具全给它。"〔S1〕
- **反转桥段 2（等接口 → 直接看屏幕）**："CEO 自己去推自动化，IT 给的排期是 6 个月、12 个月、18 个月。他们干脆不等了，让 AI 像新员工一样坐到 SAP 屏幕前点鼠标。"〔S6、S1〕
- **反转桥段 3（没人打的电话）**："测绘之后改流程，打电话这一步写进去了。但打电话的不是人，是 agent。现在供应商一错过送货窗口，agent 就去追。入库确认率从 52% 涨到 90%。"〔S6、S29；两者的关联是编剧推断，见第 4 节反转 4〕
- **反转桥段 4（踩过的坑）**："他们自己在公司里试 agent，踩过三种坑：做到一半卡住；只给答案不干活；demo 很漂亮，一碰到真实权限和例外就挂。Duvo 就是从这些错误里长出来的。"〔S31〕
- **金句备选**：
  - "It just doesn't forget, doesn't deprioritize, and doesn't stop at the top 20 suppliers."（它不会忘、不会往后推，也不会只盯前 20 大供应商。）〔S1〕
  - "That was one process. We're now running dozens."（那只是一个流程，我们现在跑着几十个。）——Rohlik CRO〔S1〕
  - "The documented process is usually fiction."（写在文档里的流程，通常是虚构的。）〔S16〕
  - "把设计糟糕的流程交给 agent，只会让糟糕的流程跑得更快。"〔S32 捷克语原句意译〕
  - "一封邮件里，一半在确认交货，一半在跟你吵价格。"〔S1 原话意译〕
- **FDE 画像**：驻场或混合办公、出差多；从需求梳理、搭建、调试、交接一路做到扩展，对结果负全责；"不写核心产品，写胶水代码"；"别自动化坏流程，先重设计"；还要配一个做过麦肯锡或四大的转型顾问。〔S14、S16〕
- **结尾升华**："AI 落地的第一个项目，别选'让慢的变快'，选'把没人干的干起来'：没有基线之争，也不抢任何人的饭碗。"〔依据 S1 的 abandoned work 论述；S7"拿裁员算 ROI 是伪命题"〕
- **诚实处理关联方的桥段（建议保留）**："这个案例有一点要说清楚：Duvo 的 CEO 同时也是 Rohlik 的 CEO。他自己说，Rohlik 是最好的试验场。先在自己的公司跑通，再卖给 Notino、Heureka 这些外部客户。"〔S17、S39、S27〕

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S1 | Duvo automates enterprise operations across legacy systems with Claude | https://claude.com/customers/duvo | Claude原文 | 2026-04-03 | ✅ 已打开（第二轮再次 curl 全文核对） |
| S1b | Claude 客户故事列表页（页面数据里 Duvo 条目的 `date` 字段） | https://claude.com/customers | Claude原文（元数据） | —— | ✅ 已打开（第一轮 curl 读到 `"date":"2026-04-03T00:00:00.000Z"`） |
| S2 | Tomas Cupr GitHub 个人主页 | https://github.com/tomascupr | 创始人个人页 | —— | ✅ 已打开（第一轮） |
| S3 | Duvo 官方 GitHub 组织页 + profile README | https://github.com/duvoai ；https://github.com/duvoai/.github/blob/main/profile/README.md | 公司官方 | —— | ✅ 已打开（第一轮） |
| S4 | duvoai/skills：duvo-cli 工作流文档（人工审批） | https://github.com/duvoai/skills/blob/main/skills/duvo-cli/references/workflows.md | 公司官方（开源） | —— | ✅ 已打开（第一轮） |
| S5 | Lisbon AI 2026 讲者页：Daniel Bukac（Duvo 创始产品工程师），演讲 "Screen-aware voice agents: a new interaction pattern" | https://lisbonai.org/speakers/ | 会议演讲 | 活动 2026-09-23 至 24 | ✅ 已打开活动官网原页（第一轮只读到 GitHub 源文件） |
| S6 | Omni Talk Retail Ep.561：How AI Can Tell You WHERE to Use AI in Your Retail Operations With Tomáš Čupr | https://omnitalkretail.captivate.fm/episode/duvo-spotlight | 播客（节目页 + 自动逐字稿） | 2026-03-30 | ✅ 已打开原页（含逐字稿；GitHub 镜像不再使用） |
| S7 | Omni Talk Retail：The Biggest AI Mistake Is Waiting for Perfect Data（5IM，Shoptalk Europe 现场） | https://omnitalkretail.captivate.fm/episode/the-biggest-ai-mistake-waiting-for-perfect-data-5im | 播客（节目页 + 自动逐字稿） | 2026-06-14 | ✅ 已打开原页（含逐字稿） |
| S8 | Lupa.cz：Čuprův AI startup jde po velkém retailu. Získal Alzu, kde má pomáhat s AI trasformací（作者 Iva Brejlová） | https://www.lupa.cz/aktuality/cupruv-ai-startup-jde-po-velkem-retailu-ziskal-alzu-kde-ma-zacit-automatizovat/ | 媒体（捷克语） | 2026-07-24 | ✅ 已打开原页（标题已被媒体修改，见第 7 节） |
| S9 | CzechCrunch：Zadám AI úkol, jdu spát, ráno se probudím a je hotovo…（Money Maker 播客文字版） | https://cc.cz/zadam-ai-ukol-jdu-spat-rano-se-probudim-a-je-hotovo-to-je-ta-opravdova-magie-rika-tomas-cupr/ | 媒体/播客（捷克语） | 2026-06-23 | ✅ 已打开原页（没有 Rohlik 项目落地细节，只引用了"为什么单独开公司"一段） |
| S10 | Duvo 客户案例：Rohlik closed annual negotiations one month faster | https://www.duvo.ai/customer-stories/annual-negotiations （第一轮旧链接 …/how-duvo-cut-the-annual-negotiation-by-1-month-and-freed-60-fte 已 404） | 公司官网案例 | 未标注 | ✅ 已打开原页 |
| S11 | G2 附件 PDF：How Rohlik Group cut a month off annual negotiations and freed 60 FTE with Duvo.ai | https://images.g2crowd.com/uploads/attachment/file/1579860/case-study-annual-negotiations.pdf | 公司案例 PDF | 未标注 | ✅ 已下载并提取全文 |
| S12 | Duvo 客户案例：Rohlik automated report retrieval and cut month-end close by ~10% | https://www.duvo.ai/customer-stories/variance-reporting （旧链接已 404） | 公司官网案例 | 未标注 | ✅ 已打开原页 |
| S13 | Duvo 客户案例：Pilulka improved stock availability by 15% in two weeks | https://www.duvo.ai/customer-stories/availability-recovery （旧链接会跳转到这里） | 公司官网案例 | 未标注 | ✅ 已打开原页（**客户是 Pilulka**） |
| S14 | Duvo 官网招聘页：Forward Deployed Engineer (UK Based) | https://www.duvo.ai/careers/forward-deployed-engineer-uk-based ；Ashby：https://jobs.ashbyhq.com/duvo/e2156092-50f1-4181-87fb-9e4bc299dde3 ；美国岗位 https://www.fwddeploy.com/jobs/forward-deployed-engineer-us-based-633e4e84 | 招聘 | 英国岗位 2026-05-21 发布 | ✅ 官网原页已打开；美国岗位返回 410（已过期）。第一轮的 freehire / dreamwork / ziprecruiter 聚合页不再使用 |
| S14b | 第三方职位聚合表（GitHub） | https://github.com/kevin-2023-code/New-Grad-Opportunities/blob/master/lists/remote.md | 招聘（聚合，**已降级**） | 2026-08-26 | 降级：已被 S14/S37 原始来源取代，正文不再引用 |
| S15 | 种子轮 1500 万美元：Duvo 官方博客 / TechFundingNews / Lupa.cz | https://www.duvo.ai/blog/duvo.ai-raises-15-million-to-give-retail-teams-an-ai-workforce-that-goes-live-in-weeks-cutting-manual-work-by-40 （blog.duvo.ai 旧链接跳转到此）；https://techfundingnews.com/duvo-ai-retail-automation-seed-funding/ ；https://www.lupa.cz/aktuality/cupr-vytvoril-ai-silu-pro-retail-spousti-duvo-ai-a-ziskava-na-nej-15-milionu-dolaru/ | 公司博客 / 媒体 | 2025-12-02（三处一致） | ✅ 三个原页均已打开 |
| S16 | Tomas Cupr Substack：What the hell does Duvo do? | https://tomascupr.substack.com/p/what-the-hell-does-duvo-do | 创始人博客 | 2026-05-13 | ✅ 已打开原页（文末有一条读者评论，不是 Čupr 本人的话，本文未引用） |
| S17 | Tomas Cupr Substack：Why I Co-Founded Duvo.ai | https://tomascupr.substack.com/p/why-i-co-founded-duvoai | 创始人博客 | 2025-12-02 | ✅ 已打开原页（第三方中文转述不再使用） |
| S18 | Oton Technology：Retailers Use AI Agents to Replace Merchant Workloads | https://otontechnology.com/retailers-ai-agents-merchant-merchandising/ | 媒体转载 | 未知 | ❌ 无法访问（原页 404；archive.org 无快照）。所引内容已在原始出处 S33 核实 |
| S20 | Czech Retail Days 分会场：Rohlik Group and duvo.ai: Artificial Intelligence in Category Management | https://www.czechretaildays.cz/en/session/rohlik-group-and-duvo-ai-artificial-intelligence-in-category-management/ | 会议议程 | 活动 2026-11-05 至 06（尚未举行） | ✅ 已打开原页（摘要含 "40% increase in efficiency and the freeing up of 10 FTEs within a few weeks"） |
| S21 | Tomáš Čupr LinkedIn | https://cz.linkedin.com/in/tomascupr | 个人页 | —— | ❌ 无法访问（HTTP 999，登录墙）。双重身份已改由 S17、S7、S15、S6 证明 |
| S22 | 第三方研究笔记：Duvo（含 2026-07-09 官网快照要点） | https://github.com/yan5xu/oh-my-ai-company/blob/main/bodies/company.duvo.md | 第三方研究笔记（**已降级**） | 2026-07-09 快照 | 降级：所转述的 duvo.ai 内容已在原页核对；其中 "A builder is half the job"、"4 weeks first live process" 在现行原页上找不到，已删除 |
| S23 | 第三方 Duvo 仿站仓库：客户案例文本 stories.ts | https://github.com/TrueTwist-Organization/duvo-clone/blob/main/src/content/stories.ts | 第三方仿站（**已降级**，低可信度） | —— | 降级：大部分数字与 duvo.ai 原页一致，但 "€1.45M surfaced" 与原页的 "closed" 冲突，已按原页更正；正文不再引用 |
| S24 | 应聘者公开仓库：Duvo Forward Deployed Engineer exercise | https://github.com/gitchrisqueen/duvo | 个人仓库（非官方） | 2026-08 至 09 | ✅ 已打开（第一轮） |
| S25 | 第三方数据集：Credo Ventures 投资组合里的 Duvo.ai（pre-seed） | https://github.com/mchlkucera/localproblems/blob/main/data/signals/funded/2026-08-14.jsonl | 第三方数据（低可信度） | 条目日期 2024-12-31 | ✅ 已打开（第一轮）；pre-seed 事实本轮已由 S41 原始报道证实，正文改引 S41 |
| S26 | CzechCrunch：V září ohlásili vznik, teď se Tomáš Čupr ze studia na vývoj AI stahuje（提到 TCF Capital 投资组合包括 Pilulka） | https://cc.cz/v-zari-ohlasili-vznik-ted-se-tomas-cupr-ze-studia-na-vyvoj-ai-stahuje-podil-vykoupil-druhy-zakladatel/ | 媒体（捷克语） | 2026-06-22 | ✅ 已打开原页（第一轮的 GitHub 转载不再使用） |
| S27 | Duvo 客户成果总览页（Rohlik / Notino / Pilulka / Heureka） | https://www.duvo.ai/customer-stories | 公司官网 | 2026-09 访问 | ✅ 已打开原页 |
| S28 | Duvo 客户案例：Rohlik closed €1.45M in annualised savings in one week | https://www.duvo.ai/customer-stories/rohlik-group-from-commodity-data-to-1.45m-eur-in-savings-in-one-week | 公司官网案例 | 未标注 | ✅ 已打开原页 |
| S29 | Duvo 客户案例：Rohlik lifted inbound confirmations from 52% to 90% | https://www.duvo.ai/customer-stories/rohlik-out-of-stock-prevention | 公司官网案例 | 未标注 | ✅ 已打开原页 |
| S30 | Duvo 博客：How Duvo Automates Enterprise Operations with Claude | https://www.duvo.ai/blog/how-duvo-automates-enterprise-operations-across-legacy-systems-with-claude | 公司博客 | 2026-04-07 | ✅ 已打开原页 |
| S31 | Tomas Cupr Substack：How far can a grocer take AI? | https://tomascupr.substack.com/p/we-started-with-chatgpt-now-we-are | 创始人博客 | 2026-08-14 | ✅ 已打开原页 |
| S32 | Newstream：Jak Tomáš Čupr propadl AI…（Čupr 在德勤"Budoucnost retailu"大会上的演讲报道） | https://www.newstream.cz/leaders/jak-tomas-cupr-propadl-ai-nudil-jsem-se-a-zrychlil-jsem-se | 媒体（捷克语） | 2026-09-10 | ✅ 已打开原页 |
| S33 | Modern Retail：AI is now doing parts of merchants' jobs, managing products and vendors | https://www.modernretail.co/technology/ai-is-now-doing-parts-of-merchants-jobs-managing-products-and-vendors/ | 媒体 | 2026-06-22 | ✅ 已打开原页 |
| S34 | Duvo 博客：Beyond the hype: where AI is actually transforming retail（Shoptalk 2026 活动回顾） | https://www.duvo.ai/blog/beyond-the-hype-where-ai-is-actually-transforming-retail-shoptalk-2026 | 公司博客 | 2026-06-10 | ✅ 已打开原页 |
| S35 | Duvo "关于我们"页 | https://www.duvo.ai/company | 公司官网 | 2026-09 访问 | ✅ 已打开原页 |
| S36 | Duvo 定价说明（pricing.md） | https://www.duvo.ai/pricing.md （页面版 https://www.duvo.ai/pricing） | 公司官网 | 2026-09 访问 | ✅ 已打开原页 |
| S37 | Duvo Ashby 招聘数据（当前全部在招岗位） | https://api.ashbyhq.com/posting-api/job-board/duvo | 招聘 | 2026-09-24 访问 | ✅ 已打开（当前 13 个岗位，含英国 FDE，无美国 FDE） |
| S38 | Duvo 其他 Rohlik 客户案例：发票对账 / 促销毛利 / 新品上架 / 临期决策 / 年返利 / 仓间调拨 | https://www.duvo.ai/customer-stories/invoice-reconciliation ；https://www.duvo.ai/customer-stories/promo-management-margin-lift ；https://www.duvo.ai/customer-stories/npd-launch-cycles ；https://www.duvo.ai/customer-stories/expiry-decisioning-margin ；https://www.duvo.ai/customer-stories/turnover-bonus-optimisation ；https://www.duvo.ai/customer-stories/transfer-logging | 公司官网案例 | 未标注 | ✅ 6 页均已打开原页 |
| S38b | Duvo 方案页：Commodity Price Monitoring | https://www.duvo.ai/solutions/commodity-price-monitoring | 公司官网 | 2026-09 访问 | ✅ 已打开原页 |
| S39 | Duvo 客户案例：Notino cut bonus reconciliation from 70 days to 15 | https://www.duvo.ai/customer-stories/bonus-reconciliation | 公司官网案例 | 未标注 | ✅ 已打开原页 |
| S40 | Index Ventures：Duvo raises $15m to give retail teams an AI workforce… | https://www.indexventures.com/perspectives/duvo-raises-15m-to-give-retail-teams-an-ai-workforce-that-goes-live-in-weeks-cutting-manual-work-by-40/ | 投资方博客 | 2025-12-02 | ✅ 已打开原页 |
| S41 | CzechCrunch：Tomáš Čupr má nový AI startup, přes 340 milionů od investorů… | https://cc.cz/tomas-cupr-ma-novy-ai-startup-pres-340-milionu-od-investoru-a-hlasi-vyresime-to-co-firmy-brzdi/ | 媒体（捷克语） | 2025-12-02 | ✅ 已打开原页 |
| S42 | 中文媒体检索（36氪、机器之心、虎嗅、雷锋网、网易、知乎等） | WebSearch 限定上述域名 | 检索记录 | 2026-09-24 | 未找到 Duvo 相关中文报道 |

### 信息缺口 / 待核实线索（交给人工补查）
- **Rohlik 项目的驻场细节**：具体哪位工程师或转型经理驻场、待了多久、先访谈了哪些品类经理或采购员。**仍未找到公开信息**。目前能确认的只有：第一批部署走正式企业采购 [S16]；第一个 agent 是大宗商品价格监控 [S32]；Paris 此前就在 Rohlik 负责 AI 自动化 [S16][S41]。
- **Marek Paris 参加的 FDE 主题圆桌**（与 Nazare 合办，嘉宾还有 SolveAI、microagi 的人）：只在搜索摘要里看到，出处是 LinkedIn，打不开，**未核实，未写入正文**。
- **Czech Retail Days 2026-11 分会场**（S20）：活动还没开，届时可能有 Rohlik 品类管理落地的现场细节，建议会后补查。
- **Omni Talk 逐字稿是机器转写**：人名、数字可能有误听，上屏引用前建议对照音频再听一遍。
- **"AI 打电话"的合规做法**：未找到公开信息。
- **Alza、Holland & Barrett 的项目结果**：只有"已签约"的报道，没有结果数字。
