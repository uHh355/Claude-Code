# 案例：Parcha — 用 Claude Agent SDK 把"每家银行一套定制流程"的合规尽调，改成按配置自适应的通用尽调智能体

> **核实状态总说明（第二轮，2026-09-24 更新，请先读）**
> - 第二轮网络已放开。第 9 节列出的 S1–S34（S12 未使用；S23、S24 已并入 S14、S15）**全部由本人用 curl 抓原页、去标签后 grep 原句核对**。本文所有英文引文都是**原页逐字原句**。第一轮根据搜索摘要写的转述已全部替换或删除。
> - **已核实 ✅：32 个来源编号**（S1–S11、S13–S21、S25–S33，S22 部分，S34 仅核实到视频标题）。
> - **无法访问 ❌（4 个链接）**：
>   - S22 中的 LinkedIn 职位页（404，职位已下线）和 Initialized 招聘板职位页（404）；
>   - S18 的 Medium 镜像（403；同一篇文章已在 Kindred 官网原页核实）；
>   - S34 YouTube 播客的字幕/文字稿（YouTube 拒绝本环境 IP 抓取字幕，只核实到 oEmbed 标题和发布方）。
> - 发布日期：本轮尽量改用页面上直接显示的日期。X 帖日期用 fxtwitter 公共接口读取，LinkedIn 帖日期用页面 JSON-LD 的 datePublished 读取。
> - **第一轮的主要错误已在第 7 节第 10 条逐条更正**，包括：种子轮领投方、"500 行/一个周末"的出处、一句多语言引语的归属、"90% 准确率/批量 API"的出处。

- 行业：金融服务 — 银行与金融科技公司的 KYB/KYC/AML 客户尽职调查（due diligence）、交易监控、制裁/负面新闻筛查【Claude原文 S1】
- 企业规模 / 地区：Claude 页面标注 "Company size: Small"、"Location: North America"【Claude原文 S1】
  - 公司 2023 年初在旧金山成立（S6："We founded Parcha in early 2023"；S5："The company started in March 2023"）。
  - 2023 年 8 月时团队只有两位创始人加一名设计负责人（S27）；2024 年 10 月时"只有四个工程师"（S21）；2026 年 YC 页面显示团队 6 人（S33）。
- Claude 产品标签：Claude Platform（页面 og:title 为 "Parcha Claude Platform (API) case study"），具体用的是 Claude Agent SDK【Claude原文 S1】
- Claude 故事发布日期：2025-12-05（claude.com/customers 列表页内嵌数据，S2）
- Claude 原文链接：https://claude.com/customers/parcha
- 落地主体（谁是"FDE"）：**供应商自己的创始人和产品/工程团队，没有第三方集成商**。证据链（均已核实）：
  - 2023 年，Fortune 报道 Parcha 在为最早的两家客户（Brex、Bridge）"逐家定制智能体"："Parcha is building customized A.I. agents for each company, built on top of Anthropic's Claude large language model"（S27）。
  - CTO 本人写道："We used their SOPs and even shadowed sessions where their teams performed these processes manually."（S6）
  - Bancoli 案例："In the first month, Parcha's product team shadowed Bancoli's compliance analysts"（S28）。
  - 工程手册："We don't have a customer support team because we are the support team."（S31）
  - **没有找到任何以 "Forward Deployed Engineer" 为名的岗位或团队**。能核实的招聘岗位只有：2023 年的 founding full-stack engineer（S4），以及 2025 年的 Backend Engineer 和 Applied AI Engineer（S15）。
- 本案例推荐指数：**4.5 / 5**（第一轮是 3 分，本轮上调）
  - 上调理由一：第一轮最担心的"反转主线未核实"已解决。S6、S7、S10 三篇创始人原文逐字核实，完整反转链条可以上屏："智能体 → 铺轨道的流程 → 回到智能体 → 副产品吃掉主业"。
  - 上调理由二：本轮新挖到 **Bancoli 案例（S28）**。它是一个有月份刻度的 FDE 落地过程：
    - 第 1 个月：产品团队坐到分析师旁边跟看（shadow）；
    - 30 天：回测 50 个历史申请，准确率 90%；
    - 第 2 个月：角色互换，分析师反过来"跟看"智能体，每周开会反馈；准确率达到约定的 95%；
    - 第 3 个月：API 集成上线。
    - 结果：30 分钟/件降到 3 分钟/件。
  - 扣分点一：Bancoli 发生在 2024 年，属于"结构化流程"时代，不是 Claude Agent SDK 时代。Claude 原文的"3 个月→5 分钟"口径仍然模糊（见第 7 节）。
  - 扣分点二：没有公开资料能说明"银行级认证"是谁认证的。
  - 对中国听众的可迁移性（高）：对公开户 KYB、跨境支付商户准入、反洗钱名单筛查，国内都有。"先坐到分析师旁边看 SOP"的打法可以直接平移。

---

## 1. Claude 原文要点（事实 + 数字）

以下全部来自 S1。第一轮已用 WebFetch 和 curl 逐字比对；第二轮（2026-09-24）重新 curl，关键句仍然在原页上。

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
    > "It allows us to reach every compliance person with a solution out of the box, in the same way that coding agents put power into every engineer's hands."

---

## 2. 背景与痛点（结构化）

| # | 痛点 | 来源 |
|---|---|---|
| P1 | 每家银行/金融科技公司都要做交易监控和客户尽调，但**做法各不相同**。传统做法是为每个客户写一套僵硬的流程，几乎没法复用到别的客户 | 【Claude原文 S1】"they all need to monitor transactions and conduct customer due diligence, but each does it differently." |
| P2 | Parcha 自研工作流引擎花了**两年**，但跨客户用起来不够灵活；"每家机构的独特流程"限制了能服务的客户类型 | 【Claude原文 S1】 |
| P3 | 企业版**销售周期长、集成深、每家都要定制实施**，"几个月的定制开发"才能上线一个合规流程 | 【Claude原文 S1】；【外部来源 S15 ✅】"it can often take weeks or months to set up, customize, integrate, and fully realize their value" |
| P4 | 工程团队大部分精力耗在**边界情况**（edge cases）上 | 【Claude原文 S1】 |
| P5 | 合规分析师花好几个小时**用 Google 人工查企业和个人的公开信息**，费时、无法审计、难以标准化 | 【Claude原文 S1】 |
| P6 | 创始人的切身经历：在 Brex 时**几千份企业开户申请**积压，全公司停下来帮忙审一周 | 【外部来源 S18 ✅】"At Brex for example, we once had a backlog of several thousand business applications we needed to process, requiring the whole company to spend a week assisting with compliance reviews." |
| P7 | 在 Brex 时，**200 多人**在做自动化，仍有大量流程离不开人工判断 | 【外部来源 S17 ✅】"Despite 200+ people working on this problem there were still many workflows that required humans in the loop." |
| P8 | 单个企业尽调案件人工耗时：**45 分钟/件**（Parcha 在 Alloy 渠道的宣传口径）；Bancoli 的实测是 **30 分钟/件** | 【外部来源 S15 ✅】"Your business due diligence that used to take analysts 45 minutes per case now gets completed by our AI agents in under 3 minutes."；【外部来源 S28 ✅】"Before Parcha, Bancoli's salaried analysts spent thirty minutes per review" |
| P9 | Pipe 这类放贷/嵌入式金融平台要审核的很多小企业**几乎没有网站**，只有社交媒体页面和网上评价 | 【外部来源 S14 ✅】"Many of the companies had limited to no web presence, besides their social media pages and online reviews." |
| P10 | 行业层面：人工流程误报率超过 90%；人力占每年 2000 多亿美元合规支出的 75% | 【外部来源 S13 ✅】"Manual processes yield false-positive rates exceeding 90%... labor costs—which account for 75% of the over $200 billion spent annually on compliance"（Parcha 引用的行业口径，原文未注明出处） |
| P11 | 合规场景对准确性要求极高：Claude 原文说这是"出错会有监管后果"的应用；在合规场景里，幻觉等于"放行失败"（failing open） | 【Claude原文 S1】；【外部来源 S5 ✅】"In compliance contexts, hallucination equals “failing open”—the worst possible outcome." |
| P12 | 银行的 BSA 官（反洗钱合规负责人）最常提的四个顾虑：黑箱、监管问责、模型可靠性、人工监督 | 【外部来源 S30 ✅】 |

---

## 3. 落地过程（FDE 怎么做的）

> 说明：Claude 原文只讲到 2025 年的 Agent SDK 阶段。下面按时间线，把创始人博客、投资方文章、媒体报道和客户案例拼起来，还原 2023–2026 的完整落地路径。**本节所有外部来源都已打开核实**。

**第 0 步（2023 年 3–8 月）：创始人亲自上，先拿两家"设计伙伴"**
- 2023 年 3 月起步，5 月公开亮相。Kindred Ventures 先投了 175 万美元的天使前轮（pre-seed）；7 月中种子轮收尾，由 Initialized Capital 的 Brett Gibson 领投，总额 500 万美元（含 pre-seed）；8 月 8 日由 Fortune 首发报道【外部来源 S27 ✅、S17 ✅、S18 ✅】。
  > "Miguel Rios-Berrios (left) and AJ Asver closed a $5 million seed round for Parcha AI in mid-July—about two months after publicly launching the company."（S27）
- 最早的两家客户：老东家 Brex，以及加密支付公司 Bridge。**每家都单独定制智能体**。合同里写了准确率门槛【S27 ✅】：
  > "bring on their first two customers—one of them being their former employer Brex. The second is a crypto payments company called Bridge. Parcha is building customized A.I. agents for each company, built on top of Anthropic's Claude large language model and utilizing GPT-4 for some tools like summarizing documents."
  > "Their contracts with Brex and Bridge are contingent upon building agents that can operate at certain accuracy rates (their goal during the testing phase is to reach 90% accuracy, but they say it may vary per customer)."
- 当时公司还没有收入，也没有成品，团队只有两位创始人加一名设计负责人（S27："Parcha AI is currently just the two of them as well as a lead designer"）。
- 产品从一开始就定位为**用客户现成的制度、SOP 和工具**做自动化：
  > "enterprise-grade AI Agents that instantly automate manual workflows in compliance and operations using existing policies, procedures and tools"（S17 ✅）

**第 1 步（2023 上半年）：拿到 SOP，坐到客户旁边看人工操作（shadowing）**
- 这是 FDE 最核心的证据，CTO 原文【S6 ✅】：
  > "From early on, we engaged with design partners — fintech and banks- with complex fintech workflows and compliance processes that agreed to work with us and test our agent... We used their SOPs and even shadowed sessions where their teams performed these processes manually."
- 同一批设计伙伴身上跑了很多场景：KYB、KYC、反欺诈、信贷审批、商户分类、可疑活动报告（SAR）等（S6 ✅）。
- ZenML 根据 Initialized 播客（S34）整理的案例摘要这样描述早期交付方式【S5 ✅，二手转述】：
  > "Early customers receive intensive support—what AJ jokingly calls “agents handbuilt in California.” This hands-on approach is intentional for bleeding-edge technology: deep customer understanding, shadowing operators doing manual reviews, iterating rapidly on discovered issues."

**第 2 步（2023 年）：用 LangChain 快速出原型，给设计伙伴验证**
- CTO 自评："fairly naive"【S4 ✅】。
  > "we used Langchain Agents with a standard operating procedure (SOP) embedded in the agent's scratchpad... While this approach helped us get something built quickly to get validation from our design partners, the approach had multiple setbacks"
- 最初的设想是"能双向对话的智能体"，现场发现客户要的不是聊天（见第 4 节反转 R0）。
- 第一批智能体**每个都要做好几周**："After taking multiple weeks to develop each of our first set of agents, we decided to focus on reusability and speed of building."（S4 ✅）
- 早期产品形态是一个 Chrome 插件，把智能体的每一步推理都展示出来，先建立客户信任：
  - S5 ✅："The initial product is a Chrome extension showing every step the agent takes with full reasoning."
  - S18 ✅ 中 CTO 也提到曾想招一个人"100% dedicated to our Chrome extension"。

**第 3 步（2023 年下半年）：根据现场跟看的结果，拆成"主管智能体 + 工作智能体"**
- 【S4 ✅】
  > "After evaluating multiple real-world SOPs and shadow sessions with design partners, we realized instructions could be decoupled into multiple SOPs... we have a coordinator <> worker model."
- 2024 年初，AJ Asver 上 Initialized 的 High Bit 播客也讲了"分而治之"：每个智能体只负责一项具体任务，再向"主管智能体"（supervisor agent）汇报【S19 ✅】。
- 工程上做减法：CTO Miguel 用一个周末把整个智能体代码库重写成**约 500 行**，LangChain 只留在模型接口互换和工具层。
  - ⚠️ 这条**出自 ZenML 对播客的整理（S5），不在 S4 博文里**（第一轮误标为 S4）。原话："Co-founder Miguel rewrote the entire agent codebase in a weekend, reducing it to approximately 500 lines of code."（S5 ✅，二手转述；播客原声未能核对，S34 ❌）

**第 4 步（2023 年）：上线前的门槛 —— 用历史数据回测到 90%，再进沙箱，最后交给客户改**
- 【S5 ✅，ZenML 对播客的二手转述】
  > "Before production deployment, agents are tested against historical data. The target is 90% accuracy on back-testing before customer exposure. After that milestone, customers test in sandbox environments, find additional edge cases, and the team iterates."
- 第一轮标为"来源存疑"的那条，**真实出处已找到：S5（ZenML LLMOps 数据库条目，底层来源是 Initialized 的 YouTube 播客 S34）**。原句：
  > "A strategic product decision: rather than Parcha achieving 99% accuracy internally, they aim for 90% accuracy then put editing tools in customers' hands. Operations staff who previously trained human teams on procedures become prompt engineers for agents."
- **旁证**：Fortune（S27 ✅）独立报道了"测试阶段目标 90% 准确率"写进 Brex 和 Bridge 的合同；Bancoli 案例（S28 ✅）也是"30 天回测到 90%"。所以"90%"这个数有三个来源交叉印证。
- "把编辑工具交给客户、让运营人员变成提示词工程师"这一句，**只有 ZenML 的转述**，播客原话无法核对（S34 字幕抓取被拒）。**上屏须注明"据播客整理"**。

**第 5 步（2024 年上半年）：关键转向 —— 给智能体"铺轨道"，改成结构化流程**
- 详见第 4 节 R1。CTO 自报：几个月内彻底换了路线，可靠性提高到原来的 3 倍（S6 ✅）。
- 设计伙伴在这个阶段转成了付费客户："This new approach resonated well with our design partners, who, by this point, were paying customers."（S6 ✅）

**第 6 步（2024 年，一个完整的 FDE 落地样本）：Bancoli，不到 90 天上线【S28 ✅，本轮新增，最重要】**
- 客户：Bancoli，2021 年成立的跨境支付/多币种账户公司，服务 200 多个国家的企业。
- 选型：Bancoli 管理层评估过几家专门做 AI 的平台，最后选了 Parcha。
- **第 1 个月：跟看分析师，30 天回测到 90%**
  > "In the first month, Parcha's product team shadowed Bancoli's compliance analysts, immersing themselves in the unique challenges and nuances Bancoli's team faced when manually reviewing applicants' KYB documents... Within 30 days of engaging with Parcha, an initial version of the automated workflow achieved 90% approval and denial accuracy based on backtesting 50 recent applicants."
- **第 2 个月：角色互换，分析师反过来"跟看"智能体；每周开会反馈，直到达到约定的 95%**
  > "By month two, Bancoli's analysts were no longer initiating manual KYB reviews but shadowing Parcha's automated compliance workflow. In weekly meetings, Bancoli's analysts provided Parcha with feedback on accuracy, including various edge cases and remediation needs. This fine-tuning continued until the automated analyses achieved the agreed-upon benchmark of 95% accuracy."
- **第 3 个月：和客户的产品、工程团队一起做 API 集成**
  > "In the final month, Parcha's team partnered with Bancoli's product and engineering teams to integrate the automation into Bancoli's onboarding flow via API. Today, Bancoli's analysts validate the AI agents' KYB analysis — a 3-minute task."
- 人机分工：智能体给出通过或拒绝的结论，分析师只做复核。
  > "Today, our analysts simply verify the AI-driven decision-making that Parcha completes."（Bancoli CEO Romeo Ju）

**第 7 步（2024–2025 年）：逐家定制，嵌进客户已有的系统（Alloy、ComplyAdvantage）**
- 企业版要逐家定制实施，集成深，销售周期长【Claude原文 S1】。
- Pipe：Pipe 在 2024 年主动找上门。Parcha 和 Alloy 合作，把定制版的强化尽调（EDD）智能体直接嵌进 Pipe 的 Alloy 工作流【S14 ✅】。
  > "Last year, global embedded finance platform Pipe approached us with a challenge... We partnered with Alloy to provide a customized version of our agent that is integrated directly into Pipe's Alloy workflow."
- Alloy 集成（2025 Q2）：Alloy 工作流里被标记要做强化尽调或 AML 告警的案件，可以直接转给 Parcha 处理【S15 ✅】。
  > "Parcha has partnered with Alloy to bring AI agents to hundreds of fintechs and banks using their platform."
- 同季度还做了 ComplyAdvantage 联动：由 ComplyAdvantage Mesh 的告警自动触发 Parcha 智能体（S15 ✅）。
- 销售端：新来的营收负责人上任头两周，就拿下一家上市全球金融科技公司的试点（S15 ✅："she helped us land a pilot with a publicly traded global fintech company"，**未具名**）。

**第 8 步（人机分工）**
- Flutterwave 首席风险官的引语在两个页面上**措辞不同**：
  - S13 ✅（Agent Hub 博文）："With Parcha, we've redirected our team from routine Level 1 reviews to high-impact investigations—without increasing headcount. What sets Parcha apart is that their AI solutions can deliver as high as 99% accuracy, giving us the confidence to scale faster while reducing compliance risk."
  - S16 ✅（产品页）："With Parcha, we've gone from routine Level 1 reviews to high-impact investigations — without increasing headcount."
- 官方口径是"副驾驶，不是自动驾驶"：高风险和边界案件由人拍板，所有决策都能追溯、复核、推翻（S30 ✅："But when it comes to nuanced or high-risk decisions, the human stays in the loop."）。

**第 9 步（2024–2025 年）：模型治理 —— "银行级"是怎么来的（能找到的全部公开信息）**
- 2024-10 公布"Parcha 模型验证框架"，三根支柱：上线前严格验证（历史回测、对抗测试、每个检查项都有黄金数据集）；上线后持续监控（误报率压在 10% 以下）；持续改进（包括内部和第三方审计）【S29 ✅】。
  > "Our framework has been developed in partnership with our customers to meet the requirements of publicly traded companies with the highest risk management and governance criteria."
  > "We conduct both internal and third-party audits to review performance, regulatory compliance, and alignment with business goals."
- 试点中的一个真实发现：人名匹配模型总体准确率很高，但按文化分组后发现东亚名和西欧名明显偏低（东亚 75%）。用 RAG 注入少样本示例后，东亚名提到 93%，总体从 92% 提到 99%【S29 ✅】。
  > "while backtesting at the beginning of a recent pilot, we noticed that incorrect name matches were happening more frequently than anticipated."
- 部署前由客户合规人员批准，并鼓励客户先和监管沟通【S30 ✅】：
  > "All documentation and decision logic is approved by compliance personnel before an agent is deployed."
  > "Engage regulators early : Proactively schedule meetings with your primary regulator to review AI implementation plans before deployment."
- 安全认证：官网页脚写 "Parcha.ai is SOC 2 Type II certified for security and data protection."（S22 的 parcha.ai/jobs 页 ✅）
- ⚠️ **仍未找到**：哪家银行、按哪个框架（如美联储 SR 11-7）、由哪个第三方做出了"银行级认证"。现有公开材料只能支撑"自建验证框架 + 客户合规审批 + SOC 2"。

**第 10 步（2025 年 7 月）：产品化 —— 从"逐家实施"到"自助建智能体"（Agent Hub）**
- 2025-07-15 发布 Agent Hub【S13 ✅；X 帖、LinkedIn 帖同日 ✅】。
  - X 帖原文："🚀 Global compliance teams can now create, customize and deploy AI agents in minutes with Agent Hub 🚀"
- 形态：现成模板（KYC/KYB、强化尽调、AML 筛查、文件核验、供应商尽调等）＋按客户现有流程和风险偏好定制＋沙箱样例数据测试＋上传 CSV 直接跑【S13 ✅】。
- Q2 通讯的原话是把"见效时间"从几个月压到几分钟【S15 ✅】：
  > "accelerate time to value for our customers from months to minutes with Agent Hub"
- 上线后的效果【S14 ✅】：
  > "Since launching in July, we've seen strong early traction with compliance teams able to go from demo to running their first cases in under 15 minutes – no weeks-long integration required."
- ⚠️ 自助也没有完全去掉人：通讯里同时写着 "schedule a 15-minute tour and get onboarded by our team"（S14 ✅）。

**第 11 步（2025 年下半年）：Agent SDK —— 用"配置"代替"重写"，两周做出 OSINT 产品**
- 交易监控等流程改成按配置适配；做了一个服务，把 Agent SDK 扩展到任意 SOP；两周做出 OSINT 调查产品，也就是"反洗钱合规版 Perplexity"【Claude原文 S1】。
- 技术实现见 CTO 2025-12-11 的长文【S7 ✅】：
  - **"Claude in a Box"运行框架（harness）**：每个追问都放进一个隔离的"盒子"，里面只装当前任务需要的技能包（skills）、工具和 MCP 服务器。
    > "The key insight: each follow-up question gets its own isolated "box" with exactly the skills, tools, and MCP servers it needs. No more, no less."
  - **技能包只按需加载**：总共 29 个技能包，一个网站可信度核查任务只拷入 4 个。原因是加载太多选项时 Claude 会"犯迷糊"。
    > "In our experiments, Claude would get confused when presented with too many options."
  - **3 年流程经验打包成技能包**：
    > "We've spent 3 years building battle-tested AI workflows for compliance and research. With skills, we can package all of that expertise and provide it as context to the agent."
  - **评测：请内部评估员用同样的指令和技能包，做同样的调查，和智能体结果并排对比**：
    > "We did side-by-side evaluations with our in-house human evaluator, performing the same research using the same set of instructions that our agents have access to, the same skills and expertise."
  - **安全：工具默认全部禁用**：
    > "We disallow all tools by default and have mechanisms of defense through the system prompt to ensure the agent stays in role."
  - **规模**：
    > "we have customers running tens of thousands of agents executing millions of LLM calls. Just with a click."
- 2025-12-12，AJ Asver 在 X 上转发了这篇文章（S8 ✅）："A deep dive on how we built Grep from my @ParchaHQ CTO and my co-founder Miguel. Worth a read if you are thinking about using Claude Agent SDK."

**第 12 步（2025-12 至 2026）：副产品变成公司主业**
- 2025 年 12 月，Grep 以研究预览版上线（S7 ✅："We just launched a Research Preview of Grep"）。
- 2026-01-22，CEO 发文【S10 ✅】：
  > "In December, we launched Grep as a research preview for business due diligence. Within two weeks, hundreds of people were using it: folks at major tech companies, consulting firms, financial institutions, and Fortune 500 enterprises."
- 公司停掉 Parcha 原有产品线【S11 ✅，parcha.ai 首页】：
  > "We retired Parcha’s original product line to focus on Grep AI, a new platform for automating research-intensive, high-stakes knowledge work with AI agents."
  > "Banking & Fintech Partners : Our commitment to accelerating compliance workflows hasn't changed. Grep AI agents are already automating compliance work across multiple global fintechs and banks."
- GitHub benchmarks 仓库写的是 "Grep — an AI-powered deep research platform by Parcha"，落款 "Parcha Labs Inc — grep.ai"【S3 ✅】。YC 页面显示 Grep AI 是 F26 批次，团队 6 人【S33 ✅】。

**时间投入小结（均已核实）**
- 2023-03 起步，2023-05 公开亮相，2023-07 种子轮收尾（S27）；
- 2023-10 第一批智能体进入生产，每个要做几周（S4）；
- 2024-06 转向结构化流程，"几个月内"完成（S6）；
- 2024 年 Bancoli 不到 90 天上线（S28）；
- 2025-07 Agent Hub 上线，试用到跑出首批案件不到 15 分钟（S13/S14）；
- 2025 年底用 Agent SDK 两周做出 OSINT 产品（S1）；
- 2025-12 Grep 研究预览版上线（S7）；
- 2026-01 发布 Grep 新版（S10），此后停掉 Parcha 原产品线（S11）。

---

## 4. 关键反转 / 转折点（最重要）

### R0 甲方要的不是"聊天机器人"，是"把活干完的智能体"【本轮新增，和本公司已有脚本的"对话框→工作台"反转同构】
- **原本以为**：智能体应该能和操作员"双向对话"，所以用 WebSocket 长连接实时聊天（S4 ✅："We initially envisioned our agents as bi-directional, able to have a two-way conversation."）。
- **现场发现**：操作员发一句"给某客户做一次 KYB"之后，基本就是智能体单向汇报进度。长连接还经常断，跑了 3–4 分钟的任务一断就得重来，"即使是概念验证，体验也很差"（S4 ✅："This, even for a POC, was a pretty poor customer experience."）。
  > "Our customers didn’t need a chatbot; they needed an agent to complete a job."（S4 ✅）
- **调整后的做法**：改成异步长任务。可以通过 API 触发，在 Slack 线程里汇报进度，也可以作为无界面进程批量评测；客户用 REST 接口集成，不依赖网页界面（S4 ✅）。
- **效果**：给后来"嵌进客户现有系统"（Alloy、ComplyAdvantage、Bancoli 的开户流程）打下基础（S14、S15、S28）。

### R1 "全自主智能体"→"铺好轨道的智能体（结构化流程）"【最强反转，已逐字核实】
- **原本以为**：把人写的 SOP 丢给智能体，让它自主规划、自主执行（S6 ✅）：
  > "Our initial approach was to take a standard operating procedure (SOP) that a human follows to perform an operational process and have an AI agent read and execute those steps autonomously."
  - CTO 后来回忆，最早用的是 Claude 1 搭的 ReAct 智能体（S7 ✅）：
  > "We built Parcha initially as a React agent using Claude 1. It was too early. Agents weren't ready for production, particularly in a compliance setting where following instructions precisely matters. The reliability just wasn't there."
- **现场发现**：
  1. **演示很惊艳，上生产就不行**；小团队的时间都耗在搭"智能体平台"上（S6 ✅）：
     > "The demos quickly impressed our partners... However, as we transitioned from demos to production, we found ourselves (a tiny team, by design) spending too much time building the "agent" platform and not enough time building the product"
  2. **客户宁可"一部分做准"，也不要"全自动但八成对"**（S6 ✅）：
     > "They would much rather have a solution that was very accurate and reliable for a subset of tasks than a fully autonomous solution that could automate a workflow end-to-end but worked only 80% of the time."
  3. **错误会层层放大**（S6 ✅）：
     > "if an AI agent carries out a workflow consisting of 10 tasks autonomously but has a 10% error rate per task, the compounded error rate over the whole workflow is 65%."
  4. **没法评测，也没法查错**（S6 ✅）：
     > "Was the issue with the dynamically generated plan, a misunderstanding of the SOP, a malfunctioning tool, or a flaw in the decision-making process?"
- **调整后的做法**：
  - 去掉动态生成计划和共享草稿区，改成静态配置的编排（S6 ✅）：
    > "We could move faster while leveraging what we built by putting the agent "on rails." We removed the dynamic generation of the plan and the shared scratchpad and instead developed an orchestration framework based on static agent configurations."
    > "This plan started as a configuration file!"
  - 聚焦单一场景（S6 ✅）：
    > "we decided to hyperfocus on one area we knew well: Know Your Business/Customer (KYB/KYC)."
  - CTO 的回顾（S7 ✅）：
    > "So we moved into putting agents in a chain. Essentially, we went back to building workflows, like most people in the industry using Celery and Temporal."
  - API 文档（S25 ✅）里的智能体就是一份 TOML 配置文件，按步骤列出每项检查。
- **效果**：
  - 可靠性提高到原来的 3 倍（S6 ✅，自报）：
    > "In just a few months, we completely changed our approach to focus on reliability and accuracy instead of autonomy, resulting in workflows that are now three times more reliable."
  - 设计伙伴转为付费客户（S6 ✅）。
  - 一个 KYB 智能体会调用 1000 多次大模型（S6 ✅："one Parcha KYB agent can perform more than a thousand LLM calls"）。
- **金句**（S6 ✅）：
  > "Ultimately, they did not ask us to build them an AI agent; they wanted us to solve a problem effectively and efficiently."

### R2 LangChain 快速原型 → 一个周末重写成约 500 行的自研内核
- 原本：用 LangChain 快速出原型给设计伙伴看（S4 ✅）。
- 问题：多层抽象让行为难以推理（S5 ✅）。
- 调整：Miguel 一个周末重写成约 500 行（S5 ✅，ZenML 对播客的转述；**不在 S4 原文中**）。
- 后续：2025 年的工程手册写明"不直接调用大模型"，所有调用走自家工具接口，并配备备用供应商（S31 ✅）：
  > "This includes using backup vendors when the main LLM is unavailable (e.g., Claude in Anthropic versus Vertex AI)"

### R3 "逐家写死流程"→"按配置自适应"（Claude 原文里的隐含反转）
- 原本：为每个客户写定制代码和僵硬流程，工作流引擎做了两年（S1）。
- 问题：精力耗在边界情况上；方案能覆盖大部分现有客户，但很难推广到更多场景，限制了能服务的客户类型（S1）。
  > "a significant part of our energy was spent on dealing with edge cases and building rigid workflows that... were very hard to generalize"
- 调整：把 Agent SDK 作为智能体引擎的核心组件，用配置适配每家机构的规则（S1）。
  > "adapts to these requirements through configuration, not reconstruction."
- 效果："3 months to 5 minutes"；"no more edge cases, no more rigid workflows"（S1，口径见第 7 节）。

### R4 "回到智能体"：两年前放弃的路线，模型和 SDK 成熟后又捡了回来
- CTO 原话（S7 ✅）：
  > "When Anthropic launched the Claude Agents SDK, we started exploring going back to being more agentic."
  > "The open-ended nature of questions is now a feature, not a liability."
- CEO 更直白的自我否定（S10 ✅）：
  > "Vertical AI agents overpromise and underdeliver because they were built for GPT-4 era models - models that needed elaborate workflows, fine-tuning, RAG, and hand-holding. That's exactly how we built Parcha"
  > "With Opus 4.5, models are now capable of reasoning through legal analysis, evaluating financial statements, conducting due diligence. They don't need rigid orchestration. They need context"
- 关键点：回到智能体，**不是推倒重来**。前 3 年的流程经验被打包成技能包（skills）；编排方式沿用 Parcha 时代的"智能体配置"（S7 ✅："We do this reusing the same architecture we built for Parcha: configurations for agents that include prompts, tools, and code"）。

### R5 企业销售驱动的逐家实施 → 自助式产品
- 原本：企业版销售周期长、集成深、每家定制（S1）。单个客户的实施像 Bancoli 那样，要约 3 个月（S28 ✅）。
- 调整一：2025 年 7 月推出 Agent Hub（S13 ✅）。Parcha 自己的说法是把见效时间"从几个月压到几分钟"（S15 ✅）；从演示到跑出第一批案件不到 15 分钟（S14 ✅）。
- 调整二：用 Agent SDK 做了一个直接面向合规分析师、"开箱即用"的产品（S1）。
  > "It allows us to reach every compliance person with a solution out of the box, in the same way that coding agents put power into every engineer's hands."

### R6 内部工具 → 对外产品
> "When the team started using the Agent SDK for their own engineering workflows, they realized this agentic framework could power customer-facing compliance workflows that reach analysts directly."（S1）
- 旁证（S7 ✅）："We've been building with Claude Code since the early days."；"we use Claude Code extensively to build Parcha."

### R7 副产品吃掉主业（Claude 故事发布之后）
- 两周做出的开放式企业调查能力，于 2025 年 12 月以 Grep 研究预览版上线，两周内几百人在用（S7 ✅、S10 ✅）。
- 公司随后停掉 Parcha 原有产品线，全力做 Grep（S11 ✅）。
- CEO 原话（S10 ✅）：
  > "We created Grep because we thought an AI Expert in business due diligence might be useful beyond compliance. We underestimated how much."
- 关于"Claude 原文里的'反洗钱合规版 Perplexity'是否就是 Grep 前身"：S7 写明 Grep 是基于 Claude Agents SDK 做的开放式主体调查，并且是在"重新想象 Parcha 最擅长的事：深度主体调查"之后做出来的。时间、技术和描述都吻合，但**没有来源逐字写"两者是同一个产品"**。仍按推断处理。

### R8 "客户比团队更敢放手"（出处已找到，但只有二手转述）
- 真实出处是 S5（ZenML 对 Initialized 播客 S34 的整理），不是第一轮猜测的 S26 Agentplex。S26 已打开核实，只是推荐了 S6 这篇文章，没有这句话。
  > "The initial product is a Chrome extension showing every step the agent takes with full reasoning. This transparency builds customer trust before autonomous operation. Interestingly, customers immediately ask for API endpoints for autonomous batch processing—surprising the team with their willingness to embrace the technology."（S5 ✅）
- 旁证：S4 ✅ 写到 2023 年 10 月时智能体已经改成可以用 API 触发，"our customers can integrate them with their workflows without relying on a web interface"。
- **上屏建议**：可以用，但措辞写成"据投资方播客整理"；播客原声未核对。

### R9 角色互换：先是"我们看分析师干活"，然后是"分析师看智能体干活"【本轮新增，来自 Bancoli】
> "In the first month, Parcha's product team shadowed Bancoli's compliance analysts"
> "By month two, Bancoli's analysts were no longer initiating manual KYB reviews but shadowing Parcha's automated compliance workflow."（S28 ✅）
- 这是整个案例里最有画面感的 FDE 桥段：同一个动词 "shadow"，一个月后主语换了。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 客户尽调"流程耗时" | 3 个月 | 5 分钟 | 【Claude原文 S1】✅ | **口径不清**，更可能指"为一家机构上线一条尽调流程"的时间，不是单个案件的处理时间。旁证：S15 ✅ "from months to minutes"；S28 ✅ Bancoli 实施"不到 90 天"；S7 ✅ "Onboarding them takes just five minutes"（指 Grep 模板）。见第 7 节 |
| 开发一个新 OSINT 调查产品 | 做不出来（"literally would not have built this product without it"） | 2 周 | 【Claude原文 S1】✅ | 建立在 3 年积累的工作流和技能包之上（S7 ✅），不是从零开始 |
| 自研工作流引擎投入 | — | 2 年 | 【Claude原文 S1】✅ | 这是"之前"的沉没成本 |
| 适配一家机构的新规则 | 写定制代码（"custom code"） | 改配置（"configuration, not reconstruction"） | 【Claude原文 S1】✅ | 定性描述，没有数字 |
| **Bancoli 单件 KYB 审核** | 30 分钟/件 | 3 分钟/件（降 90%） | 【外部来源 S28】✅ | 客户具名，CEO 有引语；Parcha 自家发布的案例 |
| **Bancoli 上线周期** | — | 不到 90 天；第 30 天回测 50 个申请，准确率 90%；最终达到约定的 95% | 【外部来源 S28】✅ | 过程最完整的一组数字 |
| Bancoli 拒绝不合格企业的速度 | — | "90% faster" | 【外部来源 S28】✅（CEO 引语） | 客户高管的说法 |
| 单个企业尽调案件（渠道宣传口径） | 45 分钟/件 | < 3 分钟 | 【外部来源 S15】✅ | Parcha 在 Alloy 集成通讯里的宣传口径，没有具名客户 |
| 新客户从演示到跑出第一批案件 | 几周集成（"weeks-long integration"） | < 15 分钟 | 【外部来源 S14】✅ | Parcha 自报，指 Agent Hub 自助试用，不等于生产上线 |
| 结构化转向后的可靠性 | 自主智能体（客户说"只有 80% 管用"不能接受） | "three times more reliable" | 【外部来源 S6】✅ | CTO 自报，没有给出测量方法 |
| 10 步流程的错误累积 | 每步 10% 错误率 | 整体 65% 出错 | 【外部来源 S6】✅ | 这是论证用的数学示例（1−0.9¹⁰≈65%），不是实测 |
| 人名匹配模型准确率 | 92%（东亚名 75%） | 99%（东亚名 93%） | 【外部来源 S29】✅ | 自报；在一次试点的回测中发现问题 |
| 误报率 | — | 目标 "below 10%" | 【外部来源 S29】✅ | 自报 |
| Flutterwave 准确率 | — | "as high as 99%"（CRO 引语，S13 ✅）；"99.7% accuracy"（EDD 智能体页 FAQ，S16 同站 ✅） | S13、S16 | 两个数不一致：99% 是客户高管引语里的"最高可达"；99.7% 出现在厂商 FAQ 里，Grep 首页（S11 ✅）也用 99.7% 作为整体宣传数 |
| Flutterwave 人力 | L1 审核靠人工 | "75% headcount growth avoidance... saving millions annually" | 【外部来源 S16 同站 EDD 页】✅ | 厂商 FAQ 口径，"避免了 75% 的人员增长"不是裁员 75% |
| Parcha 整体宣传 | — | "hundreds of thousands of compliance reviews"；"up to 10 times faster"；"accuracy rates exceeding 99%"；"reducing false-positive alerts by up to 90%" | 【外部来源 S13】✅ | 纯营销口径，"up to" 表示上限 |
| 早期测试阶段的准确率门槛 | — | 90%（写进 Brex/Bridge 合同） | 【外部来源 S27】✅ Fortune | 媒体报道，可信度较高 |
| 规模 | — | "customers running tens of thousands of agents executing millions of LLM calls" | 【外部来源 S7】✅ | 自报 |
| Grep 研究预览版采用 | — | 上线两周几百人使用 | 【外部来源 S10】✅ | 发生在 Claude 故事之后 |
| Grep 深度研究基准 | — | DRACO 归一化分 78.6%；DeepSearchQA 84.5%；DeepResearch Bench 56.27 | 【外部来源 S3】✅ | 公司自测自报；和"合规尽调"业务指标无关，仅作背景 |
| 创始人在 Brex 的经历 | — | "grew onboarding 10x in a year" | 【外部来源 S11】✅ | 描述的是 Brex 时期，不是 Parcha 的成绩 |

⚠️ **不要引用的数字**：Airwallex 2023-12-06 新闻稿里的"误报减少 50%"和"无人工干预通过开户的客户增加 20%"。本轮已打开原页（S20 ✅），**全文没有提到 Parcha**。脚注写明对比对象是 "legacy rules-based model with newer generative AI website scanner"，不能把这两个数算在 Parcha 头上。

---

## 6. 方法论提炼（可复用到其他行业）

1. **先拿 SOP，再坐到人旁边看**：设计伙伴阶段用对方的 SOP，并现场跟看人工操作（S6 ✅）；Bancoli 第一个月整月跟看分析师（S28 ✅）。→ FDE 进现场的第一件事：拿到 SOP，再看真人怎么执行 SOP，两者之间的差距就是边界情况。
2. **先定准确率门槛，再谈上线**：合同里写明准确率（S27 ✅）；先用历史数据回测到 90%（S28 ✅、S5 ✅）；再和客户约定一个验收线，比如 95%（S28 ✅）。
3. **"影子运行"交接**：先是人工主做、智能体旁跑；再换成智能体主做、人工复核；每周开会收集边界情况（S28 ✅）。
4. **先窄后宽，先准后全**：客户宁可在一部分任务上准，也不要全自动但只有八成靠谱（S6 ✅）。高风险行业先做"铺好轨道"的结构化流程。
5. **可评测、可归因，是上生产的前提**：把"抽取"和"判断"拆开，每一段有自己的数据集和实验（S4 ✅、S6 ✅）；按细分人群拆准确率，才会发现东亚名只有 75%（S29 ✅）。
6. **嵌进客户已有系统，而不是让客户换系统**：API、Slack、Alloy、ComplyAdvantage（S4、S14、S15 ✅）。"客户不需要聊天机器人"（S4 ✅）。
7. **把"逐家定制"沉淀成"配置 + 模板"**：逐家实施 → 静态配置文件（S6 ✅、S25 ✅）→ Agent Hub 模板（S13 ✅）→ Agent SDK 按配置适配（S1）→ Grep 技能包和模板（S7 ✅）。
8. **结构化阶段的积累不会白费**：重新走向智能体时，3 年的流程经验被打包成技能包（S7 ✅）。
9. **合规场景的治理动作**：部署前由客户合规人员批准所有决策逻辑，鼓励客户先和监管沟通（S30 ✅）；工具默认全部禁用，沙箱隔离（S7 ✅）；审计日志可追溯（S13 ✅、S28 ✅）。
10. **组织上：工程师就是客服，需求"按天交付"**（S31 ✅）：
    > "when a customer asks for a feature or improvement we deem reasonable, the completion timeline will always be days, not weeks, not months, but days."

---

## 7. 数字严谨性 & "评论区喷子"防御

1. **"3 个月→5 分钟"到底是什么时间？**
   - 标签写的是 "Customer due diligence workflow time reduced"，meta 描述更激进："Parcha cut customer diligence from 3 months to 5 minutes"（S1）。
   - 但正文唯一对得上的说法是："Compliance processes that previously required months of custom development now deploy rapidly with institution-specific configurations."（S1）
   - 本轮新旁证：
     - Bancoli 的实施周期是"不到 90 天"，约等于 3 个月（S28 ✅）；
     - Parcha 自己说 Agent Hub 把见效时间 "from months to minutes"（S15 ✅）；
     - CTO 写 Grep 模板 "Onboarding them takes just five minutes"（S7 ✅）。
   - 最合理的解读：**为一家机构上线一套尽调流程**，从约 3 个月的定制实施，缩短到约 5 分钟的配置。这是推断，Claude 原文没有明说。单个案件的口径是另一组数：30 或 45 分钟 → 3 分钟（S28/S15 ✅）。
   - **脚本建议说成"给一家金融公司上线一套新尽调流程"**，不要说"查一个客户从 3 个月变 5 分钟"。
2. **"银行级认证"是谁认证的？**
   - 原文只有 "Bank-grade certification achieved"（S1）。
   - 公开能找到的支撑：
     - 自建"模型验证框架"，含第三方审计，"与客户共同制定、满足上市公司的风险治理要求"（S29 ✅）；
     - 部署前由客户合规人员批准（S30 ✅）；
     - SOC 2 Type II（S22 同站页脚 ✅）；
     - 首页一句 "It survived the hardest reviews in financial services, and the audits after them."（S11 ✅）
   - **没有**任何来源点名是哪家银行的模型风险团队、哪个监管框架、哪个第三方做的认证。**属于公司自报**。
3. **"客户是全球最大的金融科技公司们"**
   - Claude 原文把 Alloy 列为客户（S1），但 Parcha 自己的材料把 Alloy 写成合作渠道："Parcha has partnered with Alloy"（S15 ✅）；Pipe 也是"通过 Alloy"集成的（S14 ✅）。说 Alloy 是"客户"，口径偏宽。
   - 已核实的具名客户：
     - Brex、Bridge（S27、S17 ✅）；
     - Bancoli（S28 ✅）；
     - Airwallex、Flutterwave、Pipe（S13、S15 ✅）；
     - FV Bank（S15、S30、S32 ✅，**唯一具名的"银行"**）；
     - IG / IG.com（S10、S30 ✅）；
     - 另有"一家全球领先的加密货币交易所"（S13 ✅，未具名）和"一家上市全球金融科技公司"的试点（S15 ✅，未具名）。
   - Airwallex 只有名字出现在客户列表里，**没有找到任何 Airwallex 方面提到 Parcha 的公开材料**。
4. **"两周"不是从零开始**：建立在 2–3 年积累的工作流、数据集成和技能包之上（S1 说"两年用 Claude 构建"；S7 ✅ 说"3 years of battle-tested AI workflows"）。
5. **Claude 独家性**：
   - 2023 年起步时就是 "built on top of Anthropic's Claude... and utilizing GPT-4 for some tools"（S27 ✅），种子轮公告也说平台可以用 GPT-4、Claude 或 Llama 2（S17 ✅）；
   - Grep 流程里的消歧和报告生成用的是 Cerebras 上的 GLM 4.6，UI 评审用 Opus 和 Gemini Pro 3（S7 ✅）；
   - 改名后的首页写着 "picks the best frontier or open-source model at every step"（S11 ✅）。
   - 评论区可能会说"不是纯 Claude"。**如实讲：核心研究智能体跑在 Claude Agent SDK 上，外围环节混用多家模型。**
6. **故事主角后来"停掉了原产品线"**：Claude 故事（2025-12-05）发布后，公司于 2026 年停掉 Parcha 原有产品线，全力做 Grep（S11 ✅）。首页同时声明对银行和金融科技伙伴的承诺不变。**建议在脚本里主动讲出来，当作最后一次反转。**
7. **2023 年融资时既没有收入，也没有成品**：Fortune 原话 "without a finished product or revenue"（S27 ✅）。落地过程是从零客户做起的。
8. **负面报道/争议**：
   - WebSearch 和 DuckDuckGo 检索都**没有找到**针对 Parcha 的负面报道、诉讼、裁员或监管处罚。
   - HN 上 "Claude in a Box" 的帖子（S9 ✅）只有 12 分、**0 条评论**，没有可用的质疑素材。
   - ZenML 对 S4 的整理给了一个温和的提醒（S5 ✅）："While the content comes from Parcha's own blog and naturally presents their solutions favorably, the technical details and lessons learned appear genuine and instructive."
9. **大部分外部数字是厂商自报**：30→3 分钟、45→3 分钟、15 分钟、99%/99.7%、75%、"3 倍更可靠"、10 倍，都来自 Parcha 自家页面，没有第三方审计。**只有"90% 准确率门槛"有 Fortune 这个独立媒体来源（S27）。**
10. **第一轮摘要有误，已更正**（本轮逐条对照原页）：
    - (a) **种子轮领投方**：第一轮写"Kindred Ventures 和 Initialized Capital 领投种子轮"。原页：Kindred 领投的是 **pre-seed（175 万美元）**，**种子轮由 Initialized 的 Brett Gibson 领投**；500 万美元含 pre-seed（S17 ✅、S27 ✅）。
    - (b) **"Miguel 一个周末重写成约 500 行"**：第一轮标为出自 S4 博文。S4 原文**没有**这句话，出处是 S5（ZenML 对 Initialized 播客的整理）。
    - (c) **"多语言企业注册文件核验、能轻松适配新的司法辖区"**：第一轮算作 Flutterwave 的说法。原页上这句是 **Bridge 首席合规官 Eric Weingarten** 的引语（S16 ✅）。
    - (d) **"90% 准确率 + 编辑工具""客户马上要批量 API"**：第一轮标为出处不明（疑似 S26 Agentplex）。已确认出自 **S5 ZenML 条目**（底层来源是 S34 播客）。S26 没有这些话。
    - (e) **Flutterwave CRO 引语有两个版本**（"redirected our team from" / "gone from"），已分别标注（S13、S16）。
    - (f) **Pipe 案例（第一轮 S23）和"45 分钟→3 分钟"（第一轮 S24）**：出处页已找到，分别是 S14（2025 Q3 通讯，2025-10-09）和 S15（2025 Q2 通讯，2025-06-30）。原 S23/S24 编号并入。
    - (g) **"客户要的是准确……80%"**：第一轮只有摘要，本轮核实原句为 "worked only 80% of the time"（S6 ✅），并补上了完整上下文。
    - (h) **日期**：S6 为 2024-06-06；S4 为 2023-10-16；S7 为 2025-12-11；S10 为 2026-01-22；S13 为 2025-07-15；种子轮博客页显示 2023-08-30，但 Fortune 首发是 2023-08-08（S27），Kindred 文章是 2023-08-10（S18）。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下是创作建议，不是事实。每条后面的方括号标出所依据的来源编号（均已核实）。

- **钩子 1（反常识）**："一家做 AI 智能体的公司，CTO 写过最出名的一篇文章，叫《智能体不是你需要的全部》。" [S6]
- **钩子 2（角色互换）**："第一个月，他们坐在分析师旁边看；第二个月，分析师坐在 AI 旁边看。" [S28]
- **钩子 3（数字）**："给一家金融公司上线一套新的尽调流程，以前要 3 个月定制实施，现在 5 分钟改配置。" [S1、S15、S28；注意按第 7 节第 1 条的口径表述]
- **钩子 4（兜圈子）**："他们用两年时间，从'智能体'退回'流程'，又从'流程'走回'智能体'。第二次回来，手里多了三年踩坑攒下的经验。" [S6、S7、S10、S1]
- **反转桥段 0：客户要的不是聊天机器人**。团队原本做了一个能和操作员来回对话的智能体，结果发现操作员只说一句"去查这家公司"，然后等结果。CTO 的原话是："客户不需要聊天机器人，他们需要一个把活干完的智能体。" [S4]（可以直接对接本公司"对话框→工作台"的既有叙事）
- **反转桥段 A：八成不够**。客户说：宁可你只做一半，但这一半做对；也不要全做完，却只有八成对。再配一道算术题：每步 90% 准，10 步下来，整体出错率 65%。 [S6]
  - 类比：新来的实习生什么都敢干，但每五件错一件，你敢让他单独签字吗？
- **反转桥段 B：每家银行都是"特殊情况"**。A 银行查一万美元以上汇往某些国家的交易，B 银行查交易频率，C 银行查商户类别。以前每种都要改代码，后来改成"配置，不是重建"。 [S1]
- **反转桥段 C：90 天三段式落地（Bancoli）**。第 1 个月跟看，回测 50 个历史申请做到 90%；第 2 个月影子运行，每周开会收集边界情况，做到约定的 95%；第 3 个月接 API 上线。30 分钟一件变成 3 分钟一件。 [S28]
- **反转桥段 D：东亚名字只有 75%**。总体准确率 92% 看着不错，按文化分组一拆，东亚名字只有 75%。补上示例之后到了 93%，总体 99%。——"平均数会骗人，FDE 要拆开看。" [S29]
- **反转桥段 E：自己先用，再卖给别人**。先在自家工程团队内部用这套框架，才意识到它能直接交给合规分析师。 [S1、S7]
- **反转桥段 F（结尾彩蛋）：副产品吃掉主业**。两周做出的"反洗钱版 Perplexity"上线两周就有几百人在用，公司干脆停掉老产品线，改名 Grep。 [S1、S7、S10、S11；"OSINT 产品＝Grep 前身"仍属推断，建议说"随后他们推出的 Grep……"]
- **FDE 方法论升华（可迁移给中国听众）**：
  - "先铺轨道，再放手"：高风险行业先做结构化流程，把每一步测准，再逐步放给智能体。 [S6、S7、S10]
  - "先坐到旁边看，再让对方坐到旁边看"：跟看 → 影子运行 → 人工复核。 [S28]
  - "现场的定制，最终要长成产品"：从逐家实施，到配置文件，到模板，再到技能包。 [S1、S6、S13、S7]
  - 中国场景映射（纯创作建议）：银行对公开户尽调、跨境支付商户准入审核、反洗钱可疑交易复核。"每家银行的风控规则都不一样"这个痛点可以直接平移。
- **避坑提示**：
  - 不要说"Parcha 让 Airwallex 误报减少 50%"（S20 原页没有提到 Parcha）；
  - 不要说"通过了某某银行的模型认证"（没有公开具体是谁认证的）；
  - 不要把 Parcha 说成有专门的 FDE 团队（没有公开证据；是创始人和产品/工程团队亲自上）；
  - "500 行""编辑工具交给客户""客户要批量 API"三条只有 ZenML 对播客的二手整理，上屏时写"据投资方播客整理"。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S1 | How Parcha built a universal customer diligence agent in two weeks with Claude Agent SDK | https://claude.com/customers/parcha | Claude原文 | 2025-12-05 | ✅ 第一轮 WebFetch + curl 逐字比对；第二轮 2026-09-24 重新 curl，关键句仍在 |
| S2 | Claude Customers 列表页（用于确认 S1 发布日期） | https://claude.com/customers | Claude原文（元数据） | — | ✅（第一轮 curl，页面内嵌 JSON 显示 date 2025-12-05） |
| S3 | Parcha-ai/benchmarks README；同组织 Parcha-ai/build README；grep.ai 银行行业页（同一组基准分） | https://github.com/Parcha-ai/benchmarks （经 https://raw.githubusercontent.com/Parcha-ai/benchmarks/main/README.md 读取；github.com 页面对 curl 返回 403）；https://github.com/Parcha-ai/build ；https://grep.ai/for-enterprise/global-banks | 公司 GitHub / 官网 | 2026 | ✅ raw README 逐字核对（"an AI-powered deep research platform by Parcha"，78.6% / 84.5% / 56.27）；grep.ai 原站页显示同样数字 |
| S4 | Building AI agents in production — Miguel Rios Berrios；LinkedIn 帖 | https://blog.parcha.ai/building-ai-agents-in-production/ （resources.parcha.com 链接会 301 跳转到这里）；https://www.linkedin.com/posts/miguelriosberrios_building-ai-agents-in-production-parcha-activity-7119752383378726912-QJuy | 公司博客（CTO） | 2023-10-16（页面日期；LinkedIn datePublished 同日） | ✅ curl 原页逐字核对；LinkedIn 帖 og 元数据核对 |
| S5 | ZenML LLMOps Database：① Parcha: Building Production-Ready AI Agents for Enterprise Operations（"View source" 指向 S34 的 YouTube 播客）；② Building Production-Grade AI Agents with Distributed Architecture and Error Recovery（对 S4 的整理） | https://www.zenml.io/llmops-database/building-production-ready-ai-agents-for-enterprise-operations ；https://www.zenml.io/llmops-database/building-production-grade-ai-agents-with-distributed-architecture-and-error-recovery | 第三方案例库（二手整理） | 页面标注 "Parcha · 2023" | ✅ curl 原页逐字核对。**"500 行""90% 准确率 + 编辑工具""客户要批量 API""agents handbuilt in California"均出自①** |
| S6 | Agents aren't all you need — Miguel Rios Berrios；LinkedIn 帖 | https://blog.parcha.ai/agents-arent-all-you-need/ ；https://www.linkedin.com/posts/miguelriosberrios_agents-arent-all-you-need-parcha-activity-7204541865101053953-Ari_ （另有 parcha.com、Scribd 镜像，未再打开，不需要） | 公司博客（CTO） | 2024-06-06（页面日期；LinkedIn 同日） | ✅ curl 原页逐字核对 |
| S7 | Claude in a Box: How We Built Grep Using the Claude Agents SDK | https://grep.ai/blog/claude-in-a-box （HN 帖原链接为 blog.parcha.dev/claude-in-a-box） | 公司工程博客（CTO） | 2025-12-11（页面日期） | ✅ curl 原页逐字核对 |
| S8 | AJ Asver 在 X 上转发 S7 | https://x.com/_aj/status/1999538672685772977 | 创始人社交媒体 | 2025-12-12 17:55 UTC | ✅ 经 fxtwitter 公共接口（api.fxtwitter.com）读取推文全文和时间，x.com 原页需登录 |
| S9 | Claude in a Box（Hacker News 讨论帖） | https://news.ycombinator.com/item?id=46246266 | 用户讨论 | 2025-12-12 | ✅ 经 HN Algolia API 读取：12 分，0 条评论 |
| S10 | Introducing Grep: Where Serious Work Gets Done. — AJ Asver | https://blog.parcha.ai/introducing-grep-where-serious-work-gets-done/ | 公司博客（CEO） | 2026-01-22 | ✅ curl 原页逐字核对 |
| S11 | Parcha is now Grep AI（parcha.ai 首页）；About GREP AI | https://www.parcha.ai/ ；https://grep.ai/about | 公司官网 | 2026（页面无日期） | ✅ curl 原页逐字核对 |
| S12 | （预留编号，未使用） | — | — | — | — |
| S13 | Agent Hub: Supercharge Your Compliance Team with AI Agents；@ParchaHQ X 帖；AJ Asver LinkedIn 帖 | https://blog.parcha.ai/agent-hub/ ；https://x.com/ParchaHQ/status/1945184542781792296 ；https://www.linkedin.com/posts/ajasver_compliance-aml-fintech-activity-7350942168003325954-QExc | 公司博客/社交媒体 | 2025-07-15 | ✅ 博客原页逐字核对；X 帖经 fxtwitter 接口核对；LinkedIn 帖 og 元数据核对 |
| S14 | The Audit Log – Q3 2025（含 Agent Hub 正式发布、"under 15 minutes"、Pipe 客户案例和 CEO Luke Voiles 引语；**原 S23 并入**） | https://blog.parcha.ai/the-audit-log-q3-2025/ | 公司季度通讯 | 2025-10-09 | ✅ curl 原页逐字核对 |
| S15 | The Audit Log Q2 2025 – Create AI agents in minutes, Alloy integration, and 47+ updates（含"45 分钟→3 分钟"、"from months to minutes"、上市公司试点、招聘岗位；**原 S24 并入**） | https://blog.parcha.ai/the-audit-log-q2-2025/ | 公司季度通讯 | 2025-06-30 | ✅ curl 原页逐字核对 |
| S16 | Business due diligence 产品页；Enhanced Due Diligence 智能体页（FAQ 中有 Flutterwave "75% headcount growth avoidance and 99.7% accuracy"） | https://www.parcha.ai/products/business-due-diligence ；https://www.parcha.ai/agents/enhanced-due-diligence | 公司产品页（客户引语） | 无日期 | ✅ curl 原页逐字核对。**注意：多语言/司法辖区引语是 Bridge CCO 的，不是 Flutterwave 的** |
| S17 | Parcha Raises $5M to intelligently automate compliance and operations；LinkedIn 帖 | https://blog.parcha.ai/parcha-raises-5m-to-intelligently/ ；https://www.linkedin.com/posts/parcha-ai_former-brex-duo-raises-5-million-for-new-activity-7094659084892717056-pxzf | 公司博客/融资新闻 | 博客页显示 2023-08-30；LinkedIn 帖 2023-08-08 | ✅ 原页逐字核对 |
| S18 | Our Investment in Parcha: AI Agents for the Enterprise — Steve Jang, Kindred Ventures | https://kindredventures.com/announcement/our-investment-in-parcha-ai-agents-for-the-enterprise/ （Medium 镜像 https://medium.com/kindred-ventures/our-investment-in-parcha-ai-agents-for-the-enterprise-f74d092e3339） | 投资方文章 | 2023-08-10 | ✅ Kindred 官网原页逐字核对；❌ Medium 镜像返回 403（不影响，内容以官网为准） |
| S19 | Episode Recap: Scaling AI Agents for Real-World Tasks with Parcha CEO AJ Asver（Initialized）；Parcha 博客同题访谈 | https://blog.initialized.com/2024/02/scaling-ai-agents-for-real-world-tasks-with-parcha-ceo-aj-asver/ ；https://blog.parcha.ai/interview-scaling-ai-agents-for-real/ | 投资方播客回顾 | 2024-02-14（Initialized）；2024-02-02（Parcha） | ✅ 两页原文核对（回顾页只有简介和时间戳，没有文字稿） |
| S20 | Airwallex improves customer onboarding with generative AI | https://www.airwallex.com/newsroom/airwallex-improves-customer-onboarding-with-generative-ai （跳转到 /global/newsroom/…） | 客户方新闻稿 | 2023-12-06 | ✅ 原页核对：**全文没有提到 Parcha**，50%/20% 不能算作 Parcha 的数字 |
| S21 | How Parcha automated financial compliance with Browserbase | https://www.browserbase.com/blog/case-study-parcha | 合作方案例 | 2024-10-30 | ✅ 原页逐字核对（"we only have four engineers"） |
| S22 | 招聘：parcha.ai/jobs（嵌入 Ashby 招聘板，抓取时没有可见职位）；LinkedIn "Applied AI Engineer at Parcha"；Initialized 招聘板 founding full-stack engineer | https://www.parcha.ai/jobs ；https://www.linkedin.com/jobs/view/applied-ai-engineer-at-parcha-4072314615 ；https://jobs.initialized.com/companies/parcha-2/jobs/37159258-founding-full-stack-engineer | 招聘 | — | ✅ parcha.ai/jobs 原页（页脚有 SOC 2 Type II 声明）；❌ LinkedIn 职位页 404（已下线）；❌ Initialized 职位页 404。可核实的岗位见 S4（founding full-stack engineer）和 S15（Backend Engineer、Applied AI Engineer）。**没有发现 FDE / Solutions / Implementation 岗位** |
| S23 | （已并入 S14） | — | — | — | — |
| S24 | （已并入 S15） | — | — | — | — |
| S25 | Anatomy of a Parcha agent（API 文档，智能体即 TOML 配置文件）；Part 4 - Agentic AI: Built with Guardrails for Compliance | https://docs.parcha.ai/concepts/anatomy-of-a-parcha-agent ；https://blog.parcha.ai/agentic-ai-built-with-guardrails-for-compliance/ | 公司文档/博客 | 文档示例 created_at 2024-08-01；博文 2025-09-19 | ✅ 原页核对 |
| S26 | Agentplex Weekly - Issue #5 | https://agentplex.substack.com/p/agentplex-weekly-issue-5 | 第三方简报 | 未标注 | ✅ 原页核对：只是推荐 S6 这篇文章，**没有**"90% 准确率 + 编辑工具""批量 API"两句（第一轮对出处的猜测有误） |
| S27 | Former Brex duo raises $5 million for new, pre-revenue A.I. agent startup meant to help fintech teams scale（Fortune） | https://fortune.com/2023/08/08/brex-parcha-artificial-intelligence-seed/ | 媒体 | 2023-08-08 | ✅ curl 原页逐字核对（首批客户 Brex/Bridge、逐家定制、合同里的 90% 准确率门槛、团队规模） |
| S28 | Bancoli accelerates onboarding with Parcha — Bancoli achieves 10x faster compliance reviews with 95% accuracy live in less than 90 days | https://blog.parcha.ai/bancoli-achieves-10x-faster-compliance-reviews-with-95-accuracy-live-in-less-than-90-days/ ；https://www.parcha.ai/customer-stories/bancoli | 公司客户案例（含客户 CEO 引语） | 2024-06-01 | ✅ 两页原文逐字核对（内容一致） |
| S29 | How our AI models achieve 99% accuracy in production（Parcha Model Validation Framework） | https://blog.parcha.ai/99-accuracy/ | 公司博客（CEO） | 2024-10-31 | ✅ curl 原页逐字核对 |
| S30 | AI in Compliance: Addressing the Top Four Concerns BSA Officers Raise | https://blog.parcha.ai/ai-in-compliance-addressing-the-top-four-concerns-bsa-officers-raise/ | 公司博客（CEO） | 2025-07-30 | ✅ curl 原页逐字核对 |
| S31 | Parcha Engineering Handbook — Miguel Rios Berrios | https://blog.parcha.ai/parcha-engineering-handbook/ | 公司博客（CTO） | 2025-03-26 | ✅ curl 原页逐字核对 |
| S32 | The Audit Log Q4'24（首期）；The Audit Log Q1'25（客户 Bridge、Flutterwave、FV Bank） | https://blog.parcha.ai/the-audit-log-q4-2024/ ；https://blog.parcha.ai/the-audit-log-q125/ | 公司季度通讯 | 2024-10-17；2025-02-20 | ✅ curl 原页核对 |
| S33 | Jobs at Grep AI（YC 公司页：Founded 2023，Batch F26，Team Size 6） | https://www.ycombinator.com/companies/grep-ai/jobs | YC 公司页 | 抓取于 2026-09-24 | ✅ curl 原页核对（当时无在招职位） |
| S34 | Scaling AI Agents for Real-World Tasks with Parcha CEO AJ Asver（Initialized Capital，High Bit 播客视频；S5① 的底层来源） | https://www.youtube.com/watch?v=zCGWDWCTYkE | 播客视频 | 约 2024-01（Parcha 博客 2024-02-02 转载） | ✅ 仅通过 YouTube oEmbed 核实标题和发布方；❌ 字幕/文字稿无法获取（YouTube 拒绝本环境 IP 抓取字幕），所以 S5① 里的转述无法对照原声 |

**中文检索**：用 WebSearch 和 DuckDuckGo 检索了 "Parcha 合规/反洗钱/KYB/Grep"，以及 36氪、机器之心、虎嗅等站点。**未找到中文报道**。

**仍存在的缺口**：
1. "银行级认证"的认证方、所用框架、对应的银行均未公开。
2. Claude Agent SDK 时代（2025 下半年）没有具名客户的落地过程。过程最完整的 Bancoli 案例属于 2024 年的结构化流程时代。
3. 唯一具名的银行客户 FV Bank 没有公开案例细节。
4. S34 播客原声未核对，所以"500 行""编辑工具交给客户""批量 API"三条只能算二手整理。
5. Airwallex 与 Parcha 合作的具体内容没有任何公开细节。
