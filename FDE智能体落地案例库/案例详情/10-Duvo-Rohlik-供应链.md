# 案例：Duvo × Rohlik Group — 用"跨系统操作的 AI 智能体"把没人干的采购/供应链长尾工作干起来，三个月年化节省 €2.8M+

- **行业**：零售 / 生鲜电商的采购、供应链、品类管理（Duvo 本身是软件公司，客户是零售和 CPG 企业）
- **企业规模 / 地区**：
  - Duvo：初创公司，总部在布拉格（捷克）[S3]；2025 年 12 月完成 1500 万美元种子轮 [S15]
  - Rohlik Group：生鲜电商，覆盖 5 个市场，营收超过 15 亿欧元（Claude 原文口径）[S1]
- **Claude 产品标签**：Claude Platform（故事标题标注为 "Case study | Claude Agent SDK"），还用到 MCP、computer use、Zero Data Retention [S1]
- **Claude 故事发布日期**：2026-04-03（取自 claude.com/customers 页面数据中的 `date` 字段，已用 curl 核实）[S1b]
- **Claude 原文链接**：https://claude.com/customers/duvo
- **落地主体（谁是"FDE"）**：由供应商 Duvo 自己的团队落地，不是 Rohlik 内部 IT，也不是咨询合作伙伴。证据链如下：
  1. Duvo 三位联合创始人 Tomáš Čupr（CEO）、Marek Paris（CPTO）、Martin Pecha（COO）都来自 Rohlik 高管层 [S15][S8]。**Čupr 至今还兼任 Rohlik Group CEO**，所以这是一个"关联方客户"案例 [S7][S21]。
  2. Duvo 正在招聘 **Forward Deployed Engineer**，职位描述写明主要以驻场/混合方式派驻客户处，出差频繁 [S14]（招聘原页未能打开，只看到搜索摘要；另有一份第三方职位聚合表，能证明该职位在 2026-08-26 仍在招 [S14b]）。
  3. **没有公开信息**写明 Rohlik 项目具体由谁驻场、做了多久。
- **本案例推荐指数：3.5 / 5**
  - 数字充分度：5 分。数字很多，而且都能直接用：€1.45M 首周、€2.8M+ 三个月、52%→90%、78%→93%、谈判周期缩短 1 个月等。
  - 过程/反转素材：3 分。Claude 原文里有两处技术反转（多 agent 接力丢上下文 → 一个 agent 一干到底；等 API 集成 → 直接操作屏幕）；外部来源里有"先画清流程、再自动化"（Duvo Clarity）和 FDE 招聘描述。但驻场细节、踩坑、失败尝试都没有公开信息。
  - 对中国听众的可迁移性：4 分。采购年度谈判、大宗原料调价、供应商催确认、促销配置，这些国内商超和生鲜电商都有。
  - 主要扣分项：**Rohlik 是 Duvo CEO 自己执掌的公司**，外界容易质疑"自己人给自己背书"（见第 7 节）。另外，本环境的出网代理屏蔽了 duvo.ai、blog.duvo.ai、Substack、CzechCrunch、Lupa.cz、LinkedIn 等大部分站点，不少外部事实只能以"搜索摘要"或"GitHub 镜像"的形式核实（每条都已标注）。

> **核实方式说明（请编剧注意）**：本环境只能直接打开 claude.com 和 github.com（含 raw.githubusercontent.com），其他域名都被出网代理拦截。因此外部来源分三档核实：
> - ✅ **已打开原页**
> - 🟡 **原页打不开，但通过 GitHub 上的第三方镜像/抓取文件读到了全文或元数据**（镜像链接在来源清单里）
> - ⚪ **仅搜索结果摘要可见，未能打开原页**（要上屏的话，请人工再打开原链接确认一遍）

---

## 1. Claude 原文要点（事实 + 数字）

以下全部为【Claude原文】[S1]，已打开 https://claude.com/customers/duvo 核实。

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
| 调价监控基本缺位 | 几千个与大宗商品挂钩的 SKU，"quarterly at best, often not at all" | 【Claude原文】S1 |
| 年度谈判决定全年毛利，却被人工拖慢 | Duvo 官网案例页摘要："the annual negotiation determines the year's margin, but the process was throttled by manual execution, with critical terms buried in thousands of email threads"（关键条款埋在成千上万封邮件里） | 【外部来源 S10】⚪ 仅搜索摘要 |
| 员工充当"人肉 API" | Omni Talk 播客节目简介："Why retail employees spend too much time acting as 'human APIs' between disconnected systems" | 【外部来源 S7】🟡 GitHub 镜像读到节目简介全文 |
| 管理层并不真正了解自己的流程 | Omni Talk 播客时间轴："00:11:07 – The reality that most leaders don't actually know their own processes" | 【外部来源 S6】🟡 |
| 创始人的亲身经历 | Čupr 在 Rohlik 看到团队每天在 SAP、供应商门户、邮件、表格、电话之间搬数据、追确认、修重复问题（第三方研究笔记对其 Substack 创始文章的中文转述） | 【外部来源 S17】🟡 第三方转述，原文未打开 |
| Duvo 本身就源于 Rohlik 的经验 | Lupa.cz："Duvo staví AI agenty, kteří dokážou vykonávat práci přímo ve firemních systémech, a vzniklo na základě zkušeností v Rohlíku."（Duvo 构建能直接在企业系统里干活的 AI 智能体，它是基于在 Rohlík 的经验而创立的。） | 【外部来源 S8】🟡 |

---

## 3. 落地过程（FDE 怎么做的）

> 说明：Claude 原文和外部来源**都没有**逐步描述 Rohlik 项目的驻场过程。下面按"公开信息能支撑到的程度"来还原，每一步都标了来源；拼不出来的地方明确写"未找到公开信息"。

**第 0 步：谁来落地，以及为什么他们懂业务**
- Duvo 三位联合创始人都来自 Rohlik：Čupr（Rohlik 创始人兼 CEO）、Marek Paris 和 Martin Pecha（Rohlik 前高管）。【外部来源 S8】🟡 Lupa.cz："Čupr spustil Duvo spolu s Markem Parisem a Martinem Pechou z Rohlíku loni."（Čupr 去年和来自 Rohlík 的 Marek Paris、Martin Pecha 一起创办了 Duvo。）另有种子轮报道称三人为 "former top managers of Rohlik" 【S15】⚪。
- 换句话说，这个案例里的"FDE"对客户业务几乎是内部人级别的熟悉。这一点对叙事有利，但也是被质疑的焦点。

**第 1 步：先把"真实流程"画出来，再谈自动化**
- Duvo 有一个专门做流程测绘的产品，叫 **Duvo Clarity**。Duvo 创始产品工程师 Daniel Bukac 在 Lisbon AI 2026 的讲者简介里写道：
  > "I was the second engineer to join Duvo AI, where I led our browsing and computer-use work before taking on Duvo Clarity - a process mapping engine that helps companies understand how they actually operate before they try to automate it." 【外部来源 S5】✅
- 他的演讲摘要透露了 Clarity 的一种采集方式：一个实时语音 agent 一边和操作员对话，一边"看"操作员的屏幕；后台由 Claude 每隔几秒读一次对话转写和截图，维护一份标准的流程状态。
  > "a real-time voice agent that watches your screen as you work. Built for Clarity." / "Claude reads the transcript + screenshots every few seconds and keeps the canonical state" 【S5】✅
  - 【编剧建议】这相当于把传统 FDE 的"坐在业务员旁边看他怎么干活（shadowing）"做成了产品。但**没有公开信息**说明 Rohlik 项目是否用过这个工具。Clarity 的推出时间也无法确认；Bukac 的简介说明他是先做浏览器/computer use，后来才接手 Clarity，所以它很可能晚于 Rohlik 早期部署。
- 创始人在播客里把这套思路讲成方法论：Omni Talk 2026-03-30 节目时间轴有 "00:14:32 – Agentic process mapping and Duvo Clarity explained"、"00:19:41 – How AI analyzes workflows and recommends improvements"、"00:44:57 – Where to start with AI: process first, not data" 【S6】🟡。
- 在新客户那里也是同样的顺序。Lupa.cz 报道 Duvo 拿下 Alza：
  > "V Alze se má nejdřív začít s mapováním, jak jednotlivé procesy skutečně fungují. Pak má podle Duvo nastoupit jejich přestavba s využitím AI."（在 Alza，第一步是摸清各个流程实际怎么运转，然后按 Duvo 的说法，再用 AI 重构这些流程。）【S8】🟡
- Čupr 的 Substack 文章 "What the hell does Duvo do?" 的搜索摘要："Duvo maps how operations actually run, identifies the work that should run, redesigns the process, and then runs the improved version with AI agents." 【S16】⚪

**第 2 步：破冰场景，挑一个"从来没人干过"的流程**
- Claude 原文重点展示的是**大宗商品挂钩 SKU 的持续价格监控 + 自动发起供应商沟通**：第一周 €1.45M 年化节省，覆盖 120+ SKU、15+ 家供应商【Claude原文 S1】。Rohlik CRO 那句 "That was one process… We're now running dozens" 说明它是后来扩展出几十个流程的起点。
  - 口径提醒：原文**没有明确说**这是 Rohlik 按时间顺序上线的第一个流程，只能说它是"被当作起点来讲"的那个。
- 这个 agent 具体怎么干活，只有搜索摘要：读取供应商发来的调价邮件，分析原材料、人工、包装、运输成本和供应商可接受的毛利，然后代表零售商在 SKU 层面回复接受或拒绝 【S18】⚪。Duvo 另有一个 "Commodity Price Tracker"，在供应商的原料成本明显下降时提醒品类团队去重新谈价（仅搜索摘要，具体出处页无法确定，列为待核实线索）。

**第 3 步：不等 IT 接口，直接操作现有界面**
- 【Claude原文 S1】"Duvo's agents operate these systems through their actual interfaces, not through APIs that may not exist." Ondrej Romancov（产品工程负责人）："Claude's computer use and MCP integrations are what made this technically possible… Before that, the heterogeneity of enterprise stacks was an unsolvable problem for automation."
- Marek Paris："Not because someone built an integration… Duvo works through the same screens the team was using." 【S1】

**第 4 步：人机分工，高风险动作设审批闸口，人的判断沉淀下来**
- 【Claude原文 S1】高风险动作要人工审批，人的回复会被持久化，供之后的运行复用。
- Duvo 官方开源的 CLI 技能文档里写明了 agent 运行中途暂停、等人批准的机制：
  > "Some agents pause for human approval mid-run." 支持 `duvo runs respond "$run_id" --approve / --deny` 【外部来源 S4】✅（duvoai 官方 GitHub）
- 供应商情绪由人来兜底（搜索摘要）："If a supplier is angry or rejecting too many of the offers, Duvo.ai will notify the retailer and have them respond." 【S18】⚪

**第 5 步：上线速度与评测方式**
- 【Claude原文 S1】从第一次沟通到带"实测节省"的生产部署，平均 8 周；采用 Agent SDK 后，几天内就进入生产。
- 评测口径：用"年化节省（annualized savings）"和业务 KPI（确认率、可得率）衡量，没有披露模型层面的评测方法。**未找到公开信息**说明 Rohlik 项目用了什么对照组或基线计算方法。

**第 6 步：从一个流程扩展到几十个**
- 【Claude原文 S1】"That was one process… We're now running dozens."；"Automated ordering surfaces supplier lead-time issues that the returns team can act on."
- 流程覆盖面：促销配置、供应商入驻催办、供应链计划（可得率）、入库确认、年度谈判【S1】。以下几项 Duvo 官网案例只看到标题或第三方转录，未能核实原页：月结差异报表 100% 自动取数、月结时间约缩短 10%【S12】⚪；发票对账保护 €2.1M 营收和 €1.4M 毛利；促销毛利 17%→27%【S22/S23，第三方】。

**第 7 步：FDE 这个岗位在 Duvo 具体做什么（招聘描述）**
- 以下为多个招聘聚合站的搜索摘要 【S14】⚪（原页 freehire.me / dreamworkhq.com / ziprecruiter / fwddeploy.com 均被代理拦截）：
  > "FDEs are how Duvo brings AI to life inside our customers… sitting at the front line, mapping workflows on the Duvo platform, improving underlying processes, and turning the result into running agents that deliver tangible business impact."
  > 职责覆盖 "scoping, build, debug, handover, and expansion, with ownership of the customer outcome end to end"
  > "You will write the glue: integration scripts, agent configurations, data transformations, prototypes, whatever it takes to get an agent running against a customer's actual systems."
  > "deployed directly with clients, mostly in onsite/hybrid mode of work, with significant travel."
- 该职位（美国）截至 2026-08-26 仍在招聘，申请链接为 Ashby 招聘页 【S14b】✅（第三方职位聚合表，已在 GitHub 上打开）。
- 旁证（非官方）：GitHub 上有一位应聘者公开了自己的 "Duvo Forward Deployed Engineer exercise" 仓库。从内容看，笔试是 60 分钟录屏，任务是给一家虚构零售商搭一个补货工具服务器；他的设计原则是"业务规则和计算不交给大模型，由服务端确定性执行" 【S24】✅。这只能说明应聘者怎么理解这个岗位，**不代表 Duvo 官方做法**。

**时间线（已知部分）**
- 2024 年底：Credo Ventures 投了 pre-seed（第三方数据集的记录，可信度低）【S25】
- 2025-12-02 前后：宣布 1500 万美元种子轮（Index Ventures 领投；Credo、Northzone、Puzzle 跟投）【S15】⚪/🟡
- 2026-03-30：Omni Talk 播客上 Čupr 讲流程测绘和 Clarity 【S6】🟡
- 2026-04-03：Claude 客户故事发布 【S1b】✅
- 2026-06：Shoptalk Europe 现场采访，Čupr 的头衔是 "Co-Founder and CEO of duvo.ai and CEO of the Rohlik Group" 【S7】🟡
- 2026-07-24：Lupa.cz 报道拿下 Alza；已知客户包括 Rohlik Group 和 Notino 【S8】🟡
- 2026-08：仍在招美国 FDE 【S14b】✅

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

**反转 2：等 IT 做接口集成 → 让 AI 像人一样操作现有屏幕（【Claude原文】S1）**
- 原本以为：自动化需要干净的 API 和 IT 集成。
- 现场情况：没有干净的 API，IT 排期"要好几年"，每家公司技术栈都不一样。
- 调整后：通过 computer use + MCP，直接在 SAP GUI、供应商门户这些现有界面上操作。
- 效果：可得率两周内从 78% 升到 93%，"不是因为有人做了集成"。
- 原句：
  > "Traditional automation stalls because there are no clean APIs, the IT backlog is years long, and every exception requires judgment."
  > "Not because someone built an integration," Paris said. "Duvo works through the same screens the team was using. It just doesn't forget, doesn't deprioritize, and doesn't stop at the top 20 suppliers."
- 外部旁证：Duvo 官网上有一个"两周可得率 +15%，不用 API、不依赖 IT"的案例（搜索结果标题："See how DUVO improved stock availability by 15% in 2 weeks — with no APIs and no IT dependency."）【S13】⚪。注意这个案例在第三方资料里被归到 Pilulka，而不是 Rohlik，见第 7 节。

**反转 3：价值不在"把慢的变快"，而在"把没人干的干起来"（【Claude原文】S1，认知反转）**
- 原本以为：AI 的价值是给现有流程提速。
- 实际发现：最大的钱藏在从来没被系统执行过的流程里。调价监控以前"最多一季度一次，经常不做"，头部 20 家供应商之外根本没人管。
- 调整后：让 agent 持续监控，自动发起沟通。
- 效果：第一周 €1.45M 年化节省，三个月 €2.8M+。
- 原句：
  > "Not from a process that was slow, but from one the company had never been able to run. 'This is the clearest example of "abandoned work" becoming real value,' Paris said."

**反转 4：以为流程是清楚的 → 先得搞清楚流程到底是什么（【外部来源】，属于产品层面的转向；"转向"这个判断本身是【编剧推断】）**
- 种子轮时的对外说法偏"描述需求、即可执行"：Čupr 的 Substack 搜索摘要写 "You describe what needs to happen, and Duvo executes it end‑to‑end across your tools" 【S16】⚪；TechFundingNews 报道标题为 "…Duvo nabs $15M from Index Ventures for no-code retail AI" 【S15】⚪（仅标题）。
- 2026 年的公开表述转向"先测绘真实流程"：
  - Omni Talk 节目时间轴 "The reality that most leaders don't actually know their own processes"，以及 "Where to start with AI: process first, not data" 【S6】🟡
  - Daniel Bukac："a process mapping engine that helps companies understand how they actually operate before they try to automate it" 【S5】✅
  - Alza 项目 "nejdřív začít s mapováním, jak jednotlivé procesy skutečně fungují"（先从测绘流程的真实运转开始）【S8】🟡
  - 第三方研究笔记记录的 Duvo 官网 compare 页原话："A builder is half the job."（只给一个搭建器，只做了一半的事）【S22】🟡 第三方快照
- 【编剧建议】可以讲成"从卖 agent 搭建工具，变成先派人摸清流程再交付"。但**没有任何来源明确说 Duvo 'pivot' 了**，上屏时请用"后来他们发现 / 他们越来越强调"这类措辞，不要说"他们放弃了 X"。

**反转 5：人批准一次，系统就记住一次（【Claude原文】S1，人机协作设计）**
- 原本：例外处理全靠老员工的经验判断，人一走经验就没了。
- 设计：高风险动作必须人工审批；人的决定被持久化，下次同类情况直接复用。
- 效果：原句是 "Over time, the system accumulates the operational judgment that used to exist only in people's heads." 原文没有给出这个机制本身的量化效果。

**反转 6：选型，多家模型对比 → 押注单一供应商（【Claude原文】S1）**
- 原句："After evaluating multiple model providers, Duvo committed to a single-provider architecture on Claude."
- 理由是在混乱、模糊任务上的表现。Čupr："Parsing a supplier email that half-confirms a delivery while raising a pricing dispute. Navigating a SAP GUI screen with dozens of fields. Making judgment calls on exceptions without hallucinating business rules."
- 【编剧建议】"一封邮件里一半在确认交货、一半在跟你吵价格"，这句画面感很强，可以直接用。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 年化节省（Rohlik，3 个月累计） | 这些流程"从未被系统性执行" | €2.8M+ 年化 | 【Claude原文】S1 | "annualized"指按年推算的数字，不是已入账现金；Duvo/Rohlik 自报 |
| 首周年化节省（大宗商品调价监控） | 最多一季度查一次，经常不查 | 首周 €1.45M 年化；120+ SKU、15+ 供应商 | 【Claude原文】S1 | 第三方仿站文本写的是 "€1.45M savings **surfaced** in one week"（识别出的节省）【S23，未核实】，和"captured"的口径可能不同 |
| 年度供应商谈判周期 | —— | 缩短 1 个月；约 80% 自动化（准备→合同生成→写回 ERP） | 【Claude原文】S1 | Duvo 官网案例写的是 "automated **70–80%** … cutting the annual cycle by 1 month and freeing **~60 FTE**" 【S10 ⚪】；两处百分比口径不同 |
| 谈判释放人力 | —— | 约 60 FTE（全职人力当量） | 【外部来源 S10】⚪ 仅搜索摘要 | Claude 原文没有这个数字；60 FTE 是否指全年累计工时折算，不明 |
| 促销配置工作量 | 基线 | 下降 65–70% | 【Claude原文】S1 | 没说是时间还是人工量 |
| 供应商入驻催办 | 基线 | 下降 50–70% | 【Claude原文】S1 | 同上 |
| 商品可得率（供应链计划） | 78% | 93%（两周内） | 【Claude原文】S1 | 78→93 正好是 +15 个百分点，和 Duvo 官网"Pilulka 两周可得率 +15%"高度吻合【S13 ⚪/S22/S23】，有可能是归属混淆，见第 7 节 |
| 入库交货确认率 | 52% | 90%，每天覆盖所有供应商 | 【Claude原文】S1 | 第三方仿站文本写作"inbound confirmations **before cut-off**"【S23 未核实】 |
| 团队产能释放（跨客户平均） | —— | 40%+ | 【Claude原文】S1 | 原文写明 "The team also estimates"，是 Duvo 的估算；种子轮时期的说法是"early deployments… roughly a 40% reduction in manual work"【S16 ⚪】 |
| 从首次沟通到生产部署（跨客户平均） | —— | 平均 8 周 | 【Claude原文】S1 | 第三方快照记录 Duvo 官网写的是 "4 weeks first live process"【S22 🟡】，种子轮标题是 "goes live in weeks"【S15】；口径不同（首个流程上线 vs 带实测节省的生产部署） |
| 采用 Agent SDK 后上线 | —— | 几天内进入生产 | 【Claude原文】S1 | 这是 Duvo 自身的工程指标，不是 Rohlik 的 |
| 月结差异报表 | 人工取数 | 100% 自动取数，月结时间约 -10% | 【外部来源 S12】⚪ 仅标题 | 未能打开原页 |
| 发票对账 | —— | 保护 €2.1M 营收和 €1.4M 毛利/年 | 【外部来源 S22/S23】第三方转录 | 未能打开 duvo.ai 原页 |
| 促销毛利 | 17% | 27% | 【外部来源 S22/S23】第三方转录 | 同上 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **先找"被放弃的工作"，而不是"慢的工作"。** 依据：【Claude原文 S1】中 "abandoned work" 和 "Not from a process that was slow…" 两处。
   - 好处一：没有基线，任何产出都是增量，ROI 好算。
   - 好处二：不会威胁到现有岗位，阻力小。
2. **先测绘真实流程（过程真相），再改流程，最后自动化。** 依据：S5（Clarity 的定位）、S6（"process first, not data"）、S8（Alza 从测绘开始）、S16（先 map → 再 redesign → 再 run）。
3. **不等接口，走现有界面。** computer use 和浏览器操作绕开"IT 排期要好几年"的瓶颈。依据：【Claude原文 S1】；S5（Bukac 早期负责 browsing/computer-use）。
4. **一个任务一个 agent，把工具都给它，避免交接丢上下文。** 依据：【Claude原文 S1】Romancov 的原话。
5. **高风险动作设人工闸口，把人的每次决定沉淀为规则。** 依据：【Claude原文 S1】；S4（官方 CLI 的人工审批接口）；S18（供应商情绪升级给人处理 ⚪）。
6. **用钱说话，几周内给出实测节省，再沿着流程的上下游扩展。** 例如订货环节暴露供应商交期问题，交给退货团队处理。依据：【Claude原文 S1】的 "Expansion within accounts happens naturally…"
7. **FDE 对结果负全责：scoping → build → debug → handover → expansion。** 依据：S14 ⚪ 招聘摘要。候选人仓库里"业务规则不交给大模型做算术"的做法可作为旁证（S24，非官方）。
8. **按"流程运行次数"计费，不按席位或 token。** 依据：S22，第三方对 Duvo pricing.md 的转述（🟡，未能打开 duvo.ai 原页），**上屏前需人工核实**。

---

## 7. 数字严谨性 & "评论区喷子"防御

1. **关联方问题（最大的风险点）**
   - Rohlik Group 的 CEO 就是 Duvo 的 CEO Tomáš Čupr：
     - Omni Talk 节目简介："Tomáš Čupr, Co-Founder and CEO of duvo.ai and CEO of the Rohlik Group" 【S7】🟡
     - LinkedIn 标题（搜索结果）："CEO @ duvo.ai, CEO @ Rohlik Group" 【S21】⚪
     - GitHub 个人简介："Serial founder — Slevomat → Dáme Jídlo → Rohlik Group → Duvo.ai" 【S2】✅
   - 另一个客户 Pilulka 也和 Čupr 有关：Lupa.cz 一篇讲 QuantumSpring 的文章（经 GitHub 镜像读到全文，原文 URL 未找到）说 Čupr 通过 TCF Capital "ovládá i další firmy jako Pilulka nebo ambiciózní AI projekt Duvo"（还控制着 Pilulka 和雄心勃勃的 AI 项目 Duvo 等公司）【S26】🟡。
   - 防御话术（【编剧建议】）：主动承认这一点，把它讲成"创始人先拿自己的公司试刀（dogfooding）"。再补上外部客户 Notino、Alza（Lupa.cz 报道，S8）作为"走出自家公司"的证据。**不要**把 Rohlik 说成"一个陌生的大客户"。
2. **"年化节省"不等于"已实现节省"。** €1.45M 和 €2.8M+ 都是 annualized。第三方仿站文本里，€1.45M 用的是 "surfaced"（识别出）【S23，未核实】。上屏建议写成"年化节省 €280 万+（公司口径）"。
3. **40% 是公司估算。** 原文写 "The team also estimates that 40%…"，而且是跨客户平均，不是 Rohlik 单独的数字。
4. **80% 和 70–80% 并存。** Claude 原文写 "approximately 80%"，Duvo 官网案例写 "70–80%"【S10 ⚪】。建议上屏用"约七到八成"。
5. **78%→93% 可能有归属问题。** Claude 原文把"两周可得率 78%→93%"写在 Rohlik 名下。Duvo 官网有一个"两周可得率 +15%、不用 API"的案例（S13 ⚪ 只看到标题，没显示客户名），两份独立的第三方资料都把它归到 **Pilulka**（S22 研究笔记、S23 仿站文本；Pilulka 案例还有供应链经理 Petr Marek 的引语）。两者可能是同一个案例，也可能两家各做了一次。**建议不要把"78%→93%"当主数字。**
6. **营收口径。** Claude 原文写 Rohlik "more than €1.5 billion in revenue"，Omni Talk 写 "$1.5B+ pan-European e-grocer" 【S6】，币种不一致。另外 "Europe's leading online grocer" 是自我描述。
7. **"8 周"的口径。** 这是跨客户平均，样本量没有披露。第三方快照记录官网写 "4 weeks first live process" 【S22】。两个口径不同：一个是带实测节省的生产部署，一个是首个流程上线。
8. **来源性质。** Claude 客户故事是 Anthropic 的营销内容，Duvo "built entirely on Claude"，双方利益一致。**未找到**独立审计或第三方复核。
9. **负面报道 / 质疑。** 在有限的检索里**没有找到**负面报道，也没有找到 Reddit/HN 讨论。需要说明：本次 WebSearch 的额度已用尽，HN/Reddit 也被代理拦截，所以"没找到"不等于"不存在"。
10. **可能的评论区问题（【编剧建议】，需要准备回答）**
    - "AI 跟供应商谈价，供应商不会反感吗？"——可以引用 S18 ⚪："If a supplier is angry or rejecting too many of the offers, Duvo.ai will notify the retailer and have them respond."
    - "AI 打电话合规吗？"——**未找到公开信息**。
    - "数据安全？"——Claude 原文说每次 API 调用都在 Zero Data Retention 下运行 【S1】；第三方快照提到官网列有 RBAC、SSO、审计轨迹、人工复核 【S22】。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下全部是**创作建议**，依据的事实都标了来源编号。

- **开场钩子 A（反常识）**："一家营收 15 亿欧元的生鲜电商，几千个跟大宗商品挂钩的商品，调价这件事以前最多一个季度查一次，经常一次都没查。AI 上线第一周，年化省下 145 万欧元。"〔S1〕
- **开场钩子 B（被放弃的工作）**："采购团队只顾得上前 20 大供应商。剩下几百个小动作，每个都不起眼，加起来值几百万欧元，但从来没人碰过。"〔S1〕
- **中国化类比**：可以类比国内商超、生鲜电商的"年框谈判"和"原料涨价函"：供应商发来调价邮件，品类经理只来得及处理头部品牌，长尾供应商的调价申请要么直接通过，要么一拖再拖。〔类比属于编剧建议；事实部分依据 S1、S18〕
- **反转桥段 1（接力赛 → 全能选手）**："一开始他们让几个 AI 像接力赛一样传棒，结果棒传着传着就掉了，上下文丢了。后来改成一个 AI 从头跑到尾，工具全给它。"〔S1 Romancov 原话〕
- **反转桥段 2（等接口 → 直接看屏幕）**："IT 说接口要排两年。他们干脆不等了，让 AI 像新员工一样坐到 SAP 屏幕前点鼠标。"〔S1："the IT backlog is years long"；"works through the same screens the team was using"〕
- **反转桥段 3（先别急着自动化）**："他们后来越来越强调一件事：老板们其实并不真正知道自己公司的流程是怎么跑的。所以第一步不是写 agent，而是让 AI 一边看员工操作屏幕、一边跟员工聊，把真实流程画出来。"〔S5、S6；"越来越强调"的措辞见第 4 节反转 4 的提醒〕
- **金句备选**：
  - "It just doesn't forget, doesn't deprioritize, and doesn't stop at the top 20 suppliers."（它不会忘、不会往后推，也不会只盯前 20 大供应商。）〔S1〕
  - "That was one process. We're now running dozens."（那只是一个流程，我们现在跑着几十个。）——Rohlik CRO〔S1〕
  - "一封邮件里，一半在确认交货，一半在跟你吵价格。"〔S1 Čupr 原话意译〕
- **FDE 画像**：驻场或混合办公、出差多；从需求梳理、搭建、调试、交接一路做到扩展，对结果负全责；会写"胶水代码"。〔S14 ⚪ 仅搜索摘要，上屏前请人工打开招聘原页核实〕
- **结尾升华**："AI 落地的第一个项目，别选'让慢的变快'，选'把没人干的干起来'：没有基线之争，也不抢任何人的饭碗。"〔依据 S1 的 abandoned work 论述〕
- **诚实处理关联方的桥段（建议保留）**："这个案例有一点要说清楚：Duvo 的 CEO 同时也是 Rohlik 的 CEO。他先在自己的公司把这套东西跑通，再拿去卖给 Alza、Notino。"〔S7、S8〕

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S1 | Duvo automates enterprise operations across legacy systems with Claude | https://claude.com/customers/duvo | Claude原文 | 2026-04-03 | ✅ 已打开（WebFetch + curl 全文） |
| S1b | Claude 客户故事列表页（页面数据里 Duvo 条目的 `date` 字段） | https://claude.com/customers | Claude原文（元数据） | —— | ✅ 已打开（curl，读到 `"date":"2026-04-03T00:00:00.000Z"`） |
| S2 | Tomas Cupr GitHub 个人主页 | https://github.com/tomascupr | 创始人个人页 | —— | ✅ 已打开 |
| S3 | Duvo 官方 GitHub 组织页 + profile README | https://github.com/duvoai ；https://github.com/duvoai/.github/blob/main/profile/README.md | 公司官方 | —— | ✅ 已打开（README 原文："Duvo is an execution platform for grocery, retail, and CPG operations. It captures how work actually runs — including judgment that never lands in a system of record…"；地点 Prague, Czechia） |
| S4 | duvoai/skills：duvo-cli 工作流文档（人工审批） | https://github.com/duvoai/skills/blob/main/skills/duvo-cli/references/workflows.md | 公司官方（开源） | —— | ✅ 已打开 |
| S5 | Lisbon AI 2026 讲者数据：Daniel Bukac（Duvo 创始产品工程师），演讲 "Screen-aware voice agents" | https://github.com/lisbon-ai/website/blob/main/src/data/speakers.ts （活动官网 https://lisbonai.org 未能打开） | 会议演讲 | 活动日期 2026-09-23 至 24 | ✅ 已打开（GitHub 源文件） |
| S6 | Omni Talk Retail：How AI Can Tell You WHERE to Use AI in Your Retail Operations With Tomáš Čupr | 原页 https://omnitalkretail.captivate.fm/episode/duvo-spotlight ；镜像 https://github.com/samnguyen80/commerce-brain/blob/main/corpus/podcast/omnitalk-pod/how-ai-can-tell-you-where-to-use-ai-in-your-retail-operations-with-tom-upr-spotl.md | 播客（节目简介） | 2026-03-30 | 🟡 原页被拦截；经 GitHub 镜像读到节目简介和时间轴全文（没有逐字稿） |
| S7 | Omni Talk Retail：The Biggest AI Mistake Is Waiting for Perfect Data（5IM，Shoptalk Europe 现场） | 原页 https://omnitalkretail.captivate.fm/episode/the-biggest-ai-mistake-waiting-for-perfect-data-5im ；镜像 https://github.com/samnguyen80/commerce-brain/blob/main/corpus/podcast/omnitalk-pod/the-biggest-ai-mistake-is-waiting-for-perfect-data-5im.md | 播客（节目简介） | 2026-06-14 | 🟡 同上 |
| S8 | Lupa.cz：Čuprův AI startup jde po velkém retailu. Získal Alzu, kde má začít automatizovat（作者 Iva Brejlová） | 原页 https://www.lupa.cz/aktuality/cupruv-ai-startup-jde-po-velkem-retailu-ziskal-alzu-kde-ma-zacit-automatizovat/ ；RSS 元数据镜像 https://github.com/kevinozer/ai-news/blob/main/inbox/2026-07-25.json ；正文转载 https://github.com/honzuejtt-ops/Honzueink/blob/main/eindata/zpravy/aktualni/detail/fa1a16c98fbc.txt | 媒体（捷克语） | 2026-07-24 | 🟡 原页被拦截；经镜像读到标题、日期、作者和正文转载（注明 "zdroj: Lupa.cz"） |
| S9 | CzechCrunch：Zadám AI úkol, jdu spát, ráno se probudím a je hotovo…（Money Maker 播客） | 原页 https://cc.cz/zadam-ai-ukol-jdu-spat-rano-se-probudim-a-je-hotovo-to-je-ta-opravdova-magie-rika-tomas-cupr/ ；RSS 镜像 https://github.com/kevinozer/ai-news/blob/main/inbox/2026-06-23.json | 媒体/播客（捷克语） | 2026-06-23 | 🟡 只读到标题和摘要，正文未读（本文没有引用其内容） |
| S10 | Duvo 客户案例：How DUVO cut the annual negotiation by 1 month and freed 60 FTE（Rohlik） | https://www.duvo.ai/customer-stories/how-duvo-cut-the-annual-negotiation-by-1-month-and-freed-60-fte | 公司官网案例 | 未知 | ⚪ 仅搜索结果摘要可见，未能打开原页 |
| S11 | G2 附件 PDF："How Rohlik Group cut a month off annual…" | https://images.g2crowd.com/uploads/attachment/file/1579860/case-study-annual-negotiations.pdf | 公司案例 PDF | 未知 | ⚪ 仅搜索结果标题可见 |
| S12 | Duvo 客户案例：variance report retrieval 100% automated，month-end close 约 -10%（Rohlik） | https://www.duvo.ai/customer-stories/how-duvo-automated-100-of-variance-report-retrieval-and-cut-month-end-close-by-10 | 公司官网案例 | 未知 | ⚪ 仅搜索结果标题可见 |
| S13 | Duvo 客户案例：improved stock availability by 15% in 2 weeks — with no APIs and no IT dependency | https://www.duvo.ai/customer-stories/customer-stories-how-duvo-improved-availability-by-15--in-2-weeks-with-no-apis-and-no-it | 公司官网案例 | 未知 | ⚪ 仅搜索结果标题可见 |
| S14 | Duvo Forward Deployed Engineer 招聘（EU/UK、US） | https://freehire.me/jobs/forward-deployed-engineer-eu-uk-based-duvo-yj6snekc ；https://www.dreamworkhq.com/job/14716441-2262-4cc4-be36-0a648be11ba9 ；https://www.fwddeploy.com/jobs/forward-deployed-engineer-us-based-633e4e84 ；https://www.ziprecruiter.com/c/Duvo.ai/Job/Forward-Deployed-Engineer-(US-Based)/-in-New-York,NY?jid=7a45abd1ae99e8c7 | 招聘 | 未知 | ⚪ 仅搜索结果摘要可见，未能打开原页 |
| S14b | 第三方职位聚合表：Duvo Inc — Forward Deployed Engineer (US Based)，2026-08-26，Ashby 申请链接 | https://github.com/kevin-2023-code/New-Grad-Opportunities/blob/master/lists/remote.md （Ashby 原页 https://jobs.ashbyhq.com/duvo/23feed80-3cae-4a73-a578-780ed0bc0f4a 被拦截） | 招聘（聚合） | 2026-08-26 | ✅ 聚合表已打开；Ashby 原页未能打开 |
| S15 | 种子轮 1500 万美元：Duvo 官方博客 / TechFundingNews / Lupa.cz | https://blog.duvo.ai/duvo.ai-raises-15-million-to-give-retail-teams-an-ai-workforce-that-goes-live-in-weeks-cutting-manual-work-by-40 ；https://techfundingnews.com/duvo-ai-retail-automation-seed-funding/ ；https://www.lupa.cz/aktuality/cupr-vytvoril-ai-silu-pro-retail-spousti-duvo-ai-a-ziskava-na-nej-15-milionu-dolaru/ | 公司博客 / 媒体 | 2025-12（第三方笔记记为 2025-12-02） | ⚪ 仅搜索结果摘要可见（融资额、领投方、创始人信息同时见于 S8 镜像正文 🟡） |
| S16 | Tomas Cupr Substack：What the hell does Duvo do? | https://tomascupr.substack.com/p/what-the-hell-does-duvo-do | 创始人博客 | 未知 | ⚪ 仅搜索结果摘要可见 |
| S17 | Tomas Cupr Substack：Why I Co-Founded Duvo.ai | https://tomascupr.substack.com/p/why-i-co-founded-duvoai ；第三方中文转述 https://github.com/yan5xu/oh-my-ai-company/blob/main/bodies/source.substack.tomas-cupr-duvo-2025-12-02.md | 创始人博客 | 2025-12-02 | 🟡 原页被拦截；只读到第三方中文转述 |
| S18 | Oton Technology：Retailers Use AI Agents to Replace Merchant Workloads | https://otontechnology.com/retailers-ai-agents-merchant-merchandising/ | 媒体/博客 | 未知 | ⚪ 仅搜索结果摘要可见 |
| S20 | Czech Retail Days 分会场：Rohlik Group and duvo.ai: Artificial Intelligence in Category Management | https://www.czechretaildays.cz/en/session/rohlik-group-and-duvo-ai-artificial-intelligence-in-category-management/ | 会议 | 未知 | ⚪ 仅搜索结果标题可见（能证明双方在品类管理 AI 上有联合演讲，内容未知） |
| S21 | Tomáš Čupr LinkedIn（标题 "CEO @ duvo.ai, CEO @ Rohlik Group…"） | https://cz.linkedin.com/in/tomascupr | 个人页 | —— | ⚪ 仅搜索结果标题可见 |
| S22 | 第三方研究笔记：Duvo（含 2026-07-09 官网 / compare / pricing 快照要点） | https://github.com/yan5xu/oh-my-ai-company/blob/main/bodies/company.duvo.md ；https://github.com/yan5xu/oh-my-ai-company/blob/main/bodies/source.website.duvo-home-2026-07-09.md | 第三方研究笔记（非官方） | 2026-07-09 快照 | 🟡 已打开笔记本身；其中引用的 duvo.ai 原页未能打开 |
| S23 | 第三方 Duvo 仿站仓库：客户案例文本 stories.ts | https://github.com/TrueTwist-Organization/duvo-clone/blob/main/src/content/stories.ts | 第三方仿站（**可信度低**，只作交叉比对） | —— | 🟡 已打开；无法确认是否忠实转录 duvo.ai |
| S24 | 应聘者公开仓库：Duvo Forward Deployed Engineer exercise | https://github.com/gitchrisqueen/duvo | 个人仓库（非官方） | 2026-08 至 09 | ✅ 已打开 |
| S25 | 第三方数据集：Credo Ventures 投资组合里的 Duvo.ai（pre-seed） | https://github.com/mchlkucera/localproblems/blob/main/data/signals/funded/2026-08-14.jsonl | 第三方数据（可信度低） | 条目日期 2024-12-31 | ✅ 已打开（只作时间线旁证） |
| S26 | Lupa.cz 关于 QuantumSpring 的文章转载（提到 TCF Capital 控制 Pilulka 和 Duvo） | https://github.com/honzuejtt-ops/Honzueink/blob/main/eindata/zpravy/aktualni/detail/4707c40dc136.txt （Lupa.cz 原文 URL 未找到；CzechCrunch 同题报道 https://cc.cz/v-zari-ohlasili-vznik-ted-se-tomas-cupr-ze-studia-na-vyvoj-ai-stahuje-podil-vykoupil-druhy-zakladatel/ 未能打开） | 媒体转载（捷克语） | 约 2026-06 | 🟡 转载全文已读，原页未核实 |

### 信息缺口 / 待核实线索（交给人工补查）
- **Rohlik 项目的驻场细节**：谁去的、待了多久、先访谈了哪些品类经理或采购员、第一个上线的流程到底是哪一个。**未找到公开信息**。
- **捷克语深度采访**：CzechCrunch Money Maker 播客（S9）、Newstream "Čupr sází na AI. Duvo má změnit způsob práce ve firmách"（https://www.newstream.cz/leaders/jak-tomas-cupr-propadl-ai-nudil-jsem-se-a-zrychlil-jsem-se ，仅搜索标题）、CzechCrunch 种子轮报道（https://cc.cz/tomas-cupr-ma-novy-ai-startup-pres-340-milionu-od-investoru-a-hlasi-vyresime-to-co-firmy-brzdi/ ，仅搜索标题）。这些很可能有落地细节，但都被代理拦截了。
- **Duvo 官网案例全文**（S10–S13）、**G2 PDF**（S11）、**FDE 招聘原页**（S14）：需要人工打开，核实原句。
- **Omni Talk 两期播客的逐字稿**（S6、S7）：时间轴 23:26 处的 "Real-world examples including missed supplier follow-ups and margin leakage" 很可能有 Rohlik 的现场故事，建议人工去听。
- "Commodity Price Tracker" 的描述（在供应商原料成本下降时提醒重新谈价）只见于搜索摘要，出处页不能确定。
