# 案例：DXC Technology — 在保险核心系统平台 Assure 里嵌入 Claude 智能体，把理赔单证积压从"几天"压到"几分钟"，把一个强监管的工伤赔付计算 8 小时做出可用版本

> **核实情况说明（请先读）**
> 本次研究环境的网络出口只放行 anthropic.com / claude.com 等少数域名；dxc.com、prnewswire、Yahoo Finance、Motley Fool、Channel Dive、Insurance Journal、LinkedIn、Apple Podcasts、WorkSafe Victoria 等**全部被代理拦截（403）**，另外本会话的网页搜索次数也已用完。
> 因此：
> - 标 ✅ 的来源（S1–S3、S20）已用 curl/WebFetch 打开原页，引用为原文逐字。
> - 标 ⚠️ 的来源 **"仅搜索结果摘要可见，未能打开原页"**。它们的"引用"来自搜索工具返回的摘要，**可能是转述而非逐字原文**，上片前请人工在浏览器里打开核对。
> - 未能专门搜索的方向：Insurance Journal / Carrier Management / Digital Insurance / The Register / CIO.com / Business Insider 的独立报道，以及 Reddit / HN 的讨论。

- **行业**：保险（财险、寿险、工伤险的核心系统与理赔、核保业务流程外包）/ 金融 IT 服务
- **企业规模 / 地区**：大型。DXC 集团约 11.5 万员工、70 个国家（[S2] ✅）；保险业务线 1.4 万人（[S1] ✅）。Claude 页面标注地区为 North America（[S1] ✅）。
- **Claude 产品标签**：Claude Platform（API）；另外文中提到 DXC 的 "field development engineers" 用 Claude Code 构建这些能力（[S1] ✅）
- **Claude 故事发布日期**：页面、页面元数据和站点地图里都**没有显示发布日期**（已检查 HTML meta 和 sitemap.xml）。从内容推断发布时间在 2026 年，很可能晚于 2026-03 的 Smart Apps 发布，但**无法确认**。
- **Claude 原文链接**：https://claude.com/customers/dxc
- **落地主体（谁是"FDE"）**：
  - **保险里这几项成果的直接落地方是 DXC 自己的保险软件团队**。原文说 "its field development engineers build them with Claude Code"，工伤计算这个 SmartApp 是 Pieroni 团队自己"喂规则、喂计算器"做出来的（"We fed Claude the regulations…"）（[S1] ✅）。DXC 在这里的角色相当于客户（保险公司）的"内置 FDE"，它运营着这些保险公司的核心系统。
  - **"FDE 计划"本身是后来才宣布的**：2026-06-11，DXC 和 Anthropic 宣布联盟，要培养"数万名 Claude 认证的前置部署工程师（FDE）——直接嵌入客户组织内部的工程师"（[S2] ✅）。据搜索摘要，到 2026-07-30 财报会时，首批只认证了 86 人（[S5][S6] ⚠️）。所以**不能把保险成果说成"这批 FDE 做出来的"**，时间线对不上（详见第 7 节）。
- **本案例推荐指数：3 / 5**
  - 数字充分度：★★★★☆。8 小时、首轮 80% 正确、人工判断占比 70%→20%、12–18 个月→几天、几天→几分钟、分类不到 1 秒，数字很多也很"硬"，但全部是 DXC 自报，没有点名任何一家保险公司。
  - 过程 / 反转素材：★★☆☆☆。官方故事里有"先定选型标准再挑模型""80% 首轮 + 20% 交专家""模型分层路由"这几个隐含转折。外部来源大多打不开，一线过程（谁在现场、踩了什么坑）**基本找不到公开信息**。
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
| 大改核心系统没人愿意碰 | DXC 的问答文章称：多数保险 IT 负责人对动辄多年的现代化项目"没有胃口"；AI 试点卡住，"不是技术没准备好，而是集成路径看起来是全有或全无" | 【外部来源 S14】⚠️ 仅搜索摘要 |
| 行业测算 | DXC 的一项基准研究（Pieroni 引用）：财险核保费用率预计下降 15–20%，寿险核保成本下降超过 25% | 【外部来源 S13】⚠️ 仅搜索摘要 |

---

## 3. 落地过程（FDE 怎么做的）

> 说明：Claude 原文只给出了"做了什么"，没有写"谁、在哪家客户现场、花了几周"。下面的步骤是按原文和外部来源重排的时间线，**没有来源支撑的环节明确写"未找到公开信息"**。

**第 0 步：人到位（2025 年 4 月）**
- DXC 任命 Bill Pieroni 负责全球保险软件与 BPS（业务流程服务）的战略和增长。他此前是保险业标准组织 ACORD 的 CEO，还当过 Marsh McLennan 全球 COO、State Farm 高级副总裁、IBM 全球保险 GM、埃森哲合伙人、麦肯锡顾问。【外部来源 S11】⚠️ 仅搜索摘要
- 【Claude原文】[S1] 里他的头衔是 "Global AI, Strategy & Growth Executive"。
- 意义：推动者是一位"保险业务出身 + 行业标准组织出身"的高管，不是纯技术负责人。

**第 1 步：先定门槛，再挑模型（时间未披露，约 2025 年）**
- 五条门槛：默认治理、生产优先于试点、聚焦核心（理赔占 75% 成本）、按决策衡量回报、见效快。【Claude原文】[S1] ✅
  > "DXC set its bar before picking a model…; production over pilots…"
- 自建评测：百页商业理赔卷宗的长上下文、复杂逻辑的首轮正确率、"十个案例演示"上的指令遵循、解释能不能让合规官直接签字。【Claude原文】[S1] ✅

**第 2 步：先在自己家用，再给客户（2025–2026）**
- Anthropic 官方说法：DXC 先在自己内部用 Claude，满足的是和客户同样严格的安全合规要求。例如 DXC OASIS（托管服务的 AI 原生编排平台，2026 年 4 月上线）超过 95% 的代码由 Claude 生成、工程师复核，开发速度估计提升 10 倍，已服务 50 多家客户。【外部来源 S2】✅
  > "They proved Claude inside their own operations first, under the same security and compliance requirements their customers face."（Anthropic CCO Paul Smith）
- 保险侧：DXC 用 Claude Platform 构建 Assure 编排层"约一年"。【Claude原文】[S1] ✅

**第 3 步：搭四层架构 + 人机分工**
- 文档智能 → 工作流编排 → Smart Apps（单一任务智能体）→ 合规层。【Claude原文】[S1] ✅
- 人机分工：智能体只在授权额度内行动；重大、法律、财务相关的决定由人把关；每一步记录"谁决定、依据什么、什么时间、是人还是智能体"；核保端采用"例外处理"，只把需要人判断的交给核保员。【Claude原文】[S1] ✅
- 成本控制：简单分诊走轻量模型，百页卷宗走前沿模型。【Claude原文】[S1] ✅

**第 4 步：破冰场景（原文没点名"第一个"，按证据推测）**
- Claude 原文称工伤案例是 "DXC's clearest example"，但**没说它是第一个场景**。文档分类、抽取（理赔单证积压）是这套平台最底层的能力，按逻辑很可能最先上线，但**未找到公开信息确认先后顺序**。
- 工伤 SmartApp：把法规、立法、成文规则、系统算法、DXC 自有计算器喂给 Claude，8 小时出可用版本，首轮 80% 正确，剩下 20% 交给理赔专家复核并回流。【Claude原文】[S1] ✅
- **这个工伤场景在哪个法域？** Claude 原文没说。"pre-injury average weekly earnings（PIAWE）+ 受伤前 52 周平均"是澳大利亚维多利亚州（WorkSafe Victoria）等地的法定术语，而 DXC 正是 WorkSafe Victoria 委托的理赔代理机构之一【外部来源 S16、S17】⚠️ 仅搜索摘要。**所以这个场景很可能来自 DXC 的澳洲工伤理赔管理业务，但这是推断，未经证实**，而 Claude 页面标注的地区是 North America。
- **8 小时是不是在客户大会上做出来的？** DXC 2026 年 4 月的新闻稿称，2026 年 3 月的 DXC Connect 保险高管论坛（Charleston）上，"DXC 工程师连夜快速做出新的 AI 智能体原型，第二天就演示了"；现场还设了 "Assure Smart App Studio"，让客户贡献 Smart App 的点子。【外部来源 S8、S10】⚠️ 仅搜索摘要。**没有来源把这次"连夜原型"和"8 小时工伤 SmartApp"对应起来，不能混为一谈。**

**第 5 步：产品化成可复制的 Smart Apps（2025-10 → 2026-04）**
- 2025-10-13：DXC 发布 Assure Smart Apps，用 DXC Assure BPM 构建，通过 AWS 云能力和 Assure Platform 的 API 与保险公司核心系统集成。【外部来源 S9】⚠️ 仅搜索摘要
- 2026-03 在论坛发布、2026-04-09 发新闻稿：新一批 Smart Apps "构建在 ServiceNow 上"，首批三个是 Claims Assistant、Engagement Assistant、Underwriter Assistant；口径是人工工作量减少 30–40%、周期最多缩短 30%（Claims Assistant 另一处写"最多 35%"），"12 周或更短"见到可衡量成果。【外部来源 S8、S10、S14】⚠️ 仅搜索摘要
- 注意：能看到的 Smart Apps 新闻稿摘要**都没有提到 Claude**，只提到 ServiceNow 和 AWS。Claude 与 ServiceNow 在 Smart Apps 里具体怎么分工，**未找到公开信息**。

**第 6 步：规模化**
- 数千名保险业务员工在用；"field development engineers" 用 Claude Code 构建。【Claude原文】[S1] ✅
- 财务侧印证（间接）：FY2026 第四季度（2026 年 1–3 月）保险收入同比增长 4%，软件业务增长在十几个百分点的高段，DXC 把原因归于客户迁移到云端 Assure 平台、采用 AI Smart Apps。【外部来源 S7】⚠️ 仅搜索摘要

**第 7 步：把"FDE"变成一个规模化队伍（2026-06 起）**
- 2026-06-11 宣布联盟：DXC 成为 Claude Partner Network 的 Global Premier 合作伙伴之一【S4 ⚠️】。DXC 从现有开发团队里挑工程师，通过 Anthropic Academy 认证，再叠加 DXC 自己针对关键业务系统的课程；保险是四个首发领域之一。【外部来源 S2】✅
  > "For its FDE program, DXC will recruit engineers from its existing development teams and certify them through Anthropic Academy… DXC has added its own curriculum on top"
- 认证承诺 2 万人。【外部来源 S3】✅
  > "DXC has committed to 20,000 certifications."
- 据搜索摘要："90 天内"完成培训和认证【S4/S5 ⚠️】；7 月中旬起在旧金山、伦敦办"base camp"实操营；到 2026-07-30 财报会，首批 86 人认证完成。【外部来源 S5、S6】⚠️ 仅搜索摘要

**以下关键问题未找到公开信息：**
- 谁去了哪家保险公司现场、观察和访谈了哪些岗位（理赔员、核保员、合规官）？
- 评测集有多大？"80% 正确"是拿什么标准对比的？
- 从试点到生产用了几周？中间失败过几次？
- 哪家保险公司是第一个客户？客户方有没有发过公告？

---

## 4. 关键反转 / 转折点

> 公开资料里**没有**"我们一开始做错了什么"这种一手复盘。下面的反转都是从官方文字里挖出来的**隐含反转**，每条都标明依据。

**反转 1：不先挑模型，先定"及格线"；"试点"不算数，只认"生产"**
- 原本做法：行业普遍先挑模型、做 POC，结果大量卡在试点阶段（DXC 自己的问答文章说试点卡住"是因为集成路径看起来全有或全无"【S14 ⚠️】）。
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

**反转 6：不"推倒重来"核心系统，而是在旧核心外面挂智能体**
- 原本：保险核心系统现代化 = 多年期、全有或全无的大项目，IT 负责人"没有胃口"。【S14 ⚠️】
- 调整后：Assure 走 API、客户接入不需定制【S1 ✅】；Smart Apps 与现有核心系统预集成，"12 周或更短"出可衡量成果【S8 ⚠️】。

**反转 7（外部，给"喷子防御"用）：官方故事很漂亮，财报很冷静**
- Q1 FY2027 财报会（2026-07-30）搜索摘要显示：保险板块受一份 BPO 合同到期收尾拖累，影响会延续到第二、三季度；保险收入增长 1.4%；管理层对 Anthropic/FDE 相关新业务的收入预测"近乎为零"，自称"极其保守"；Fernandez 还提到，客户对 AI 投资回报和技术路线的疑问会拉长销售周期。【外部来源 S5、S6、S18】⚠️ 仅搜索摘要
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
| Smart Apps（ServiceNow 版）人工工作量 | — | 减少 30–40% | [S8/S10/S14] ⚠️ | 产品宣传口径（"可以减少"），**与 Claude 故事是不同口径**，没说用的是什么模型 |
| Smart Apps 周期 | — | 缩短最多 30%（Claims Assistant 另一处写"最多 35%"） | [S8/S10] ⚠️ | 同上，而且两处数字不一致 |
| Smart Apps 见效时间 | — | ≤12 周 | [S8/S14] ⚠️ | 产品承诺 |
| OASIS（非保险，DXC 自用）开发 | — | 代码 95% 以上由 Claude 生成、开发提速 10 倍、50 多家客户 | [S2] ✅ | 是托管服务平台，不是保险场景；可作"先自用"的佐证 |
| OASIS 客户数时间线 | 2026-04 上线时 10 家 | 6 月 50 多家 → 7 月底 57 家（目标上半财年末 85、财年末 125） | [S2] ✅ / [S5] ⚠️ | 不同时点，互相并不矛盾 |
| FDE 认证 | — | 承诺 2 万人认证[S3 ✅]、"数万名"FDE[S2 ✅]；实际首批 86 人（2026-07-30）[S5/S6 ⚠️] | 见左 | "2 万"与"数万"口径略有差异；86 人和目标差距很大 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **先定"及格线"，再挑模型**：把"可审计、生产级、按决策算回报"写成选型门槛，而不是看谁演示得好。（依据：[S1] ✅ "set its bar before picking a model"）
2. **用业务里最长、最脏的材料做评测**：百页卷宗、复杂计算逻辑、十个真实案例看指令遵循、解释能不能让合规官签字。（依据：[S1] ✅）
3. **把"已有的规则资产"直接喂给模型，而不是重写规则引擎**：法规、成文规则、系统算法、既有计算器，都是现成的上下文。（依据：[S1] ✅ "We fed Claude the regulations…our own DXC calculators"）
4. **"80% + 人工 20%"是一种设计**：先让机器接住大头，把剩下的交给专家，专家复核再回流成信号，人工比例逐步下降（70%→20%）。（依据：[S1] ✅）
5. **授权额度 + 人工把关点 + 全程留痕**：智能体只在额度内行动；有重大、法律、财务影响的决定由人拍板；每一步记录"谁、依据什么、什么时间、人还是机器"，可以回放给监管看。（依据：[S1] ✅）
6. **单一任务智能体（Smart App）起步，小步证明价值再扩**："clients can start small, prove value, and scale"（[S1] ✅）；外部口径是"12 周见效"（[S8] ⚠️）。
7. **模型分层路由控制成本**（[S1] ✅）。
8. **先自用，再对外**：DXC 先在自家 OASIS 平台上验证（95% 以上代码由 Claude 生成），再带着"做过的人"进客户环境。（依据：[S2] ✅ Paul Smith 引语）
9. **FDE 从内部老员工里挑，再叠加行业课程**：不是招一批新人，而是从熟悉客户系统的现有开发团队里选人认证，并补上关键业务系统的专有课程。（依据：[S2] ✅）

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
8. **地区标签和场景可能不一致**：页面写 North America，但 PIAWE 是澳洲（维州等）术语，DXC 又是 WorkSafe Victoria 的理赔代理【S16/S17 ⚠️】。脚本里别说"美国工伤"，写"工伤保险"就好。

**C. "FDE"时间线陷阱（重要）**
- Claude 故事里的成果是 DXC 做了"约一年"的积累，由其 "field development engineers" 和保险团队完成（[S1] ✅）。
- "数万名 Claude 认证 FDE"是 2026-06-11 才宣布的计划（[S2] ✅），首批 86 人 7 月底才出来（[S5/S6] ⚠️）。
- → 如果脚本说"DXC 派了 FDE 进驻保险公司，8 小时搞定"，**会被抓时间线错误**。正确说法是：DXC 作为运营这些保险核心系统的服务商，本身就"驻扎"在客户的系统里，它的工程师扮演了 FDE 的角色。

**D. "Assure 是 Claude 做的吗？"——可能被质疑**
- Claude 原文："building on the Claude Platform for about a year to create Assure, its orchestration platform"（[S1] ✅）。
- 但 DXC 自己的新闻稿摘要显示，Assure Platform 早已存在（2025-10 的新闻稿就提到"APIs of the DXC Assure Platform"、由 AWS 驱动），而 2026-04 的 Smart Apps "构建在 ServiceNow 上"，摘要里没提 Claude（[S8][S9][S19] ⚠️）。
- 合理解读：Assure 是一个多厂商组合的保险平台品牌，Claude 负责其中的推理和文档智能层，工作流可能由 ServiceNow 或 Assure BPM 承担。**但具体分工未找到公开信息**，脚本里别说"Assure 就是 Claude 做的"。

**E. 负面 / 冷静信号（均为 ⚠️ 仅搜索摘要）**
- FY2026 第四季度收入约 31 亿美元，比有机收入指引少约 7,500 万美元（约 2 个百分点）[S7]。
- Q1 FY2027：保险板块受一份 BPO 合同到期收尾拖累，影响会持续到第二、三季度；保险收入增长 1.4%；管理层对 Anthropic 联盟相关收入的预测"近乎为零"[S5][S6]。
- Fernandez：客户对 AI 投资回报的疑问会拉长销售周期[S18]。
- 另有一篇标题为 "DXC Technology Faces Stock Slump, Pitches AI Turnaround at Annual Meeting" 的 Yahoo Finance 文章，**只看到标题，内容未能获取**。
- 未能检索 Reddit / HN 或专业媒体的质疑性报道（搜索次数用完 + 域名被拦），**这是信息缺口**。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下都是创作建议，不是事实。每条后面标了所依据的来源编号。

**钩子候选**
1. "一个工人受了伤，他每周能领多少钱？这个数字，保险公司过去要算好几个月。这次，8 个小时。"（依据 [S1] ✅："Projects tend to fall months behind" / "eight hours"）
2. "保险业每天几百万个决定，真正'没人碰'的只有 1%。"（依据 [S1] ✅）
3. "监管一改规则，保险系统要改一年半。现在，几天。"（依据 [S1] ✅：12–18 个月 → days）
4. "它第一次只做对了 80%。但这恰恰是整个项目最聪明的地方。"（依据 [S1] ✅，引出反转 3）

**反转桥段**
- **"80% 不是失败，是分工"**：机器接住 80%，剩下 20% 交给理赔老手；老手每改一次，都变成下一次的改进信号；需要人工判断的部分从 70% 降到 20%。（依据 [S1] ✅；台词避开 "trained the model" 这个说法）
- **"不是挑最聪明的模型，是挑最会说'我不确定'的模型"**：受监管行业要的是"会举手提问、不瞎猜"。（依据 [S1] ✅ Pieroni 引语）
- **"监管要的不是准确率，而是'每一步为什么'"**：谁决定的、依据什么、什么时间、是人还是机器，全部可以回放。（依据 [S1] ✅）
- **"不是合规，是良心"**：结尾情绪点用 Pieroni 那句 "These people need this money. They can't wait for it."（依据 [S1] ✅）
- **"先在自己身上动刀"**：DXC 先用 Claude 写自己平台超过 95% 的代码，再去碰客户的核心系统。（依据 [S2] ✅）
- **"清醒一刻"**：技术上 8 小时跑通，但财报里 DXC 对这块新收入的预测是"近乎为零"，说明落地变现需要时间。（依据 [S5][S6] ⚠️，上片前需核实原文）

**类比（面向中国听众）**
- 可以类比国内工伤保险待遇计算、车险 / 健康险理赔单证录入这类场景。**具体的中国法规口径需另行核实，本研究未覆盖**。
- "授权额度 + 人工把关点"可以类比银行的"分级授权审批"。

**FDE 角色的讲法（避坑）**
- 推荐说法："DXC 本来就替这些保险公司运营核心系统，它的工程师天然就在客户的'后台'里，这就是 FDE 最理想的位置。"（依据 [S1] ✅ 1,100 家客户在其平台上运行、[S2] ✅ FDE 定义）
- 不要说"Anthropic 认证的 FDE 团队 8 小时做出来"，时间线不成立（见第 7 节 C）。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S1 | DXC brings Claude to the insurance backbone running billions of policies | https://claude.com/customers/dxc | Claude原文 | 页面未显示 | ✅ 已打开（curl 全文 + WebFetch），关键句逐字核对 |
| S2 | DXC will integrate Claude into the systems banks, airlines, and other regulated industries rely on | https://www.anthropic.com/news/dxc-anthropic-alliance | Anthropic 官方公告（合作方） | 2026-06-11 | ✅ 已打开，引文逐字 |
| S3 | Four role-based certifications for the people who put Claude to work for customers | https://claude.com/blog/four-role-based-claude-certifications | Anthropic / Claude 官方博客 | 2026-07-23 | ✅ 已打开（"DXC has committed to 20,000 certifications."） |
| S4 | DXC and Anthropic Announce Multi-Year Global Alliance to Bring AI into Mission-Critical Enterprise Systems | https://dxc.com/newsroom/06112026-dxc-and-anthropic-announce-multi-year-global-alliance-to-bring-ai-into-mission-critical-enterprise-systems | 公司新闻稿（DXC） | 2026-06-11 | ⚠️ 仅搜索结果摘要可见，未能打开原页（dxc.com 被代理拦截） |
| S5 | DXC promotes AI platform builders as Anthropic cohort reaches 86 | https://www.channeldive.com/news/dxc-promotes-ai-platform-builders-as-anthropic-cohort-reaches-86/826727/ | 媒体（Channel Dive） | 约 2026-07-31 | ⚠️ 仅搜索结果摘要可见，未能打开原页 |
| S6 | DXC (DXC) Q1 2027 Earnings Call Transcript | https://www.fool.com/earnings/call-transcripts/2026/08/03/dxc-dxc-q1-2027-earnings-call-transcript/ | 财报会转录（Motley Fool） | 电话会 2026-07-30，页面 2026-08-03 | ⚠️ 仅搜索结果摘要可见，未能打开原页 |
| S7 | DXC Technology Q4 Earnings Call Highlights | https://finance.yahoo.com/markets/stocks/articles/dxc-technology-q4-earnings-call-061023956.html | 媒体（财报摘要） | 2026-05 | ⚠️ 仅搜索结果摘要可见，未能打开原页 |
| S8 | DXC Introduces New Assure Smart Apps to Accelerate Insurers' AI-Powered Transformation | https://dxc.com/newsroom/04092026-dxc-introduces-new-assure-smart-apps-to-accelerate-insurers-ai-powered-transformation | 公司新闻稿（DXC） | 2026-04-09 | ⚠️ 仅搜索结果摘要可见，未能打开原页 |
| S9 | DXC Launches Assure Smart Apps to Accelerate AI-Driven Innovation in the Insurance Industry | https://dxc.com/newsroom/10132025-dxc-launches-assure-smart-apps-to-accelerate-ai-driven-innovation-in-the-insurance-industry | 公司新闻稿（DXC） | 2025-10-13 | ⚠️ 仅搜索结果摘要可见，未能打开原页 |
| S10 | DXC launches AI insurance apps with ServiceNow to speed insurer transformation（另见 DXC Connect Charleston 活动页 https://dxc.com/about-us/events/dxc-connect-insurance-executive-forum-charleston ） | https://beinsure.com/news/dxc-launches-ai-insurance-apps/ | 媒体 + 公司活动页 | 2026-03/04 | ⚠️ 仅搜索结果摘要可见，未能打开原页 |
| S11 | DXC Appoints William Pieroni to Drive Strategy and Growth Across Global Insurance Software and Business Process Services | https://dxc.com/newsroom/04232025-dxc-appoints-william-pieroni-to-global-insurance-software-bps | 公司新闻稿（DXC） | 2025-04-23 | ⚠️ 仅搜索结果摘要可见，未能打开原页 |
| S12 | DXC Technology's Pieroni: Agentic AI To 'Eliminate Laggards and Accelerate Leaders'（AM Best Audio，录于 InsureTech Connect 2025） | https://podcasts.apple.com/us/podcast/dxc-technologys-pieroni-agentic-ai-to-eliminate-laggards/id126723118?i=1000739638276 | 播客 | 2025 年秋 | ⚠️ 仅搜索结果摘要可见，未能打开原页。摘要大意：精明的保险公司不部署黑箱，而是可审计、可验证、可追溯的技术 |
| S13 | Unlocking the power of agentic AI in insurance（另有 Insurance Thought Leadership 转载 https://www.insurancethoughtleadership.com/ai-machine-learning/unlocking-power-agentic-ai-insurance ） | https://dxc.com/insights/knowledge-base/agentic-ai-in-insurance | 公司洞察文章 | 未知 | ⚠️ 仅搜索结果摘要可见，未能打开原页 |
| S14 | Agentic AI gives insurers a path to modernize without rip and replace（Jenna Colman、Dan Stanovich 问答） | https://dxc.com/insights/knowledge-base/q-and-a/agentic-ai-gives-insurers-a-path-to-modernize-without-rip-and-replace | 公司洞察问答 | 未知（约 2026） | ⚠️ 仅搜索结果摘要可见，未能打开原页 |
| S15 | Bill Pieroni LinkedIn（搜索摘要提示他本人发帖复述了 8 小时 / 80% / 70%→20% / 1%→50% 等数字） | https://www.linkedin.com/in/bill-pieroni-99740670/ | 个人社媒 | 未知 | ⚠️ 仅搜索结果摘要可见，未能打开原页；无法确认具体帖子 |
| S16 | Pre-injury average weekly earnings for workers and employers（WorkSafe Victoria） | https://www.worksafe.vic.gov.au/pre-injury-average-weekly-earnings-workers-and-employers | 政府 / 监管机构 | 未知 | ⚠️ 仅搜索结果摘要可见，未能打开原页（摘要：PIAWE 通常按受伤前 52 周普通收入平均） |
| S17 | DXC Claims Management Services – VIC Employer | https://dxc.com/au/en/cp/claims-management-services/victoria/employer | 公司业务页（DXC 澳洲工伤理赔代理） | 未知 | ⚠️ 仅搜索结果摘要可见，未能打开原页（摘要：DXC 作为代理，负责确保 WorkSafe Victoria 理赔中 PIAWE 支付准确） |
| S18 | DXC Technology Co (DXC) (Q1 2027) Earnings Call Highlights | https://finance.yahoo.com/technology/ai/articles/dxc-technology-co-dxc-q1-050104027.html | 媒体（财报摘要） | 2026-07/08 | ⚠️ 仅搜索结果摘要可见，未能打开原页 |
| S19 | Assure Platform – DXC Technology | https://dxc.com/platforms/assure | 公司产品页 | 未知 | ⚠️ 仅搜索结果摘要可见，未能打开原页（摘要：Assure Platform 由 AWS 驱动，提供数千个 API） |
| S20 | Claude customer stories 列表页 | https://claude.com/customers | Claude 官方 | — | ✅ 已打开（列表中有 "DXC brings Claude to the insurance backbone running billions of policies"） |

**信息缺口汇总**
- 没有点名任何一家使用 Claude 版 Assure 的保险公司，也没有找到客户方公告。
- 找不到现场过程（谁去的、访谈了谁、第一个场景、上线周期、失败经历）的公开一手描述。
- 评测细节（样本量、对照标准）未披露。
- Claude 与 ServiceNow / AWS 在 Assure 里如何分工未披露。
- 工伤场景属于哪个法域未披露（澳洲维州可能性较高，但属推断）。
- 专业保险媒体、The Register、Business Insider、Reddit / HN 未能检索或打开（网络策略拦截 + 搜索次数用完）。
