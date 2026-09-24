# 案例：Freedom Forever（美国户用光伏安装商）— 用 Claude Agent SDK 自建智能体，处理光伏报建许可邮件、填报第三方许可网站，清掉没人察觉的积压

> 本槽位（制造/能源工业运营）评估了两个候选：(A) Freedom Forever 许可流程自动化；(B) AES 安全审计智能体。
> **选定 A 作为主案例**。理由：按"落地过程可核实信息 + 清晰反转"的规则，A 的 Claude 原文本身就写明了选型过程（自建 8 个模拟网站做基准测试、其他框架 20–60% 成功率）、上线时间线（3 周测试 + 2 周上线）、人机分工（71% 全自动、其余转人工）、意外发现（回填时挖出平均积压 3 周的邮件）、二次迁移（销售支持智能体从其他框架迁过来）；B 的外部来源（Google Cloud 案例页）数字更扎实，但**没有任何公开的失败/转向信息**，反转只能靠编。B 放在文末附录。
> **第二轮补充**：A 的落地素材本轮又补强了（公司自家播客里两位负责人亲口讲了"3 家电力公司写死规则 → 被要求做剩下 3,000 家 → 搁置 → AI 后重启"等前史，见第 3、4 节），但 A 的公司已于 2026 年破产清算。仍保留 A 为主案例，前提是口播必须处理这个事实（见第 7 节）；如果节目不想碰这个风险，B（AES）是更稳妥的替补。
>
> **核实状态说明（第二轮，2026-09-24，网络已放开）**：
> - **合计：外部来源 ✅ 17 个、❌ 2 个**（❌ 都是 LinkedIn 个人页：S6、A6）。C1 于 2026-09-24 重新打开，仍在线，关键原句仍能逐字检索到。
> - 第一轮 7 个未核实外部来源（S1–S7）逐条重开，**6 个 ✅**：S1 LinkedIn 帖子、S3 PR Newswire、S4 Solar Builder、S5 Solar Power World、S7 公司博客，以及 S2 ElevenLabs（原链接已 404，找到现行原页 https://elevenlabs.io/blog/freedom-forever 后核对，但正文已改版，见下）；**S6 Rob Richardson LinkedIn 个人页 ❌**（LinkedIn 返回 999 反爬、WebFetch 被出口代理拦截、Wayback 无快照），据它引用的"started with their messiest problem"一句已从正文删除引号、降级为"未核实"。
> - 本轮新增并已打开核对的来源 S2b（ElevenLabs 故事最初版本的转载）和 S8–S14（公司自家播客节目页 + RSS、pv magazine / Solar Power World / Latitude Media 的破产报道、搜狐转载的中国光伏行业协会日报），附录 AES 新增 A4–A7（A6 LinkedIn ❌）。其中 S8 是公司自家播客，没有文字稿，本轮下载原音频做了机器转写，引文要人工听音复核（见第 3 节说明）。
> - 本轮新补的关键过程（来自 S8）：AI 之前只给 3 家电力公司写了规则，扩到 3,000 家要 3 年，于是搁置；AI 功能按"项目摘要 → 文件校验 → Raya → 智能体"的顺序上线；许可邮件智能体的决策链和转人工逻辑；Raya 上线后把 2018 年的旧文档翻出来，逼出"数据有人负责"；Lightspeed 人工检查从 100 个任务膨胀到 300 个又往回砍。仍缺：第一个上线的是哪个智能体、转人工的具体规则、被比较的框架名称、许可邮件智能体上线初期出过什么错。
> - **本轮最重大的新发现（第一轮完全没查到）**：Freedom Forever 在 Claude 故事发布（2026-01-30）约 2.5 个月后，于 **2026-04-15 申请 Chapter 11 破产**，当天约 1,600 名员工被裁；**2026-08-07 转为 Chapter 7 清算** [S10][S12][S13]。这不改变 Claude 原文里的落地事实，但彻底改变了这个案例能不能讲、怎么讲，见第 7 节和推荐指数。
> - 第一轮摘要有误、已更正的点：ElevenLabs 原链接、ElevenLabs 故事日期与现行措辞（"headcount −50%"只剩在页面 meta 描述和 2025-11-05 的转载里，现行正文已改成"reassigned"）；Raya 新闻稿的"30 多个州"与同稿"29 个州"并存；Sean Otto 在 AES 官网的头衔是"Director of Analytics"。
> - 中文检索：未找到 36氪 / 机器之心 / 虎嗅 / 雷锋网 对 Freedom Forever × Claude 的中文报道；只找到搜狐转载的中国光伏行业协会日报对其破产的一句话报道 [S14]。

- 行业：能源 / 户用光伏安装（EPC + 施工现场运营），claude.com 行业标签为 Energy [C1]
- 企业规模 / 地区：约 3,000 名员工（大部分为现场作业和安装队），软件与产品团队 50 人；美国（North America）[C1]；每月处理约 5,000 份许可 [C1]。员工数各来源口径不一：ElevenLabs 故事写"more than 2,500 employees"，另有"10,000 to 20,000 independent sales representatives"[S2]；Solar Power World 2026-04 写"over 3,600 employees"[S11]。覆盖州数：同一篇 Raya 新闻稿里既写"more than 30 states"又写"Operating in 29 states"[S3]；Solar Power World 2026-04 写"35 states, Puerto Rico and Washington, D.C."[S11]
- **公司现状（重要）**：2026-04-15 申请 Chapter 11 破产，2026-08-07 转为 Chapter 7 清算 [S10][S13]（详见第 7 节）
- Claude 产品标签：Claude Platform [C1]；正文提到的具体产品：Claude Agent SDK（主力智能体框架）、Claude Code（用于构建内部工具、基准测试和报表）、structured outputs（结构化输出）、web search（网页搜索）[C1]
- Claude 故事发布日期：2026-01-30（取自 claude.com 客户故事 CMS 数据中的 `date` 字段；页面正文未显示日期）
- Claude 原文链接：https://claude.com/customers/freedom-forever
- 落地主体（谁是"FDE"）：**客户方内部团队自建**。Claude 原文只提到 Freedom Forever 自己的 50 人软件与产品团队、VP of Product Rob Richardson，以及"少数几个开发者"在 SDK 层开发 [C1]。**原文没有提到 Anthropic 或任何第三方实施团队驻场**，也没有找到 Freedom Forever 请外部 FDE/集成商的公开证据。CTO 是 Zachary（Zach）Bloom（新闻稿 [S3][S4][S5] 均写明 "Chief Technology Officer"）。公司自家播客 [S8] 里，Bloom 和 Richardson 两人一起讲了软件团队怎么用 AI 改造运营；Bloom 在播客里说 Richardson 带着一个团队专门做"discovery"（需求发现），这是本案例里最接近"FDE 进现场"的角色，只不过是公司内部的产品团队 [S8]。第一轮"CTO 与 Richardson 共同推动"的说法出自搜索摘要 [S6]，原页仍打不开；现在改由 [S3][S8] 支撑。
- 本案例推荐指数：**3 / 5**（第一轮为 4/5，本轮下调）
  - 数字充分度 5/5：成功率、邮件量、单次成本、单次耗时、自动化率、上线周数都有。
  - 过程/反转素材 4.5/5（上调）：除 Claude 原文里的选型反转、回填发现、二次迁移、瓶颈转移外，本轮从公司自家播客 [S8] 补到了一线负责人亲口讲的前史和踩坑：3 家电力公司写死规则、被要求扩到 3,000 家而搁置；Raya 上线后把 2018 年的过期文档翻出来，逼出"数据有人负责"；Lightspeed 规则从 100 个任务膨胀到 300 个又往回砍。仍缺：具体哪家许可网站最难搞、许可邮件智能体上线初期出过什么错。
  - **下调理由（风险项）**：Claude 故事发布 2.5 个月后公司申请破产，8 月转清算，约 1,600 名员工被裁时未领到工资，另有得州总检察长调查和 WARN 法案集体诉讼 [S10][S12][S13]。"史上最快安装周期"和"公司倒闭"放在同一期视频里，评论区一定会追问。案例的方法论依然成立，但不能再当"成功企业"来讲。
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
| 已有数字底座 | 公司有自研 CRM/运营引擎 Lightspeed（2022 年上线）；2025-06-24 发布基于 Lightspeed 的 AI 工具 Raya，给销售伙伴提供 24/7 电话支持和项目查询。原句："Built on Lightspeed, Freedom Forever's proprietary CRM and operational engine, Raya delivers real-time intelligence, automated issue resolution and 24/7 phone support to sales partners nationwide." | 【外部来源 S3】✅ PR Newswire 原页（S4、S5 两家行业媒体转述一致） |
| Lightspeed 的来历 | 2022 年的播客节目介绍：Bloom 团队把 1,200 多份标准作业程序（SOP）做成了 Lightspeed。原句："he and his team turned over 1,200 standard operating procedures into the first CRM software custom-built for solar" | 【外部来源 S9】✅ 公司播客节目简介（RSS） |
| 规则数据库（AI 的底座） | Bloom："maintained thousands of records of all the requirements to get a job what we would call built on paper."（员工多年手工维护各 AHJ、电力公司、金融公司的要求记录）；主持人："we have thousands of utilities or AHJs or even HOA data across the country." | 【外部来源 S8】✅ 播客音频，本轮机器转写 |
| 许可"两头"是谁 | AHJ（有管辖权的机构）通常是地方政府办公室，负责发施工许可、做正式检查；电力公司另有并网协议和表计要求。原句："Your Authority having Jurisdiction, or AHJ for short is usually an office in your local government that has the authority to issue construction permits and perform official inspections." | 【外部来源 S7】✅ 公司博客（2020-12-18） |
| 外部系统不通 API | Bloom：金融公司门户、电力公司门户、市政门户"don't have integrations, they don't have Webhooks, APIs"；外部系统里一有更新，就得有人去看、再回填到自家系统，"That is the baton toss, that is what moves projects forward. If you do that fast, you're fast. If you do that slow, you're slow." | 【外部来源 S8】✅ 播客音频，本轮机器转写 |
| 支持线规模（另一供应商口径） | 第一轮写的"销售支持线 120 多名坐席，客服线 90 名"在本轮打开的页面里**均未找到**，已删除。可核对的是：高峰期最多 75% 的来电没人接，等待最长 25 分钟（2025-11-05 转载稿）；现行 ElevenLabs 页面只写"high-volume inbound support lines""tens of thousands of calls each month" | 【外部来源 S2】✅ ElevenLabs 现行页；【S2b】✅ blockchain.news 转载 |

【编剧建议】可换算的"痛点数字"：每月 5,000 份许可，首月约 19,000 封许可邮件，平均每份许可约 3.8 封邮件（19,000 ÷ 5,000，编剧自算，两个数口径不完全相同：一个是每月许可数，一个是首月邮件数，只能作为量级参考）。

---

## 3. 落地过程（FDE 怎么做的）

> 先说结论：公开资料里**没有"驻场观察/访谈一线许可专员"的具体描述**，也没有外部 FDE。这是客户方产品与工程团队自建的案例。下面按时间顺序还原能查证的步骤。
>
> **关于 [S8] 播客引文的说明**：[S8] 是 Freedom Forever 自家播客《Solar Disruption Theory》2026-01-02 那期（61 分钟，主持人 Chad Towner，嘉宾 Bloom 和 Richardson，节目中提到录制时间是"end of 2025"）。节目没有文字稿，本轮下载原音频，用 Whisper 做了机器转写（全程用 base.en，关键段落再用 small.en 复核，两遍文字基本一致）。转写**不带说话人标注**，下文"Bloom 说 / Richardson 说"是按上下文推断的（例如主持人点名"Zach, how did we get to this point?"之后的回答）。**上屏字幕前请人工听一遍原音频核对**，时间码已标在每条引文后面。

**第零步（前史，外部来源补充）：AI 之前，这个问题就被提过，因为"长尾"做不完而搁置**
- 许可/并网邮件自动化，业务部门很早就提过。当年 NEM 政策推动时，软件团队只给 3 家电力公司的 3 类邮件写了专用规则，用了几周，能用。业务部门接着问能不能把剩下 3,000 家也做了，团队估计要 3 年，于是搁置。【外部来源 S8】（约 31:14–32:31，按上下文推断为 Bloom 所说）
  > "We've been asked to automate interconnection and permitting emails and notifications for a very long time. … the amount of work it takes to cover all those different types of emails pre-AI is not, the juice is not worth the squeeze."
  > "there's these three utilities, they send these three types of emails … So we went and built a very explicit function for those three, it took a couple weeks, and it worked. … Can you go do that for the other 3,000? … take that and you'll have it in three years."
- AI 落地是一步步来的（播客里亲口讲的顺序）：① 最早是"项目摘要"，把 Lightspeed 里很长的项目备注一键浓缩成一段话，每次查询省 30 分钟，"That was several years ago now"（约 25:52–27:14，主持人所说）；② 接着做文件上传校验，先确认上传的"wasn't just a picture of their foot"（约 28:16）；③ 2025-06 上线 Raya，"Rob is the father of Raya"（约 22:27，按上下文推断为 Bloom 所说）；主持人还回忆 Richardson"integrated with, I think it was Claude"，做了一个发短信就能查公司任何数据的工具，"took you a couple of days to stand it up"（约 13:14–13:31）；④ "over the last couple of months"才进入"agent era"，让 AI 调用工具、做决策、操作系统（约 28:53–29:13）。【外部来源 S8】
  - 注意：③ 里的"I think it was Claude"是主持人不太确定的回忆，只能说明 Claude 很早就被用于内部问答工具，不能据此断定 Raya 的底层模型。

**内部"FDE"角色：产品团队做 discovery**
- Bloom 形容 Richardson 的职责偏"前端"，带着一个团队专门做 discovery；做法是先承认自己不懂，再尽快变成屋里最懂的人。【外部来源 S8】（约 06:10–07:04）
  > "once we've identified a problem, we are the dumbest people in the room to start. And I think where we've shown that we can, you know, add value is how quickly we're able to become the expert in the room."
  > "Rob's responsibility lies more on that front end. He's got a whole team backing him to go do what we call discovery."
- Richardson 回忆，他加入时软件团队约 10 人，常听到"做了几周几个月才发现做偏了"。【外部来源 S8】（约 09:43–10:06）："we spent weeks or months building a thing. And we kind of missed the mark."

**第一步：定位"最难的问题"，不从最简单的场景下手**
- 团队没有从简单场景开始试，而是围绕最难的问题做正式基准测试：在第三方网站上自动提交许可。【Claude原文】[C1]
  > "Freedom Forever built a formal benchmark around their hardest problem: automating permit submissions on third-party websites."
- 第一轮引用过的"从最乱的问题——许可积压——开始"一句，本轮仍**无法打开出处**（S6 LinkedIn 个人页 ❌），已删除引文，不再作为事实使用。本轮两次 WebSearch 返回的摘要写法都是第三人称（"Rob Richardson wanted to … starting with their messiest problem"），更像别人发的帖子或转帖，不像 Richardson 本人的原话。

**第二步：把现场的"脏环境"复刻成考场（8 个模拟网站 × 5 轮 × 录屏核验）**
- 自建 8 个内部模拟网站，覆盖单页表单、多步流程、cookie/弹窗阻断、iframe、shadow DOM；每个网站跑 5 轮，把实际提交结果和预期结果比对，并录屏核验准确性。【Claude原文】[C1]
- 被测对象包括"用其他智能体框架搭的应用"。原文没有点名是哪些框架。【Claude原文】[C1]："The team had explored alternatives, including building applications using other agent frameworks."
  - 本轮补查：播客 [S8] 也没点名任何被比较的框架，Bloom 只说网页操作这一类问题"Right now it's some version of computer use or browser automation is kind of the key term"（约 41:10）。**被比较的框架名称：未找到公开信息。**（语音线另有一次选型：ElevenLabs 故事写 Freedom Forever 评估过"several voice and conversational AI architectures, including multimodal pipelines and real-time APIs"[S2]，这是语音客服线的选型，和本案的 Agent SDK 基准不是一回事。）
- 用时约 3 周。【Claude原文】[C1]

**第三步：选型结论出来后，2 周内上线第一批生产智能体**
- "they launched their first production agents two weeks later"。【Claude原文】[C1]
- 从开始做基准到首批上线，合计约 5 周（3 周 + 2 周，编剧按原文相加）。
- 原文没有明确说"第一批生产智能体"具体是哪一个；只说许可邮件处理智能体是"量最大的部署"（"their highest-volume deployment"）。【Claude原文】[C1]
- 本轮补查：播客 [S8] 讲"agent era"时列举了两条已上线的全流程：许可邮件处理（约 29:16–30:49，按上下文推断为 Richardson 所说），以及 7×24 小时盯金融公司门户里的变更单、自动回写 Lightspeed（约 39:48–40:43，Bloom 说"It's running as I'm speaking right now"），但**没有说哪一个最先上线**。"第一个上线的是哪个智能体"：仍未找到公开信息。

**第四步：设计人机分工，智能体做分类、抽取和执行，人接住例外**
- 许可邮件智能体的工作流：分类（检查通知、回执确认、缴费要求、整改要求等）→ 抽取相关数据 → 采取相应动作。【Claude原文】[C1]
  > "The system categorizes incoming messages … extracts relevant data, and takes appropriate action."
- 对接自研 CRM，覆盖排期、任务完成、文件分析、**转人工**（human handoffs）。【Claude原文】[C1]
- 分工比例：约 71% 的邮件全程无需人工；需要转人工的那部分，人的工作量也"大幅减少"。【Claude原文】[C1]
- 播客 [S8] 补充了许可邮件智能体的决策链和转人工逻辑（约 29:16–30:49，按上下文推断为 Richardson 所说）：读邮件 → 判断是批准、整改还是驳回 → 到自家数据库调出该辖区的规则 → 在大量项目里找到对的那一个（同名、同地址的客户可能不止一个，还要核对阶段、许可类型和辖区）→ 推进项目 → 判断不了就升级给人。
  > "how do we decide is this an approval? Is it a correction? Is it a rejection? if it's these cases and it's in this jurisdiction, what do we do with it? Let's go into our database and pull out the rules"
  > "how do you make sure it's the right project in the right stage, waiting for the right permit in that same jurisdiction? … And then when it can't, how do we escalate it to an expert, a person on our team to look at it"
- 准确性顾虑从第一个 AI 功能就有：做项目摘要时就开始想"how do you validate it's actually accurate and how do you make sure that it's not just hallucinating"，后来在 AI 周边补了很多校验工作。【外部来源 S8】（约 27:55–28:13）
- 仍**没有公开**：转人工的具体阈值或规则、人工复核是抽检还是全检、出错时怎么回滚。未找到公开信息。

**第五步：回填历史数据，挖出隐藏积压**
- 上线后对历史邮件做回填（backfill），发现平均积压 3 周的未处理邮件，涉及几十位客户，智能体推动了这些项目。【Claude原文】[C1]
- （第一轮在这里引用过 S6 搜索摘要里的同类说法；S6 原页打不开，已删除该引文。回填这件事以 [C1] 为准。）

**第六步：平台化，建"智能体控制台"，让非开发者也能配置**
- 在 SDK 上自建内部 "agent console" 来管理工作流。【Claude原文】[C1]
- 现在只有少数开发者在 SDK 层开发，更多人用 UI 配置技能（skills）和工作流。【Claude原文】[C1]
- SDK 有新能力就直接用，自己的变通代码随之删掉（structured outputs）。【Claude原文】[C1]

**第七步：横向扩展到更多流程**
- 文件校验智能体：约 1,500 份电费单，包括手持拍照件和图表数据；开启网页搜索补充信息，把学到的东西写回知识库。【Claude原文】[C1]
- 销售支持智能体：从另一框架迁到 Claude Agent SDK，服务 1 万多名销售代表，支持电话和短信。【Claude原文】[C1]
- 同一时期，公司还在用 ElevenLabs Agents 做两条呼入语音线：销售支持和客户支持。先由一个路由智能体识别来电者类型，再分给专门的智能体；需要真人时带着完整通话记录转接。原型到生产用了一周。原句："A routing agent identifies the caller type and directs them to the specialized agent best suited for the request. When a human representative is needed, calls transfer with full transcript context"；"move to production in one week"。【外部来源 S2】✅
- 两者是什么关系（ElevenLabs 负责语音层、Claude 负责后端编排？还是先后替换？），**公开资料没有说明，未找到公开信息**。线索有三条，都只是推测：Claude 原文说销售支持智能体是一条"电话或短信"呼入线 [C1]；Raya 新闻稿说 Raya 给销售伙伴提供"24/7 phone support"[S3]；播客里说 Richardson 用 Claude 做过"发短信就能查"的工具 [S8]。三者**很可能指同一条销售支持线的不同层**，但没有来源直接证实。【编剧建议】口播时不要说"Raya 就是 Claude 做的"。

**关于"谁去的现场 / 观察了谁 / 访谈了谁"**：仍然没有找到具体的跟岗或访谈记录（比如跟着哪位许可专员看了几天）。能查到的只有方法层面的说法：产品团队做 discovery，"how quickly can you talk to people? How quickly can you understand the issue well enough to then come up with a solution?"【外部来源 S8】（约 06:40–06:50，Bloom）

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

### 反转 7（第二轮新增，外部来源 S8，故事性最强的前史）："3 家做得出来，3,000 家做不完" → 搁置两年 → AI 让长尾变短，旧需求重启
- **原本做法**：许可/并网邮件，每家电力公司写一套专用规则。当年 NEM 政策推动时，只给 3 家电力公司的 3 类邮件做了，几周做完，能用。【外部来源 S8】（约 31:29–31:54）
- **遇到的问题**：业务部门马上要求覆盖剩下 3,000 家，估计要 3 年，于是放弃。"the juice is not worth the squeeze."【外部来源 S8】
- **调整后的做法**：AI 出现后，团队重新审视两年前拒掉的需求。
  > "the long tail of the flexibility or the differences of these solutions is shorter. … things we said no two years ago, we're revisiting them trying to drop our own baggage and be like, oh, that's actually solvable now."（约 32:10–32:31）
- **效果**：和 [C1] 接上：许可邮件智能体首月处理约 19,000 封，71% 全自动。（S8 本身没给数字，数字来自 C1）
- 口径提醒：说话人按上下文推断为 Bloom；"3,000"是口语里的约数，不是统计数字。

### 反转 8（第二轮新增，外部来源 S8，上线后踩的坑）：AI 上线很顺，结果把"脏数据"放大了
- **原本以为**：数据都在，AI 接上去就能用。Raya "was successful immediately because we had all the data"。【外部来源 S8】（约 22:27–22:41，按上下文推断为 Bloom 所说）
- **现场发现**：销售资源中心里有一份 2018 年起就一直挂着、没人再看过的旧文档，里面是过时的市场数据。人不会去翻它，Raya 却会立刻抓出来答给销售。
  > "hidden in some document that hasn't been looked at, but it's still for some reason live since 2018 has old market data. Unlike a human, Raya is able to grab that instantly and could serve that up. And so we went through the growing pains"（约 22:45–23:00）
- **调整后的做法**：给数据指定负责人。有人一开始说自己"kind of own it"，后来发现"this is kind of a full-time job"，公司就为数据维护配了专职的人。（约 23:04–23:17）
- **效果**：定性。"it's a responsibility of freedom now and it's more important than ever to keep the data clean"（约 22:19–22:23）
- 这是本案例目前唯一一条来自一线负责人、能核对到原音频的"上线后出问题"细节。不过它说的是 Raya（销售支持问答），不是许可邮件智能体。

### 反转 9（第二轮新增，外部来源 S8）：规则越加越多，流程反而变慢 → 用自动化和 AI 把检查项往回砍
- **原本做法**：每出一次问题，就在 Lightspeed 里加一道人工校验任务，任务数从上线时的约 100 个涨到约 300 个。（约 47:25–47:41，按上下文推断为 Bloom 所说）
- **问题**：流程臃肿、"expensive and slow"，而且砍回去"really, really difficult"，因为这已经是风险问题，不只是技术问题，要拉上 CEO 等管理层一起判断"is this still worth it?"
- **调整后的做法**：能自动化的检查交给自动化或 AI，把人工检查砍掉一大部分："now we've peeled a good amount of that back … through automation, sometimes utilizing AI to do so."（约 48:59–49:07）
- **效果**：定性，"we're seeing some of that speed come back to our timelines"，并说要"pressure test this going into the summer next year"。（公司在"来年夏天"之前就破产了，见第 7 节。）

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
| 销售支持覆盖 | —— | 1 万多名销售代表可电话/短信查询 | 【Claude原文】[C1] | 已证实是外部独立销售，不是员工：ElevenLabs 故事写"a national network of 10,000 to 20,000 independent sales representatives"[S2 ✅]；S3 称 Raya 服务"sales partners nationwide" |
| 项目摘要（早期 AI 功能） | 人工翻备注约 30 分钟 | 一键生成一段摘要 | 【外部来源 S8】✅ 播客（主持人口述，约 27:08） | 口述数字，"immediately saved 30 minutes"；这是"several years ago"的早期功能，不是 Agent SDK 的成果 |
| Lightspeed 人工校验任务数 | 上线时约 100 个 | 膨胀到约 300 个，后用自动化/AI 砍回"a good amount" | 【外部来源 S8】✅ 播客（约 47:31–49:07） | 口述约数；砍回后剩多少没说 |
| 规则写死的覆盖范围（AI 前） | 3 家电力公司、3 类邮件，几周做完 | 覆盖其余约 3,000 家估计要 3 年 → 放弃 | 【外部来源 S8】✅ 播客（约 31:33–32:03） | 口语约数 |
| （另一供应商）支持线等待时间 | 25 分钟 | 即时应答 | 【外部来源 S2b】✅ blockchain.news 2025-11-05 转载："We replaced 25-minute wait times with instant answers" | ElevenLabs 的客户故事，**不能算到 Claude 头上**；ElevenLabs 现行正文只剩"eliminates the need for callers to wait" |
| （另一供应商）单通电话成本 | —— | 下降 90% | 【S2b】✅ 转载原话"cut our cost per call by 90%"；【S2】✅ 现行页标题"cuts customer support costs by 90%"，正文改成"90% higher efficiency of support interactions" | 同上；现行正文把"成本降 90%"改成了"效率高 90%"，口径变了 |
| （另一供应商）弃呼率 | 40% | "nearly zero" | 【S2b】✅ 转载："call abandonment rates from 40% to nearly zero" | **第一轮写的"下降 98%"在所有已打开页面中都找不到，已更正**；现行 S2 正文不再给这个数字，只在 meta 描述里写"significant drop in call abandonment rates" |
| （另一供应商）人员规模 | —— | 人工坐席减少 50%（以上） | 【S2】✅ 现行页 meta 描述："reducing cost per call by 90% and human agent headcount by 50%"；【S2b】✅ 转载引述 Richardson："while reducing headcount by over 50%" | **现行 S2 正文已删掉这句**，改成"support team members have been reassigned to roles that require human expertise"。敏感信息，见第 7 节 |
| （另一供应商）月自动解决来电 | —— | "tens of thousands of calls each month" | 【S2】✅ | 同上 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **先造考场，再选框架**：把现场最难的障碍（弹窗、iframe、shadow DOM、多步表单）复刻成模拟环境，固定题目、固定轮数、录屏核验，所有候选方案同卷作答。依据：[C1] 基准测试描述。
2. **从"最难"的点切入，而不是从最简单的点**：官方说法是"hardest problem"。依据：[C1]。（第一轮并列引用的"messiest problem"出处打不开，已删除。）
3. **上线后第一件事是回填历史数据**：只处理增量数据，永远发现不了存量问题；回填才暴露出平均 3 周的隐形积压。依据：[C1]。
4. **人机分工按"可全自动的比例"来设计，而不是追求 100%**：71% 全自动，其余转人工，但人工量也要减下来。依据：[C1]。
5. **一个框架统一多个流程，再用控制台把配置权下放**：少数开发者维护底座，业务侧通过 UI 配置技能和工作流。依据：[C1]。
6. **让智能体暴露规则缺陷，并把学到的东西沉淀进知识库**：文件校验智能体发现规则漏洞，开启网页搜索补齐，再写入知识库。依据：[C1]。
7. **瓶颈会从"模型能力"转到"工具覆盖面"**：后期的投入重点是给智能体接更多工具、开放更多工作流。依据：[C1]。
8. **把"曾经说不"的需求清单翻出来重估**：AI 之前因为长尾太长而放弃的需求（3 家能做、3,000 家做不完），正是 AI 最适合的切入点。依据：[S8] 约 31:14–32:31。
9. **AI 上线前先定"数据归谁管"**：AI 会把没人看的旧文档一秒翻出来答给用户，所以数据维护要有专人，甚至是全职岗位。依据：[S8] 约 22:19–23:17。
10. **规则数据库是护城河，AI 只是加速器**：多年手工维护的 AHJ、电力公司、金融公司要求库，才是智能体能做判断的前提。Bloom 的原话是"we're primed for AI. Now we just gotta go, we have all the data."（约 15:25–15:30）；另一段说"it's not magical … you need the foundation"（约 37:48–37:53）。依据：[S8]。
11. **用"异常才上人工"替代"每单都过一遍检查"**：Lightspeed 的人工检查从 100 个任务涨到 300 个，再借助自动化往回砍，关键在按项目实际情况判断需要哪些检查。依据：[S8] 约 47:25–50:13（主持人还拿"骨折只要拍 X 光，护士却先量血压"打了个比方）。

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
| "美国最大户用光伏安装商？" | **有争议，要改口径**。按装机量（kW），它是 Solar Power World 2024 和 2025 两年《Top Solar Contractors》榜单的住宅类第一 [S3][S11]；但按 Wood Mackenzie 的市场份额，2025 年它是第二大（6.1%，Sunrun 12.7% 第一）[S10][S12]。建议口播说"美国头部户用光伏安装商之一" | [C1]；[S3][S10][S11][S12] ✅ |
| "1 万名销售都是员工？" | 不是。ElevenLabs 故事写明"a national network of 10,000 to 20,000 independent sales representatives"，是外部独立销售 | [C1]；[S2] ✅ |
| "AI 导致裁员？" | ElevenLabs 故事最初版（2025-11-05 的转载）里，Richardson 被引述称"while reducing headcount by over 50%"[S2b ✅]；ElevenLabs 现行页的 meta 描述仍写"human agent headcount by 50%"，但**正文已改写**为"support team members have been reassigned to roles that require human expertise"[S2 ✅]。这是语音支持线，供应商是 ElevenLabs，不是 Claude。另外，2025-06 Raya 发布时，Solar Power World 文章下就有读者留言"Is this why they are laying off people?"[S5 ✅，读者言论]。**评论区高风险点**，建议不在 Claude 案例里提；如果被问到，就如实说"那是另一家供应商的语音客服线，且对方已修改表述" | [S2][S2b][S5] ✅ |
| "安装周期到底快了多少天？" | 原文没有给数字，只有定性表述；播客 [S8] 同样只有定性说法（"we're seeing some of that speed come back to our timelines"） | 【Claude原文】[C1]；[S8] |
| **"这家公司后来倒闭了吧？"（最大风险）** | **是。** 时间线：①2025-08 公司对外称员工"more than 3,000"；②2026 年初其政策总监对路透社表示已退出 10 个州的市场，裁员约 20% [S10，pv magazine 转述路透社]；③2026-01-30 Claude 故事发布（C1 至 2026-09-24 仍在线）；④2026-04-03 得州总检察长 Ken Paxton 宣布整治光伏"欺诈与误导性销售"，点名 Freedom Forever [S10][S12]；⑤**2026-04-15 在特拉华州申请 Chapter 11**，负债 5 亿–10 亿美元，资产 1 亿–5 亿美元，最大债权人是 Mosaic（约 1.1–1.2 亿美元）[S10][S11]；同日约 1,600 名员工被停职，后被解雇，欠薪没有到账时间 [S12]；⑥出售资产和寻找重组投资人这两条路都失败了（Bloomberg Law 标题称是"Insider Sale Effort Collapse"，正文要付费，本轮没核对细节），**2026-08-07 转为 Chapter 7 清算**，前员工以 WARN 法案（大规模裁员须提前 60 天书面通知）提起两起集体诉讼 [S13]。原句："Freedom Forever's bankruptcy case was officially converted from a Chapter 11 reorganization to a Chapter 7 liquidation on Aug. 7, 2026."[S13] | [S10][S11][S12][S13] ✅ |
| 破产原因和 AI 有关吗？ | 没有任何已打开的来源把破产归因于 AI 项目。行业媒体给的原因是：经销商模式和第三方所有权（TPO）模式的结构性问题、联邦户用税收抵免（25D）在 2025 年底到期、政策变化和利率上升、背负债务只能靠增长维持、销售端的欺诈投诉等 [S11][S12]。Latitude 引用 Wood Mackenzie 分析师的话："They utilized third-party sales organizations instead of in-house teams … This has led to a lot of issues… with high sales commissions, deceptive sales practices, just reduced operational control."[S12]。【编剧建议】可以这样说："智能体能把许可流程提速，但救不了商业模式。"这是观点，不是来源结论 | [S11][S12] ✅ |
| 负面报道 / 诉讼 / 客诉 | 除上面的破产、得州总检察长调查、WARN 集体诉讼外：Latitude 提到 2024-05 CBS News 调查发现，有房主称自己被签了从没同意过的光伏贷款、文件上的签名不是本人签的 [S12，转述，CBS 原报道本轮没有打开]。清算后，融资方（Sunrun、GoodLeap、EverBright 等）获法院准许，可以另找承包商接手烂尾项目 [S13]。 | [S12][S13] ✅ |
| "Claude 故事里说'安装周期史上最快'，结果 2.5 个月后破产？" | 两件事并不矛盾（运营效率 ≠ 财务可持续），但放在一起必然被质疑。【编剧建议】如果用这个案例，建议片尾主动交代破产，并把主题定为"方法论可以借鉴，商业模式另当别论"；否则建议换 AES 案例 | [C1][S10] |
| 故事日期 | claude.com CMS 数据显示为 2026-01-30；页面本身不显示日期 | [C1] |

---

## 8. 【编剧建议】钩子与叙事素材

> 本节全部是创作建议；括号里标注所依据的事实来源。

- **钩子 1（隐形积压）**："一封电力公司的邮件，在收件箱里躺了三个礼拜。没人看见，客户在家干等，屋顶上的板子一块都装不了。"（依据 [C1]：平均 3 周、几十位客户）
- **钩子 2（考场反转）**："别人选 AI 看 demo。他们自己搭了 8 个假网站，专门放弹窗、嵌套页、隐藏元素，让每个框架考 40 场。别的框架及格率 20% 到 60%，这一家 40 场过了 39 场，挂掉的那场还是因为同时开太多被限流。"（依据 [C1]）
- **钩子 3（成本对比）**："一次两分钟，一次两三块人民币。"（依据 [C1]：0.20–0.35 美元、约 2 分钟；人民币按约 7.1–7.2 汇率粗算 ≈ 1.4–2.5 元，**口播前按当时汇率复核**）
- **反转桥段**："他们本来以为，AI 的活儿是接住每天新来的邮件。结果让 AI 把旧邮件翻一遍，才发现真正的问题早就压在那里，只是没人知道。"（依据 [C1] backfill 段落）
- **升华句**："做到最后，瓶颈不是 AI 够不够聪明，而是你给它接了几条路。"（依据 [C1] Richardson 关于限制在"building more tools"的原话）
- **"接力棒"类比（第二轮新增）**：Bloom 把外部门户有更新、再回填到自家系统这件事叫"the baton toss"（接力棒交接），"If you do that fast, you're fast. If you do that slow, you're slow."（依据 [S8] 约 39:24–39:29）适合用来解释中国语境下"政务网站 / 电网营业厅 / 客户 SRM 门户状态变了，没人及时同步"的痛点。
- **中国化类比**：美国光伏的"几百家电力公司 + 几百个辖区网站"≈ 国内分布式光伏的"并网申请 + 各地电网营业厅/网上国网 + 住建/消防等多头口径"；制造业可以类比"几十家客户的供应商门户（SRM）各有各的填报网站 + 邮件催单"。（类比属于编剧推演，没有来源；国内流程细节需另行核实）
- **FDE 视角改写**（注意：原案例是客户自建，不是外部 FDE，口播时不能说"FDE 进场做了 X"）："如果是我们去做，第一周不写智能体，先干两件事：复刻最难的页面做考场，把历史邮件全量回填一遍。"
- **可用人物**：Rob Richardson，VP of Product（[C1] 有多段原话，可以直接打字幕）；CTO Zachary（Zach）Bloom（职务已由 [S3][S4][S5] 核实，可以上屏；他在 [S8] 里的话是机器转写，打字幕前要人工听音核对）。两人现在的去向（公司清算后）未核实，**上屏时建议加上"时任"**。
- **钩子 4（第二轮新增，前史反转）**："三家电力公司，写死规则，两周搞定。老板说：好，剩下三千家也这么干。工程师算了算：三年。于是这事搁了两年，直到 AI 来了。"（依据 [S8] 约 31:14–32:31；"两周"原话是"a couple weeks"，"两年"原话是"things we said no two years ago"）
- **钩子 5（第二轮新增，踩坑桥段）**："AI 上线第一天就很好用，好用到把一份 2018 年就没人看过的旧文档翻了出来，一本正经地回答给销售。那一刻他们才明白：数据得有人管。"（依据 [S8] 约 22:27–23:17）
- **结尾的诚实交代（第二轮新增，强烈建议）**："这家公司后来怎么样了？2026 年 4 月，它申请了破产。智能体把许可流程提速了，但救不了它的商业模式。我们学的是方法，不是结局。"（依据 [S10][S13]；后半句是观点）

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| C1 | Freedom Forever automates permit workflows with Claude | https://claude.com/customers/freedom-forever | Claude原文 | 2026-01-30（claude.com CMS `date` 字段） | ✅ 已打开，关键原句逐字检索确认（2026-09-24） |
| S1 | Noah Zweben 的 LinkedIn 帖子（页面 AI 生成标题：Claude Agent SDK Boosts Solar Permitting Efficiency） | https://www.linkedin.com/posts/noahzweben_customer-story-freedom-forever-claude-activity-7445962929247760384-uXsc | 社交媒体帖子 | 2026-04-03（页面 JSON-LD `datePublished`） | ✅ 已打开（2026-09-24）。内容只是转引 C1 的原句"Claude Agent SDK scored 97.5% on our benchmark—we couldn't break it...Other frameworks hit 20–60% at higher cost."，**没有新增事实**；作者的任职单位本轮没有核实 |
| S2 | ElevenLabs — Freedom Forever cuts customer support costs by 90% using ElevenLabs Agents（正文标题：Freedom Forever scales support nationwide with ElevenLabs Agents） | https://elevenlabs.io/blog/freedom-forever | 其他供应商客户故事 | 2025-12-18（页面标注 "Published Dec 18, 2025"） | ✅ 已打开。**第一轮链接（…-cuts-cost-per-support-call-by-90percent-…）现在返回 404，已更正为 sitemap 里的现行 URL。** 现行正文已改写，没有"headcount −50%""25 分钟""弃呼率"等句子，只剩 meta 描述里还有"human agent headcount by 50%"；Wayback 查不到旧版快照 |
| S2b | Freedom Forever Slashes Support Costs with ElevenLabs Agents by 90%（blockchain.news，Rebeca Moen） | https://blockchain.news/news/freedom-forever-slashes-support-costs-elevenlabs-agents | 媒体转载（转述 ElevenLabs 最初版本） | 2025-11-05 | ✅ 已打开。保留了 Richardson 的原话"We replaced 25-minute wait times with instant answers and cut our cost per call by 90%, while reducing headcount by over 50%." |
| S3 | Freedom Forever Launches Raya: AI-Powered Tool Supercharged by LIGHTSPEED（PR Newswire） | https://www.prnewswire.com/news-releases/freedom-forever-launches-raya-ai-powered-tool-supercharged-by-lightspeed-302489884.html | 客户方新闻稿 | 2025-06-24 | ✅ 已打开，Bloom（CTO）和 Richardson 的引语逐字核对无误。同一篇稿里既写"more than 30 states"又写"Operating in 29 states" |
| S4 | Freedom Forever debuts in-house AI to improve operations and support（Solar Builder，SB Staff） | https://solarbuildermag.com/news/freedom-forever-debuts-in-house-ai-to-improve-operations-and-support/ | 行业媒体 | 2025-06-25 | ✅ 已打开，内容是新闻稿的改写，没有新增事实 |
| S5 | Freedom Forever debuts AI solar customer management tool（Solar Power World，Billy Ludt） | https://www.solarpowerworldonline.com/2025/06/freedom-forever-debuts-ai-solar-customer-management-tool/ | 行业媒体 | 2025-06-24 | ✅ 已打开，内容是新闻稿的改写；文章下有读者留言"Is this why they are laying off people?"（读者言论） |
| S6 | Rob Richardson - Freedom Forever（LinkedIn 个人页） | https://www.linkedin.com/in/rob-richardson-io/ | 社交媒体 | —— | ❌ 无法访问：curl 返回 LinkedIn 999（反爬），WebFetch 被出口代理拦截（EGRESS_BLOCKED），Wayback 无快照。据此引用的"messiest problem"一句已从正文删除 |
| S7 | Relationship between Freedom Forever your AHJ, and utility company（公司博客） | https://freedomforever.com/blog/freedom-forever-ahj-utility-company/ | 公司博客 | 2020-12-18 | ✅ 已打开，AHJ 的定义已逐字核对 |
| S8 | How Zach Bloom & Rob Richardson are Shaping Solar's Future（公司自家播客《Solar Disruption Theory》，主持人 Chad Towner，61:28） | https://creators.spotify.com/pod/profile/solar-disruption-theory/episodes/How-Zach-Bloom--Rob-Richardson-are-Shaping-Solars-Future-e3d2nlk ；RSS：https://anchor.fm/s/c388a270/podcast/rss ；YouTube：https://www.youtube.com/watch?v=oORKvVEq37E | 客户方播客（负责人访谈） | 2026-01-02（RSS pubDate；节目中称录制于"end of 2025"） | ✅ 节目页和简介已打开核对；音频已下载，本轮用 Whisper 机器转写（base.en 全程 + small.en 复核关键段落）。**引文为机器转写，无说话人标注，上屏前需人工听音核对** |
| S9 | Moving at LIGHTSPEED - Creating a CRM Software Custom-Built for Solar with Zach Bloom（同一播客） | https://podcasters.spotify.com/pod/show/solar-disruption-theory/episodes/Moving-at-LIGHTSPEED---Creating-a-CRM-Software-Custom-Built-for-Solar-with-Zach-Bloom-e1rljuk | 客户方播客 | 2022-12-02 | ✅ 仅核对了 RSS 里的节目简介（"turned over 1,200 standard operating procedures into the first CRM software custom-built for solar"），音频没有转写 |
| S10 | Residential solar company Freedom Forever files chapter 11 bankruptcy（pv magazine USA，Ben Zientara） | https://pv-magazine-usa.com/2026/04/15/residential-solar-company-freedom-forever-files-chapter-11-bankruptcy/ | 行业媒体（负面） | 2026-04-15 | ✅ 已打开 |
| S11 | Residential solar installer Freedom Forever files bankruptcy（Solar Power World，Kelly Pickerel） | https://www.solarpowerworldonline.com/2026/04/residential-solar-installer-freedom-forever-files-bankruptcy/ | 行业媒体（负面） | 2026-04-15 | ✅ 已打开 |
| S12 | Why did residential solar installer Freedom Forever go under?（Latitude Media，Bianca Giacobone） | https://www.latitudemedia.com/news/what-freedom-forevers-bankruptcy-says-about-residential-solar-today/ | 媒体深度报道（负面） | 2026-06-01 | ✅ 已打开 |
| S13 | Freedom Forever bankruptcy converted to Chapter 7 liquidation, key dates set（pv magazine USA，Ben Zientara） | https://pv-magazine-usa.com/2026/09/09/freedom-forever-bankruptcy-converted-to-chapter-7-liquidation-key-dates-set/ | 行业媒体（负面） | 2026-09-09 | ✅ 已打开 |
| S14 | 光伏热点新闻（2026年4月20日）（搜狐转载，来源：中国光伏行业协会 CPIA DAILY NEWS） | https://www.sohu.com/a/1012088845_122014422 | 中文媒体 | 2026-04-20 | ✅ 已打开。唯一找到的中文报道，只有一句："美国户用太阳能安装商Freedom Forever在面临一系列广泛的诉讼指控的情况下，已申请第11章破产保护"。**未找到任何中文媒体报道 Freedom Forever × Claude** |

---

## 附录：候选 B — AES（未选为主案例）

**未选原因**：数字最硬（有 Google Cloud 独立案例页佐证，已打开核实），但公开资料**完全没有失败、转向、踩坑的信息**，达不到"清晰反转"这条要求。它的优势是贴近用户优先的"制造/工业"语境（EHS 安全审计），可以作为备选或单独的一期短视频。

- 【Claude原文】[A1] 每年约 1,550 次内部安全审计，多由"本职不是审计"的员工执行，每次最长两周；三层智能体：文档处理 → 任务拆解 → 报告生成；结果：审计结果生成快 96%、准确率 +10–20%、成本 −99%。风机类比："一台 1.5MW 风机，要 75 台才抵得上一台 GW 级机组"（Sean Otto，数据科学与分析高级总监）。原句："Audit reports that took two weeks to complete can now be generated in about an hour." —— https://claude.com/customers/aes （2024-11-21，已打开核实）
- 【外部来源 A2】Google Cloud 案例页补充了**过程信息**：每次审计约 100 个员工工时；要求"至少比人快 100 倍"，而且不需要持续盯着；**两个月**让智能体上线（含构建知识库和微调智能体）；完成 50 多次智能体审计后，成本 −99%、快 99.7%；文档审阅阶段一次最多 400 页，涉及多语言；**人在回路**：智能体承担一半工作量，另一半仍由人审查，审计产能因此翻倍。原句："We can double the number of audits conducted, as our gen AI agents handle half of the workload." / "The other half, which involves a 'human in the loop' examining the process, remains in place." —— https://cloud.google.com/customers/aes （已打开核实；页面没有日期，产品名已更新为 Gemini Enterprise Agent Platform）
- 【外部来源 A2】"谁来落地"：由 AES 内部数据科学团队（Dr. Sean Otto、Dr. Marwan Sherri）牵头，Google Cloud 团队支持。原句："Otto is full of praise for the Google Cloud team that supported the AI-agent project." 没有 Anthropic 或外部 FDE 驻场的公开证据。
- 【外部来源 A3】Google Cloud 博客《Real-world gen AI use cases…》把 AES 列入清单，写法是"14 days to one hour"、成本 −99%、准确率 +10–20%（当时还写作 Vertex AI）—— https://cloud.google.com/transform/101-real-world-generative-ai-use-cases-from-industry-leaders （已打开，页面标注 last updated 2026-04-22）；Google Cloud 能源行业解决方案页也引用了该案例 —— https://cloud.google.com/solutions/energy （已打开）
- **数字口径冲突（必须写进防御稿）**：提速在 Claude 原文里有两个版本，标题是"96% faster"，正文是"99% reduction in audit time"；Google Cloud 写的是"99.7% faster"。审计量：Claude 写"about 1,550"，Google Cloud 写"more than 1,500"。准确率：Claude 写"10–20%"，Google Cloud 结果栏写"up to 20%"。"14 天→1 小时"是日历时间，"100 员工工时"是人力投入，两者口径不同，不能混用。[A1][A2]
- 【外部来源 A4】✅ AES 官网 Sean Otto 页（https://www.aes.com/sean-otto 会跳转到 https://www.aes.com/about-us/our-people/our-leadership/sean-otto ，2026-09-24 打开，页面无日期）：头衔写的是"**Director of Analytics**"。原句："Sean Otto is a Director of Analytics at AES, a seasoned Utility Analytics Consultant in AI and ML with over 15 years of experience of helping companies maximize the value of their data." **口径冲突**：Claude 原文 [A1] 和 Google Cloud [A2] 都写"Senior Director of Data Science (&) Analytics"。AES 官网这页很可能没随他升职更新。
- 【外部来源 A5】✅ H2O.ai 视频页（https://h2o.ai/resources/video/doing-ml-at-a-leading-renewable-energy-company-by-sean-otto/ ，内嵌 YouTube L8ihTNXlZ9w，页面无日期，带全文文字稿）：演讲者标注为"Director of Analytics, AES"，讲 AES 的 AI/ML 理念、变革管理和数据民主化，时间早于生成式 AI 审计项目，**和安全审计智能体无关**。其中关于变革管理的一句可以用来补 AES 的"人"这一面："Change manage about getting people in on the front end. So they're with you on the back end, right? And that's the core of change management."另一句："There has to be full trust on data and process. And that also means that you have to be fully transparent in everything."
- 【外部来源 A6】❌ LinkedIn https://www.linkedin.com/in/seanottophd ：curl 返回 999，WebFetch 被出口代理拦截，Wayback 无快照。本轮 WebSearch 的结果标题仍显示"Sean Otto, Phd - AI Workforce Transformation / AI Advisory …"，但原页打不开，**他现在的头衔和是否仍在 AES 都无法核实**。做选题联系或上屏头衔前，建议用"时任 AES 数据科学与分析高级总监"（以 A1、A2 为准）。
- 【外部来源 A7】✅ AES 官网文章《Purpose-driven AI at AES》（Alejandro Reyes，2026-09-22，https://www.aes.com/energy-insights/purpose-driven-ai-aes ）：介绍 AES 的 9 条负责任 AI 原则，列举的实例有 Haven Safety AI（AES 与 AI Fund 联合创办的公司开发的事故调查平台）、Farseer、GridSim、Maximo 机器人，**没有提到安全审计智能体、Claude 或 Anthropic**。和审计案例的人机分工口径一致的一句："embedding AI where it creates the most value: augmenting human expertise, improving decisions, and transforming how work gets done without removing people from the lead."
- **AES 关于 AI 安全审计的新闻稿**：本轮检索了 aes.com 的 sitemap（505 个 URL，按 ai / audit / safety / anthropic / google / agent 过滤）和一次 WebSearch，**没有找到 AES 自己发布的关于安全审计智能体的新闻稿**。唯一的 AES × Google 合作文章《Three ways AES and Google are innovating the energy industry of the future》讲的是 24/7 无碳能源、电网虚拟化和数字能源平台，和审计无关。目前公开来源只有 [A1][A2][A3] 三个供应商页面。
