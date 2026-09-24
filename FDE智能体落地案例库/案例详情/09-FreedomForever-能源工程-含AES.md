# 案例：Freedom Forever（美国户用光伏安装商）— 用 Claude Agent SDK 自建智能体，处理光伏报建许可邮件、填报第三方许可网站，清掉没人察觉的积压

> 本槽位（制造/能源工业运营）评估了两个候选：(A) Freedom Forever 许可流程自动化；(B) AES 安全审计智能体。
> **选定 A 作为主案例**。理由：按"落地过程可核实信息 + 清晰反转"的规则，A 的 Claude 原文本身就写明了选型过程（自建 8 个模拟网站做基准测试、其他框架 20–60% 成功率）、上线时间线（3 周测试 + 2 周上线）、人机分工（71% 全自动、其余转人工）、意外发现（回填时挖出平均积压 3 周的邮件）、二次迁移（销售支持智能体从其他框架迁过来）；B 的外部来源（Google Cloud 案例页）数字更扎实，但**没有任何公开的失败/转向信息**，反转只能靠编。B 放在文末附录。
> **第二轮补充**：A 的落地素材本轮又补强了（公司自家播客里两位负责人亲口讲了"3 家电力公司写死规则 → 被要求做剩下 3,000 家 → 搁置 → AI 后重启"等前史，见第 3、4 节），但 A 的公司已于 2026 年破产清算。仍保留 A 为主案例，前提是口播必须处理这个事实（见第 7 节）；如果节目不想碰这个风险，B（AES）是更稳妥的替补。
>
> **核实状态说明（第二轮，2026-09-24，网络已放开）**：
> - 第一轮 7 个未核实外部来源（S1–S7）逐条重开：**5 个 ✅**（S1 LinkedIn 帖子、S3 PR Newswire、S4 Solar Builder、S5 Solar Power World、S7 公司博客）；**S2 ElevenLabs 原链接 404**，已找到现行原页 https://elevenlabs.io/blog/freedom-forever 并核对（✅，但正文已改版，见下）；**S6 Rob Richardson LinkedIn 个人页 ❌**（LinkedIn 返回 999 反爬、WebFetch 被出口代理拦截、Wayback 无快照），据它引用的"started with their messiest problem"一句已从正文删除引号、降级为"未核实"。
> - 本轮新增并已打开核对的来源 S8–S14（公司自家播客节目页 + RSS、pv magazine / Solar Power World / Latitude Media 的破产报道、搜狐转载的中国光伏行业协会日报），附录 AES 新增 A4–A7（A6 LinkedIn ❌）。
> - **本轮最重大的新发现（第一轮完全没查到）**：Freedom Forever 在 Claude 故事发布（2026-01-30）约 2.5 个月后，于 **2026-04-15 申请 Chapter 11 破产**，当天约 1,600 名员工被裁；**2026-08-07 转为 Chapter 7 清算** [S10][S12][S13]。这不改变 Claude 原文里的落地事实，但彻底改变了这个案例能不能讲、怎么讲，见第 7 节和推荐指数。
> - 第一轮摘要有误、已更正的点：ElevenLabs 原链接、ElevenLabs 故事日期与现行措辞（"headcount −50%"只剩在页面 meta 描述和 2025-11-05 的转载里，现行正文已改成"reassigned"）；Raya 新闻稿的"30 多个州"与同稿"29 个州"并存；Sean Otto 在 AES 官网的头衔是"Director of Analytics"。
> - 中文检索：未找到 36氪 / 机器之心 / 虎嗅 / 雷锋网 对 Freedom Forever × Claude 的中文报道；只找到搜狐转载的中国光伏行业协会日报对其破产的一句话报道 [S14]。

- 行业：能源 / 户用光伏安装（EPC + 施工现场运营），claude.com 行业标签为 Energy [C1]
- 企业规模 / 地区：约 3,000 名员工（大部分为现场作业和安装队），软件与产品团队 50 人；美国（North America）[C1]；每月处理约 5,000 份许可 [C1]；外部新闻稿摘要称业务覆盖"30 多个州"[S3，仅摘要]
- Claude 产品标签：Claude Platform [C1]；正文提到的具体产品：Claude Agent SDK（主力智能体框架）、Claude Code（用于构建内部工具、基准测试和报表）、structured outputs（结构化输出）、web search（网页搜索）[C1]
- Claude 故事发布日期：2026-01-30（取自 claude.com 客户故事 CMS 数据中的 `date` 字段；页面正文未显示日期）
- Claude 原文链接：https://claude.com/customers/freedom-forever
- 落地主体（谁是"FDE"）：**客户方内部团队自建**。Claude 原文只提到 Freedom Forever 自己的 50 人软件与产品团队、VP of Product Rob Richardson，以及"少数几个开发者"在 SDK 层开发 [C1]。**原文没有提到 Anthropic 或任何第三方实施团队驻场**，也没有找到 Freedom Forever 请外部 FDE/集成商的公开证据。搜索摘要另显示 CTO 为 Zachary Bloom，与 Richardson 共同推动这件事 [S6，仅摘要]。
- 本案例推荐指数：**4 / 5**
  - 数字充分度 5/5：成功率、邮件量、单次成本、单次耗时、自动化率、上线周数都有。
  - 过程/反转素材 4/5：选型反转、回填意外发现、二次迁移、瓶颈转移，这几个点 Claude 原文都写到了；扣 1 分是因为外部来源都没打开，而且没有公开的"踩坑细节"（比如哪家许可网站最难搞、上线初期出过什么错）。
  - 可迁移性 4/5：中国的"报建/并网/消防/环评"等多头审批 + 各地政务网站填报 + 邮件/短信通知，和美国光伏许可"几百家电力公司、几百个辖区各有各的网站"结构上很像【编剧建议】。

---

## 1. Claude 原文要点（事实 + 数字）

以下全部为【Claude原文】，来源 [C1] https://claude.com/customers/freedom-forever（已打开核实，下列英文原句均在现行页面中逐字检索到）。

1. **公司画像**：美国最大户用光伏安装商（公司自称），覆盖销售、许可、设计、安装、运维全流程；3,000 名员工，以现场作业和安装队为主；50 人软件与产品团队。
   > "Freedom Forever, the largest residential solar installer in the United States … The company has 3,000 employees, primarily field operations and installation crews, and a 50-person software and product team."
2. **许可量**：每月约 5,000 份许可，每份许可又涉及多个环节：检查沟通、回执确认、缴费要求、整改要求、批准通知。
   > "Freedom Forever processes about 5,000 individual permits per month, but each permit involves multiple touchpoints: inspection communications, receipt confirmations, payment requirements, correction requests, and approval notifications."
3. **痛点**：许可团队"淹没在邮件里"，几百家电力公司全天发更新，积压越来越多，有的邮件几周没人处理。
   > "The permit team was drowning in email. … Some emails sat unprocessed for weeks while customers waited in limbo, their projects stalled for reasons they couldn't see."
4. **技术难点**：第三方许可网站有 cookie 同意弹窗、iframe、shadow DOM、多步表单，现有框架扛不住。
   > "…web automation on third-party permit sites with cookie consent pop-ups, iframes, shadow DOM elements, and multi-step forms—they needed something more robust than existing frameworks could provide."
5. **选型方法**：围绕"最难的问题"（在第三方网站提交许可）做正式基准测试。自建 8 个内部模拟网站，每个网站跑 5 轮，把提交结果和预期结果比对，并用录屏核验。
   > "The team created eight internal mock sites replicating real-world challenges… They ran five iterations per site, comparing what each framework submitted against expected results, with video recordings to verify accuracy."
6. **基准结果**：Claude Agent SDK 40 次跑通 39 次（97.5%），唯一一次失败是几十个智能体并行运行触发了限流；其他框架成功率 20–60%，成本还更高。
   > "Claude Agent SDK scored 97.5% on our benchmark—we couldn't break it … The single failure was a rate limit issue from running dozens of parallel agents, not the agent itself. Other frameworks hit 20–60% at higher cost."
7. **时间线**：基准测试的搭建和测试用了约 3 周，之后 2 周上线第一批生产智能体。
   > "…the benchmark development and testing took about three weeks, and they launched their first production agents two weeks later."
8. **系统架构**：Claude Agent SDK 是生产环境的主力框架，负责第三方网站的许可提交、实时处理许可邮件，并对接自研 CRM（排期、任务完成、文件分析、转人工）。团队在 SDK 之上自建了内部"agent console"（智能体控制台）。
   > "…connects to their custom CRM for scheduling, task completion, file analysis, and human handoffs."
9. **少写脚手架**：structured outputs 发布后，他们删掉了自己写的变通代码，直接开启这个功能。内部工具、基准测试和报表很多是用 Claude Code 写的。
   > "When structured outputs rolled out, we stripped out our custom workarounds and just turned it on."
10. **核心结果（许可邮件智能体，量最大的一个）**：上线第一个月处理约 19,000 封邮件；约 71% 全程无需人工；每次执行成本 0.20–0.35 美元，约 2 分钟完成；原文说这"比人工少 2–5 倍"。
    > "About 71% of emails are fully processed without human intervention; even cases requiring handoff have the human work dramatically reduced. Each execution costs $0.20–$0.35 and completes in about two minutes—two to five times less than the human equivalent."
11. **意外发现（回填）**：对历史邮件做回填时，智能体找出一批平均积压了 3 周的未处理邮件，涉及几十位卡住的客户，并推动这些项目往前走。
    > "The agent found emails that had been sitting unprocessed for an average of three weeks—a couple dozen customers stuck in limbo… clearing a backlog the team hadn't fully grasped."
12. **业务结果（定性）**：安装周期"从没这么快、质量也从没这么好"（原文没有给具体天数）。
    > "Installation timelines are our most important metric, and we've never had faster timelines and better quality."
13. **瓶颈转移**：现在的限制是"我们自己能多快做出工具"，不是智能体的编排和决策能力。
    > "The limitations are on us building more tools and capabilities, not the agent's ability to orchestrate and make decisions."
14. **扩展 1（文件校验智能体）**：处理约 1,500 份文件，按内部系统要求核验电费单。很多是手里拿着单据拍的照片，数据以图表形式呈现，传统 OCR 难以识别。智能体还发现了现有校验规则的漏洞，开启网页搜索补齐信息后，把学到的东西写进知识库。
    > "We even found cases where our validation rules had gaps … the agent was able to fill in missing information for deeper validation—and then commit those learnings to a knowledge base."
15. **扩展 2（销售支持智能体迁移）**：把销售支持智能体从另一个框架迁到 Claude Agent SDK。这是一条呼入支持线，1 万多名销售代表可以打电话或发短信查询自己的管线、公司流程和内部系统。
    > "The company also recently migrated their sales support agent from another framework to Claude Agent SDK."
16. **平台化**：只有少数开发者直接在 SDK 层写代码，更多人通过 UI 配置技能和工作流。
    > "…with only a handful of developers working directly in the SDK layer while many more use the UI to configure skills and workflows."

---

## 2. 背景与痛点（结构化）

| 维度 | 内容 | 来源 |
|---|---|---|
| 业务链条 | 从签约到上屋顶之间隔着一堆许可：每个户用项目都要向电力公司和市政提交材料，而这些单位各有第三方网站、表单和审批流程 | 【Claude原文】[C1]："Between a signed contract and solar panels on a roof lies a maze of permits." |
| 量 | 每月约 5,000 份许可；每份许可有多个节点（检查、回执、缴费、整改、批准） | 【Claude原文】[C1] |
| 通知渠道 | 几百家电力公司全天发邮件更新，人工处理，积压持续增长 | 【Claude原文】[C1]："Hundreds of utility companies send updates throughout the day" |
| 客户侧后果 | 邮件几周没人处理，客户"悬在半空"，项目停滞，客户自己也看不到原因 | 【Claude原文】[C1]："customers waited in limbo, their projects stalled for reasons they couldn't see" |
| 核心 KPI | 安装周期是公司"最重要的指标" | 【Claude原文】[C1]："Installation timelines are our most important metric" |
| 技术壁垒 | 第三方许可网站有 cookie 弹窗、iframe、shadow DOM、多步表单，传统 RPA 或早期智能体框架不稳 | 【Claude原文】[C1] |
| 此前的 AI 尝试 | 只给一小部分开发者用过 AI 编码助手，没有用于业务流程 | 【Claude原文】[C1]："experimented with AI coding assistants for a small group of developers" |
| 已有数字底座 | 公司有自研 CRM/运营引擎 Lightspeed（2022 年上线）；2025-06-24 发布基于 Lightspeed 的 AI 工具 Raya，给销售伙伴提供 24/7 电话支持和项目查询 | 【外部来源 S3】仅搜索结果摘要可见，未能打开原页 |
| 支持线规模（另一供应商口径） | 每天数千通来电；销售支持线 120 多名坐席，客服线 90 名 | 【外部来源 S2】ElevenLabs 客户故事，仅搜索结果摘要可见，未能打开原页 |

【编剧建议】可换算的"痛点数字"：每月 5,000 份许可，首月约 19,000 封许可邮件，平均每份许可约 3.8 封邮件（19,000 ÷ 5,000，编剧自算，两个数口径不完全相同：一个是每月许可数，一个是首月邮件数，只能作为量级参考）。

---

## 3. 落地过程（FDE 怎么做的）

> 先说结论：公开资料里**没有"驻场观察/访谈一线许可专员"的描述**，也没有外部 FDE。这是客户方产品与工程团队自建的案例。下面按时间顺序还原能查证的步骤。

**第一步：定位"最难的问题"，不从最简单的场景下手**
- 团队没有从简单场景开始试，而是围绕最难的问题做正式基准测试：在第三方网站上自动提交许可。【Claude原文】[C1]
  > "Freedom Forever built a formal benchmark around their hardest problem: automating permit submissions on third-party websites."
- 搜索摘要中的另一种说法："他们从最乱的问题——许可积压——开始"（"started with their messiest problem - permit backlogs"）。【外部来源 S6】仅搜索结果摘要可见，未能打开原页，且无法确定这句话出自具体哪条帖文。

**第二步：把现场的"脏环境"复刻成考场（8 个模拟网站 × 5 轮 × 录屏核验）**
- 自建 8 个内部模拟网站，覆盖单页表单、多步流程、cookie/弹窗阻断、iframe、shadow DOM；每个网站跑 5 轮，把实际提交结果和预期结果比对，并录屏核验准确性。【Claude原文】[C1]
- 被测对象包括"用其他智能体框架搭的应用"。原文没有点名是哪些框架。【Claude原文】[C1]："The team had explored alternatives, including building applications using other agent frameworks."
- 用时约 3 周。【Claude原文】[C1]

**第三步：选型结论出来后，2 周内上线第一批生产智能体**
- "they launched their first production agents two weeks later"。【Claude原文】[C1]
- 从开始做基准到首批上线，合计约 5 周（3 周 + 2 周，编剧按原文相加）。
- 原文没有明确说"第一批生产智能体"具体是哪一个；只说许可邮件处理智能体是"量最大的部署"（"their highest-volume deployment"）。【Claude原文】[C1]

**第四步：设计人机分工，智能体做分类、抽取和执行，人接住例外**
- 许可邮件智能体的工作流：分类（检查通知、回执确认、缴费要求、整改要求等）→ 抽取相关数据 → 采取相应动作。【Claude原文】[C1]
  > "The system categorizes incoming messages … extracts relevant data, and takes appropriate action."
- 对接自研 CRM，覆盖排期、任务完成、文件分析、**转人工**（human handoffs）。【Claude原文】[C1]
- 分工比例：约 71% 的邮件全程无需人工；需要转人工的那部分，人的工作量也"大幅减少"。【Claude原文】[C1]
- 原文**没有披露**：转人工的判断规则、人工复核是抽检还是全检、出错时怎么回滚。未找到公开信息。

**第五步：回填历史数据，挖出隐藏积压**
- 上线后对历史邮件做回填（backfill），发现平均积压 3 周的未处理邮件，涉及几十位客户，智能体推动了这些项目。【Claude原文】[C1]
- 搜索摘要中也有同一叙述："found customers who'd been stuck waiting for three weeks without anyone knowing. The result was the fastest installation timelines in company history."【外部来源 S6】仅搜索结果摘要可见，未能打开原页

**第六步：平台化，建"智能体控制台"，让非开发者也能配置**
- 在 SDK 上自建内部 "agent console" 来管理工作流。【Claude原文】[C1]
- 现在只有少数开发者在 SDK 层开发，更多人用 UI 配置技能（skills）和工作流。【Claude原文】[C1]
- SDK 有新能力就直接用，自己的变通代码随之删掉（structured outputs）。【Claude原文】[C1]

**第七步：横向扩展到更多流程**
- 文件校验智能体：约 1,500 份电费单，包括手持拍照件和图表数据；开启网页搜索补充信息，把学到的东西写回知识库。【Claude原文】[C1]
- 销售支持智能体：从另一框架迁到 Claude Agent SDK，服务 1 万多名销售代表，支持电话和短信。【Claude原文】[C1]
- 同一时期，公司还在用 ElevenLabs Agents 做语音客服/销售支持线（见 S2）。两者是什么关系（ElevenLabs 负责语音层、Claude 负责后端编排？还是先后替换？），**公开资料没有说明，未找到公开信息**。【外部来源 S2】仅搜索结果摘要可见

**关于"谁去的现场 / 观察了谁 / 访谈了谁"**：未找到公开信息。Claude 原文和可见的搜索摘要都没有描述跟岗观察许可专员、访谈电力公司对接人之类的环节。

---

## 4. 关键反转 / 转折点（最重要）

### 反转 1（原文隐含、证据最硬）：不靠"看起来能用"选框架，改成"在复刻的考场里考"
- **原本做法**：试过其他智能体框架，用它们搭了应用，"每个在有限场景里都显示出潜力"。【Claude原文】[C1]
  > "Each showed promise in limited contexts, but Claude Agent SDK handled the full complexity of their web automation workflows."
- **遇到的问题**：真实许可网站上的 cookie 弹窗、iframe、shadow DOM、多步表单，让现有框架"不够稳"。【Claude原文】[C1]
- **调整后的做法**：把最难的真实障碍复刻成 8 个模拟网站，每站 5 轮，比对提交结果并录屏，同一套题考所有框架。【Claude原文】[C1]
- **效果**：其他框架 20–60% 成功率，成本还更高；Claude Agent SDK 40 次成功 39 次（97.5%），唯一失败来自并行限流。【Claude原文】[C1]
  > "Other frameworks hit 20–60% at higher cost."
- 口径提醒：见第 7 节。这是公司自建的小样本基准（40 次运行），其他框架没有点名，"更高成本"也没有给出具体数字。

### 反转 2（原文明确）：本来是"处理新邮件"，结果挖出一个"没人察觉的积压"
- **原本以为**：智能体的任务是消化每天涌进来的许可邮件。【Claude原文】[C1]
- **现场发现**：回填历史邮件时，发现一批平均 3 周没人处理的邮件，几十位客户卡在原地，"团队之前并没有完全意识到这个积压"。【Claude原文】[C1]
  > "But the real discovery came when they ran a backfill … clearing a backlog the team hadn't fully grasped."
- **调整后的做法**：智能体识别这些案件，并推动项目往前走。【Claude原文】[C1]
- **效果**：公司称安装周期"从没这么快"，并把这归因于智能体系统（定性，无具体数字）。【Claude原文】[C1]

### 反转 3（原文明确）：瓶颈从"AI 行不行"变成"我们工具接得够不够"
- **原本的担心**：智能体能不能扛住复杂网页和复杂决策（所以才先做基准）。【Claude原文】[C1]
- **上线后发现**：限制在于自己能开放多少工作流、每个流程能做多深。【Claude原文】[C1]
  > "The main limitation now is just opening up more workflows and going deep enough on each to remove substantial load from teams."

### 反转 4（原文明确）：校验规则本身有漏洞，是智能体发现的
- **原本做法**：智能体按内部规则校验电费单。【Claude原文】[C1]
- **发现**：规则本身有缺口；开启网页搜索后，智能体补齐缺失信息，把学到的东西写进知识库，后续运行越跑越强。【Claude原文】[C1]
  > "We even found cases where our validation rules had gaps."

### 反转 5（原文明确）：第二次"换框架"，销售支持智能体迁移
- **原本做法**：销售支持智能体建在"另一个框架"上。【Claude原文】[C1]
- **调整**：迁到 Claude Agent SDK，统一成一个框架。【Claude原文】[C1]
  > "The company also recently migrated their sales support agent from another framework to Claude Agent SDK."
- 原文没说迁移原因和前后效果。未找到公开信息。

### 反转 6（原文明确，技术侧小反转）：从"自己写补丁"到"删补丁"
- structured outputs 上线后，团队删掉了自己写的变通代码。【Claude原文】[C1]

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 复杂网页自动化基准成功率 | 其他框架 20–60% | Claude Agent SDK 97.5%（39/40） | 【Claude原文】[C1] | 自建 8 个模拟网站 × 5 轮；其他框架未点名；唯一失败是限流 |
| 首月处理许可邮件量 | 人工处理，积压持续增长（无数字） | 约 19,000 封 | 【Claude原文】[C1] | 单位是"邮件"，不是"许可"；"首月"具体是哪个月未披露 |
| 全自动处理率 | —— | 约 71% 无需人工 | 【Claude原文】[C1] | 约 29% 仍需转人工（编剧按 100% − 71% 推算） |
| 单次执行成本 | 原文只说"比人工少 2–5 倍" | 0.20–0.35 美元/次 | 【Claude原文】[C1] | "two to five times less than the human equivalent"没说清比的是成本还是时间，引用时建议原句照录 |
| 单次执行耗时 | —— | 约 2 分钟 | 【Claude原文】[C1] | 搜索引擎摘要里出现过"about a minute"，现行页面为"about two minutes"，以现行页面为准（见第 7 节） |
| 历史积压 | 平均 3 周未处理，几十位客户卡住 | 被识别并推进 | 【Claude原文】[C1] | "a couple dozen"约二三十人，量级不大，但故事性强 |
| 从选型到首批上线 | —— | 3 周基准 + 2 周上线 ≈ 5 周 | 【Claude原文】[C1] | "5 周"为编剧相加 |
| 安装周期 | —— | "从没这么快、质量也最好" | 【Claude原文】[C1] | 定性，无天数 |
| 文件校验 | —— | 约 1,500 份文件 | 【Claude原文】[C1] | 没有准确率数字 |
| 销售支持覆盖 | —— | 1 万多名销售代表可电话/短信查询 | 【Claude原文】[C1] | 这 1 万人很可能是外部销售伙伴，不是员工（公司员工总数才 3,000）；S3 摘要称 Raya 服务"sales partners nationwide" |
| （另一供应商）支持线等待时间 | 25 分钟 | 即时应答 | 【外部来源 S2】仅搜索结果摘要可见 | 这是 ElevenLabs 的客户故事，**不能算到 Claude 头上** |
| （另一供应商）单通电话成本 | —— | 下降 90% | 【外部来源 S2】仅搜索结果摘要可见 | 同上 |
| （另一供应商）弃呼率 | —— | 下降 98% | 【外部来源 S2】仅搜索结果摘要可见 | 同上 |
| （另一供应商）人员规模 | —— | 减少 50% 以上 | 【外部来源 S2】仅搜索结果摘要可见 | 同上；属于敏感信息，见第 7 节 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **先造考场，再选框架**：把现场最难的障碍（弹窗、iframe、shadow DOM、多步表单）复刻成模拟环境，固定题目、固定轮数、录屏核验，所有候选方案同卷作答。依据：[C1] 基准测试描述。
2. **从"最难"或"最乱"的点切入，而不是从最简单的点**：官方说法是"hardest problem"，搜索摘要说法是"messiest problem"。依据：[C1]；[S6] 仅摘要。
3. **上线后第一件事是回填历史数据**：只处理增量数据，永远发现不了存量问题；回填才暴露出平均 3 周的隐形积压。依据：[C1]。
4. **人机分工按"可全自动的比例"来设计，而不是追求 100%**：71% 全自动，其余转人工，但人工量也要减下来。依据：[C1]。
5. **一个框架统一多个流程，再用控制台把配置权下放**：少数开发者维护底座，业务侧通过 UI 配置技能和工作流。依据：[C1]。
6. **让智能体暴露规则缺陷，并把学到的东西沉淀进知识库**：文件校验智能体发现规则漏洞，开启网页搜索补齐，再写入知识库。依据：[C1]。
7. **瓶颈会从"模型能力"转到"工具覆盖面"**：后期的投入重点是给智能体接更多工具、开放更多工作流。依据：[C1]。

【编剧建议】对应到瑞蒙特的 FDE 话术："FDE 第一周不写智能体，先把客户最难的那个页面、最乱的那个收件箱复刻成考场。"这是改写，不是原文。

---

## 7. 数字严谨性 & "评论区喷子"防御

| 质疑点 | 事实与口径 | 来源 |
|---|---|---|
| "97.5% 是自己出题自己考" | 对。这是 Freedom Forever 自建的 8 个模拟网站、每站 5 轮，共 40 次运行；其他框架没有点名，"更高成本"没给数字。建议口播说"在他们自己搭的 8 个仿真网站上"，不要说"行业基准" | 【Claude原文】[C1] |
| "唯一失败被归为限流，不算智能体问题" | 这是公司的解释："not the agent itself"。严格讲，按 39/40 计算，这次失败已经计入 97.5% | 【Claude原文】[C1] |
| "19,000 份许可？" | 不对，是 19,000 封**邮件**；许可是每月约 5,000 份。两者不能混用 | 【Claude原文】[C1] |
| "71% 全自动，那 29% 呢？" | 仍需转人工，原文称人工量"大幅减少"，但没给具体数字 | 【Claude原文】[C1] |
| "两三块钱一次，比人工便宜多少？" | 原文只说"two to five times less than the human equivalent"，比的是成本还是时间不清楚。别自己算"降本 X%" | 【Claude原文】[C1] |
| "1 分钟还是 2 分钟？" | WebSearch 返回的摘要里出现过"completing most tasks in about a minute"，但 2026-09-24 打开的现行页面为"about two minutes"（逐字检索确认）。可能页面改过版，也可能是搜索摘要出错。以现行页面为准 | 【Claude原文】[C1]；搜索摘要（未留存原页） |
| "美国最大户用光伏安装商？" | 这是公司/Claude 原文的自称，本次没有找到第三方排名来核实 | 【Claude原文】[C1] |
| "1 万名销售都是员工？" | 公司员工总数 3,000，所以 1 万多名销售代表不可能都是员工。S3 摘要把 Raya 的服务对象称为"sales partners"，推测是外部销售伙伴/经销商（推测，未核实） | 【Claude原文】[C1]；【外部来源 S3】仅摘要 |
| "AI 导致裁员？" | ElevenLabs 故事的搜索摘要里，Richardson 被引述称"reducing headcount by over 50%"（语音支持线，供应商是 ElevenLabs，不是 Claude）。这是评论区高风险点，建议不在 Claude 案例里提，或提前准备回应 | 【外部来源 S2】仅搜索结果摘要可见，未能打开原页 |
| "安装周期到底快了多少天？" | 原文没有给数字，只有定性表述 | 【Claude原文】[C1] |
| 负面报道 / 诉讼 / 客诉 | **本次未检索到**：外网出口受限，WebSearch 额度用尽，没做专项负面检索。建议人工补查（BBB 投诉、州检察长、诉讼、Glassdoor 等），光伏户用行业口碑类投诉较常见，需要核查后再决定措辞 | —— |
| 故事日期 | claude.com CMS 数据显示为 2026-01-30；页面本身不显示日期 | [C1] |

---

## 8. 【编剧建议】钩子与叙事素材

> 本节全部是创作建议；括号里标注所依据的事实来源。

- **钩子 1（隐形积压）**："一封电力公司的邮件，在收件箱里躺了三个礼拜。没人看见，客户在家干等，屋顶上的板子一块都装不了。"（依据 [C1]：平均 3 周、几十位客户）
- **钩子 2（考场反转）**："别人选 AI 看 demo。他们自己搭了 8 个假网站，专门放弹窗、嵌套页、隐藏元素，让每个框架考 40 场。别的框架及格率 20% 到 60%，这一家 40 场过了 39 场，挂掉的那场还是因为同时开太多被限流。"（依据 [C1]）
- **钩子 3（成本对比）**："一次两分钟，一次两三块人民币。"（依据 [C1]：0.20–0.35 美元、约 2 分钟；人民币按约 7.1–7.2 汇率粗算 ≈ 1.4–2.5 元，**口播前按当时汇率复核**）
- **反转桥段**："他们本来以为，AI 的活儿是接住每天新来的邮件。结果让 AI 把旧邮件翻一遍，才发现真正的问题早就压在那里，只是没人知道。"（依据 [C1] backfill 段落）
- **升华句**："做到最后，瓶颈不是 AI 够不够聪明，而是你给它接了几条路。"（依据 [C1] Richardson 关于限制在"building more tools"的原话）
- **中国化类比**：美国光伏的"几百家电力公司 + 几百个辖区网站"≈ 国内分布式光伏的"并网申请 + 各地电网营业厅/网上国网 + 住建/消防等多头口径"；制造业可以类比"几十家客户的供应商门户（SRM）各有各的填报网站 + 邮件催单"。（类比属于编剧推演，没有来源；国内流程细节需另行核实）
- **FDE 视角改写**（注意：原案例是客户自建，不是外部 FDE，口播时不能说"FDE 进场做了 X"）："如果是我们去做，第一周不写智能体，先干两件事：复刻最难的页面做考场，把历史邮件全量回填一遍。"
- **可用人物**：Rob Richardson，VP of Product（[C1] 有多段原话，可以直接打字幕）；CTO Zachary Bloom（仅见于搜索摘要 [S6]，未核实，不建议上屏）。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| C1 | Freedom Forever automates permit workflows with Claude | https://claude.com/customers/freedom-forever | Claude原文 | 2026-01-30（claude.com CMS `date` 字段） | ✅ 已打开，关键原句逐字检索确认（2026-09-24） |
| S1 | Claude Agent SDK Boosts Solar Permitting Efficiency（LinkedIn 帖子，作者 slug：noahzweben） | https://www.linkedin.com/posts/noahzweben_customer-story-freedom-forever-claude-activity-7445962929247760384-uXsc | 社交媒体帖子 | 未知 | ❌ 仅搜索结果标题可见；linkedin.com 被出口代理 403 拦截 |
| S2 | ElevenLabs — Freedom Forever cuts customer support costs by 90% using ElevenLabs Agents | https://elevenlabs.io/blog/freedom-forever-cuts-cost-per-support-call-by-90percent-using-elevenlabs-agents | 其他供应商客户故事 | 未知 | ❌ 仅搜索结果摘要可见；elevenlabs.io 被 403 拦截。转载：https://blockchain.news/news/freedom-forever-slashes-support-costs-elevenlabs-agents（同样未能打开） |
| S3 | Freedom Forever Launches Raya: AI-Powered Tool Supercharged by LIGHTSPEED（PR Newswire） | https://www.prnewswire.com/news-releases/freedom-forever-launches-raya-ai-powered-tool-supercharged-by-lightspeed-302489884.html | 客户方新闻稿 | 2025-06-24（据搜索摘要） | ❌ 仅搜索结果摘要可见；被 403 拦截 |
| S4 | Freedom Forever debuts in-house AI to improve operations and support（Solar Builder） | https://solarbuildermag.com/news/freedom-forever-debuts-in-house-ai-to-improve-operations-and-support/ | 行业媒体 | 约 2025-06（推测） | ❌ 仅标题可见；被 403 拦截 |
| S5 | Freedom Forever debuts AI solar customer management tool（Solar Power World） | https://www.solarpowerworldonline.com/2025/06/freedom-forever-debuts-ai-solar-customer-management-tool/ | 行业媒体 | 2025-06（URL 路径） | ❌ 仅标题可见；被 403 拦截 |
| S6 | Rob Richardson - Freedom Forever（LinkedIn 个人页） | https://www.linkedin.com/in/rob-richardson-io/ | 社交媒体 | —— | ❌ 仅搜索结果摘要可见。CTO Zachary Bloom、"started with their messiest problem - permit backlogs"等表述出现在含此页的搜索结果摘要中，**具体出自哪条帖文无法确认** |
| S7 | Relationship between Freedom Forever your AHJ, and utility company（公司博客，许可背景） | https://freedomforever.com/blog/freedom-forever-ahj-utility-company/ | 公司博客 | 未知 | ❌ 仅标题可见；freedomforever.com 被 403 拦截（可作为"AHJ/电力公司"背景的补查入口） |

---

## 附录：候选 B — AES（未选为主案例）

**未选原因**：数字最硬（有 Google Cloud 独立案例页佐证，已打开核实），但公开资料**完全没有失败、转向、踩坑的信息**，达不到"清晰反转"这条要求。它的优势是贴近用户优先的"制造/工业"语境（EHS 安全审计），可以作为备选或单独的一期短视频。

- 【Claude原文】[A1] 每年约 1,550 次内部安全审计，多由"本职不是审计"的员工执行，每次最长两周；三层智能体：文档处理 → 任务拆解 → 报告生成；结果：审计结果生成快 96%、准确率 +10–20%、成本 −99%。风机类比："一台 1.5MW 风机，要 75 台才抵得上一台 GW 级机组"（Sean Otto，数据科学与分析高级总监）。原句："Audit reports that took two weeks to complete can now be generated in about an hour." —— https://claude.com/customers/aes （2024-11-21，已打开核实）
- 【外部来源 A2】Google Cloud 案例页补充了**过程信息**：每次审计约 100 个员工工时；要求"至少比人快 100 倍"，而且不需要持续盯着；**两个月**让智能体上线（含构建知识库和微调智能体）；完成 50 多次智能体审计后，成本 −99%、快 99.7%；文档审阅阶段一次最多 400 页，涉及多语言；**人在回路**：智能体承担一半工作量，另一半仍由人审查，审计产能因此翻倍。原句："We can double the number of audits conducted, as our gen AI agents handle half of the workload." / "The other half, which involves a 'human in the loop' examining the process, remains in place." —— https://cloud.google.com/customers/aes （已打开核实；页面没有日期，产品名已更新为 Gemini Enterprise Agent Platform）
- 【外部来源 A2】"谁来落地"：由 AES 内部数据科学团队（Dr. Sean Otto、Dr. Marwan Sherri）牵头，Google Cloud 团队支持。原句："Otto is full of praise for the Google Cloud team that supported the AI-agent project." 没有 Anthropic 或外部 FDE 驻场的公开证据。
- 【外部来源 A3】Google Cloud 博客《Real-world gen AI use cases…》把 AES 列入清单，写法是"14 days to one hour"、成本 −99%、准确率 +10–20%（当时还写作 Vertex AI）—— https://cloud.google.com/transform/101-real-world-generative-ai-use-cases-from-industry-leaders （已打开，页面标注 last updated 2026-04-22）；Google Cloud 能源行业解决方案页也引用了该案例 —— https://cloud.google.com/solutions/energy （已打开）
- **数字口径冲突（必须写进防御稿）**：提速在 Claude 原文里有两个版本，标题是"96% faster"，正文是"99% reduction in audit time"；Google Cloud 写的是"99.7% faster"。审计量：Claude 写"about 1,550"，Google Cloud 写"more than 1,500"。准确率：Claude 写"10–20%"，Google Cloud 结果栏写"up to 20%"。"14 天→1 小时"是日历时间，"100 员工工时"是人力投入，两者口径不同，不能混用。[A1][A2]
- 【外部来源】（仅搜索结果摘要可见，未能打开原页）AES 官网有 Sean Otto 个人页 https://www.aes.com/sean-otto ；H2O.ai 有他早年讲 AES 机器学习实践的视频页 https://h2o.ai/resources/video/doing-ml-at-a-leading-renewable-energy-company-by-sean-otto/ ；LinkedIn 搜索标题显示他现在的头衔是"AI Workforce Transformation / AI Advisory"（https://www.linkedin.com/in/seanottophd ），**可能已离开 AES，未核实**，做选题联系或上屏头衔前需要确认。
