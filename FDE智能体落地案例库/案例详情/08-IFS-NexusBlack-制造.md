# 案例：IFS Nexus Black — 驻场工程师在苏格兰威士忌酒厂落地"会看、会听、能说话"的维修智能体 Resolve，把"救火式维修"变成预测性维护

> **核实状态总说明（第二轮，2026-09-24 更新，请先读）**
> - 【Claude原文】S0 本轮再次用 curl 打开 https://claude.com/customers/ifs，关键英文句（38%、£8.4m、gloves 等）仍在页面上，逐字一致。
> - 【外部来源】本轮网络放开后，第一轮的 S1–S26 **逐个打开了原页**，另新增 S27–S32 共 6 个来源（均已打开核对）。结果：
>   - **✅ 已打开原页核对：31 个**（S1–S11、S13–S32。其中 S10 Computer Weekly、S20 Techzine 直连被 Cloudflare/403 拦截，改用 r.jina.ai 阅读代理拿到原页全文，核对通过；S25 X 帖子需登录，改用 api.fxtwitter.com 拿到原帖全文；S22/S23 两个 YouTube 视频只核对了**标题、频道、发布日期和视频简介**）。
>   - **❌ 无法访问：1 个**（S12 Supply Chain Digital：直连是 Cloudflare 验证页，阅读代理只抓到广告追踪像素，web.archive.org 连接反复被重置，WebFetch 被出网代理拦截）。S12 支撑的数字（£8.4m ≈ US$11.1m）已改由 S11 支撑。
>   - **❌ 部分无法获取：S22 视频字幕**（YouTube 对本环境返回 "Sign in to confirm you're not a bot"，播放器接口和字幕接口都拿不到，第三方字幕站被 Cloudflare 拦截），所以**视频里说了什么仍未核实**，下文只引用它的标题和简介。
> - **第一轮摘要有误、本轮已更正的地方**见第 7 节 D 小节（共 9 处，包括 Anthropic 发言人名字、40% 的出处、70% 数据不存在、监督智能体说法张冠李戴、88%/29% 出处等）。
> - 【编剧建议】只出现在第 8 节和标了【编剧建议】的地方。

- **行业**：工业软件厂商（Claude 页面标签是 "Industry: Software"）→ 落地客户属于制造（酒类蒸馏、休闲食品）、公用事业（电力/燃气）、能源、航空航天与国防、现场服务
- **企业规模 / 地区**：Claude 页面标注 "Company size: Large / Location: Europe"【Claude原文 S0】。IFS 是一家有四十年行业经验的全球软件公司（"a global software company with four decades of experience"）【Claude原文 S0】。2025 财年前三季度 ARR 同比增长 22%（"Annual Recurring Revenue (ARR): +22% YoY"）【外部来源 S3 ✅】。IFS 自称 "over 7,000 employees in 80 countries"【S5 ✅】。落地客户 William Grant & Sons 的这次项目在苏格兰西海岸的 Girvan 厂区【S7 ✅ "William Grant & Sons' site in Girvan on the west coast of Scotland"；S0 只写 "Scotland's west coast"】
- **Claude 产品标签**：Claude Platform（正文还提到 MCP、Skills、Agent SDK、多模态）【Claude原文 S0】
- **Claude 故事发布日期**：页面**没有显示日期**（本轮再查 HTML，仍无 datePublished）。故事内容与 2025-11-13 IFS 在纽约 Industrial X Unleashed 大会上发布的合作新闻稿高度一致【S4 ✅ "Industrial X Unleashed, New York, NY, November 13, 2025"】，推测在那之后发布，**未核实**
- **Claude 原文链接**：https://claude.com/customers/ifs
- **落地主体（谁是"FDE"）**：**IFS Nexus Black**，也就是软件厂商 IFS 内部单独设立的"前置部署工程师"团队（供应商自己的 FDE 团队），Anthropic 作为模型方和合作伙伴（Anthropic Applied AI Lead **Garvan Doyle** 在发布会上站台，第一轮误写为 "Garvin"，已更正【S4 ✅】）。证据如下（本轮全部打开原页核对）：
  - IFS 官方财报新闻稿："Nexus Black, IFS's AI innovation accelerator, is already delivering breakthrough AI products and measurable customer results within weeks. Forward-deployed engineers turn customer challenges into AI solutions."【S3 ✅】
  - Constellation Research："IFS Nexus Black, a team of forward deployed engineers, has partnered with Anthropic and used its Claude models to launch Resolve"【S9 ✅】
  - Computer Weekly：William Grant & Sons "worked with IFS Nexus Black and Anthropic to forward-deploy a field-worker productivity service"【S10 ✅】
  - diginomica：Nexus Black "isn't a traditional consulting function, she hastens to point out, more of a Forward Deployed Engineer (FDE) service that pioneers products for IFS"【S18 ✅，本轮新发现，是**最直接的"FDE"定性**】
  - Futurum："IFS Nexus Black, the company's specialized AI engineering team focused on solving high-friction industrial problems through forward-deployed engineering"【S21 ✅】
  - ABI Research：Nexus Black 是 "a separate unit staffed with product managers, AI engineers, solution architects, and User Experience (UX) specialists"【S19 ✅】
  - IFS 发布 Nexus Black 的新闻稿："a dedicated delivery team"、四阶段模型、共同投资（co-investment）模式【S1 ✅】
- **本案例推荐指数：4.5 / 5**（第一轮 4 分，本轮上调 0.5）
  - 数字充分度（高）：38%（另有 "Nearly 40%" 说法）救火式维修、预计年省 £840 万（单一厂区）、故障解决提速 25%、冗余库存减少 20%、恢复供电快 40%（IFS 口径）。
  - 过程/反转素材（高，比第一轮更足）："聊天框→戴手套没法打字→改成语音"这条因果链**已在原页逐字核实**；新发现客户 CTO 原话"我们非常想避开 PoC 陷阱，一上来就做规模化"；CEO 说"几天内部署、让客户开始测试、不交给第三方"；CEO 说"别太纠结那四个阶段"；另有第二个具名客户 KLN Family Brands 的**完整转向故事**（先做报价引擎 → 客户发现产能过剩 → 转做预测与排产 → 变成产品 Flow）。
  - 可迁移性（高）：老工厂、老设备、老师傅退休、数据散在各个系统里，这些也是中国制造业和电网的通病。
  - 上调理由：外部来源从"全是摘要"变成 31 个已核实，关键反转有了原句；新增了评测方法（评测集 + ROI）和第二个具名客户。
  - 仍扣 0.5 分：William Grant 项目**具体做了几周、驻场几个人**仍未公开；25%、20% 两个数字在外部仍找不到对应客户和口径；过程细节几乎都出自厂商自述（S7/S27 是 IFS 付费发布的赞助内容）。

---

## 1. Claude 原文要点（事实 + 数字）

以下全部是【Claude原文 S0】，英文已在线上页面逐字核对。

1. **两个头条数字**
   - "25% faster fault resolution — Engineers fix problems faster with AI-powered diagnostics that work in the field"
   - "20% reduction in excess inventory — Utilities cut unnecessary stock through predictive maintenance and smart sourcing"
   - 页面 meta 描述："IFS resolves equipment faults 25% faster."
2. **产品定位**："Their flagship product, Resolve, is an AI assistant built on Claude that works alongside engineers on transmission poles, in engine rooms, and out in the field—spotting what humans might miss by analyzing equipment images, correlating sensor readings, and catching problems before they become failures."
3. **行业环境约束（故事里的"痛点三连"）**："Engineers can't type into a chatbot when they're wearing gloves. Offshore wind farms need systems that work without signal. Manufacturing plants require solutions that speak the language of their 40-year-old machinery."
4. **出错的代价**："one mistake prolongs a power outage, shuts down a production line, or costs millions in wasted inventory. Results need to happen fast."
5. **团队构成**："IFS Nexus Black brings together AI specialists and the industrial knowledge of IFS…"
6. **技术要点**
   - 多模态："analyze thousands of equipment images, correlate sensor readings, and connect patterns across visual inspections and operational data"
   - MCP 打通老系统："facilitates easier connections between systems—including legacy infrastructure that has traditionally been challenging to integrate"
   - Skills 管上下文："helps IFS manage the complex context that comes with decades of industrial data—ensuring engineers get relevant, accurate information without drowning in documentation"
   - Agent SDK 串联流程："coordinate across multiple field service workflows, from initial diagnostics to parts ordering and final verification"
7. **William Grant & Sons（威士忌/金酒蒸馏商）**
   - 背景："had just completed a major expansion at their facility on Scotland's west coast"
   - 痛点："Fragmented data meant technicians had to react to problems instead of preventing them. **38% of repairs were reactive**, leading to costly downtime."
   - 做法："reads complex plant schematics like a trained engineer and connects to existing sensors to catch problems early. During repairs, it diagnoses faults in real time"
   - 结果："The distillery has slashed downtime and boosted output, and the team **estimates** that these changes will save them **£8.4 million a year at this one site alone—once they are in business-as-usual mode**."
   - 客户原话（Badri Narasimhan，Chief Technology & Business Growth Officer）："IFS Nexus Black understood our industry—they weren't trying to apply something generic… It's been innovation that's practical, fast, and connected to results, not theory."
8. **公用事业/抗灾场景**："Resolve is assessing when storms could intensify and identifying which areas face the highest risk of disruption. Utility technicians are then directed to the highest-priority sites, and teams across different utilities are coordinated… advising on repairs based on image or video capture and automatically redirecting essential parts."（原文这一段**没有给数字**）
9. **负责人原话（Kriti Sharma，CEO of IFS Nexus Black）**
   - "If you don't build AI safety-first in our world, lives are put at risk."
   - "Industries like these may not make headlines… But there's a quiet transformation happening here—supporting the workers who keep the lights on, the shelves stocked, and the world turning."
10. **定位**："Resolve represents the first major product from IFS Nexus Black's work with Anthropic"

---

## 2. 背景与痛点（结构化）

| # | 痛点 | 来源 & 原句 |
|---|---|---|
| 2.1 | 一线工人戴着手套，**没法在聊天框里打字** | 【Claude原文 S0】"Engineers can't type into a chatbot when they're wearing gloves."；【S16 ✅，Kriti 播客原话】"If the tool doesn't work, when their gloves are on, they're not going to use it. They're not going to take their gloves off every few seconds." |
| 2.2 | 现场**没有信号** | 【Claude原文 S0】"Offshore wind farms need systems that work without signal."；【S16 ✅】"Or if it's down in the basement of a damp utility room and you don't have Wi-Fi, it's going to not use it."；产品页声称支持离线：【S6 ✅】"Resolve listens, works without a signal"、"Cloud, on-premise, and offline support"（**厂商产品主张**，具体怎么实现未公开，见第 7 节） |
| 2.3 | 工厂设备用了 40 年，老系统难接 | 【Claude原文 S0】"…speak the language of their 40-year-old machinery"；"legacy infrastructure that has traditionally been challenging to integrate" |
| 2.4 | 酒厂**扩建完反而没达到预期效率**：设施老化、数据分散，造成产量和批次损失 | 【S8 ✅，FMCG CEO】"Following a significant expansion, however, the company discovered operations were not as efficient as hoped. At the heart of the issue, a combination of ageing infrastructure and fragmented data meant technicians were reacting to problems rather than preventing them, resulting in significant production and batch loss." / 【Claude原文 S0】"had just completed a major expansion" |
| 2.5 | **38%（或"将近 40%"）的维修是紧急/纠正性维修**，经常导致停机 | 【Claude原文 S0】"38% of repairs were reactive"；【S8 ✅】Kriti Sharma："What really happened on the ground was that when we went and did our assessment, we found 38 percent of maintenance work was emergency or corrective repairs, things that shut down, and the team had to go to replanning and run around to try and fix it."；【S4 ✅】"38% of repairs carried out by engineers were emergency, not proactive"；【S7 ✅】"Nearly 40% of repairs were for emergencies, not proactive maintenance." |
| 2.6 | 故障**要等报警响了才被发现** | 【S7 ✅，Manufacturing Dive 赞助文】"Faults were caught only after the alarm sounded, meaning more downtime and stifled output."；【S8 ✅】Kriti："Faults were only being caught after alarms were set off, causing serious disruptions. It's a very emotional time for colleagues… We saw the pain first hand." |
| 2.7 | 老技师退休，经验跟着流失 | 【S15 ✅，Emerj（IFS 赞助文）】主题之一："Preserving institutional knowledge as senior technicians retire at record rates"；【S17 ✅】Kriti："Experienced operators who can diagnose an issue just by listening to a machine are retiring, and newer teams don't yet have that intuitive knowledge."；【S6 ✅】产品主张 "gives an engineer with two years on the job the expertise of one with twenty" |
| 2.8 | 行业普遍陷在 **"试点炼狱"**（pilot purgatory） | 【S16 ✅，Tech Talks Daily 节目简介（主持人撰写）】"tackling 'pilot purgatory,' where companies experiment with AI but struggle to deploy it at scale"；【S15 ✅】"many industrial teams have lost patience with long AI programs that never make it to production"；【S19 ✅ ABI】"Innovations must scale quickly and not be trapped in pilot purgatory." |
| 2.9 | 工业企业**怕自己的数据被拿去训练、最后便宜了竞争对手** | 【S19 ✅，ABI Research】"I&M firms often are cautious regarding AI due to the fact they don't want their data to inform Large Language Models (LLMs) that will be used by competitors." |
| 2.10 | 过去 AI/数字化项目失败留下的阴影 | 【S17 ✅】Kriti："What we see more often is the shadow of past failures. Teams have tried AI or digital programs before that didn't work, so there's hesitation."（第一轮此行写的是"全球约 70% 的劳动力不坐办公室"，出处写作 S13；本轮打开 S13 全文**没有这句话**，已删除，见第 7 节 D） |
| 2.11 | 电网等场景：极端天气增多、熟练工短缺、基础设施老化 | 【S5 ✅，IFS Resolve for Utilities 新闻稿】"skilled workforce shortages, extreme weather events increasing in frequency and severity, aging infrastructure requiring urgent modernization, and communities expecting faster restoration times" |

---

## 3. 落地过程（FDE 怎么做的）

> 注意：William Grant & Sons 这一个项目的**具体周期和驻场人数仍然没有公开**。下面把 IFS 公开的通用方法论（S1/S3/S15/S17/S18/S26）和酒厂项目细节（S0/S7/S8/S11/S16）拼起来，每一步都标了来源。本轮所有引文均已打开原页逐字核对。

**第 0 步：组织形态，厂商内部单独设一支 FDE 部队（2025-04 成立）**
- IFS 于 2025-04-23 在伯明翰 IFS Connect 大会上发布 Nexus Black，定位是 "a strategic innovation program to expedite high-impact AI adoption for industrial organizations"【S1 ✅】。
- 编制："a dedicated delivery team"；"Access to dedicated AI engineers, domain experts, and solution architects, with deep expertise in industrial contexts and enterprise architecture"【S1 ✅】。ABI 的说法是，这个独立单元里还有产品经理和 UX 专家【S19 ✅】。
- IFS CEO Mark Moffat 在发布会上的说法："We will send you data engineers and scientists and UX designers who – within days – will create an application you can deploy. The mantra is prototypes – not PowerPoint."【S26 ✅，Aerospace Testing International，2025-04-23】
- 商业模式：**共同投资**。"Through a co-investment model, customers gain a fast-mover advantage in their industries and influence solutions that enhance their agility"；客户可以 "access capabilities ahead of general launch and directly engage in the creation process"【S1 ✅】。定价："Nexus Black engagements are bespoke, reflected in the resource-intensive, expert led nature of the program"【S1 ✅】。
- 官方的四阶段模型："Structured four phase model: Problem Definition; Proof of Value; Accelerated Development; Digital Continuity"，目标是 "turn bold ideas into tangible outcomes in a matter of weeks"【S1 ✅】。
- 2025-07-08 任命 Kriti Sharma 为 Nexus Black CEO（此前任 Thomson Reuters LegalTech 首席产品官，"previously held senior AI roles at Sage Group and GfK"）【S2 ✅】。
- **文化来源**：Kriti 把 Nexus Black 的做法和 IFS 的创业故事挂钩："In 1983, the founders of IFS pitched a tent on the site of their first customer and stayed there until the job was done. We adopted that same spirit."【S17 ✅】（IFS 官方简介也写着 "founded in 1983 by five university friends who pitched a tent outside our first customer's site"【S5 ✅】）

**第 1 步：进现场（CEO 本人也穿安全装备下车间）**
- 酒厂项目："We spent days at the team's distillery, learning processes first-hand."【S7 ✅ / S27 ✅，IFS Nexus Black 署名的赞助内容，原文是第一人称 "We"】
- 客户方评价驻场方式：Badri Narasimhan："The way the Nexus Black team has worked on the ground in terms of understanding the business need, but more importantly understanding the operating challenge – the challenge of somebody working on the ground in their boots – has been remarkable."【S8 ✅】
- 通用做法："Her approach begins by placing engineers directly in the operational environment, where the real constraints live — last-minute orders, unexpected absences, emergency repairs, and the constant reshuffling…"【S15 ✅】
- 负责人亲自下现场："for the past few months, she's been donning a hi-vis gilet, hard hat, boots and safety glasses to bring AI to vastly different industrial settings."【S18 ✅】；Kriti 自述："most days I am in an orange high-vis jacket and steel-toe boots and a hard hat on building products right next to the technicians"【S16 ✅，播客文字稿 00:03:07】
- 访谈对象："We work with engineering teams, operators, technicians – the people who live the problem every day."【S17 ✅】

**第 2 步：量化痛点（先做诊断评估）**
- "when we went and did our assessment, we found 38 percent of maintenance work was emergency or corrective repairs"【S8 ✅】。这个 38% 是**厂商驻场评估得出的基线**，不是客户早就掌握的 KPI。

**第 3 步：挑破冰点（先窄后宽，但客户要求"别做 PoC，直接上规模"）**
- "We used that knowledge to pick the best starting point for AI: something that would prove value fast, by helping the business shift to predictive maintenance."【S7 ✅】第一个场景定在**预测性维护**。
- 客户 CTO 的立场（本轮新发现）："We were very keen to avoid the whole proof of concept trap. We said, do something at scale – and that's what we've been able to do. The pace at which we've gone from idea to something real has been fantastic."【S7 ✅ / S27 ✅，Badri Narasimhan】
- 通用原则："we start with the first use case and then expand"【S17 ✅】。
- Kriti 对四阶段模型的态度："Honestly, I wouldn't get too hung up on the phases. What matters is we go on the ground and we build new products."【S17 ✅】

**第 4 步：接数据，不推翻原有系统，直接"插"进去**
- "Working alongside the William Grant & Sons team, IFS designed an AI solution model that plugged directly into the distillery's existing systems and sensors – reading detailed plant schematics and predicting which parts were likely to fail before they actually did."【S8 ✅】
- 能读 P&ID："Plug into every system and schematic in William Grant's operation – even piping & instrumentation diagrams, highly complex plans typically analyzed by top engineers."【S7 ✅】Kriti 在播客里解释为什么 P&ID 重要："So when something breaks here, it knows how it's connected to all the other things and what might be breaking somewhere… What's the root cause? It might be somewhere else because it can read how the plant is connected to each other."【S16 ✅，00:20:13–00:20:43】
- 实时 + 历史数据，赶在报警之前预警："Monitor live information from sensors alongside historic data about each asset. Flag a potential problem well before the sensor would trigger an alarm. Analyze how a specific fault will impact the entire distillery."【S7 ✅】
- 技术上用 MCP 连老系统、用 Skills 管理"几十年的工业数据上下文"【Claude原文 S0】。Kriti 称 "Resolve was developed with Anthropic using the models and some of the [Claude] SDK capabilities"【S16 ✅，自动文字稿写作 "Cloud SDK"】；Techzine："Resolve was actually built collaboratively by teams from both IFS and Anthropic"【S20 ✅】。

**第 5 步：设计人机协作，一线工人的交互方式是整个设计的核心**
- 输入方式：**语音 + 自动转写**（详见第 4 节反转 1）【S7 ✅】。产品页："Snap a photo, record a short video, or add a voice note. Resolve is built for environments where typing isn't an option."【S6 ✅】
- 多模态诊断："it captures video to detect abnormal movements, audio to interpret a rattling pipe, and even changes in temperature and pressure"【S8 ✅】；"Give technicians a way to capture what they spot on the job – from video and audio to vibration and sensor data. Turn that context into clear, accurate work orders, to fix more faults first time."【S7 ✅】
- 分工：AI 负责诊断和指导，维修还是人来做。"step-by-step repair guidance gives an engineer with two years on the job the expertise of one with twenty"【S6 ✅】；Claude 原文的说法是 "acts as an extension of an engineer's expertise"【S0】。
- 闭环学习："And feeds every fault and fix back into the system, getting smarter for next time."【S6 ✅】
- **让一线工人参与设计、由老师傅带新人推广**（本轮新发现）："We join the existing training days where the workers go and get upskilled… they love the ones who've been part of the process. They want to be the ones who show it to everyone else… 'This is what it did. And it does exactly what I would have done a week ago.'"【S16 ✅，00:13:08】；一家约 150 年历史的英国家族制造商的老师傅反馈："wow, for me, I will not use it, but it brings everyone else up to my level"【S16 ✅，00:09:06；Kriti **没有点名**这家制造商，不能直接说成 William Grant】

**第 6 步：上线前先过评测，再逐步放权（本轮新补的"怎么评测"）**
- 评测方法（通用做法，不是酒厂项目的具体评测报告）："We don't go full autonomy… on day one… We identify a process that needs to be automated. We define a very clear evaluation set of what would make it reliable, compliant, safe, scalable, right? … if it hits the evaluation criteria, it goes out in the world. [If it] doesn't hit the evaluation criteria, we continue to iterate."【S18 ✅】
- Techzine 的转述："IFS uses an internal feedback loop with clear evaluation criteria, she explains. Only when the technology does what it's supposed to do can they actually put it into production."【S20 ✅】
- 业务口径的衡量标准："ROI is the KPI. If we don't deliver measurable value for the investment our clients make, what are we doing?"【S17 ✅】
- 放权节奏："adoption is a dial, not a switch… We increase autonomy gradually, where it makes sense."【S17 ✅】；"You start by solving the real problem with more intervention and controlled deployments, and as you see success, you dial up the autonomy over time."【S15 ✅】
- 用 Agent SDK 串起 "initial diagnostics to parts ordering and final verification"【Claude原文 S0】。
- 信任问题：IFS 调研 "while 88% of executives report AI has already improved profitability, only 29% are 'completely happy' to let AI make critical decisions without human review."【S29 ✅，Kriti Sharma 署名的 IFS 博客，2025-09-17；第一轮误标为 S17】

**第 7 步：把项目做成产品，再复制到其他行业**
- "We're now working on scaling this solution across the whole of William Grant's operation. And what we built here became Resolve – a product now available across manufacturing, field services, utilities, and more."【S7 ✅ / S27 ✅】
- 2025-11-13，Resolve 在纽约 IFS Industrial X Unleashed 大会上正式发布，"IFS is launching Resolve as the first of many new IFS solutions"【S4 ✅】。发布当时的状态：William Grant "has been piloting Resolve at one of its factories in Scotland"【S11 ✅，Manufacturing Dive 新闻，2025-11-14】；Techzine："It was already in use at the time of the official launch"【S20 ✅】。
- 其他落地点（未具名）："IFS has also deployed Resolve at an airport hangar in the Middle East."【S11 ✅】；"For one major US airline, meanwhile, work has begun on AI-supported inspections and condition-monitoring tools"【S8 ✅】。
- 2026-02-03 在圣地亚哥 DISTRIBUTECH 大会推出 Resolve for Utilities（面向电力和燃气公司的抢修与排班）【S5 ✅；第一轮写作"镜像稿日期 2026-02-04"，官方原页为 2026-02-03】。
- 同一届纽约大会上，Nexus Black 还展示了 "an AI system capable of ingesting and analyzing complex airworthiness directives"、"a utility grade management system designed to assess and prioritize grid maintenance and repair operations"，以及多模态预测性维护【S21 ✅】。
- **第二个具名客户：KLN Family Brands（位于 Perham 的三代家族企业，做糖果、爆米花和宠物食品，"a 3rd-generation family business"）**，做出来的是另一款产品 Flow（报价 + 预测 + 排产）。完整转向故事见第 4 节反转 6【S28 ✅】。
- Kriti 对"项目 vs 产品"的定性："It's not bespoke consultancy; it's productised innovation with contextual adaptation."【S17 ✅】；"We deploy that new product. They become part of the wider IFS offering over time… versus bespoke or consulting type solutions"【S18 ✅】。

**花了多长时间？**
- **William Grant 项目的具体周期：仍未找到公开信息。** 能拼出来的时间点只有：驻场学习用了"几天"（"We spent days at the team's distillery"【S7 ✅】）；2025-11 发布时还处于"piloting"（试点）状态【S11 ✅】；到 2026-06 赞助文发布时，"We're now working on scaling this solution across the whole of William Grant's operation"【S7 ✅，发布日 2026-06-22】。
- 通用说法："we deploy it in a few days and they start to test. And we don't hand it off to some third party to figure it out."【S16 ✅，00:10:53】；"we do it in days and weeks, not years"【S17 ✅】；"delivering breakthrough AI products and measurable customer results within weeks"【S3 ✅】；Emerj（IFS 赞助文）的主题概括 "Moving from multi-year implementations to three-week production-grade results"【S15 ✅；这是 Emerj 的概括，**不是**酒厂项目的实际用时】；IFS 博客自称 "sometimes delivering 10X ROI in weeks"【S29 ✅，营销口径】。
- **驻场人数**：仍**未找到公开信息**。

---

## 4. 关键反转 / 转折点（最重要）

### 反转 1（最强）：从"工业聊天机器人"到"它不是聊天机器人，是一个能听、能看、能开口说话的同事"
- **原本的做法/默认形态**：行业默认的 AI 形态是 chatbot/copilot。Nexus Black 发布时公开的初期用例里就写着 "AI copilots for service and sales"【S1 ✅】；Claude 原文把 Resolve 称为 "an AI assistant"【S0】。
- **现场发现**（本轮已在原页逐字核对）："**The gloves stay on.** Working on the ground taught us the reality of life on the factory floor. Like that a chatbot with text input isn't much use to an engineer wearing protective gloves."【S7 ✅ / S27 ✅】Kriti 在播客里讲的是同一个道理："If the tool doesn't work, when their gloves are on, they're not going to use it. They're not going to take their gloves off every few seconds."【S16 ✅】
- **调整后的做法**："It has to be voice activated, with automatic transcription so they can diagnose faults and report fixes just by talking."【S7 ✅】同时支持拍视频（看异常动作）、录声音（听管道异响）、读压力和温度【S8 ✅】。
- **效果/定位变化**：产品页写着 "Resolve isn't a chatbot – it interprets audio, video, or shifts in pressure to diagnose a fault."【S6 ✅】，以及 "Makes reporting fast and easy, even with gloves on"【S6 ✅】。酒厂结果见第 5 节（预计年省 £840 万，单厂）。
- **注意**：这条"原来以为→现场发现→改了"的完整因果链出自 **IFS Nexus Black 署名的赞助内容**（S7 页面写着 "Sponsored content… By IFS Nexus Black"，同一篇文章也挂在 Nexus Black 官网 S27）。它是**厂商自述**，不是独立媒体调查。

### 反转 2：扩建完产能上去了，效率却没上去
- **原本以为**：大规模扩建完成后效率会提升【S0】"had just completed a major expansion"。
- **实际情况**："the company discovered operations were not as efficient as hoped"，原因是 "ageing infrastructure and fragmented data"，结果是 "significant production and batch loss"【S8 ✅】。
- **调整**：不另起炉灶，直接接入现有传感器和图纸，从"报警后抢修"转向"报警前预判"【S7 ✅ / S8 ✅】。
- **效果**：停机减少、产出提升【S0】"slashed downtime and boosted output"（没有公开停机时长的前后数字）。

### 反转 3：报警了才修 → 报警之前就预判
- **原本做法**："Faults were caught only after the alarm sounded"【S7 ✅】。
- **调整后**："Monitor live information from sensors alongside historic data about each asset. Flag a potential problem well before the sensor would trigger an alarm."【S7 ✅】
- **效果**：£840 万的三项来源："That's thanks to more first-time fix rates, less downtime, and higher output."【S7 ✅】

### 反转 4：客户说"别做 PoC"，厂商说"别纠结阶段"——驻场几天、挑一个点、直接上规模
- **行业常见做法**：发一个通用 AI 工具或做一个 PoC，然后陷进"试点炼狱"【S16 ✅ / S19 ✅】。IFS 自己的官方模型也是四阶段："Problem Definition; Proof of Value; Accelerated Development; Digital Continuity"【S1 ✅】。
- **客户的要求**："We were very keen to avoid the whole proof of concept trap. We said, do something at scale – and that's what we've been able to do."【S7 ✅，Badri Narasimhan】
- **FDE 负责人的说法**："Honestly, I wouldn't get too hung up on the phases. What matters is we go on the ground and we build new products."【S17 ✅】；"we deploy it in a few days and they start to test. And we don't hand it off to some third party to figure it out. And by doing that, we learn things that you wouldn't learn otherwise."【S16 ✅】
- **客户的评价**：【Claude原文 S0】"they weren't trying to apply something generic… practical, fast, and connected to results, not theory."
- **要注意的张力**：Manufacturing Dive 2025-11-14 的新闻稿写的是 William Grant "has been piloting Resolve at one of its factories"【S11 ✅】。也就是说，"不做 PoC"不等于"没有试点阶段"：先在一个厂区跑起来，2026 年再往全公司推【S7 ✅】。视频里别说成"一步到位全公司上线"。

### 反转 5：一个客户项目最后变成了公司的旗舰产品（FDE → 产品化）
- "And what we built here became Resolve – a product now available across manufacturing, field services, utilities, and more."【S7 ✅】然后扩展到公用事业【S5 ✅】、航空【S8 ✅ / S11 ✅ / S21 ✅】。Claude 原文："Resolve represents the first major product from IFS Nexus Black's work with Anthropic"【S0】。
- IFS 官方把这个模式写进了财报新闻稿："Forward-deployed engineers turn customer challenges into AI solutions. IFS is differentiated as these AI solutions are productised at unprecedented speed and scale."【S3 ✅；第一轮摘要把第二句写成 "These AI solutions are productised…"，已按原页更正】
- 2026-01 年报新闻稿再次确认："IFS Nexus Black™ delivers breakthrough AI capabilities within weeks by turning customer challenges into productized innovation."【S30 ✅】

### 反转 6（本轮新发现，第二个具名客户）：KLN Family Brands——做着报价引擎，客户却盯上了"产能过剩"，项目整体转向
- **原本做法**："The first problem we solved with KLN was around quoting: an engine to work out if a request that came in was a good deal."【S28 ✅】
- **现场发现**："But when we showed them what we'd made, something else caught their eye: our product showed they had excess capacity. The focus turned to forecasting and planning."【S28 ✅】
- **调整后的做法**："We shadowed the team as they mapped out days and dealt with disruption. The product we built with them became Flow: AI that brings together quoting, forecasting, scheduling, and production planning."【S28 ✅】
- **一个很适合讲故事的现场细节**："Shadowing KLN's team in person showed us the reality of their day to day. Like the fact that one of their forecasters, Paul, had to look at eight different tabs at once just to forecast one SKU. Now, he gets one UI to look at, and an answer in 20 seconds."【S28 ✅】
- **客户原话**："It wasn't him telling me 'here's our platform and this is what we use.' It was understanding what do you need, and then creating a platform for that."（Jeff Peichel, Operations Planning Manager）；"This project has moved very swiftly. In the past, it would have taken years."（Lance Schultz, CTO）【S28 ✅】
- **现状**："Flow is in the pilot phase with KLN right now."【S28 ✅】，**没有公开数字**。
- **注意**：这是 Nexus Black 官网的客户故事（厂商自述），和 Claude 故事无关，也没有说用的是 Claude。可以作为"FDE 在现场被客户带着转向"的旁证，不要混进 IFS × Claude 的主线数字里。

### 隐含反转（Claude 原文里）
- "Claude's capabilities opened up approaches that weren't possible before"【S0】：暗示多模态看图、读图纸之前做不到，但原文**没有**说以前试过什么方案、失败率是多少。**未找到公开信息**。Kriti 有一句相关的话："The biggest gains come from the scaffolding"（模型本身不够，要看怎么部署）【S20 ✅】。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 救火式（紧急/纠正性）维修占比，William Grant | 38%（另一说"将近 40%"）| 原文没给"之后"的比例 | 【S0】"38% of repairs were reactive"；【S8 ✅】"38 percent of maintenance work was emergency or corrective repairs"；【S4 ✅】"38% of repairs carried out by engineers were emergency, not proactive"；【S7 ✅】"Nearly 40% of repairs were for emergencies" | 几个版本口径有细微差别：reactive repairs / emergency or corrective maintenance work / emergency repairs by engineers。基线出自 **Nexus Black 自己的评估**（S8）。**没有公开"之后"的占比**。Tech Talks Daily 主持人口播说 "they cut emergency repairs from 38%"【S16 ✅】，但没说降到多少 |
| 年度节省，William Grant 单厂（Girvan） | — | **预计** £840 万/年 | 【S0】"estimates… £8.4 million a year at this one site alone—once they are in business-as-usual mode"；【S4 ✅】"The team estimates these changes will save £8.4 million annually at the site, once business-as-usual operations are established."；【S7 ✅】"William Grant & Sons estimates savings of £8.4 million a year at Girvan, once in business-as-usual mode"；【S11 ✅】"estimated cost savings of 8.4 million pounds ($11.1 million) per year at the one location"；【S13 ✅】"projected £8.4 million… once the rollout is complete"；【S20 ✅】"expects to save 8 million pounds"；【S6 ✅】官网首页写作 "See how we saved them £8m per year" | **是预估值，不是已实现的节省**，前提是"进入常态运营以后"。只算一个厂区。构成是首次修复率、停机、产出三项，**没有拆分**。注意 Nexus Black 官网把它写成过去时 "saved them £8m"，和"预计"口径冲突，视频里用"预计" |
| 故障解决速度 | — | 快 25% | 【Claude原文 S0】"25% faster fault resolution" | **外部仍没找到对应的客户、基线或统计周期**。只出现在 Claude 故事里 |
| 冗余库存 | — | 减少 20%（公用事业客户） | 【Claude原文 S0】"20% reduction in excess inventory — Utilities cut unnecessary stock…" | **外部仍没找到来源**，哪家公用事业、什么时间段都不清楚 |
| 重大灾害后恢复供电的速度 | — | 快 40%（部分媒体写"最多快 40%"）| 【S4 ✅ IFS 新闻稿】"The result is gas and utilities firms can now restore power after major events 40% faster than they could without a comparable tool"；【S13 ✅】"up to 40% faster than without a comparable tool, IFS claims"；【S8 ✅】"According to IFS, gas and utilities firms using these solutions can restore power after major events up to 40 percent faster"；【S25 ✅】Ronald van Loon 在 X 上转述 Kriti："cutting utility power restoration times by 40% during extreme weather" | **第一轮把出处写成 S5（Resolve for Utilities 新闻稿），本轮打开 S5 全文，里面没有 40%**；真正出处是 2025-11 的 S4。IFS 官方稿写的是"40% faster than… without a comparable tool"（和不用同类工具相比），没有"up to"；"up to"是媒体转述时加的。**没有点名具体公司**，S5 里 SoCalGas 的应急主管只说 "A solution like this **could** help us cut restoration times"（假设语气，不是实测）。这个数字**不在 Claude 故事里** |
| 预测一个 SKU 的时间（KLN，Flow 产品）| 同时看 8 个表格 | 一个界面，20 秒出答案 | 【S28 ✅】"had to look at eight different tabs at once just to forecast one SKU. Now, he gets one UI to look at, and an answer in 20 seconds." | 厂商官网客户故事；**试点阶段**；和 Claude 故事无关 |
| 经验差距（产品主张） | 2 年工龄工程师 | 相当于 20 年老师傅的专业水平 | 【S6 ✅】"gives an engineer with two years on the job the expertise of one with twenty"；【S11 ✅】Kriti："a junior engineer can act like one with 20 years of experience" | **营销口号**，不是测量出来的结果 |
| 交付周期（通用说法） | 多年期实施 | "a few days" 部署测试 / "weeks" / "three-week production-grade results" | 【S16 ✅ / S17 ✅ / S1 ✅ / S3 ✅ / S15 ✅】| 通用宣传口径，**不是**酒厂项目的实际周期 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **厂商内部单独设 FDE 单元，用"共同投资"绑定客户**：客户出场景和数据，厂商出 AI 工程师、领域专家、方案架构师、产品经理和 UX，客户可以提前用上新能力，并参与塑造产品【依据 S1/S19/S26】。
2. **有方法论框架，但不被框架绑住**：官方是"定义问题 → 验证价值 → 加速开发 → 数字化延续"四阶段【S1】；负责人的原话是"别太纠结阶段，关键是下现场、做产品"【S17】；客户的要求是"避开 PoC 陷阱，直接做规模化"【S7】。
3. **先驻场，再选点**：工程师在现场待几天，搞清楚真实约束（插单、缺勤、急修），然后只挑一个"能最快证明价值"的起点（酒厂挑的是预测性维护）【依据 S7/S15】。
4. **先用自己的评估把痛点量化成一个基线数字**（38% 救火式维修），后面的 ROI 叙事全都锚定在这个数上；"ROI is the KPI"【依据 S8/S17】。
5. **交互方式跟着一线工人的身体条件走**：戴手套就用语音，没信号就要能离线，嘈杂环境就拍视频、录声音、读传感器，而不是把办公室里的聊天框直接搬到车间【依据 S0/S6/S7/S16】。
6. **不推翻老系统，直接"插"进去**：接现有传感器、读 P&ID 图纸，用 MCP 连遗留系统【依据 S0/S7/S8/S16】。
7. **先定评测集，过了才上线；自主权像旋钮一样逐步调高**：人做决定，AI 做诊断和指导【依据 S15/S17/S18/S20】。
8. **让一线老师傅参与设计、在培训日由他们向同事演示**，用"同行背书"推动采用【依据 S16】。
9. **拿给客户看的原型本身就是调研工具**：KLN 看到报价引擎后发现了产能过剩，项目整体转向【依据 S28】。
10. **把一个客户的定制方案做成可复制的产品**，从酒厂到电网再到航空；"不是定制咨询，是产品化创新 + 场景适配"【依据 S3/S5/S7/S17/S18/S21】。

---

## 7. 数字严谨性 & "评论区喷子"防御

**A. 哪些是自报、口径是什么**
- **£840 万是"预计"值**，前提是"进入常态运营以后"，而且只算一个厂区【S0/S4/S7】。说成"已经省了 £840 万"会被抓住（Nexus Black 官网自己就写成了 "saved them £8m per year"【S6】，这是厂商营销口径）。推荐说法："客户预计单厂每年可省约 840 万英镑"。
- **38% 是 Nexus Black 自己评估得出的基线**【S8】，公开材料里**没有"之后"降到多少**。赞助文里又写成 "Nearly 40%"【S7】。
- **25% 和 20%**：只在 Claude 故事里出现，**没有客户名、基线和统计周期**，本轮再次检索外部仍找不到出处。建议只作为次要数字，并注明是厂商在 Claude 客户故事中的口径。
- **"40% 更快恢复供电"**：IFS 自己的口径是"和没有同类工具相比快 40%"【S4】，没有点名具体公司，媒体转述时加了 "up to"【S8/S13】。
- **Manufacturing Dive 那篇（S7）是赞助内容**：页面标注 "Sponsored content… By IFS Nexus Black"，"Permission granted by Itch Media for IFS Nexus Black"，发布日期 2026-06-22，同样的文字也挂在 Nexus Black 官网（S27）。"驻场几天""手套→语音""别做 PoC"这几个最关键的过程细节都出自这篇，属于**厂商自述**。
- **Emerj 那篇（S15）也是 IFS 赞助的**："This article is sponsored by IFS"。diginomica 文末披露 "IFS is a diginomica premier partner at time of writing"【S18】。
- **"两年工龄=二十年老师傅"**是营销口号【S6】。

**B. 可能被挑刺的地方**
- **"它不是聊天机器人"和 Claude 原文里的 "AI assistant" 说法不一样**：可以解释为产品形态从文本对话转向了语音加多模态（本质上还是 LLM 助手），视频里别说得太绝对。
- **"138 年历史的酒厂"说法有问题（本轮新发现）**：赞助文开头写 "Christmas Day, 1887. And the first drop of whisky ran from the stills at William Grant & Sons' site in Girvan"【S7】。但维基百科写 Girvan 酒厂 "was built in 1963"【S24 ✅】，而 1887 年圣诞节第一次出酒的是 Dufftown 的 Glenfiddich 酒厂（"The Glenfiddich single malt whisky first ran from the stills on Christmas Day, 1887"【S31 ✅】）。所以"138 年"是 **William Grant & Sons 这家公司**的历史，不是 Girvan 厂区的历史。视频里说"一家有 138 年历史的酒业公司"更稳妥。
- **"离线/没信号"**：产品页现在写了 "works without a signal" 和 "offline support"【S6】，但这是**产品主张**，没有任何公开材料说明离线模式怎么实现、酒厂是否用到。视频里可以说"官方称支持离线"，别说"实测能离线"。
- **"不做 PoC" vs "试点"**：客户 CTO 说避开了 PoC 陷阱【S7】，但 2025-11 媒体报道写的是"在一个工厂试点"【S11】，KLN 的 Flow 也仍在 "pilot phase"【S28】。
- **ABI Research 的质疑**（本轮已打开全文，作者 Michael Larner，2025-05-19）【S19 ✅】：
  - 数据顾虑："I&M firms often are cautious regarding AI due to the fact they don't want their data to inform Large Language Models (LLMs) that will be used by competitors."
  - 排他期博弈："ABI Research expects that Nexus Black customers will negotiate an exclusivity period for 'their solution' before the capabilities and use case are available more broadly."（呼应"客户项目变成通用产品"这件事：客户出钱出数据共创的方案，最后会卖给同行）
  - 生态伙伴："Many of IFS' partners were also in attendance at IFS Connect. IFS will need to ensure they are also involved at the appropriate time."（暗示会挤压实施伙伴/系统集成商的空间）
- **Techzine 的保留意见**（2026-05-13）【S20 ✅】：对 Kriti 说 "We no longer see any hallucinations in our field"，Techzine 评价 "That's quite the statement."；对"不是渐进改善而是显著改善"的说法，评价 "That's quite a bold statement based on the (initial) results of a single solution"，并说 "we'd still like to see a few more solutions emerge from IFS Nexus Black before we fully commit to the narrative."
- **"幻觉已不是问题"这类说法别照搬**：Kriti 说过 "Hallucinations were a 2022 problem"【S17】，媒体已经在挑刺【S20】。
- **信任问题**：IFS 自己的调研也承认只有 29% 的高管完全放心让 AI 不经人工复核就做关键决策【S29】。可以用来回应"AI 修设备出了事谁负责"。
- **负面报道/事故**：本轮检索**没有找到**针对 Resolve 或 William Grant 项目的负面报道或事故。
- **行业标签**：Claude 页面的行业标签是 "Software"，因为 IFS 是软件厂商，最终客户是酒厂，视频里别混淆。

**C. 信息缺口（如实声明）**
- William Grant 项目：**开始时间、总周期、驻场人数、上线以后 38% 降到多少**，仍**未找到公开信息**。已补上的只有：驻场学习"几天"【S7】、2025-11 处于试点【S11】、2026-06 正往全公司推【S7】。
- 评测方法：只找到**通用做法**（评测集 + ROI + 逐步放权）【S17/S18/S20】，**没有酒厂项目的具体评测指标或报告**。
- 25% 和 20% 对应哪家客户：**仍未找到**。
- 除 William Grant 之外的具名 Nexus Black 客户：本轮找到 **KLN Family Brands**（Flow 产品，试点中）【S28】。航空（"one major US airline"、"an airport hangar in the Middle East"）和公用事业客户**都没有公开名字**【S8/S11】。
- S22 视频（IFS 官方频道的 William Grant 案例视频，2026-01-21）：本环境拿不到字幕（YouTube 要求登录验证），**视频内容仍未核实**，建议人工观看。
- **中文报道**：用中文关键词检索（IFS Nexus Black / Resolve / Anthropic / 威士忌酒厂 / 工业 AI），**未找到中文报道**，结果全是英文媒体。

**D. 第一轮摘要有误、本轮已更正（打开原页后发现）**
1. Anthropic 发言人名字：第一轮写 "Garvin Doyle"，原页为 **Garvan Doyle**【S4/S10/S13】。
2. "40% 更快恢复供电"的出处：第一轮写成 S5（Resolve for Utilities 新闻稿），S5 原页**没有 40%**；实际出自 2025-11 的 S4，且 IFS 原话没有 "up to"、也没有 "firms report"。
3. 第一轮第 2 节"全球约 70% 的劳动力不坐办公室"标注出自 S13 TechInformed，S13 原页**没有这句话**，已删除。（Tech Talks Daily 主持人口播里有另一个版本："deskless workers, they represent 80% of the global workforce"【S16】，是主持人说的，不是 IFS 的数据，本稿不采用。）
4. "Implementing governance via supervisor agent frameworks…"：第一轮写成 Nexus Black 的做法，S15 原页显示这是 **IFS Loops CEO Somya Kapoor** 讲的，不是 Nexus Black，已从 Nexus Black 流程中移除。
5. "88% / 29%" 调研数字：第一轮标注出自 S17 GEC Newswire，S17 原页没有；实际出自 Kriti Sharma 署名的 IFS 博客（新增 S29）。
6. S3 财报原句：第一轮第二句写成 "These AI solutions are productised…"，原页为 "IFS is differentiated as these AI solutions are productised at unprecedented speed and scale."
7. "驻场几天"的原句：第一轮写成 "Nexus Black engineers spent days at the Girvan distillery…"，原页是第一人称 "We spent days at the team's distillery, learning processes first-hand."；"38%"在赞助文里写的是 "Nearly 40%"。
8. S5 发布日期：第一轮写"2026-02（镜像稿 2026-02-04）"，官方原页为 **2026-02-03**（San Diego, DISTRIBUTECH）。
9. "The challenge is not building the technology, it is building trust in it."：第一轮归为 Kriti 或 S16/S17 结果集；原页显示这是 **Tech Talks Daily 主持人 Neil C. Hughes 在节目简介里的概括**，不是 Kriti 原话。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下都是创作建议，不是事实。每条都注明了依据哪个来源编号。

- **开场钩子 A**：“工人戴着手套，你让他在聊天框里打字？”【依据 S0/S7/S16】
- **开场钩子 B**：“一家有 138 年历史的威士忌酒业公司，刚扩完产，却发现将近四成维修都是在救火。”【依据 S7 的 1887/"138-year-old"、S8 的扩建和 38%；注意说"酒业公司"不说"酒厂"，理由见第 7 节 B】
- **反转桥段（直接对应我们模板里的"对话框→工作台"）**：客户以为要的是"AI 聊天助手" → FDE 在酒厂待了几天，看到师傅戴着防护手套 → 聊天框直接作废 → 改成"开口说话 + 拍一段视频 + 录一段管道异响"，AI 告诉你哪坏了、怎么修 → 产品页的定位变成一句话："它不是聊天机器人"【依据 S0/S6/S7/S8/S16】。
- **第二个反转桥段（可做系列第二集或插叙）**：给食品厂做报价引擎 → 演示时客户一眼看到"原来我们产能过剩" → 项目整体转向做预测和排产 → 预测员 Paul 以前要开 8 个表格，现在 20 秒出答案【依据 S28】。
- **甲方原话钩子**：“我们非常想避开 PoC 陷阱。我们说，直接做规模化。”【依据 S7，Badri Narasimhan】
- **FDE 负责人原话钩子**：“别太纠结那几个阶段，关键是下现场、做产品。”【依据 S17】；“几天内部署，让他们开始测，我们不交给第三方。”【依据 S16】
- **中国化类比**：可以比作老中医的"望闻问切"。**望**是看视频里零件的异常动作，**闻**是听管道异响，**问**是工人开口描述，**切**是读压力和温度传感器【依据 S8 的多模态描述；类比本身是创作】。
- **数字表达**：“单厂一年预计省 840 万英镑（按约 1:9.5 汇率粗算，约合 8000 万人民币，发布前核对当日汇率）”，一定要带上"预计""单厂""常态运营后"【依据 S0/S7】。
- **升华句**：“FDE 真正交付的不是一个项目，而是一款产品：酒厂的方案后来变成了 IFS 卖给全行业的 Resolve。”【依据 S7/S3】
- **二段升华**：“AI 最大的变革发生在你看不见的地方：电线杆上、机房里、酒厂的管道边。”（呼应 Kriti 的 "quiet transformation" 和 S23 主题演讲标题 "Invisible Industrial Revolution"）【依据 S0/S23】
- **老师傅那句话**：“我自己用不上它，但它把其他人都拉到了我的水平。”【依据 S16；注意 Kriti 没点名是哪家工厂，别说成 William Grant】
- **创业故事彩蛋**：“IFS 1983 年创业时，创始人在第一个客户厂门口搭了顶帐篷，活不干完不走。四十年后，他们把这股劲儿做成了 FDE 部队。”【依据 S5/S17】
- **评论区预埋**：主动说一句“这个数字是客户预估，要等进入常态运营以后才兑现”，提前堵住喷子【依据第 7 节】。
- **可以借用的一句客户原话**：“他们没拿通用方案来套我们。”（"they weren't trying to apply something generic"）【依据 S0】

---

## 9. 来源清单

> "是否已打开核实"一栏：✅ = 本轮已打开原页并逐字核对引文；❌ = 无法访问（写明原因）。

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S0 | IFS Nexus Black builds industrial AI with Claude | https://claude.com/customers/ifs | Claude原文 | 页面未显示（推测 2025-11 以后，未核实）| ✅（第一轮 WebFetch + curl，本轮 curl 复核）|
| S1 | IFS launches Nexus Black | https://www.ifs.com/en/insights/news/ifs-launches-nexus-black | 公司新闻稿 | 2025-04-23（IFS Connect，伯明翰）| ✅ |
| S2 | IFS appoints Kriti Sharma as CEO of Nexus Black… | https://www.ifs.com/en/insights/news/ifs-appoints-kriti-sharma | 公司新闻稿 | 2025-07-08 | ✅ |
| S3 | IFS Delivers 22% ARR Growth as Industrial AI moves from Promise to Performance | https://www.ifs.com/en/insights/news/ifs-delivers-arr-growth-as-industrial-ai-moves-from-promise-to-performance | 公司新闻稿（财报）| 2025-10-28 | ✅ |
| S4 | IFS Partners with Anthropic to Develop Powerful Industrial AI Solutions… | https://www.ifs.com/en/insights/news/ifs-partners-with-anthropic （PR Newswire 同文：https://www.prnewswire.com/news-releases/ifs-partners-with-anthropic-to-develop-powerful-industrial-ai-solutions-accelerating-the-next-industrial-revolution-302614489.html ）| 公司新闻稿 | 2025-11-13 | ✅（IFS 原站 + PR Newswire 均已打开）|
| S5 | IFS Nexus Black Launches Resolve for Utilities | https://www.ifs.com/en/insights/news/ifs-nexus-black-launches-resolve-for-utilities | 公司新闻稿 | 2026-02-03（DISTRIBUTECH，圣地亚哥）| ✅ |
| S6 | IFS Nexus Black – Resolve 产品页 | https://www.nexusblack.com/resolve | 公司产品页 | 未标注（页脚 2026）| ✅ |
| S7 | How do we take a 138-year-old distillery from fixing problems to predicting them? | https://www.manufacturingdive.com/spons/how-do-we-take-a-138-year-old-distillery-from-fixing-problems-to-predicting/823343/ | 媒体**赞助内容**（署名 IFS Nexus Black）| 2026-06-22 | ✅ |
| S8 | Industrial AI: behind the barrel | https://www.fmcgceo.co.uk/industrial-ai-behind-the-barrel/ | 媒体（FMCG CEO，作者 Eamonn Duff，含 Kriti Sharma、Badri Narasimhan 原话）| 2025-12-15 | ✅ |
| S9 | Anthropic: Claude eyes real world impact, industrial use cases | https://www.constellationr.com/insights/news/anthropic-claude-eyes-real-world-impact-industrial-use-cases | 分析机构/媒体（作者 Larry Dignan）| 2025-11-13 | ✅ |
| S10 | IFS validates applied Industrial AI platform with real-world impact showcase | https://www.computerweekly.com/blog/CW-Developer-Network/IFS-validates-applied-Industrial-AI-platform-with-real-world-impact-showcase | 媒体（Computer Weekly 博客）| 2025-11-13 | ✅（直连被 Cloudflare 拦截，经 r.jina.ai 阅读代理取得原页全文核对）|
| S11 | IFS, Anthropic partner on AI for industrial frontline workers | https://www.manufacturingdive.com/news/ifs-nexus-black-anthropic-claude-resolve-ai-industrial-frontline-workers/805534/ | 媒体（作者 Nathan Owens）| 2025-11-14 | ✅ |
| S12 | How IFS & Anthropic are Shielding Supply Chains from Failure | https://supplychaindigital.com/news/anthropic-and-ifs-ai-supply-chains | 媒体 | 2025-11（未核实）| ❌ 无法访问（直连为 Cloudflare 验证页；阅读代理只返回广告追踪像素；web.archive.org 连接被重置；WebFetch 被出网代理拦截）。其支撑的"£8.4m ≈ US$11.1m"改由 S11 支撑 |
| S13 | Anthropic's bet: Industrial AI will matter more than office AI | https://techinformed.com/anthropics-bet-industrial-ai-will-matter-more-than-office-ai/ | 媒体（作者 Aman Gupta）| 2025-11-25 | ✅（原页无第一轮所称"70% 劳动力"一句）|
| S14 | The AI in Business Podcast: Solving Hard Industrial Problems with Fast AI Deployment – with Kriti Sharma | https://podcast.emerj.com/solving-hard-industrial-problems-with-fast-ai-deployment-with-kriti-sharma-of-ifs-nexus-black | 播客节目页（仅节目简介，无文字稿）| 2025-11-17 | ✅ |
| S15 | Why Industrial AI Projects Stall Before Production | https://emerj.com/why-industrial-ai-projects-stall-before-production/ | 媒体（**IFS 赞助文**，作者 Nick Gertsch）| 2026-03-25 | ✅ |
| S16 | How IFS Nexus Black Is Turning Industrial AI Into Real World Results（Tech Talks Daily）| https://techtalksnetwork.com/podcast/tech-talks-daily/episode/how-ifs-nexus-black-is-turning-industrial-ai-into-real-world-results （Apple：https://podcasts.apple.com/gb/podcast/how-ifs-nexus-black-is-turning-industrial-ai-into-real/id1018727913?i=1000757218444 ）| 播客节目页（**含带时间戳的完整文字稿**，疑为自动转写，有 "Cloud SDK""Hendrix Gin" 等识别错误）| 2026-03-25 | ✅ |
| S17 | Industrial AI at ground zero: IFS Nexus Black CEO on solving the hardest real-world problems | https://gecnewswire.com/industrial-ai-at-ground-zero-ifs-nexus-black-ceo-on-solving-the-hardest-real-world-problems/ | 媒体采访（作者 Jeevan Thankappan）| 2025-11-27 | ✅ |
| S18 | Executive Intelligence podcast – IFS's Kriti Sharma on harnessing AI for good and for industry | https://diginomica.com/executive-intelligence-podcast-ifss-kriti-sharma-harnessing-ai-good-and-industry （音频页：https://diginomica.podbean.com/e/executive-intelligence-ceo-of-ifs-nexus-black-kriti-sharma-on-what-it-takes-to-succeed-with-industrial-ai/ ，32 分钟）| 媒体播客（作者 Phil Wainewright；文末披露 IFS 为其 premier partner）| 2025-11-25（音频 2025-11-24）| ✅ |
| S19 | Nexus Black from IFS: A Hands-on Approach for Helping Manufacturers Deploy AI, but Will Everyone Be Happy? | https://www.abiresearch.com/market-research/insight/7786138-nexus-black-from-ifs-a-hands-on-approach-f | 分析机构（带质疑，作者 Michael Larner，IN-7825）| 2025-05-19 | ✅（全文可读）|
| S20 | One year of IFS Nexus Black: major impact on FSM and manufacturing | https://www.techzine.eu/blogs/analytics/141215/one-year-of-ifs-nexus-black-a-major-impact-on-fsm-and-manufacturing/ | 媒体（带保留意见）| 2026-05-13 | ✅（直连 403，经 r.jina.ai 阅读代理取得原页全文核对）|
| S21 | IFS Industrial X: Will the Focus on Physical World Use Cases for AI Resonate? | https://futurumgroup.com/insights/ifs-industrial-x-will-the-focus-on-physical-world-use-cases-for-ai-resonate/ | 分析机构 | 2025-11-19 | ✅ |
| S22 | How AI in Manufacturing Powers Predictive Maintenance: A Case Study with William Grant & Nexus Black | https://www.youtube.com/watch?v=XaJlV7HxpVM | 视频（IFS 官方频道 @IFSdotcom 的客户案例）| 2026-01-21 | ✅ 仅**标题、频道、日期、简介**（oEmbed + 视频页数据）。简介原句："This episode highlights the collaboration between William Grant, a renowned distillery on Scotland's West Coast, and AI solutions provider Nexus Black."；"Understand how AI drives operational improvements by replacing traditional preventive maintenance with predictive strategies." ❌ **字幕/内容无法获取**（YouTube 返回 "Sign in to confirm you're not a bot"，字幕接口 FAILED_PRECONDITION）|
| S23 | Keynote – Invisible Industrial Revolution: AI's Biggest Impact Where You Can't See It (Kriti Sharma) | https://www.youtube.com/watch?v=HUwyBW0KWFc | 视频（主题演讲，第三方频道 Thinking About Thinking）| 2026-03-03（上传）；演讲为 2025 年伦敦 "Algorithmic Innovation and Entrepreneurship Global Summit on Open Problems for AI" | ✅ 仅**标题、频道、日期、简介**；❌ 字幕同样无法获取 |
| S24 | Girvan distillery（维基百科）| https://en.wikipedia.org/wiki/Girvan_distillery | 百科（南艾尔郡谷物威士忌酒厂，属 William Grant & Sons，1963 年建成，也生产 Hendrick's Gin）| — | ✅ |
| S25 | Ronald van Loon 在 X 上的帖子（转述 Kriti Sharma 的 40% 数字）| https://x.com/Ronald_vanLoon/status/2009294131529486414 | 社交媒体（用户言论）| 2026-01-08 | ✅（x.com 需登录，经 api.fxtwitter.com 取得原帖全文）|
| S26 | IFS launches development service for bespoke industrial AI applications | https://www.aerospacetestinginternational.com/news/ifs-launches-development-service-for-bespoke-industrial-ai-applications.html | 行业媒体 | 2025-04-23 | ✅ |
| S27 | William Grant & Sons（Nexus Black 官网客户故事，与 S7 同文）| https://www.nexusblack.com/william-grant-and-sons | 公司官网客户故事 | 未标注 | ✅（**本轮新增**）|
| S28 | KLN Family Brands: How do you boost throughput and cut waste when your planning still runs on spreadsheets? | https://www.nexusblack.com/kln-family-brands | 公司官网客户故事（第二个具名客户）| 未标注 | ✅（**本轮新增**）|
| S29 | Industrial AI at a Tipping Point: What I Told CNBC About the Future of Work（Kriti Sharma）| https://blog.ifs.com/industrial-ai-at-a-tipping-point-what-i-told-cnbc-about-the-future-of-work/ | 公司博客 | 2025-09-17 | ✅（**本轮新增**，88%/29% 的真实出处）|
| S30 | IFS delivers exceptional FY2025 Financial Results as Industrial AI scales from first deployment to commercial impact | https://www.ifs.com/en/insights/news/ifs-delivers-exceptional-fy2025-growth-as-industrial-ai-scales-from-first-deployment | 公司新闻稿（年报）| 2026-01-22 | ✅（**本轮新增**）|
| S31 | Glenfiddich distillery（维基百科）| https://en.wikipedia.org/wiki/Glenfiddich_distillery | 百科（用于核对"1887 年圣诞节首次出酒"指的是 Glenfiddich，不是 Girvan）| — | ✅（**本轮新增**）|
| S32 | How IFS and Anthropic are Accelerating AI Adoption（Manufacturing Digital）| https://manufacturingdigital.com/news/ifs-anthropic-powering-ai-adoption-in-manufacturing | 媒体（复述 IFS 新闻稿，"could save William Grant & Sons around £8.4m each year"）| 2025-11-18 | ✅（**本轮新增**，经 r.jina.ai 阅读代理）|
