# 案例：Parcha — 用 Claude Agent SDK 把"每家银行一套定制流程"的合规尽调，改成按配置自适应的通用尽调智能体

> **核实状态总说明（请先读）**
> - 本次研究环境的网络出口策略只允许访问 claude.com / anthropic.com / raw.githubusercontent.com 等少数域名；Parcha 官网与博客（parcha.ai、blog.parcha.ai、resources.parcha.com）、grep.ai、LinkedIn、X、Medium、ZenML、Initialized、HN、Airwallex 等**全部被拦截，无法打开原页**。另外，本会话的 WebSearch 配额（200 次）在研究中途用尽。
> - 因此：**只有 S1、S2、S3 是亲自打开并逐字核对过的**；其余外部来源一律标注"仅搜索结果摘要可见，未能打开原页"。这些来源下的"英文表述"来自搜索引擎摘要，**不保证逐字**，引用前必须由人工打开原链接核对。
> - 发布日期中标"由 ID 推算"的，是根据 X（Twitter）状态 ID / LinkedIn activity ID 内嵌的时间戳换算得到，属于技术推算，不是页面上直接看到的日期。

- 行业：金融服务 — 银行与金融科技公司的 KYB/KYC/AML 客户尽职调查（due diligence）、交易监控、制裁/负面新闻筛查【Claude原文 S1】
- 企业规模 / 地区：Claude 页面标注 "Company size: Small"、"Location: North America"【Claude原文 S1】；搜索摘要称公司成立于 2023 年、总部旧金山（仅搜索结果摘要可见，未能打开原页，S22）
- Claude 产品标签：Claude Platform（页面 og:title 为 "Parcha Claude Platform (API) case study"），具体用的是 Claude Agent SDK【Claude原文 S1】
- Claude 故事发布日期：2025-12-05（claude.com/customers 列表页内嵌数据 `"slug":"parcha","date":"2025-12-05T00:00:00.000Z"`，S2 已核实）
- Claude 原文链接：https://claude.com/customers/parcha
- 落地主体（谁是"FDE"）：**供应商自己的核心工程团队（联合创始人 + 工程师），不是第三方集成商**。证据：Claude 原文说 Parcha 的企业方案"每家机构都要定制实施"（S1）；搜索摘要显示 2023 年由联合创始人亲自带"设计合作伙伴"（design partners）做早期落地、给早期客户"高强度支持"（S4/S5，未能打开原页）。**未找到任何以 "Forward Deployed Engineer" 为名的 Parcha 岗位或团队的公开证据**；搜到的招聘岗位是 Applied AI Engineer、Founding Systems/Backend Engineer（S22，未能打开原页）。
- 本案例推荐指数：**3 / 5**
  - 数字充分度（中）：Claude 原文的"3 个月→5 分钟"很抓眼，但口径不清（见第 7 节）；其余数字大多来自 Parcha 自家营销页面。
  - 过程/反转素材（高，但未逐字核实）：创始人自己公开写过"智能体→流程→再回到智能体"的完整反转，还有"副产品吃掉主业"（公司后来改名 Grep、主产品线停掉）的结尾。问题是本次环境打不开原文，**需人工核对原文后才能上屏**。
  - FDE 现场素材（低）：没找到"谁去了哪家银行、坐在谁旁边看了什么"的公开描述。
  - 对中国听众的可迁移性（高）：银行对公开户尽调、反洗钱、跨境支付商户审核，这些场景国内也有；"每家银行流程都不一样"的痛点也通用。
  - 若人工打开并核实 S6、S7 原文，推荐指数可以提到 4。

---

## 1. Claude 原文要点（事实 + 数字）

以下全部来自 S1，已用 WebFetch 打开，并用 curl 下载 HTML 逐字比对过。

1. **头条数字：客户尽调流程耗时从 3 个月降到 5 分钟**
   > "3 months to 5 minutes" / "Customer due diligence workflow time reduced"
   页面 meta 描述写的是：> "Parcha cut customer diligence from 3 months to 5 minutes."
   （口径问题见第 7 节）
2. **号称通过"银行级"模型治理认证**
   > "Bank-grade certification achieved" / "Tools built with Claude models pass the most challenging model governance evaluations in the industry"
   > "Our bank-grade compliant tools are built and certified using Claude models, passing some of the most challenging model governance evaluations in the industry," — Miguel Rios Berrios, CTO
3. **两周做出一个完全智能体化的开源情报（OSINT）调查产品，定位是"反洗钱合规版 Perplexity"**
   > "With the Agent SDK, Parcha developed a fully agentic open-source intelligence research product in just two weeks—essentially "Perplexity for AML compliance.""
   > "The Agent SDK unlocked this capability—we literally would not have built this product without it,"
4. **列出的客户**
   > "The company serves some of the world's largest fintech companies, including Airwallex, Pipe, Flutterwave, and Alloy"
5. **核心痛点：每家机构流程都不一样，限制了能服务的客户类型**
   > "one of the challenges we've always faced is how to scale our product to capture all the unique workflows of every fintech or bank, which has limited the types of customers we could serve."
   > "our product can now adapt to each of our customers' unique needs on the fly, without the need to use a complex workflow editor"
6. **此前自研工作流引擎做了两年**
   > "Parcha had spent two years developing their own workflow engine, but needed to make it work more naturally and flexibly across their entire customer base."
7. **此前工程团队的大部分精力耗在边界情况和僵硬流程上**
   > "Before the Agent SDK, a significant part of our energy was spent on dealing with edge cases and building rigid workflows that, while they solved the problem for most of our current customers, were very hard to generalize to a broader set of use cases,"
8. **交易监控的例子：从"改代码"变成"改配置"**
   > "One institution flags transactions over $10,000 to certain countries, while another monitors velocity patterns or merchant categories. Previously, each variation required custom code. Now, Parcha's Agent SDK-powered system adapts to these requirements through configuration, not reconstruction."
9. **做了一个服务，把 Agent SDK 扩展到任意金融科技公司的 SOP（标准作业流程）**
   > "Parcha built a service extending Agent SDK functionality to any fintech standard operating procedure."
10. **企业版的老问题：销售周期长、集成深、每家都要定制实施**
    > "Parcha's enterprise solution required lengthy sales cycles, deep integrations, and custom implementations for each institution."
11. **隐含的反转：先在内部工程上用 Agent SDK，后来才意识到可以直接做给合规分析师用**
    > "When the team started using the Agent SDK for their own engineering workflows, they realized this agentic framework could power customer-facing compliance workflows that reach analysts directly."
12. **分析师的痛点：人工用 Google 做开源调查**
    > "compliance analysts at every institution spend hours conducting open-source research on businesses and individuals using Google—work that's time-consuming, unauditable, and difficult to standardize."
13. **为什么选 Claude：已经用了两年，看重推理能力和可靠性**
    > "After two years building with Claude models, Parcha selected the Agent SDK based on proven results and deep familiarity with its capabilities."
    > "The team chose Claude specifically for its extended reasoning capabilities and reliability—critical factors for compliance applications where errors have regulatory consequences."
14. **结果：从几个月的定制开发，变成按机构配置、快速上线；商业模式更偏自助**
    > "Compliance processes that previously required months of custom development now deploy rapidly with institution-specific configurations."
    > "Engineering teams have shifted their focus—no more edge cases, no more rigid workflows."
    > "Parcha can serve more types of customers in a more self-serve way."

---

## 2. 背景与痛点（结构化）

| # | 痛点 | 来源 |
|---|---|---|
| P1 | 每家银行/金融科技公司都要做交易监控和客户尽调，但**做法各不相同**。传统做法是为每个客户写一套僵硬的流程，几乎没法复用到别的客户 | 【Claude原文 S1】"they all need to monitor transactions and conduct customer due diligence, but each does it differently." |
| P2 | Parcha 自研工作流引擎花了**两年**，但跨客户用起来不够灵活；"每家机构的独特流程"限制了能服务的客户类型 | 【Claude原文 S1】 |
| P3 | 企业版**销售周期长、集成深、每家都要定制实施**，"几个月的定制开发"才能上线一个合规流程 | 【Claude原文 S1】 |
| P4 | 工程团队大部分精力耗在**边界情况**（edge cases）上 | 【Claude原文 S1】 |
| P5 | 合规分析师花好几个小时**用 Google 人工查企业和个人的公开信息**，费时、无法审计、难以标准化 | 【Claude原文 S1】 |
| P6 | 创始人的切身经历：在 Brex 时，有**几千份企业开户申请**积压在合规审核队列里 | 【外部来源 S18】Kindred Ventures 投资文章（仅搜索结果摘要可见，未能打开原页）。摘要英文表述："a backlog of several thousand business applications at Brex requiring compliance reviews"（非逐字核实） |
| P7 | 单个尽调案件人工耗时：分析师每件**约 45 分钟**，Parcha 称能压到 **3 分钟以内** | 【外部来源 S24】（仅搜索结果摘要可见，未能打开原页；具体出处页面未能确认，候选为 S15）。摘要英文表述："completing business due diligence that previously took analysts 45 minutes per case in under 3 minutes"（非逐字核实） |
| P8 | Pipe 这类放贷/嵌入式金融平台要审核的很多小企业**几乎没有网站**，只有社交媒体页面和网上评价，人工尽调很费劲 | 【外部来源 S23】（仅搜索结果摘要可见，未能打开原页）。摘要英文表述："Many of the companies had limited to no web presence, besides their social media pages and online reviews."（非逐字核实） |
| P9 | 合规场景对准确性要求极高：Claude 原文说这是"出错会有监管后果"的应用 | 【Claude原文 S1】"critical factors for compliance applications where errors have regulatory consequences." |

---

## 3. 落地过程（FDE 怎么做的）

> 说明：Claude 原文只讲到 2025 年的 Agent SDK 阶段。下面按时间线，把创始人博客、投资方文章、产品公告拼起来，还原从 2023 年到 2026 年的完整落地路径。除 S1/S3 外，其他来源**均未能打开原页**，引用只能作线索。

**第 0 步（2023 年，建立设计合作伙伴关系）谁去现场：联合创始人亲自上**
- 2023 年 8 月前后拿到 500 万美元种子轮，由 Kindred Ventures 和 Initialized Capital 领投。当时公司正在和支付、借贷、银行、加密货币领域的早期 beta 客户一起，自动化它们的运营和合规流程【外部来源 S17，仅搜索结果摘要可见，未能打开原页；LinkedIn 帖日期 2023-08-08，由 ID 推算】。
  - 摘要英文表述："Parcha was working with early beta customers in payments, lending, banking, and crypto to automate their operations and compliance workflows."（非逐字核实）
  - 该 LinkedIn 帖转发的报道标题是 "Former Brex duo raises $5 million for new, pre-revenue A.I. agent startup"（这是搜索结果里看到的帖子标题）。
- 产品输入是**客户现成的制度、SOP 和工具**，不是另起炉灶："automate manual workflows in compliance and operations using existing policies, procedures and tools"【外部来源 S17/S4，未能打开原页，非逐字核实】。

**第 1 步（2023 上半年，先快速做原型，拿给设计伙伴验证）**
- 最早用 LangChain 快速搭原型，目的是尽快做出东西给设计合作伙伴验证【外部来源 S4/S5，未能打开原页】。
  - 摘要英文表述："Their initial LangChain-based approach helped them get something built quickly to get validation from their design partners."（非逐字核实）
- 第一个场景（破冰）：KYB/KYC，也就是核验企业注册信息、地址、制裁名单状态、文件真伪【外部来源 S4/S5，未能打开原页】。后来扩展到反欺诈、信贷审批、商户分类、可疑活动报告（SAR）等流程。

**第 2 步（2023 年，给早期客户"高强度、手把手"支持）**
- ZenML 对 Parcha 这篇文章的案例摘要说，早期客户得到的是高强度支持，团队对前沿技术采取亲力亲为的方式：深入理解客户，发现问题就快速迭代【外部来源 S5，仅搜索结果摘要可见，未能打开原页】。
  - 摘要英文表述："early customers receive intensive support and the team uses a hands-on approach for bleeding-edge technology, including deep customer understanding and rapid iteration on discovered issues"（非逐字核实）
  - ⚠️ 具体是谁、去了哪家客户、观察了哪个岗位：**未找到公开信息**。

**第 3 步（2023–2024 年，最初的架构：智能体读 SOP、自主执行）**
- 最初的做法是，把人工遵循的 SOP 交给一个 AI 智能体，让它读懂后自主执行【外部来源 S6，未能打开原页】。
  - 摘要英文表述："an initial approach of taking a standard operating procedure (SOP) that a human follows and having an AI agent read and execute those steps autonomously"（非逐字核实）
- 2024 年 2 月，AJ Asver 上 Initialized 的播客时介绍了"分而治之"：每个智能体只负责一项具体任务，再向一个"主管智能体"（supervisor agent）汇报【外部来源 S19，未能打开原页】。

**第 4 步（2023 年，工程上做减法）**
- LangChain 的多层抽象让系统行为难以推理。联合创始人 Miguel 用一个周末重写了整个智能体代码库，只剩**约 500 行**。LangChain 只保留在模型接口互换（比如在 GPT-4 和 Claude 之间切换）和工具层【外部来源 S4/S5，未能打开原页】。
  - 摘要英文表述："co-founder Miguel rewrote the entire agent codebase in a weekend, reducing it to approximately 500 lines of code."（非逐字核实）

**第 5 步（2024 年，关键转向：给智能体"铺轨道"，改成结构化流程）**
- 详见第 4 节反转 R1。结论是：客户宁可要"在一部分任务上非常准、非常稳"，也不要"全自动但只有 80% 时候管用"【外部来源 S6，未能打开原页】。

**第 6 步（2024–2025 年，逐家定制实施，嵌进客户现有系统）**
- 每家机构都要定制实施，集成深、销售周期长【Claude原文 S1】。
- 例子一，Pipe：Parcha 的强化尽调（EDD）智能体经过定制，通过和 Alloy 的合作，直接集成进 Pipe 的 Alloy 工作流【外部来源 S23，仅搜索结果摘要可见，未能打开原页】。
  - 摘要英文表述："customized and integrated directly into Pipe's Alloy workflow through a partnership with Alloy"（非逐字核实）
- 例子二，Flutterwave：提供多语言的企业注册文件和股权文件核验工具，"能轻松适配新的司法辖区"【外部来源 S16/S13，未能打开原页】。
- 2025 年第二季度的季度通讯标题是 "The Audit Log Q2 2025 – Create AI agents in minutes, Alloy integration, and 47+ updates"（这是搜索结果里看到的标题，S15）。

**第 7 步（人机分工）**
- Flutterwave 首席风险官的说法：团队从日常的一级（L1）审核转去做高价值调查，没有增加人手【外部来源 S16，未能打开原页】。
  - 摘要中的引语："With Parcha, we've redirected our team from routine Level 1 reviews to high-impact investigations—without increasing headcount."（出现在 Parcha 多个产品页，非逐字核实）
- 有一条**来源存疑**的搜索摘要说：Parcha 内部不追求 99% 的准确率，而是做到 90% 后把编辑工具交给客户，让原来培训人工团队的运营人员变成智能体的"提示词工程师"【仅搜索结果摘要可见；摘要同时列出了 S26 Agentplex Weekly、S6、S5 几个链接，**无法确认出自哪一篇**，引用前必须人工核对】。
  - 摘要英文表述："rather than achieving 99% accuracy internally, they aim for 90% accuracy then put editing tools in customers' hands. Operations staff who previously trained human teams on procedures become prompt engineers for agents."（非逐字核实）

**第 8 步（2025 年 7 月，产品化：从"逐家实施"到"自助建智能体"）**
- 2025-07-15 发布 Agent Hub【外部来源 S13；X 帖日期由 ID 推算】。X 帖标题是："🚀 Global compliance teams can now create, customize and deploy AI agents in minutes with Agent Hub 🚀"（搜索结果标题可见，未能打开原页）。
- Agent Hub 提供现成模板（KYC/KYB、强化尽调、反洗钱筛查、文件核验、供应商尽调等），可以用样例数据或直接上传 CSV 来测试；季度通讯称有"十几个预配置智能体"【外部来源 S13/S14，未能打开原页】。
- 上线后的效果：合规团队从看演示到跑出第一批案件**不到 15 分钟**，不需要几周的集成【外部来源 S13/S14，未能打开原页】。
  - 摘要英文表述："compliance teams able to go from demo to running their first cases in under 15 minutes – no weeks-long integration required"（非逐字核实）

**第 9 步（2025 年下半年，Agent SDK：用"配置"代替"重写"，两周做出 OSINT 产品）**
- 交易监控等流程改成按配置适配；做了一个服务，把 Agent SDK 扩展到任意 SOP；两周做出 OSINT 调查产品，也就是"反洗钱合规版 Perplexity"【Claude原文 S1】。
- 技术实现（来自 CTO 的技术长文）：他们做了一个叫 **"Claude in a Box"** 的运行框架（harness），用 Claude Agents SDK 在生产环境大规模跑智能体，做开放式的主体调查；把 Parcha **3 年**积累的工作流经验打包成 skills（技能包），配合工具和 MCP 使用；沙箱之间相互隔离，工具默认全部禁用【外部来源 S7，仅搜索结果摘要可见，未能打开原页】。
  - 摘要英文表述："After spending 3 years building battle-tested AI workflows for compliance and research, they can package all of that expertise and provide it as context to the agent through skills."；"disallow all tools by default"（非逐字核实）
- 2025-12-12，AJ Asver 在 X 上转发了这篇文章（日期由 ID 推算），帖子原文（搜索结果标题可见）："A deep dive on how we built Grep from my @ParchaHQ CTO and my co-founder Miguel. Worth a read if you are thinking about using Claude Agent SDK."【外部来源 S8】

**第 10 步（2025-12 至 2026，扩展：副产品变成公司主业）**
- 2025 年 12 月，Grep 以"研究预览版"形式上线，先做企业尽调；**两周内就有几百人在用**，来自大型科技公司、咨询公司、金融机构和世界 500 强【外部来源 S10/S11，未能打开原页】。
- 公司随后停掉了 Parcha 原有的产品线，专注做 Grep（首页标题是 "Parcha is now Grep AI"）【外部来源 S11/S10，未能打开原页】。
- GitHub 上 Parcha 官方组织的 benchmarks 仓库写的是："Grep — an AI-powered deep research platform by Parcha"，落款是 "Parcha Labs Inc — grep.ai"【外部来源 S3，**已打开核实**】。

**时间投入小结**：2023 年起步 → 2024 年转向结构化流程 → 自研工作流引擎做了两年（S1）→ 2025 年 7 月 Agent Hub 自助化 → 2025 年底用 Agent SDK 两周做出 OSINT 产品（S1）→ 2026 年改名 Grep。

---

## 4. 关键反转 / 转折点（最重要）

### R1 "全自主智能体"→"铺好轨道的智能体（结构化流程）"【最强反转，但需人工核对原文】
- **原本以为**：把人写的 SOP 丢给智能体，让它自主规划、自主执行，就能自动化合规运营（S6）。CTO 后来的技术长文也承认：最早用 **Claude 1** 做了一个 ReAct 智能体（S7，未能打开原页）。
- **现场发现**：
  1. 太早了。智能体还达不到生产要求，尤其在合规场景，"精确遵循指令"是硬要求。
     摘要英文表述："it was too early—agents weren't ready for production, particularly in a compliance setting where following instructions precisely matters"（S7，非逐字核实）
  2. 很难评测、很难查错。出错时分不清是动态生成的计划有问题、对 SOP 理解错了、工具坏了，还是决策本身有缺陷（S6，非逐字核实："determining the root cause of errors was challenging (whether from the dynamically generated plan, a misunderstanding of the SOP, a malfunctioning tool, or a flaw in decision-making)"）。
  3. 客户要的是准确、可靠、集成顺、好用，不是"全自主"（S6）。
     摘要英文表述："would rather have a solution that was very accurate and reliable for a subset of tasks than a fully autonomous solution that worked only 80% of the time."（非逐字核实）
- **调整后的做法**：把智能体串成链条，基本回到用 Celery、Temporal 这类工具搭工作流，和业内大多数人一样（S7，非逐字核实："moved into putting agents in a chain, essentially going back to building workflows like most people in the industry using Celery and Temporal"）。CTO 文章把这叫做 "agents on rails"（给智能体铺轨道），并强调聚焦领域、采用结构化的智能体工作流（S6 摘要）。
- **效果**：公开数字没有直接对应到这次转向。间接结果是 Claude 原文说的"自研工作流引擎做了两年"（S1），以及这期间拿下 Airwallex、Flutterwave、Pipe 等客户（S1、S13）。

### R2 LangChain 快速原型 → 一个周末重写成约 500 行的自研内核
- 原本：用 LangChain 快速出原型给设计伙伴看（S4/S5）→ 问题：多层抽象让行为难以推理、难以上生产 → 调整：Miguel 一个周末重写成约 500 行，LangChain 只留在模型接口和工具层 → 效果：可控、可调试（S4/S5，未能打开原页）。

### R3 "逐家写死流程"→"按配置自适应"（Claude 原文里的隐含反转）
- 原本：为每个客户写定制代码和僵硬流程，工作流引擎做了两年（S1）。
- 问题：精力耗在边界情况上；方案能覆盖大部分现有客户，但很难推广到更多场景，限制了能服务的客户类型（S1）。
  > "a significant part of our energy was spent on dealing with edge cases and building rigid workflows that... were very hard to generalize"
- 调整：把 Agent SDK 作为智能体引擎的核心组件，用配置适配每家机构的规则（S1）。
  > "adapts to these requirements through configuration, not reconstruction."
- 效果："3 months to 5 minutes"；"no more edge cases, no more rigid workflows"（S1，口径见第 7 节）。

### R4 "回到智能体"：两年前被放弃的路线，模型和 SDK 成熟后又被捡回来
- CTO 的原话线索（S7，未能打开原页）：Anthropic 推出 Claude Agents SDK 后，他们开始探索重新变得更"智能体化"；问题的开放性"现在是优点，不再是负担"。
  - 摘要英文表述："When Anthropic launched the Claude Agents SDK, they started exploring going back to being more agentic."；"The open-ended nature of questions is now a feature, not a liability."（非逐字核实）
- 关键点：回到智能体，**不是推倒重来**。前 3 年结构化流程里积累的经验被打包成 skills 喂给智能体（S7）。

### R5 企业销售驱动的逐家实施 → 自助式产品
- 原本：企业版销售周期长、集成深、每家定制（S1）。
- 调整一：2025 年 7 月推出 Agent Hub，模板加 CSV 上传，从演示到跑出第一批案件不到 15 分钟（S13/S14，未能打开原页）。
- 调整二：用 Agent SDK 做了一个直接面向合规分析师、"开箱即用"的产品（S1）。
  > "It allows us to reach every compliance person with a solution out of the box, in the same way that coding agents put power into every engineer's hands."

### R6 内部工具 → 对外产品
> "When the team started using the Agent SDK for their own engineering workflows, they realized this agentic framework could power customer-facing compliance workflows that reach analysts directly."（S1，已核实）
- 也就是说：先在自家工程团队内部用（破冰），才看出能对外做成产品。

### R7 副产品吃掉主业（Claude 故事发布之后）
- 两周做出的 OSINT/企业尽调调查能力 → 2025 年 12 月以 Grep 研究预览版上线，两周内几百人在用 → 公司停掉 Parcha 原有产品线，改名 Grep AI，定位扩展到"高风险决策的深度研究与自主工作流"（S10/S11，未能打开原页；S3 已核实 Parcha Labs 与 Grep 的关系）。
- 摘要英文表述："The team created Grep because they thought an AI Expert in business due diligence might be useful beyond compliance, and they underestimated how much demand there would be."（S10，非逐字核实）
- ⚠️ 推断：Claude 原文里的"反洗钱合规版 Perplexity"是否就是 Grep 的前身，**没有来源明说**。时间（2025 年 12 月）和描述（基于 Agent SDK 的开放式主体调查）高度吻合，但这只是推断。

### R8（来源存疑）客户比团队更敢放手
- 搜索摘要称：客户马上要求提供 API 接口，做全自动的批量处理，团队对客户这么愿意接受新技术感到意外（与第 3 节第 7 步那条"90% 准确率"摘要同源，**无法确认出处**）。
  - 摘要英文表述："Customers immediately asked for API endpoints for autonomous batch processing—surprising the team with their willingness to embrace the technology."（非逐字核实）
- 在人工打开 S5/S26 核实之前，**不要上屏**。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 客户尽调"流程耗时" | 3 个月 | 5 分钟 | 【Claude原文 S1】已核实 | **口径不清**：标签写"Customer due diligence workflow time reduced"，但正文说的是"几个月的定制开发→按配置快速上线"。更可能指**为一家新客户搭建或配置一条尽调流程的时间**，而不是单个案件的处理时间。见第 7 节 |
| 开发一个新 OSINT 调查产品 | 做不出来（"literally would not have built this product without it"） | 2 周 | 【Claude原文 S1】已核实 | 建立在 3 年积累的工作流和 skills 之上（S7），不是从零开始 |
| 自研工作流引擎投入 | — | 2 年 | 【Claude原文 S1】已核实 | 这是"之前"的沉没成本 |
| 适配一家机构的新规则 | 写定制代码（"custom code"） | 改配置（"configuration, not reconstruction"） | 【Claude原文 S1】已核实 | 定性描述，没有数字 |
| 单个企业尽调案件 | 约 45 分钟/件（分析师） | < 3 分钟 | 【外部来源 S24】仅搜索摘要，未能打开原页 | Parcha 自报；具体页面未确认 |
| 新客户从演示到跑出第一批案件 | 几周集成（"weeks-long integration"） | < 15 分钟 | 【外部来源 S13/S14】仅搜索摘要 | Parcha 自报，指 Agent Hub 自助试用，不等于生产上线 |
| Flutterwave 准确率 | — | "as high as 99%"（CRO 引语）；另有"99.7% accuracy" | 【外部来源 S16】仅搜索摘要 | 两个数不一致：99% 是客户高管引语里的"最高可达"，99.7% 出处页面未确认 |
| Flutterwave 人力 | L1 审核人工 | "75% headcount growth avoidance"，"saving millions annually" | 【外部来源 S16/S13】仅搜索摘要 | 厂商营销口径，"避免了 75% 的人员增长"不是裁员 75% |
| 误报率 / 开户速度（Parcha 整体宣传） | — | "90% fewer false positives"，"accelerating onboarding 10x" | 【外部来源】仅搜索摘要（S20 查询结果里的 Parcha 页面） | 纯营销口径，没有说明基线 |
| 早期自主智能体可用率 | "only 80% of the time"（客户不接受） | 转向"在部分任务上高准确、高可靠" | 【外部来源 S6】仅搜索摘要 | 80% 是 CTO 文章里的论证口径，未必是实测指标 |
| Grep 研究预览版采用 | — | 上线两周几百人使用 | 【外部来源 S10/S11】仅搜索摘要 | 发生在 Claude 故事之后 |
| Grep 深度研究基准 | — | DRACO 归一化分 78.6%；DeepSearchQA 84.5%；DeepResearch Bench 56.27 | 【外部来源 S3】**已打开核实** | 公司自测和自报；和"合规尽调"业务指标无关，仅作背景 |

⚠️ **不要引用的数字**：Airwallex 2023-12-06 新闻稿里的"误报减少 50%"和"无人工干预通过开户的客户增加 20%"（S20，仅搜索摘要）。**搜索摘要里没有显示这份新闻稿提到 Parcha**，不能把这两个数算在 Parcha 头上。

---

## 6. 方法论提炼（可复用到其他行业）

1. **从客户现成的 SOP 出发，而不是另起炉灶**：产品一开始就定位为"用现有制度、流程和工具"做自动化（S17）；到 Agent SDK 阶段，仍然是"把 SDK 扩展到任意 SOP"（S1）。→ FDE 进现场，第一件事是拿到并吃透客户的 SOP。
2. **先窄后宽，先准后全**：客户宁可在一部分任务上准，也不要全自动但只有八成靠谱（S6）。高风险行业先做"铺好轨道"的结构化流程，拆成可评测的小步（S6、S19）。
3. **可评测、可归因，是上生产的前提**：自主智能体最难的地方是出了错说不清是计划、理解、工具还是决策的问题（S6）。流程拆细，本质上是为了让每一步都能测、能查。
4. **把"逐家定制"沉淀成"配置 + 模板"**：两年定制实施 → Agent Hub 模板（S13）→ Agent SDK 按配置适配（S1）。FDE 在现场做的定制，最终要反哺成产品能力。这也是 Claude 原文的核心叙事："configuration, not reconstruction"（S1）。
5. **结构化阶段的积累不会白费**：重新走向智能体时，3 年的流程经验被打包成 skills 喂给智能体（S7）。先流程化、再智能体化，比一步到位更稳。
6. **先在内部用，再对外卖**：Agent SDK 先用在自家工程团队，再意识到可以对外做产品（S1）。
7. **人机分工：机器做 L1，人做调查**：Flutterwave 把一级审核交给 AI，人转去做高价值调查（S16）。"让懂流程的业务人员直接改智能体的指令"这一点来源存疑（第 3 节第 7 步）。
8. **合规场景的安全底线**：沙箱隔离，工具默认全部禁用（S7）。

---

## 7. 数字严谨性 & "评论区喷子"防御

1. **"3 个月→5 分钟"到底是什么时间？**
   - 标签写的是 "Customer due diligence workflow time reduced"，meta 描述更激进："Parcha cut customer diligence from 3 months to 5 minutes"（S1）。
   - 但正文唯一对得上的说法是："Compliance processes that previously required months of custom development now deploy rapidly with institution-specific configurations."（S1）
   - 所以最合理的解读是：**为一家机构搭建一条尽调流程**，从约 3 个月的定制开发，缩短到约 5 分钟的配置。不是"查一个客户从 3 个月变 5 分钟"。
   - 单个案件的时间，Parcha 其他材料里的口径是 45 分钟→3 分钟以内（S24，未核实）。
   - 脚本里如果说"尽调从 3 个月变 5 分钟"，懂行的人会质疑：单个客户尽调哪要 3 个月？**建议说成"给一家银行上线一套新尽调流程"**。
2. **"银行级认证"是谁认证的？**
   - 原文只有 "Bank-grade certification achieved"，以及"通过了业内最严格的一些模型治理评估"（S1）。没有写明是哪家银行、哪个框架（比如美联储 SR 11-7 模型风险管理）、哪个第三方。
   - **未找到公开信息**，属于公司自报。
3. **"客户是全球最大的金融科技公司们"**
   - 原文列了 Alloy（S1），但其他材料显示 Alloy 更像集成合作伙伴或渠道：季度通讯标题里写的是 "Alloy integration"（S15），Pipe 的案例也是"通过与 Alloy 的合作"集成的（S23）。说 Alloy 是"客户"，口径偏宽。
   - Parcha 其他材料里还提到 Bridge、IG.com、"一家全球领先的加密货币交易所"（S13、S10，未核实）。
4. **"两周"不是从零开始**：建立在 2–3 年积累的工作流、数据集成和 skills 之上（S1 说"两年用 Claude 构建"；S7 说"3 年实战打磨的工作流"）。
5. **Claude 独家性**：Claude 原文说工具"基于 Claude 模型构建并认证"（S1）。但：
   - 2023 年他们保留 LangChain，本来就是为了能在 GPT-4 和 Claude 之间切换（S4/S5，未核实）；
   - 改名 Grep 之后，平台描述为"在每一步自动挑选最合适的前沿模型或开源模型"的运行框架（S11/S10，未核实）；
   - GitHub 上的 Build 仓库是一个同时驱动 Claude Code、Cursor、Codex、Gemini 的多工具 IDE（Parcha-ai/build README，已打开，见 S3 同组织）。
   - 评论区可能会说"他们后来也不只用 Claude 了"。
6. **故事主角后来"停掉了原产品线"**：Claude 故事发布（2025-12-05）后没多久，公司就停掉 Parcha 原有产品线、改名 Grep（S10/S11）。有人可能会说"这个合规产品后来不做了"。**建议在脚本里主动讲出来，当作第二次反转**（副产品吃掉主业），不要回避。
7. **2023 年融资时还没有收入**：报道标题是 "pre-revenue A.I. agent startup"（S17）。说明 2023 到 2025 年的落地过程是从零客户做起的，这也是一个叙事点。
8. **负面报道/争议**：搜索配额和网络限制下，**没有找到**针对 Parcha 的负面报道或监管处罚。HN 上有 "Claude in a Box" 的讨论帖（S9），但打不开，看不到评论内容。
9. **大部分外部数字是厂商自报**：45→3 分钟、15 分钟、99%/99.7%、75%、90% 误报减少、10 倍，都来自 Parcha 自家页面，没有第三方审计。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下是创作建议，不是事实。每条后面的方括号标出所依据的来源编号；依据是"未核实"来源的，上屏前必须人工打开原文核对。

- **钩子 1（反常识）**："一家做 AI 智能体的公司，CTO 写过最出名的一篇文章，叫《智能体不是你需要的全部》。" [S6]
- **钩子 2（数字）**："给一家银行上线一套新的尽调流程，以前要 3 个月定制开发，现在 5 分钟改配置。" [S1；注意按第 7 节第 1 条的口径表述]
- **钩子 3（兜圈子）**："他们用两年时间，从'智能体'退回'流程'，又从'流程'走回'智能体'。第二次回来，手里多了三年踩坑攒下的经验。" [S6、S7、S1]
- **反转桥段 A：八成不够**。团队原以为客户想要"全自动"。结果客户说：宁可你只做一半，但这一半做对；也不要全做完，却只有八成对。 [S6]
  - 类比：新来的实习生什么都敢干，但每五件错一件，你敢让他单独签字吗？
- **反转桥段 B：每家银行都是"特殊情况"**。A 银行查一万美元以上汇往某些国家的交易，B 银行查交易频率，C 银行查商户类别。以前每种都要改代码，工程师天天在补"特殊情况"。后来改成"配置，不是重建"。 [S1]
- **反转桥段 C：自己先用，再卖给别人**。他们先在自家工程团队内部用这套框架，才突然意识到：这个能直接交给合规分析师用。 [S1]
- **反转桥段 D（结尾彩蛋）：副产品吃掉主业**。两周做出的"反洗钱版 Perplexity"上线两周就有几百人在用，公司干脆改了名。 [S1、S10、S11、S3；"OSINT 产品＝Grep 前身"是推断，需要措辞谨慎，比如"随后他们推出的 Grep……"]
- **FDE 方法论升华（可迁移给中国听众）**：
  - "先铺轨道，再放手"：高风险行业先做结构化流程，把每一步测准，再逐步放给智能体。 [S6、S7]
  - "现场的定制，最终要长成产品"：从逐家实施，到模板，再到配置。 [S1、S13]
  - 中国场景映射（纯创作建议）：银行对公开户尽调、跨境支付商户准入审核、反洗钱可疑交易复核。"每家银行的风控规则都不一样"这个痛点可以直接平移。
- **避坑提示**：
  - 不要说"Parcha 让 Airwallex 误报减少 50%"（没有证据把这个数和 Parcha 关联）；
  - 不要说"通过了某某银行的模型认证"（没有公开具体是谁认证的）；
  - 不要把 Parcha 说成有专门的 FDE 团队（没有公开证据）。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S1 | How Parcha built a universal customer diligence agent in two weeks with Claude Agent SDK | https://claude.com/customers/parcha | Claude原文 | 2025-12-05 | ✅ 已打开（WebFetch + curl 下载 HTML 逐字比对） |
| S2 | Claude Customers 列表页（用于确认 S1 发布日期） | https://claude.com/customers | Claude原文（元数据） | — | ✅ 已打开（curl，页面内嵌 JSON 显示 date 2025-12-05） |
| S3 | Parcha-ai/benchmarks README（"Grep — an AI-powered deep research platform by Parcha"）；同组织 Parcha-ai/build README | https://github.com/Parcha-ai/benchmarks （经 https://raw.githubusercontent.com/Parcha-ai/benchmarks/main/README.md 打开）；https://github.com/Parcha-ai/build | 公司 GitHub | 2026（仓库创建于 2026-04） | ✅ 已打开（raw 文件） |
| S4 | Building AI agents in production — Miguel Rios Berrios（另有 parcha.com 镜像；LinkedIn 帖 activity-7119752383378726912） | https://resources.parcha.com/building-ai-agents-in-production/ ；https://www.parcha.com/blog/building-ai-agents-in-production ；https://www.linkedin.com/posts/miguelriosberrios_building-ai-agents-in-production-parcha-activity-7119752383378726912-QJuy | 公司博客（CTO） | 约 2023-10-16（由 LinkedIn ID 推算） | ❌ 仅搜索结果摘要可见，未能打开原页（网络策略拦截） |
| S5 | Parcha: Building Production-Ready AI Agents for Enterprise Operations（另一篇相关条目：Building Production-Grade AI Agents with Distributed Architecture and Error Recovery） | https://www.zenml.io/llmops-database/building-production-ready-ai-agents-for-enterprise-operations ；https://www.zenml.io/llmops-database/building-production-grade-ai-agents-with-distributed-architecture-and-error-recovery | 第三方案例库（对 S4 的摘要） | 未知 | ❌ 仅搜索结果摘要可见，未能打开原页 |
| S6 | Agents aren't all you need — Miguel Rios Berrios（镜像：parcha.com/blog、Scribd PDF；LinkedIn 帖） | https://blog.parcha.ai/agents-arent-all-you-need/ ；https://www.parcha.com/blog/agents-arent-all-you-need ；https://www.scribd.com/document/827413963/Agents-aren-t-all-you-need-Parcha ；https://www.linkedin.com/posts/miguelriosberrios_agents-arent-all-you-need-parcha-activity-7204541865101053953-Ari_ | 公司博客（CTO） | 约 2024-06-06（由 LinkedIn ID 推算） | ❌ 仅搜索结果摘要可见，未能打开原页 |
| S7 | Claude in a Box: Building Grep on the Agents SDK | https://grep.ai/blog/claude-in-a-box | 公司工程博客（CTO） | 约 2025-12（依据 S8 转发日期） | ❌ 仅搜索结果摘要可见，未能打开原页 |
| S8 | AJ Asver 在 X 上转发 S7："A deep dive on how we built Grep from my @ParchaHQ CTO and my co-founder Miguel…" | https://x.com/_aj/status/1999538672685772977 | 创始人社交媒体 | 2025-12-12（由 X ID 推算） | ❌ 仅搜索结果标题可见，未能打开原页 |
| S9 | Claude in a Box（Hacker News 讨论帖） | https://news.ycombinator.com/item?id=46246266 | 用户讨论 | 约 2025-12 | ❌ 仅标题可见，评论内容未能获取 |
| S10 | Introducing Grep: Where Serious Work Gets Done. | https://blog.parcha.ai/introducing-grep-where-serious-work-gets-done/ | 公司博客 | 2025-12 之后（具体未知） | ❌ 仅搜索结果摘要可见，未能打开原页 |
| S11 | Parcha is now Grep AI（官网首页）；Due diligence at the speed of AI - Grep（about 页） | https://www.parcha.ai/ ；https://grep.ai/about | 公司官网 | 2026（推测） | ❌ 仅搜索结果摘要可见，未能打开原页 |
| S12 | （预留编号，未使用） | — | — | — | — |
| S13 | Agent Hub: Supercharge Your Compliance Team with AI Agents；@ParchaHQ X 帖；AJ Asver LinkedIn 帖 | https://blog.parcha.ai/agent-hub/ ；https://x.com/ParchaHQ/status/1945184542781792296 ；https://www.linkedin.com/posts/ajasver_compliance-aml-fintech-activity-7350942168003325954-QExc | 公司博客/社交媒体 | 2025-07-15（由 X/LinkedIn ID 推算） | ❌ 仅搜索结果摘要可见，未能打开原页 |
| S14 | The Audit Log – Q3 2025 | https://blog.parcha.ai/the-audit-log-q3-2025/ | 公司季度通讯 | 2025 Q3/Q4 | ❌ 仅搜索结果摘要可见，未能打开原页 |
| S15 | The Audit Log Q2 2025 – Create AI agents in minutes, Alloy integration, and 47+ updates | https://blog.parcha.ai/the-audit-log-q2-2025/ ；https://resources.parcha.com/the-audit-log-q2-2025/ | 公司季度通讯 | 2025 Q2/Q3 | ❌ 仅搜索结果标题/摘要可见，未能打开原页 |
| S16 | Business due diligence in minutes（含 Flutterwave CRO Amaresh Mohan 引语，同一引语出现在多个产品页） | https://www.parcha.ai/products/business-due-diligence | 公司产品页（客户引语） | 未知 | ❌ 仅搜索结果摘要可见，未能打开原页 |
| S17 | Parcha Raises $5M to intelligently automate compliance and operations；LinkedIn 帖 "Former Brex duo raises $5 million for new, pre-revenue A.I. agent startup" | https://blog.parcha.ai/parcha-raises-5m-to-intelligently/ ；https://www.linkedin.com/posts/parcha-ai_former-brex-duo-raises-5-million-for-new-activity-7094659084892717056-pxzf | 公司博客/融资新闻 | 约 2023-08-08（由 LinkedIn ID 推算） | ❌ 仅搜索结果摘要可见，未能打开原页 |
| S18 | Our Investment in Parcha: AI Agents for the Enterprise — Steve Jang, Kindred Ventures | https://medium.com/kindred-ventures/our-investment-in-parcha-ai-agents-for-the-enterprise-f74d092e3339 ；https://kindredventures.com/announcement/our-investment-in-parcha-ai-agents-for-the-enterprise/ | 投资方文章 | 约 2023-08 | ❌ 仅搜索结果摘要可见，未能打开原页 |
| S19 | Episode Recap: Scaling AI Agents for Real-World Tasks with Parcha CEO AJ Asver；Parcha 博客同题访谈 | https://blog.initialized.com/2024/02/scaling-ai-agents-for-real-world-tasks-with-parcha-ceo-aj-asver/ ；https://blog.parcha.ai/interview-scaling-ai-agents-for-real/ | 投资方播客回顾 | 2024-02（依据 URL） | ❌ 仅搜索结果摘要可见，未能打开原页 |
| S20 | Airwallex improves customer onboarding with generative AI | https://www.airwallex.com/newsroom/airwallex-improves-customer-onboarding-with-generative-ai | 客户方新闻稿 | 2023-12-06（依据转载 URL） | ❌ 仅搜索结果摘要可见，未能打开原页；**摘要未显示提及 Parcha，勿把其中数字归给 Parcha** |
| S21 | How Parcha automated compliance with Browserbase | https://www.browserbase.com/blog/case-study-parcha | 合作方案例 | 未知 | ❌ 仅标题可见，未能打开原页 |
| S22 | 招聘：Parcha hiring Applied AI Engineer；Founding Systems Engineer @ Parcha（Initialized 招聘板）；Parcha Jobs | https://www.linkedin.com/jobs/view/applied-ai-engineer-at-parcha-4072314615 ；https://jobs.initialized.com/companies/parcha-2/jobs/37159258-founding-full-stack-engineer ；https://www.parcha.ai/jobs | 招聘 | 未知 | ❌ 仅搜索结果摘要可见，未能打开原页；**未发现 FDE 岗位** |
| S23 | Pipe 案例（强化尽调智能体通过 Alloy 集成进 Pipe 的工作流） | 具体页面未能确认；候选：https://www.parcha.ai/agents/enhanced-due-diligence | 公司案例/产品页 | 未知 | ❌ 仅搜索结果摘要可见，出处页未确认 |
| S24 | "45 分钟/件 → 3 分钟以内" | 具体页面未能确认；候选：https://blog.parcha.ai/the-audit-log-q2-2025/ | 公司材料 | 未知 | ❌ 仅搜索结果摘要可见，出处页未确认 |
| S25 | Anatomy of a Parcha agent（API 文档）；Part 4 - Agentic AI: Built with Guardrails, for Compliance | https://docs.parcha.ai/concepts/anatomy-of-a-parcha-agent ；https://blog.parcha.ai/agentic-ai-built-with-guardrails-for-compliance/ | 公司文档/博客 | 未知 | ❌ 仅标题可见，未能打开（后续可深挖"护栏"设计） |
| S26 | Agentplex Weekly - Issue #5（疑似"90% 准确率+编辑工具""客户要批量 API"摘要的来源之一） | https://agentplex.substack.com/p/agentplex-weekly-issue-5 | 第三方简报 | 未知 | ❌ 仅搜索结果标题可见，出处未确认 |

**给人工核验的优先级建议**：
1. S6（Agents aren't all you need）
2. S7（Claude in a Box）
3. S10（Introducing Grep）
4. S13（Agent Hub）
5. S4（Building AI agents in production）

这五篇决定了反转主线能不能上屏，请在浏览器里打开，逐字核对第 3、4 节引用的英文表述。
