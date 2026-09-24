# 案例：DXC Technology — 在保险核心系统平台 Assure 里嵌入 Claude 智能体，把理赔单证积压从"几天"压到"几分钟"，把一个强监管的工伤赔付计算 8 小时做出可用版本

> **核实状态说明（第二轮，2026-09-24 更新，请先读）**
> 第二轮网络放开后，第一轮所有标 ⚠️ 的外部来源都已逐个用 curl 打开原页、去标签后 grep 原句核对。
> - **第一轮外部来源（S4–S19，共 16 个）**：15 个已打开核对 → ✅；1 个无法访问 → ❌（S15 LinkedIn：代理拦截 linkedin.com，Wayback 快照返回 429 / 连接被重置）。S1–S3、S20 第一轮已是 ✅，本轮重新打开 S1、S2 复核，引文无误。
> - **本轮新增来源 S21–S28**：6 个 ✅（WorkSafe Victoria 代理名单、Lockton 新州工伤代理说明、DXC 在澳洲招聘 PIAWE 专员的职位页、Yahoo 股东大会报道、Reinsurance News、美通社中文稿）；2 个 ❌（Insurance Innovation Reporter、HCAmag，均被代理拦截）。
> - **第一轮摘要有误、本轮已按原页更正的地方**（详见第 7 节 F）：Pieroni 履历里的具体头衔、播客页的"黑箱"说法、2025-10 Smart Apps 新闻稿里的"AWS"、Assure 产品页的"数千个 API"、WorkSafe 页面的"52 周"、财报会上"近乎为零"的归属和 Fernandez 关于销售周期的原话。
> - 仍有缺口：没有任何一家保险公司被点名为 Claude 版 Assure 的用户；没有找到 field development engineers 在客户现场怎么干活的一手描述；Insurance Journal / Digital Insurance / Carrier Management / The Register 没找到针对这件事的独立报道。

- **行业**：保险（财险、寿险、工伤险的核心系统与理赔、核保业务流程外包）/ 金融 IT 服务
- **企业规模 / 地区**：大型。DXC 集团员工超过 11.5 万、分布在 70 个国家（[S2] ✅ [S4] ✅）；保险业务线 1.4 万人（[S1] ✅）。Claude 页面标注地区为 North America（[S1] ✅），但工伤案例很可能来自澳洲业务（见第 3 节第 4 步）。
- **Claude 产品标签**：Claude Platform（API）；另外文中提到 DXC 的 "field development engineers" 用 Claude Code 构建这些能力（[S1] ✅）
- **Claude 故事发布日期**：页面、页面元数据和站点地图里都**没有显示发布日期**。从内容推断发布时间在 2026 年，很可能晚于 2026-03 的 Smart Apps 发布，但**无法确认**。
- **Claude 原文链接**：https://claude.com/customers/dxc
- **落地主体（谁是"FDE"）**：
  - **保险里这几项成果的直接落地方是 DXC 自己的保险软件团队**。原文说 "its field development engineers build them with Claude Code"，工伤计算这个 SmartApp 是 Pieroni 团队自己"喂规则、喂计算器"做出来的（"We fed Claude the regulations…"）（[S1] ✅）。DXC 在这里的角色相当于客户（保险公司）的"内置 FDE"：它运营着这些保险公司的核心系统，旗下寿险 BPS 部门本身就替北美约 30 家保险公司处理后台和呼叫中心业务（[S14] ✅）。
  - **"FDE 计划"本身是后来才宣布的**：2026-06-11，DXC 和 Anthropic 宣布联盟，要培养"数万名 Claude 认证的前置部署工程师"（[S2] ✅ [S4] ✅）。7 月中旬才在旧金山、伦敦办 base camp 开始认证，到 2026-07-30 财报会时首批 86 人认证完成（[S5] ✅ [S6] ✅）。所以**不能把保险成果说成"这批 FDE 做出来的"**，时间线对不上（详见第 7 节）。
- **本案例推荐指数：3 / 5**（与第一轮相同）
  - 数字充分度：★★★★☆。8 小时、首轮 80% 正确、人工判断占比 70%→20%、12–18 个月→几天、几天→几分钟、分类不到 1 秒，数字很多也很"硬"，但全部是 DXC 自报，没有点名任何一家保险公司。
  - 过程 / 反转素材：★★☆☆☆ → 略有改善但仍不到三星。本轮补到了 DXC 寿险 BPS 部门"先在自己身上试"（Customer Zero）的一手问答（理赔 40–60 天 → 10–15 天）[S14 ✅]，以及客户大会上"连夜做原型、第二天演示"的原文 [S8 ✅]；但这两条都属于 ServiceNow 版 Smart Apps，**没说用的是 Claude**。和 Claude 直接相关的一线过程（谁在现场、踩了什么坑）仍然**找不到公开信息**。所以指数不变。
  - 对中国听众的可迁移性：★★★★☆。"保险理赔单证积压""监管规则一变系统要改一年""工伤赔付金额算不准"这些痛点在国内保险公司、TPA、社保经办都很常见。"审计留痕 + 人工把关点"这套治理思路也能直接对上国内金融监管的语境。

---

## 1. Claude 原文要点（事实 + 数字）

全部来自 [S1] ✅ https://claude.com/customers/dxc

**公司体量**
1. DXC 为全球保险业运营核心系统：1,100 家客户（保险公司、经纪、第三方理赔管理机构 TPA）在它的平台上跑着数十亿张保单，涉及年保费 5–7 万亿美元。
   > "1,100 customers, from carriers to brokers and third-party administrators, run billions of policies on its platforms, which touch between five and seven trillion dollars in annual premiums."
2. Assure 是把这些产品串起来的编排平台，Claude 跑在它的每一层里。
   > "Assure is the orchestration platform that ties that portfolio together, and Claude now runs inside every layer of it, from reading claims documents to logging every action an agent takes for regulators."

**六条核心成果（原文 bullet）**
3. 理赔单证积压从"几天"降到"几分钟"，单据分类不到 1 秒。
   > "Cut claims document backlogs from days to minutes, with documents classified in under a second"
4. 新监管规则几天内就能嵌入系统，行业里过去要 12–18 个月。
   > "Embeds new regulatory rules in days, work that historically took 12 to 18 months"
5. 8 小时做出一个复杂、受监管的赔付计算的可用版本，首轮 80% 正确。
   > "Stood up a working version of a complex, regulated benefits calculation in eight hours, 80% right on the first pass"
6. 治理是默认开启的：每个动作都有记录、可追溯、可端到端回放给监管看。
   > "every action logged, traceable, and replayable end to end for regulators"
7. 在 1.4 万人的保险业务里，已有数千名员工在用。
   > "Scaled Claude-powered capabilities to thousands of employees across its 14,000-person insurance business"
8. 按模型档位分流：前沿模型只留给上百页的理赔卷宗。
   > "Routes work across model tiers, reserving frontier models for hundred-page claims files"

**痛点数字（都是 Pieroni 的估计或说法）**
9. 核保和理赔这两个决策点创造了行业"100% 的价值"；约 70% 的这类决策靠人的判断，而不是结构化规则；一家普通保险公司"不到一小时就要做几百万个"这种决策。
   > "Pieroni estimates 70% of those decisions on human judgment rather than structured rules." / "For an average carrier, millions of these decisions are made in less than an hour"
10. 单证通过邮件、传真、纸件、电话进来，要么人工重新录入，要么走 OCR。全行业有 4 EB 数据，能用的不到 15%。在理赔运营里，光是看懂单证就要占掉专家至少 40–50% 的时间。
    > "Before Claude, making sense of those documents took at least 40 to 50% of expert time in claims operations. 'Backlogs for claims ran days, exceptions waited, errors compounded,' Pieroni said."
11. 理赔拖得越久赔得越多（claim severity 上升）。客户流失只有两个原因：理赔处理不当，以及一年内涨价超过 10%。财险公司长期利润率只有约 1%。
12. 保险公司成本结构：核保占 25%，理赔占 75%。

**选型过程（隐含的"先定标准再挑模型"）**
13. DXC 在选模型**之前**先定了门槛：默认治理（每个动作可追溯）；生产优先于试点；聚焦核心业务；回报要能按单个决策衡量；见效快。
    > "DXC set its bar before picking a model: governance by default, with every action traceable; production over pilots; a focus on the core…; returns measurable decision by decision; and speed to value."
14. 评测里发现：商业理赔卷宗动辄几百页，别的模型"跟丢了线索"；Claude 在复杂逻辑上首轮正确率"一开始就好得多"，不需要反复重试；指令遵循在 DXC 的"十个案例演示"里站得住；给出的解释合规官可以直接签字，不用"翻译"。
    > "in testing Claude held context where other models, as Pieroni put it, 'just lost the thread.' First-pass correctness on complex logic came 'far better from the onset,' without the retry loops other models needed, and instruction adherence held on DXC's ten-case demo."
15. "会标出不确定、会问而不是猜"，被当成受监管业务的刚需。
    > "Claude does a better job at flagging uncertainty and asks when there's uncertainty rather than guessing… That type of behavior is what regulated work like insurance demands."
16. 在 Claude Platform 上构建 Assure 大约一年。Assure 走 API，和现有产品线打通，客户接入不需要定制。
    > "DXC has been building on the Claude Platform for about a year to create Assure… clients connect without custom setups."

**架构（四层）与人机分工**
17. 第一层，文档智能：分类不到 1 秒，抽取保单、当事方、金额、日期，并标出需要人处理的事项；核保侧读投保材料、把风险结构化，以"例外处理"的方式交给核保员。第二层，工作流编排。第三层，Smart Apps，即单一任务智能体，例如出险报案（FNOL）、理赔准备金（reserving）。第四层，合规层，覆盖 200 多个国家和地区。
18. 智能体在设定的**授权额度**内行动；凡是有重大、法律或财务影响的决定，**人掌握把关点**；监管可以端到端重建任何一个决策。
    > "The Claude-powered agents operate inside set authority levels, and humans own the checkpoints on calls with material, legal, or financial weight"
    > "Every action is recorded: who decided, what basis, what moment, whether it's a person or the agent"
19. 简单分诊走轻量模型，百页卷宗走前沿模型。

**工伤赔付计算（本案最强的故事）**
20. 场景：工伤险的"受伤前平均周收入"（pre-injury average weekly earnings），按受伤前 52 周的总收入平均，决定伤者康复期间每周领多少钱。Pieroni 称之为"整个理赔都骑在它身上的那个数"。
    > "DXC's clearest example of advancing AI came through a workers' compensation use case centered on a single number: the pre-injury average weekly earnings, which determines what an injured worker receives while recovering, which averages 52 weeks of gross earnings"
    > "'the number the whole claim rides on'… 'It drives every weekly payment that follows. It's highly regulated and it's unforgiving.' Projects tend to fall months behind getting the calculation right."
21. 做法：把法规、立法、成文规则、系统算法和 DXC 自己的计算器全部喂给 Claude，8 小时立起一个可用的 SmartApp。
    > "'We fed Claude the regulations, the legislation, documented rules, our system algorithms, and our own DXC calculators,' Pieroni recalled. 'We stood a working SmartApp up in eight hours.'"
22. 首轮 80% 正确，剩下 20% 交给理赔专家，专家的复核"进一步训练了模型"；需要人工判断的比例已经从 70% 降到 20%，最终会"削到零"。
    > "The workers' comp Smart App running on Claude was 80% right on the first pass. The remaining 20% of decision-making went to claims experts, whose review further trained the model. The share of the calculation requiring human judgment has already dropped from 70% to 20%"
23. 价值落点：
    > "These are injured people… These people need this money. They can't wait for it. It's not about compliance. It's about doing the right thing for the insured."

**规模化与愿景**
24. 数千名保险业务员工在用；"field development engineers" 用 Claude Code 构建这些能力。
    > "Thousands of the 14,000 DXC employees in its insurance business use these capabilities today, and its field development engineers build them with Claude Code."
25. 监管变更："stuff that took months now is days"。Claude 读懂复杂法规只要几秒到几分钟。
26. 愿景：现在保险业约 1% 的决策是全自动的（"no one touches"），目标 50%，也就是提升 50 倍；让监管规则本身变成会自我更新的"living code"。

---

## 2. 背景与痛点（结构化）

| 痛点 | 具体描述 / 数字 | 来源 |
|---|---|---|
| 决策靠人 | 核保、理赔约 70% 的决策靠人的判断；一家保险公司不到一小时就要做几百万个决策 | 【Claude原文】[S1] ✅ |
| 单证靠手 | 单证通过邮件、传真、纸件、电话进来，靠人工录入或 OCR；理赔专家 40–50% 的时间花在"看懂单证"上 | 【Claude原文】[S1] ✅ |
| 数据不可用 | 全行业 4 EB 数据，可用的不到 15% | 【Claude原文】[S1] ✅（Pieroni 估计） |
| 积压 → 赔得更多 → 客户流失 | 理赔积压以"天"计；越慢赔付越多；理赔处理不当是客户流失的两大原因之一；财险利润率约 1% | 【Claude原文】[S1] ✅ |
| 监管变更慢 | 新规则写进系统，行业里历来要 12–18 个月 | 【Claude原文】[S1] ✅ |
| 受监管计算容易拖 | 工伤周赔付基数的计算"项目往往落后几个月" | 【Claude原文】[S1] ✅ |
| 成本重心在理赔 | 核保占成本 25%，理赔占 75% | 【Claude原文】[S1] ✅ |
| 人才危机 | Pieroni 说行业面临人才危机，保险公司"应该抢着提升员工的产能和能力" | 【Claude原文】[S1] ✅ |
| 大改核心系统没人愿意碰 | DXC 的问答文章（2026-05-21）：很多保险公司还跑在 30 年前用 COBOL 写的平台上；"多数保险 IT 负责人对要做好几年的现代化项目没有胃口。保险业的 AI 试点会卡住，不是因为技术没准备好，而是因为集成路径看起来是全有或全无。" 原句："Most insurance IT leaders don't have the appetite for modernization projects that can take years to complete. AI pilots in insurance can stall not because the technology isn't ready, but because the path to integrating it feels all or nothing." | 【外部来源 S14】✅ |
| 理赔周期长 | 同一篇问答里，DXC 寿险 BPS 负责人 Dan Stanovich 说：传统上处理一笔理赔要 40–60 天，理赔员和保单持有人之间来回拉扯，纸质流程容易出错、缺资料。原句："Traditionally, processing a claim takes anywhere from 40 to 60 days." | 【外部来源 S14】✅ |
| 行业测算 | Pieroni 署名文章（2025-09）引用 DXC 基准研究：财险核保费用率预计下降 15–20%、理赔费用率下降超过 15%；寿险核保成本下降超过 25%、给付费用下降近 20%；理赔从"几周"缩到"几小时或更短"，支付错误减少 30% 以上。原句："In P&C, for example, underwriting expense ratios are projected to decline by 15 to 20 percent… In life insurance, underwriting costs will fall by more than 25 percent" | 【外部来源 S13】✅（这是预测，不是结果） |

---

## 3. 落地过程（FDE 怎么做的）

> 说明：Claude 原文只给出了"做了什么"，没有写"谁、在哪家客户现场、花了几周"。下面的步骤是按原文和外部来源重排的时间线，**没有来源支撑的环节明确写"未找到公开信息"**。

**第 0 步：人到位（2025 年 4 月）**
- 2025-04-23，DXC 任命 William（Bill）Pieroni 为保险软件与业务流程服务（BPS）的"全球战略与增长负责人"（"Global Strategy and Growth Leader for Insurance Software & Business Process Services (BPS)"）。他此前是保险业标准组织 ACORD 的 CEO，还在 ACORD 设立了 ACORD Solutions Group；更早在 Marsh McLennan、Aon、State Farm、IBM、埃森哲、麦肯锡担任过高管（新闻稿原文只写 "held senior executive roles at Marsh McLennan, Aon, State Farm, IBM, Accenture, and McKinsey & Company"，**没写具体头衔**）。【外部来源 S11】✅
- 【Claude原文】[S1] 里他的头衔是 "Global AI, Strategy & Growth Executive"；AM Best 播客页写作 "global AI, strategy and growth leader"【S12 ✅】。
- 意义：推动者是一位"保险业务出身 + 行业标准组织出身"的高管，不是纯技术负责人。

**第 1 步：先定门槛，再挑模型（时间未披露，约 2025 年）**
- 五条门槛：默认治理、生产优先于试点、聚焦核心（理赔占 75% 成本）、按决策衡量回报、见效快。【Claude原文】[S1] ✅
  > "DXC set its bar before picking a model…; production over pilots…"
- 自建评测：百页商业理赔卷宗的长上下文、复杂逻辑的首轮正确率、"十个案例演示"上的指令遵循、解释能不能让合规官直接签字。【Claude原文】[S1] ✅
- 2025 年秋 Pieroni 在 InsureTech Connect 2025（拉斯维加斯）接受 AM Best TV 采访，节目页只写他认为保险业已到临界点，AI 将"淘汰落后者、加速领先者"（"eliminate laggards and accelerate leaders"），**没有提到 Claude 或具体案例**。节目 2025-12-04 上线。【外部来源 S12】✅（只核对了节目页简介，节目没有文字稿）

**第 2 步：先在自己家用，再给客户（2025–2026，"Customer Zero"）**
- Anthropic 官方说法：DXC 先在自己内部用 Claude，满足的是和客户同样严格的安全合规要求。例如 DXC OASIS（托管服务的 AI 原生编排平台，2026 年 4 月上线）超过 95% 的代码由 Claude 生成、再经工程师复核，交付速度估计提升 10 倍，已服务 50 多家客户。【外部来源 S2 ✅、S4 ✅】
  > "They proved Claude inside their own operations first, under the same security and compliance requirements their customers face."（Anthropic CCO Paul Smith）
- 保险侧：DXC 用 Claude Platform 构建 Assure 编排层"约一年"。【Claude原文】[S1] ✅
- **保险业务里的 Customer Zero（新补，一手问答）**：DXC 寿险 BPS 部门替北美约 30 家保险公司做后台和呼叫中心运营。负责人 Dan Stanovich 说："如果 DXC 的寿险 BPS 是一家保险公司，我们会是北美最大的。"他们先在自家运营里把 Claims Assistant 和 Engagement Assistant 跑通，再推向市场。【外部来源 S14】✅
  > "It also positions us as what we call Customer Zero for DXC's insurance software, including Assure Smart Apps. We prove it works in our own operation first before we bring it to market — we've done it with the Claims Assistant and Engagement Assistant"
  > "With agentic AI, a claims process can go from 40 to 60 days down to 10 to 15."
  - 分工描述：Claims Assistant 以电子方式生成并签署理赔表单，"有恰当的人工监督"；AI 智能体同时做单证抽取、欺诈检测、保单校验，简单理赔（保障清楚、资料齐全、无欺诈迹象）可以很快结案。
  - **注意**：这篇问答讲的是"构建在 ServiceNow 上"的 Smart Apps，只说"使用大语言模型"（"using large language models"），**没有说是 Claude**。不能把"40–60 天 → 10–15 天"算到 Claude 头上。

**第 3 步：搭四层架构 + 人机分工**
- 文档智能 → 工作流编排 → Smart Apps（单一任务智能体）→ 合规层。【Claude原文】[S1] ✅
- 人机分工：智能体只在授权额度内行动；重大、法律、财务相关的决定由人把关；每一步记录"谁决定、依据什么、什么时间、是人还是智能体"；核保端采用"例外处理"，只把需要人判断的交给核保员。【Claude原文】[S1] ✅
- 成本控制：简单分诊走轻量模型，百页卷宗走前沿模型。【Claude原文】[S1] ✅

**第 4 步：破冰场景（原文没点名"第一个"，按证据推测）**
- Claude 原文称工伤案例是 "DXC's clearest example"，但**没说它是第一个场景**。文档分类、抽取（理赔单证积压）是这套平台最底层的能力，按逻辑很可能最先上线，但**未找到公开信息确认先后顺序**。
- 工伤 SmartApp：把法规、立法、成文规则、系统算法、DXC 自有计算器喂给 Claude，8 小时出可用版本，首轮 80% 正确，剩下 20% 交给理赔专家复核并回流。【Claude原文】[S1] ✅
- **这个工伤场景在哪个法域？（本轮加强了证据，但仍是推断）**
  - "pre-injury average weekly earnings（PIAWE）"是澳大利亚工伤保险的法定术语。维州 WorkSafe 官方页面："How much these payments are depends on how much you earned before you were injured. This is called your pre-injury average weekly earnings (PIAWE)."；前 13 周每周赔付为 PIAWE 的 95%。【外部来源 S16】✅（注意：该页面**没有**写"52 周"，"52 周平均"只出现在 Claude 原文里）
  - DXC 是维州 WorkSafe 的四家理赔代理之一（名单：Allianz、EML、Gallagher Bassett、DXC Claims Management Services）。【外部来源 S21】✅
  - DXC 也是新州（NSW）工伤体系的六家理赔服务商之一，2023 年起进入。【外部来源 S22】✅
  - DXC 维州业务页写明，代理负责确保 PIAWE 赔付准确："Agents (scheme agents, service providers, authorised providers and claims managers) are responsible for ensuring that those payments are accurate."；并称 DXC 在澳洲管理工伤保单和理赔已有 20 多年。【外部来源 S17】✅
  - DXC 2026-07 在墨尔本和新州 Macquarie Park 招聘"工伤 PIAWE 专员"，职责就是"按各州工伤法规准确计算 PIAWE"。【外部来源 S23】✅
  - 2026-03 客户大会的自保（self-insured）分会场议程写到会"介绍我们在澳大利亚的最新创新及其对全球客户的意义"（"highlight recent innovation from our work in Australia"），主题正是工伤和责任险。【外部来源 S10 活动页】✅
  - **结论**：这个场景**很可能**来自 DXC 的澳洲工伤理赔代理业务（维州或新州），而不是美国；但**没有任何来源明说**，Claude 页面标注的地区又是 North America。脚本里只说"工伤保险"，不要说哪个国家。
- **8 小时是不是在客户大会上做出来的？** DXC 2026-04-09 新闻稿原文："During the event, DXC engineers rapidly prototyped new AI agents overnight and demonstrated them on day two"；现场设了 "Assure Smart App Studio"，客户在这里贡献 Smart App 的点子。【外部来源 S8】✅ 大会是 2026-03-03 至 05 在南卡罗来纳州查尔斯顿举行的第四届 DXC Connect 保险高管论坛，Pieroni 在第三天做了主题演讲 "The agentic shift"。【外部来源 S10 活动页】✅ **没有来源把这次"连夜原型"和"8 小时工伤 SmartApp"对应起来，不能混为一谈。**

**第 5 步：产品化成可复制的 Smart Apps（2025-10 → 2026-04）**
- 2025-10-13：DXC 发布 Assure Smart Apps，"用 DXC 的 Assure BPM 构建"，通过"业界领先的云能力和 DXC Assure Platform 的 API"与保险公司核心系统集成；与 ServiceNow 的合作增强了 Assure BPM 的工作流和智能体能力，流程设计时间减少约 80%。【外部来源 S9】✅（第一轮写"通过 AWS 云能力"，原文**没有提 AWS**，已更正）
  > "The suite fully integrates with insurers' core systems through industry-leading cloud capabilities, and APIs of the DXC Assure Platform."
- 2026-03 在论坛发布、2026-04-09 发新闻稿：新一批 Smart Apps "构建在 ServiceNow 上"（"new Assure Smart Apps built on ServiceNow"），通过 Assure Platform 编排；首批三个是 Claims Assistant、Engagement Assistant、Underwriter Assistant；口径是人工流程减少 30–40%、周期缩短"约 30%"（副标题）/"最多 30%"（正文），Claims Assistant 单独写"最多 35%"，Engagement Assistant 客户体验提升 5–15%；"12 周或更短"见到可衡量成果。【外部来源 S8】✅ 媒体 Beinsure 基本照抄新闻稿。【S10】✅
- Assure Platform 产品页："Powered by AWS"；Smart Apps "use the Assure Platform's intelligent orchestration, together with generative and agentic AI"。【外部来源 S19】✅
- **Claude 与 ServiceNow 在 Smart Apps 里怎么分工？** 本轮打开的所有 DXC 页面（S8、S9、S10、S14、S19，以及活动页）**都没有出现 "Claude" 或 "Anthropic"**，只写 ServiceNow、AWS 和"大语言模型"。唯一把 Smart App 和 Claude 连起来的是 Claude 原文："The workers' comp Smart App running on Claude"【S1 ✅】。合理解读：Smart Apps 是一个产品线品牌，工作流底座是 ServiceNow / Assure BPM，至少工伤这一个 Smart App 的推理跑在 Claude 上；其他 Smart App 用什么模型，**未找到公开信息**。

**第 6 步：规模化**
- 数千名保险业务员工在用；"field development engineers" 用 Claude Code 构建。【Claude原文】[S1] ✅
- 财务侧印证（间接）：FY2026 第四季度（2026 年 1–3 月）保险收入同比增长 4%，软件业务增长在十几个百分点的高段，DXC 把原因归于客户迁移到云端 Assure 平台、采用 AI Smart Apps。原句："Insurance: Revenue grew 4% year over year, driven by high-teens growth in the software business. DXC cited customer migrations to its cloud-based Assure platform and adoption of AI-enabled Smart Apps."【外部来源 S7】✅
- Q1 FY2027（2026 年 4–6 月）：保险软件收入同比增长 13%，SaaS 收入同比翻倍以上，CFO 说 SaaS 收入会随着客户迁移上平台、AI Smart Apps 销售增长而增加。【外部来源 S6】✅（Motley Fool 文字稿把平台名转写成 "Azure platform"，结合 Q4 的 "cloud-based Assure platform"，应是语音转写错误）

**第 7 步：把"FDE"变成一个规模化队伍（2026-06 起）**
- 2026-06-11 宣布联盟：DXC 成为 Claude Partner Network 中为数不多的 Global Premier 合作伙伴之一；保险是三个首发领域之一（保险、网络安全、应用服务；Anthropic 版本另列了现代化即服务）。【外部来源 S4 ✅、S2 ✅】
  > "These engineers will be selectively recruited from DXC's existing engineering talent, trained and certified in 90 days through the Anthropic Partner Academy"（S4 原句；S2 称该项目为 "Anthropic Academy"）
  > "DXC has also developed additional certification curriculum to enhance its engineers' capability to operate in mission-critical environments."（S4）
- 认证承诺 2 万人。【外部来源 S3】✅
  > "DXC has committed to 20,000 certifications."
- 7 月中旬起在旧金山、伦敦办 base camp 实操营；到 2026-07-30 财报会，首批 86 人认证完成。【外部来源 S6】✅
  > "In mid July, we began certifying DXC engineers with anthropic through hands on base camps in San Francisco and London… We are seeing early momentum with our first 86 trained."（CEO Raul Fernandez，文字稿为机器转写，大小写照录）
- CEO 对 FDE 的定义："一类新的混合型 AI 构建者，直接在客户环境里工作，把 AI 概念变成已部署的结果，再把可复用的模式沉淀下来以便规模化。"【S6 ✅】
  > "FDEs are a new class of hybrid AI builders, who work directly inside customer environments. Turning AI concepts into deployed outcomes and then capturing the reusable patterns that allow us to scale."
- FDE 以"小组（pods）"形式卖给新老客户，认证是"多语言"的：除 Anthropic 外还结合 Microsoft Copilot、7AI、ElevenLabs 和一项亚马逊服务，加上 DXC 自己的 "discover, build, scale" 方法论。【外部来源 S5 ✅、S6 ✅】→ 所以 DXC 的 FDE 并不只做 Claude。

**以下关键问题仍未找到公开信息：**
- 谁去了哪家保险公司现场、观察和访谈了哪些岗位（理赔员、核保员、合规官）？"field development engineers" 在 DXC 内部是什么编制、多少人？
- 评测集有多大？"80% 正确"是拿什么标准对比的？
- 从 8 小时原型到生产用了几周？中间失败过几次？
- 哪家保险公司是第一个用 Claude 版 Assure 的客户？客户方有没有发过公告？

---

## 4. 关键反转 / 转折点

> 公开资料里**没有**"我们一开始用 Claude 做错了什么"这种一手复盘。下面的反转都是从官方文字里挖出来的**隐含反转**，每条都标明依据。

**反转 1：不先挑模型，先定"及格线"；"试点"不算数，只认"生产"**
- 原本做法：行业普遍先挑模型、做 POC，结果大量卡在试点阶段。DXC 自己的问答文章原话："AI pilots in insurance can stall not because the technology isn't ready, but because the path to integrating it feels all or nothing."【S14 ✅】
- 调整后：DXC 在选模型前先定五条门槛，其中明确写 "production over pilots"。【S1 ✅】
  > "DXC set its bar before picking a model: governance by default…; production over pilots"
- 效果：选型标准直接绑定监管可审计性和按决策衡量的回报，而不是看演示效果。

**反转 2：别的模型在百页卷宗上"跟丢了"，需要反复重试 → 选定 Claude**
- 原本：评测里其他模型读长卷宗 "just lost the thread"，复杂逻辑要靠重试循环。
- 调整后：选定 Claude。首轮正确率"一开始就好得多"，不用重试。【S1 ✅】
  > "in testing Claude held context where other models… 'just lost the thread.' First-pass correctness on complex logic came 'far better from the onset,' without the retry loops other models needed"
- 注意：这是 DXC 的说法，刊登在 Anthropic 官网，属于利益相关方表述（见第 7 节）。

**反转 3（最强）：一个"要拖好几个月"的受监管计算 → 8 小时做出来，但"80% 不是失败，而是设计"**
- 原本：工伤周赔付基数"高度受监管、容不得错"，这类项目"往往落后好几个月"。
- 现场做法：不从零写规则引擎，而是把法规原文、成文规则、现有系统算法、DXC 已有的计算器一股脑喂给 Claude → 8 小时出可用 SmartApp。
- 关键转折：首轮只有 80% 正确。他们**没有**等到 100% 才上线，而是把剩下 20% 设计成"交给理赔专家"，专家的复核作为信号回流 → 需要人工判断的部分从 70% 降到 20%。【S1 ✅】
  > "80% right on the first pass. The remaining 20% of decision-making went to claims experts, whose review further trained the model."
  > "Every decision and outcome becomes the signal for the next one."
- 背景佐证：DXC 在澳洲真的养着一批专门手算 PIAWE 的"PIAWE 专员"，要对着工资单逐项核对、按州法规计算【S23 ✅】——这正是那"20% 交给理赔专家"的人。
- 口径提醒："further trained the model" 在 API 场景下具体指什么（微调？改提示词或规则？积累评测样本？），原文没说，**未找到公开信息**。

**反转 4：从"合规驱动"到"为伤者驱动"**
- 原本：这类计算被当成合规任务。
- 转念：Pieroni 把它重新定义为"伤者等不起这笔钱"。【S1 ✅】
  > "It's not about compliance. It's about doing the right thing for the insured."
- 编剧价值：情绪转折点。

**反转 5：不是所有决策都配用最强模型 → 按档位分流**
- 原本（隐含）：一个模型包打天下。
- 调整后：简单分诊走轻量模型，百页卷宗才上前沿模型。【S1 ✅】
  > "simple triage runs on lighter tiers, while a hundred-page claim gets routed to a frontier model."

**反转 6：不"推倒重来"核心系统，而是在旧核心外面挂智能体；先拿自己的 BPS 部门当小白鼠**
- 原本：保险核心系统现代化 = 多年期、全有或全无的大项目，IT 负责人"没有胃口"。【S14 ✅】
- 调整后：Assure 走 API、客户接入不需定制【S1 ✅】；Smart Apps 与现有核心保单系统预集成，"12 周或更短"出可衡量成果【S8 ✅】；先在 DXC 自己替约 30 家保险公司做的寿险 BPS 运营里跑通（Customer Zero），理赔周期从 40–60 天降到 10–15 天【S14 ✅，注意这是 ServiceNow 版 Smart Apps，没说用 Claude】。

**反转 7（外部，给"喷子防御"用）：官方故事很漂亮，财报很冷静**
- Q1 FY2027 财报会（2026-07-30）：【S6 ✅、S18 ✅、S5 ✅】
  - 保险收入同比增长 1.4%；保险服务收入下降约 1%，原因是一份 BPO 合同正在收尾，这会拖累第二、三季度，第四季度才"翻篇"。CFO Del Bene："impacted by the wind-down of a BPO contract which will also impact the second and third quarters of this fiscal year"；答问时又说这是"唯一一个我们正在结束合作关系的客户"，"it is a drag on our growth rate for the first 3 quarters"。
  - 保险板块本季订单出货比"远低于 1"（分析师原话 "well below 1"），CFO 解释为保险大单多为续约、季度间波动大。
  - 对 Anthropic 联盟的收入预期：CEO 说最大受益方是咨询与工程服务（CES），而且"极其保守地按零来建模"。Motley Fool 文字稿原句："We have taken an extremely conservative approach to modeling that, zero, because A, they are just getting certified."；Channel Dive 的引法是 "an extremely conservative approach to modeling near zero" revenue。→ 两处措辞略有差异（"zero" vs "near zero"），都指 **FY2027 的 Anthropic 相关新收入**，**不是专指保险**。
  - Fernandez 承认客户董事会在追问"技术路线对不对、智能体含量够不够、方案能用多少年"，"这些问题确实会拖慢决策"。原句："their boards, are asking extra questions with regards to, is this the right technical approach? Is there enough agentic in this solution? How long is this solution going to have a useful life… But those questions do introduce delay in decision making."（第一轮写成"对 AI 投资回报的疑问"，原话里没有 ROI，已更正）
- Channel Dive 的独立点评（2026-07-31，Phil Harvey）："The Anthropic contribution is just off the starting block and is modeled at close to zero revenue for fiscal 2027." / "Both statements are true; the company simply doesn't know what the alliance is worth."【S5 ✅】
- 解读【编剧建议】：这不是否定，而是说明"技术上 8 小时能跑通"和"商业上大规模变现"之间还有很长的路。可以当作片尾的"清醒一刻"。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明 / 风险 |
|---|---|---|---|---|
| 理赔单证（intake）积压 | 以"天"计 | 以"分钟"计或更短 | [S1] ✅ | 指在 DXC 平台上跑理赔的保险公司的**进件环节**，不是整个理赔周期；没有给具体客户或样本 |
| 单证类型分类耗时 | 未给 | < 1 秒 | [S1] ✅ | 只是分类这一步 |
| 专家花在"看懂单证"上的时间占比 | ≥40–50% | 未给"之后"的数字 | [S1] ✅ | 只有基线，没有改善后的数字 |
| 新监管规则嵌入系统 | 12–18 个月（行业历史） | 几天 | [S1] ✅ | "之前"是行业口径，"之后"是 DXC 自报，没有点名具体哪条法规 |
| 受监管赔付计算（工伤周赔付基数）建成可用版本 | "往往落后几个月" | 8 小时 | [S1] ✅ | "working version / working SmartApp"，**不等于上线生产**；原文没交代进生产用了多久 |
| 该计算首轮正确率 | — | 80% | [S1] ✅ | 评测集大小、对照标准未披露 |
| 该计算需要人工判断的比例 | 70% | 20%（目标"削到零"） | [S1] ✅ | 注意：原文另有一个"行业 70% 的决策靠人判断"，两个 70% 口径不同，别混用 |
| 全自动（无人触碰）决策占比 | 行业约 1% | 愿景 50%（50 倍） | [S1] ✅ | **愿景，不是结果** |
| 保险业务内使用人数 | — | 1.4 万人中的"数千人" | [S1] ✅ | 没有精确数字 |
| DXC 寿险 BPS 自用 Smart Apps 后的理赔周期 | 40–60 天 | 10–15 天 | [S14] ✅ | ServiceNow 版 Smart Apps，DXC 自家运营（Customer Zero）；**没说用 Claude**，也没给样本量 |
| Smart Apps（ServiceNow 版）人工流程 | — | 减少 30–40% | [S8] ✅ | 产品宣传口径（"can reduce"），**与 Claude 故事是不同口径** |
| Smart Apps 周期 | — | 缩短"约 30%"（副标题）/"最多 30%"（正文）；Claims Assistant"最多 35%" | [S8] ✅ | 同上，三处数字口径不一 |
| Smart Apps 见效时间 | — | ≤12 周 | [S8] ✅ | 产品承诺 |
| Smart Apps 流程设计时间（2025-10 版） | — | 减少约 80% | [S9] ✅ | 归功于 ServiceNow 合作，不是 Claude |
| OASIS（非保险，DXC 自用）开发 | — | 代码 95% 以上由 Claude 生成、交付提速约 10 倍、50 多家客户 | [S2] ✅ [S4] ✅ | 是托管服务平台，不是保险场景；可作"先自用"的佐证 |
| OASIS 客户数时间线 | 2026-04 上线时 10 家 | 6 月 50 多家 → 7 月底 57 个客户环境（目标上半财年末 85、财年末 125） | [S4] ✅ / [S5] ✅ [S6] ✅ | 不同时点，互相并不矛盾 |
| FDE 认证 | — | 承诺 2 万人认证[S3 ✅]、"数万名"FDE[S2 ✅ S4 ✅]；实际首批 86 人（2026-07-30）[S5 ✅ S6 ✅] | 见左 | "2 万"与"数万"口径略有差异；86 人和目标差距很大；FDE 认证是多厂商的，不只 Claude |
| 保险板块收入增速 | FY2026 Q4 +4% | FY2027 Q1 +1.4% | [S7] ✅ [S6] ✅ | 放缓主要因一份 BPO 合同收尾；同期保险软件 +13% |

---

## 6. 方法论提炼（可复用到其他行业）

1. **先定"及格线"，再挑模型**：把"可审计、生产级、按决策算回报"写成选型门槛，而不是看谁演示得好。（依据：[S1] ✅ "set its bar before picking a model"）
2. **用业务里最长、最脏的材料做评测**：百页卷宗、复杂计算逻辑、十个真实案例看指令遵循、解释能不能让合规官签字。（依据：[S1] ✅）
3. **把"已有的规则资产"直接喂给模型，而不是重写规则引擎**：法规、成文规则、系统算法、既有计算器，都是现成的上下文。（依据：[S1] ✅ "We fed Claude the regulations…our own DXC calculators"）
4. **"80% + 人工 20%"是一种设计**：先让机器接住大头，把剩下的交给专家，专家复核再回流成信号，人工比例逐步下降（70%→20%）。（依据：[S1] ✅）
5. **授权额度 + 人工把关点 + 全程留痕**：智能体只在额度内行动；有重大、法律、财务影响的决定由人拍板；每一步记录"谁、依据什么、什么时间、人还是机器"，可以回放给监管看。（依据：[S1] ✅）
6. **单一任务智能体（Smart App）起步，小步证明价值再扩**："clients can start small, prove value, and scale"（[S1] ✅）；外部口径是"12 周见效"（[S8] ✅）；"一次只解决一个大痛点，再去下一个"（"teams can isolate one large pain point, implement an app-based AI solution to address it… and then move on to the next challenge"，[S14] ✅）。
7. **模型分层路由控制成本**（[S1] ✅）。
8. **先自用，再对外（Customer Zero）**：DXC 先在自家 OASIS 平台上验证（95% 以上代码由 Claude 生成），保险侧先在自家寿险 BPS 运营上跑通 Smart Apps，再带着"做过的人"进客户环境。（依据：[S2] ✅ Paul Smith 引语；[S14] ✅ "We prove it works in our own operation first before we bring it to market"）
9. **FDE 从内部老员工里挑，再叠加行业课程**：不是招一批新人，而是从熟悉客户系统的现有开发团队里选人认证，并补上关键业务系统的专有课程。（依据：[S2] ✅ [S4] ✅）
10. **周期压缩是卖点本身**：CEO 说过去"发现需求 3–6 个月、做原型 6–12 个月、第 12 个月以后才部署"，现在压到"几天到几周"。原句："discovery taking 3 to 6 months, prototyping 6 to 12 months, deployment at month 12 and beyond. Those have now been cut down to days and weeks."（依据：[S6] ✅，CEO 泛指，非保险专属）

---

## 7. 数字严谨性 & "评论区喷子"防御

**A. 全部核心数字都是 DXC 自报，刊登在 Anthropic 官网**
- [S1] 是 Anthropic 的客户故事，[S2] 是 Anthropic 与 DXC 的联合公告。双方都是利益相关方（DXC 是 Claude 的 Global Premier 合作伙伴，并承诺认证 2 万人）。
- 没有第三方审计，也没有点名任何一家保险公司客户。**建议台词用"DXC 称""据 DXC 披露"**。

**B. 容易被抓的口径问题**
1. **"8 小时"不是 8 小时上线**：原文是 "stood up a working version" / "a working SmartApp"。上生产、过监管审查用了多久，没说。
2. **"80% 正确"的分母不明**：评测集多大、对照标准是什么，没披露。另外"十个案例演示"只针对指令遵循，样本很小。
3. **两个"70%"**：一个是"行业 70% 的决策靠人判断"（Pieroni 估计），另一个是"工伤计算中需要人工判断的部分从 70% 降到 20%"。写脚本时不要混在一起。
4. **"12–18 个月→几天"**："之前"是行业历史口径，"之后"是 DXC 自报，没说是哪条法规、哪个法域。
5. **"几天→几分钟"指的是进件环节的单证积压**，不是整个理赔周期。
6. **"1%→50% 自动决策"是愿景**，不是结果。
7. **"further trained the model"**：通过 API 用 Claude 时，客户的复核一般不会直接改变基础模型的权重。原文这句话具体指什么没交代，建议台词改成"专家的每次复核都变成下一次的改进信号"，避免技术上被挑刺。
8. **地区标签和场景可能不一致**：页面写 North America，但 PIAWE 是澳洲工伤体系的法定术语【S16 ✅】，DXC 是维州 WorkSafe 和新州工伤体系的理赔代理【S21 ✅ S22 ✅】，还在两地招 PIAWE 专员【S23 ✅】。脚本里别说"美国工伤"，写"工伤保险"就好。
9. **"40–60 天 → 10–15 天"不是 Claude 的数字**：它来自 ServiceNow 版 Smart Apps 在 DXC 自家 BPS 的使用【S14 ✅】，别和 Claude 故事拼在一起讲。

**C. "FDE"时间线陷阱（重要）**
- Claude 故事里的成果是 DXC 做了"约一年"的积累，由其 "field development engineers" 和保险团队完成（[S1] ✅）。
- "数万名 Claude 认证 FDE"是 2026-06-11 才宣布的计划（[S2] ✅ [S4] ✅），7 月中旬才开始认证，首批 86 人 7 月底才出来（[S5] ✅ [S6] ✅）。
- → 如果脚本说"DXC 派了 FDE 进驻保险公司，8 小时搞定"，**会被抓时间线错误**。正确说法是：DXC 作为运营这些保险核心系统的服务商，本身就"驻扎"在客户的系统里，它的工程师扮演了 FDE 的角色。
- 另外，DXC 的 FDE 认证是"多语言"的（Anthropic + Microsoft Copilot + 7AI + ElevenLabs + 亚马逊服务）【S5 ✅ S6 ✅】，别说成"Claude 专属工程师队伍"。

**D. "Assure 是 Claude 做的吗？"——可能被质疑**
- Claude 原文："building on the Claude Platform for about a year to create Assure, its orchestration platform"（[S1] ✅）。
- 但 DXC 自己的页面显示：Assure Platform "Powered by AWS"（[S19] ✅）；2025-10 的 Smart Apps "用 Assure BPM 构建"、借力 ServiceNow（[S9] ✅）；2026-04 的 Smart Apps "构建在 ServiceNow 上"（[S8] ✅）。**这些 DXC 页面全都没有提到 Claude**。
- 合理解读：Assure 是一个多厂商组合的保险平台品牌，AWS 做云底座，ServiceNow / Assure BPM 做工作流，Claude 至少负责文档智能层和工伤 Smart App 的推理。**具体分工未找到公开信息**，脚本里别说"Assure 就是 Claude 做的"。

**E. 负面 / 冷静信号（均已打开原页核对）**
- FY2026 第四季度收入略高于 31 亿美元，比有机收入指引少约 7,500 万美元（约 2 个百分点）；Fernandez 承认"这不只是需求问题，也是执行问题"（"That's not just a pipeline and demand issue, it's execution"）；当季进入决赛圈的 13 个大单按金额算只赢了 32%、输了 40%。FY2027 指引为有机收入下降 3–5%，Fernandez 称对新 AI 业务的收入贡献采取了"非常、非常保守"的假设。[S7 ✅]
- Q1 FY2027：总收入 30 亿美元、有机下降 6.7%；保险 +1.4%，受一份 BPO 合同收尾拖累至第三季度；Anthropic 相关收入按"零 / 近乎为零"建模；保险订单出货比低于 1。[S5 ✅ S6 ✅ S18 ✅]
- Fernandez：客户董事会在追问技术路线、智能体含量、方案寿命，"会拖慢决策"。[S6 ✅]
- 2026-07 股东大会：董事长 David Herzog 说董事会"对 2026 财年的股价表现不满意"（"unsatisfied with our stock price performance during fiscal 2026"）；股东否决了扩大 2017 年综合激励计划的议案。Herzog 同时点名保险软件与服务业务是"市场领导者"，其 AI 应用可以"不做昂贵或高风险的替换项目"就把旧系统现代化。[S24 ✅]
- Channel Dive 点评：DXC "根本不知道这个联盟值多少钱"；OpenAI、Google Cloud、Anthropic 自己也在往客户那里派工程师，DXC 要和它们正面竞争。[S5 ✅]
- 专业保险媒体：Reinsurance News 只是转述联盟新闻稿、无独立分析 [S25 ✅]；Insurance Innovation Reporter 有一篇联盟报道但被代理拦截无法打开 [S27 ❌]；在 Insurance Journal、Digital Insurance（dig-in.com）、Carrier Management 站内搜索 "DXC Anthropic / DXC Claude"，**没有找到相关报道**；The Register 没检索到相关报道。Reddit / HN 本轮未检索。
- **中文报道**：只找到美通社的中文版联盟新闻稿（译作"前沿部署工程师"，标注日期 2026 年 6 月 12 日）[S26 ✅]，这是新闻稿译文，不是独立报道；36氪、机器之心、虎嗅、雷锋网**未找到中文报道**。

**F. 第一轮摘要有误、本轮已更正的地方**
1. **Pieroni 履历（S11）**：第一轮写"Marsh McLennan 全球 COO、State Farm 高级副总裁、IBM 全球保险 GM、埃森哲合伙人、麦肯锡顾问"。原新闻稿只列公司名、没写具体头衔，而且还有 Aon。已改为原文说法。
2. **AM Best 播客（S12）**：第一轮写"摘要大意：精明的保险公司不部署黑箱……"，节目页上**没有这句话**，已删除；补上真实简介和上线日期 2025-12-04。
3. **2025-10 Smart Apps 新闻稿（S9）**：第一轮写"通过 AWS 云能力"，原文是 "industry-leading cloud capabilities"，**没提 AWS**，已更正。AWS 只出现在 Assure 产品页（S19）。
4. **Assure 产品页（S19）**：第一轮写"提供数千个 API"，原页**没有这个说法**，已删除；"Powered by AWS"属实。
5. **WorkSafe Victoria 页（S16）**：第一轮写"PIAWE 通常按受伤前 52 周普通收入平均"，原页**没有 52 周**，只讲 PIAWE 的定义和"前 13 周按 PIAWE 的 95% 赔付"。"52 周"只来自 Claude 原文。
6. **DXC 维州页（S17）**：第一轮写"DXC 作为代理，负责确保 PIAWE 支付准确"。原句是泛指"各类代理（Agents）负责确保支付准确"；DXC 是 WorkSafe 代理这一点由新来源 S21 证实。
7. **"近乎为零"（S5/S6）**：第一轮写成"管理层对 Anthropic/FDE 相关新业务的收入预测'近乎为零'"，大体没错，但要补充：原话是 CEO 在讲 CES（咨询与工程服务）受益最大时说的，Fool 文字稿是 "modeling that, zero"，Channel Dive 引作 "modeling near zero"；**和保险板块无关**。
8. **销售周期（S18/S6）**：第一轮写"客户对 AI 投资回报和技术路线的疑问会拉长销售周期"。原话讲的是董事会问"技术路线、智能体含量、方案寿命"，没有提投资回报（ROI 是 Fool 自动摘要的概括），已改为原话。
9. **FDE 培训机构名称**：DXC 新闻稿写 "Anthropic Partner Academy"，Anthropic 公告写 "Anthropic Academy"，两种写法都保留。
10. **Smart Apps 周期数字（S8）**：第一轮写"周期最多缩短 30%"。新闻稿副标题写"约 30%"（approximately），正文写"最多 30%"（up to），已并列。

**G. 文字稿质量提醒**
- Motley Fool 的 Q1 FY2027 文字稿明显是机器转写，有多处错误（例如把 Assure 写成 "Azure platform"，把 FDE pods 写成 "FTE pods"，人名也有疑似错误）。引用时只用意思清楚的句子；DXC 官网 IR 页面本轮访问返回 403，未能拿到官方文字稿对照。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下都是创作建议，不是事实。每条后面标了所依据的来源编号。

**钩子候选**
1. "一个工人受了伤，他每周能领多少钱？这个数字，保险公司过去要算好几个月。这次，8 个小时。"（依据 [S1] ✅："Projects tend to fall months behind" / "eight hours"）
2. "保险业每天几百万个决定，真正'没人碰'的只有 1%。"（依据 [S1] ✅）
3. "监管一改规则，保险系统要改一年半。现在，几天。"（依据 [S1] ✅：12–18 个月 → days）
4. "它第一次只做对了 80%。但这恰恰是整个项目最聪明的地方。"（依据 [S1] ✅，引出反转 3）

**反转桥段**
- **"80% 不是失败，是分工"**：机器接住 80%，剩下 20% 交给理赔老手（DXC 在澳洲真有一批专门算这个数的"PIAWE 专员"[S23 ✅]）；老手每改一次，都变成下一次的改进信号；需要人工判断的部分从 70% 降到 20%。（依据 [S1] ✅；台词避开 "trained the model" 这个说法）
- **"不是挑最聪明的模型，是挑最会说'我不确定'的模型"**：受监管行业要的是"会举手提问、不瞎猜"。（依据 [S1] ✅ Pieroni 引语）
- **"监管要的不是准确率，而是'每一步为什么'"**：谁决定的、依据什么、什么时间、是人还是机器，全部可以回放。（依据 [S1] ✅）
- **"不是合规，是良心"**：结尾情绪点用 Pieroni 那句 "These people need this money. They can't wait for it."（依据 [S1] ✅）
- **"先在自己身上动刀"**：DXC 先用 Claude 写自己平台超过 95% 的代码，再去碰客户的核心系统（依据 [S2] ✅）；保险侧也是先在替 30 家保险公司干活的自家 BPS 部门试（依据 [S14] ✅，但这段是 ServiceNow 版 Smart Apps，别说成 Claude）。
- **"连夜做原型，第二天演示"**：客户大会上，客户白天提点子，DXC 工程师连夜做出智能体原型，第二天就演示（依据 [S8] ✅；不要说这就是 8 小时工伤 App）。
- **"清醒一刻"**：技术上 8 小时跑通，但财报会上 CEO 说对 Anthropic 相关新收入"按零来建模"；媒体点评"公司自己也不知道这个联盟值多少钱"。说明落地变现需要时间。（依据 [S5] ✅ [S6] ✅）

**类比（面向中国听众）**
- 可以类比国内工伤保险待遇计算、车险 / 健康险理赔单证录入这类场景。**具体的中国法规口径需另行核实，本研究未覆盖**。
- "授权额度 + 人工把关点"可以类比银行的"分级授权审批"。

**FDE 角色的讲法（避坑）**
- 推荐说法："DXC 本来就替这些保险公司运营核心系统，它的工程师天然就在客户的'后台'里，这就是 FDE 最理想的位置。"（依据 [S1] ✅ 1,100 家客户在其平台上运行、[S14] ✅ 寿险 BPS 替约 30 家保险公司运营、[S2] ✅ FDE 定义；Channel Dive 的说法可作旁证："its pods arrive alongside 30 years of operating those customers' systems rather than in place of them" [S5] ✅）
- 不要说"Anthropic 认证的 FDE 团队 8 小时做出来"，时间线不成立（见第 7 节 C）。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S1 | DXC brings Claude to the insurance backbone running billions of policies | https://claude.com/customers/dxc | Claude原文 | 页面未显示 | ✅ 已打开（第一轮 curl 全文 + WebFetch；本轮再次 curl 复核），关键句逐字核对 |
| S2 | DXC will integrate Claude into the systems banks, airlines, and other regulated industries rely on | https://www.anthropic.com/news/dxc-anthropic-alliance | Anthropic 官方公告（合作方） | 2026-06-11 | ✅ 已打开，引文逐字（本轮复核） |
| S3 | Four role-based certifications for the people who put Claude to work for customers | https://claude.com/blog/four-role-based-claude-certifications | Anthropic / Claude 官方博客 | 2026-07-23 | ✅ 已打开（"DXC has committed to 20,000 certifications."） |
| S4 | DXC and Anthropic Announce Multi-Year Global Alliance to Bring AI into Mission-Critical Enterprise Systems | https://dxc.com/newsroom/06112026-dxc-and-anthropic-announce-multi-year-global-alliance-to-bring-ai-into-mission-critical-enterprise-systems | 公司新闻稿（DXC） | 2026-06-11 | ✅ 本轮已打开核对（90 天、Anthropic Partner Academy、OASIS 50+ 客户、95% 代码、Customer Zero、首发领域） |
| S5 | DXC promotes AI platform builders as Anthropic cohort reaches 86（作者 Phil Harvey） | https://www.channeldive.com/news/dxc-promotes-ai-platform-builders-as-anthropic-cohort-reaches-86/826727/ | 媒体（Channel Dive） | 2026-07-31 | ✅ 本轮已打开核对（86 人、"modeling near zero"、57 个客户环境、多厂商 FDE、pods、独立点评） |
| S6 | DXC (DXC) Q1 2027 Earnings Call Transcript | https://www.fool.com/earnings/call-transcripts/2026/08/03/dxc-dxc-q1-2027-earnings-call-transcript/ | 财报会转录（Motley Fool，机器转写） | 电话会 2026-07-30，页面 2026-08-03 | ✅ 本轮已打开核对（"modeling that, zero"、BPO 合同收尾、保险 +1.4%、base camp、86 人、董事会追问拖慢决策）；转写有错误，见第 7 节 G |
| S7 | DXC Technology Q4 Earnings Call Highlights | https://finance.yahoo.com/markets/stocks/articles/dxc-technology-q4-earnings-call-061023956.html | 媒体（财报摘要） | 2026-05-10 | ✅ 本轮已打开核对（约 7,500 万美元缺口、保险 +4%、云端 Assure 与 Smart Apps、大单胜率 32%） |
| S8 | DXC Introduces New Assure Smart Apps to Accelerate Insurers' AI-Powered Transformation | https://dxc.com/newsroom/04092026-dxc-introduces-new-assure-smart-apps-to-accelerate-insurers-ai-powered-transformation | 公司新闻稿（DXC） | 2026-04-09 | ✅ 本轮已打开核对（built on ServiceNow、30–40%、约/最多 30%、35%、12 周、连夜原型；全文无 Claude） |
| S9 | DXC Launches Assure Smart Apps to Accelerate AI-Driven Innovation in the Insurance Industry | https://dxc.com/newsroom/10132025-dxc-launches-assure-smart-apps-to-accelerate-ai-driven-innovation-in-the-insurance-industry | 公司新闻稿（DXC） | 2025-10-13 | ✅ 本轮已打开核对（Assure BPM、ServiceNow、约 80% 设计时间；**无 AWS、无 Claude**） |
| S10 | DXC launches AI insurance apps with ServiceNow to speed insurer transformation（另见 DXC Connect Charleston 活动页 https://dxc.com/about-us/events/dxc-connect-insurance-executive-forum-charleston ） | https://beinsure.com/news/dxc-launches-ai-insurance-apps/ | 媒体 + 公司活动页 | Beinsure 2026-04-15；大会 2026-03-03 至 05 | ✅ 本轮两页都已打开核对（Beinsure 基本复述新闻稿；活动页含 Pieroni "The agentic shift" 演讲、"our work in Australia" 工伤分会场） |
| S11 | DXC Appoints William Pieroni to Drive Strategy and Growth Across Global Insurance Software and Business Process Services | https://dxc.com/newsroom/04232025-dxc-appoints-william-pieroni-to-global-insurance-software-bps | 公司新闻稿（DXC） | 2025-04-23 | ✅ 本轮已打开核对；**更正了第一轮的履历头衔** |
| S12 | DXC Technology's Pieroni: Agentic AI To 'Eliminate Laggards and Accelerate Leaders'（AM Best Audio，录于 InsureTech Connect 2025） | https://podcasts.apple.com/us/podcast/dxc-technologys-pieroni-agentic-ai-to-eliminate-laggards/id126723118?i=1000739638276 | 播客 | 2025-12-04 | ✅ 本轮已打开节目页核对简介；节目无文字稿，未听音频；第一轮的"黑箱"摘要页面上不存在，已删除 |
| S13 | Unlocking the power of agentic AI in insurance（Pieroni 署名；另有 Insurance Thought Leadership 转载 https://www.insurancethoughtleadership.com/ai-machine-learning/unlocking-power-agentic-ai-insurance ） | https://dxc.com/insights/knowledge-base/agentic-ai-in-insurance | 公司洞察文章 | DXC 页 2025-09-18；ITL 转载 2025-09-04 | ✅ 本轮两页都已打开核对（15–20%、>25% 等预测数字） |
| S14 | Agentic AI gives insurers a path to modernize without rip and replace（Jenna Colman、Dan Stanovich 问答） | https://dxc.com/insights/knowledge-base/q-and-a/agentic-ai-gives-insurers-a-path-to-modernize-without-rip-and-replace | 公司洞察问答 | 2026-05-21 | ✅ 本轮已打开核对（"all or nothing"、Customer Zero、约 30 家客户、40–60 天→10–15 天；全文无 Claude） |
| S15 | Bill Pieroni LinkedIn（第一轮搜索摘要提示他本人发帖复述了 8 小时 / 80% / 70%→20% / 1%→50% 等数字） | https://www.linkedin.com/in/bill-pieroni-99740670/ | 个人社媒 | 未知 | ❌ 无法访问（curl 返回 999 反爬；WebFetch 被代理拦截；Wayback 查询返回 429 / 连接被重置）。相关说法不在正文使用 |
| S16 | Pre-injury average weekly earnings for workers and employers（WorkSafe Victoria） | https://www.worksafe.vic.gov.au/pre-injury-average-weekly-earnings-workers-and-employers | 政府 / 监管机构 | 未显示 | ✅ 本轮已打开核对（PIAWE 定义、前 13 周 95%；**页面无"52 周"**） |
| S17 | DXC Claims Management Services – VIC Employer | https://dxc.com/au/en/cp/claims-management-services/victoria/employer | 公司业务页（DXC 澳洲工伤理赔代理） | 未显示 | ✅ 本轮已打开核对（"Agents … are responsible for ensuring that those payments are accurate"、澳洲 20 多年工伤理赔经验） |
| S18 | DXC Technology Co (DXC) (Q1 2027) Earnings Call Highlights | https://finance.yahoo.com/technology/ai/articles/dxc-technology-co-dxc-q1-050104027.html | 媒体（财报摘要） | 2026-07-31 | ✅ 本轮已打开核对（保险 +1.4%、BPS 合同收尾拖累 Q2/Q3、董事会追问拖慢决策） |
| S19 | Assure Platform – DXC Technology | https://dxc.com/platforms/assure | 公司产品页 | 未显示 | ✅ 本轮已打开核对（"Powered by AWS"、Smart Apps 用生成式和智能体 AI；**无"数千个 API"，无 Claude**） |
| S20 | Claude customer stories 列表页 | https://claude.com/customers | Claude 官方 | — | ✅ 已打开（列表中有 "DXC brings Claude to the insurance backbone running billions of policies"） |
| S21 | WorkSafe agent contact details（WorkSafe Victoria） | https://www.worksafe.vic.gov.au/agents | 政府 / 监管机构 | 未显示 | ✅ 本轮新增，已打开（四家代理：Allianz、EML、Gallagher Bassett、DXC Claims Management Services） |
| S22 | NSW Workers' Compensation guide: claims agent changes（Lockton） | https://global.lockton.com/au/en/news-insights/nsw-workers-compensation-guide-claims-agent-changes | 行业机构（保险经纪） | 未显示（讲 2023 年变更） | ✅ 本轮新增，已打开（"The new entrants are DXC and Gallagher Bassett who will commence in 2023."） |
| S23 | Workers Compensation PIAWE Specialist（DXC，墨尔本）/ Worker's Compensation PIAWE Specialist（DXC，新州 Macquarie Park） | https://www.dreamworkhq.com/job/bac307b5-d920-43de-acb2-a0d23be4cd53 ；https://www.dreamworkhq.com/job/43f7d9a9-2a94-4346-baa0-cab53d84aa94 | 招聘（第三方聚合页） | 2026-07-17 | ✅ 本轮新增，已打开（"Accurately calculate PIAWE in line with relevant state workers' compensation legislative and regulatory requirements."） |
| S24 | DXC Technology Faces Stock Slump, Pitches AI Turnaround at Annual Meeting | https://finance.yahoo.com/markets/stocks/articles/dxc-technology-faces-stock-slump-140651266.html | 媒体（Yahoo Finance） | 2026-07-21 | ✅ 本轮新增，已打开（"unsatisfied with our stock price performance during fiscal 2026"、激励计划被否决） |
| S25 | DXC to leverage Anthropic's Claude for mission-critical enterprise systems | https://www.reinsurancene.ws/dxc-to-leverage-anthropics-claude-for-mission-critical-enterprise-systems/ | 行业媒体（Reinsurance News） | 2026-06-11 | ✅ 本轮新增，已打开（复述新闻稿，无独立分析） |
| S26 | DXC与Anthropic宣布达成多年期全球联盟，将AI引入任务关键型企业系统 | https://www.prnasia.com/story/537032-1.shtml | 中文新闻稿（美通社） | 2026-06-12（稿件标注） | ✅ 本轮新增，已打开（中文译文，非独立报道） |
| S27 | DXC, Anthropic Form Global AI Alliance（Insurance Innovation Reporter） | https://iireporter.com/dxc-anthropic-form-global-ai-alliance/ | 行业媒体 | 约 2026-06 | ❌ 无法访问（curl 返回 202 空页；WebFetch 被代理拦截）。未使用其内容 |
| S28 | DXC Technology launches people-first workers' compensation solution（HCAmag） | https://premium.hcamag.com/au-2025-exclusivefeature-dxc-launches-people-first-workers-compensation-solution/p/1 | 行业媒体（澳洲） | 2025 | ❌ 无法访问（付费墙，curl 只返回标题；WebFetch 被代理拦截）。可能与澳洲工伤业务有关，未使用其内容 |

**信息缺口汇总**
- 没有点名任何一家使用 Claude 版 Assure 的保险公司，也没有找到客户方公告。
- 找不到 Claude 相关的现场过程（谁去的、访谈了谁、第一个场景、上线周期、失败经历）的公开一手描述；能找到的一手过程（S14 Customer Zero、S8 连夜原型）都属于 ServiceNow 版 Smart Apps，没说用 Claude。
- "field development engineers" 在 DXC 内部是什么团队、多少人，未找到公开信息。
- 评测细节（样本量、对照标准）未披露。
- Claude 与 ServiceNow / AWS 在 Assure 里如何分工未披露（DXC 自己的页面都没提 Claude）。
- 工伤场景属于哪个法域未披露（澳洲维州或新州的可能性很高，证据见第 3 节第 4 步，但仍属推断）。
- Insurance Journal、Digital Insurance、Carrier Management、The Register 没找到相关报道；IIReporter、HCAmag 无法打开；Reddit / HN 未检索；中文媒体只有美通社新闻稿译文。
