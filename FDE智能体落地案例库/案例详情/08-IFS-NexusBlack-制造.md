# 案例：IFS Nexus Black — 驻场工程师在苏格兰威士忌酒厂落地"会看、会听、能说话"的维修智能体 Resolve，把"救火式维修"变成预测性维护

> **核实状态总说明（请先读）**
> - 【Claude原文】S0 已用 WebFetch 和 curl 两种方式打开 https://claude.com/customers/ifs，下文引用的英文句子都在线上页面里逐字核对过。
> - 【外部来源】S1–S26：本次研究环境的出网代理**拦截了除 claude.com / anthropic.com 以外的全部新闻和公司站点**（WebFetch 返回 `EGRESS_BLOCKED`，curl 返回 `CONNECT tunnel failed, 403`，已逐个测试）。所以外部来源**全部是"仅搜索结果摘要可见，未能打开原页"**。下文外部来源的英文引用取自搜索引擎摘要，**可能被摘要改写过，不一定是原文逐字**，发布前需要人工打开原页核对。另外，本会话的 WebSearch 额度（200 次）在研究后段已经用完，部分线索没法继续深挖（见第 7 节"信息缺口"）。
> - 【编剧建议】只出现在第 8 节和标了【编剧建议】的地方。

- **行业**：工业软件厂商（Claude 页面标签是 "Industry: Software"）→ 落地客户属于制造（酒类蒸馏）、公用事业（电力/燃气）、能源、航空航天与国防、现场服务
- **企业规模 / 地区**：Claude 页面标注 "Company size: Large / Location: Europe"【Claude原文 S0】。IFS 是一家有四十年行业经验的全球软件公司（"a global software company with four decades of experience"）【Claude原文 S0】。2025 财年截至当时的 ARR 增长 22%【外部来源 S3】。落地客户 William Grant & Sons 的这次项目在苏格兰西海岸的 Girvan 厂区【外部来源 S7，S0 只写 "Scotland's west coast"】
- **Claude 产品标签**：Claude Platform（正文还提到 MCP、Skills、Agent SDK、多模态）【Claude原文 S0】
- **Claude 故事发布日期**：页面**没有显示日期**（HTML 的 meta 里也没有）。故事内容跟 IFS 和 Anthropic 在 2025-11-13（部分报道写 11-14）Industrial X Unleashed 大会（纽约）上发布的合作消息高度一致【外部来源 S4/S10】，推测在那之后发布，**未核实**
- **Claude 原文链接**：https://claude.com/customers/ifs
- **落地主体（谁是"FDE"）**：**IFS Nexus Black**，也就是软件厂商 IFS 内部单独设立的"前置部署工程师"团队（供应商自己的 FDE 团队），Anthropic 作为模型方和合作伙伴（Anthropic Applied AI Lead Garvin Doyle 在发布会上站台）。证据如下：
  - IFS 官方财报新闻稿："Forward-deployed engineers turn customer challenges into AI solutions."【S3】
  - Constellation Research："IFS Nexus Black, a team of forward deployed engineers, has partnered with Anthropic…"【S9】
  - Computer Weekly：William Grant & Sons "worked with IFS Nexus Black and Anthropic to **forward-deploy** a field-worker productivity service"【S10】
  - ABI Research：Nexus Black 是 "a separate unit staffed with product managers, AI engineers, solution architects, and User Experience (UX) specialists"【S19】
  - IFS 发布 Nexus Black 的新闻稿：采用"dedicated delivery team"、四阶段模型和共同投资（co-investment）模式【S1】
- **本案例推荐指数：4 / 5**
  - 数字充分度（高）：38% 救火式维修、预计年省 £840 万（单一厂区）、故障解决提速 25%、冗余库存减少 20%、恢复供电最多快 40%。
  - 过程/反转素材（中高）：有非常贴合我们脚本模板的反转，"聊天框→戴手套没法打字→改成语音+拍视频+听声音，'Resolve isn't a chatbot'"，还有"驻场几天挑破冰点""客户项目最后变成产品"。但 William Grant 项目**具体做了几周、驻场几个人、怎么评测，都没有公开**。
  - 可迁移性（高）：老工厂、老设备、老师傅退休、数据散在各个系统里，这些也是中国制造业和电网的通病。
  - 扣掉 1 分的原因：外部来源在本环境里全都打不开，只能用搜索摘要；25%、20% 这两个数字在外部找不到对应的客户和口径。

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
| 2.1 | 一线工人戴着手套，**没法在聊天框里打字** | 【Claude原文 S0】"Engineers can't type into a chatbot when they're wearing gloves." |
| 2.2 | 海上风电场**没有信号** | 【Claude原文 S0】"Offshore wind farms need systems that work without signal."（外部**没找到**任何关于离线模式的具体实现，见第 7 节） |
| 2.3 | 工厂设备用了 40 年，老系统难接 | 【Claude原文 S0】"…speak the language of their 40-year-old machinery"；"legacy infrastructure that has traditionally been challenging to integrate" |
| 2.4 | 酒厂**扩建完反而没达到预期效率**：设施老化、数据分散，造成产量和批次损失 | 【外部来源 S8，FMCG CEO】（搜索摘要）"following a significant expansion, the company discovered operations were not as efficient as hoped… ageing infrastructure and fragmented data… resulting in significant production and batch loss." / 【Claude原文 S0】"had just completed a major expansion… saw an opportunity to improve efficiency" |
| 2.5 | **38% 的维修是救火/纠正性维修**，经常导致停机 | 【Claude原文 S0】"38% of repairs were reactive"；【外部来源 S8】Kriti Sharma 说这个数来自 Nexus Black 自己做的评估："their assessment found that '38 percent of maintenance work was emergency or corrective repairs'"（搜索摘要）；【外部来源 S4】IFS 新闻稿（搜索摘要）"38% of repairs carried out by engineers were emergency, not proactive" |
| 2.6 | 故障**要等报警响了才被发现** | 【外部来源 S7，Manufacturing Dive 赞助文】（搜索摘要）"faults caught only after alarms sounded, meaning more downtime and reduced output"（这句话出现在含 S7 的搜索结果摘要里，具体出自哪一页不能完全确定） |
| 2.7 | 老技师退休，经验跟着流失 | 【外部来源 S15，Emerj】（搜索摘要）"Scaling digital workforces to preserve institutional knowledge as senior technicians retire at record rates"；【外部来源 S6，nexusblack.com】产品主张 "gives an engineer with two years on the job the expertise of one with twenty" |
| 2.8 | 行业普遍陷在 **"试点炼狱"**（pilot purgatory），AI 项目迟迟进不了生产 | 【外部来源 S16，Tech Talks Daily】（搜索摘要）"tackling 'pilot purgatory,' where companies experiment with AI but struggle to deploy it at scale"；【外部来源 S15】"many industrial teams have lost patience with long AI programs that never make it to production" |
| 2.9 | 工业企业**怕自己的数据被拿去训练、最后便宜了竞争对手** | 【外部来源 S19，ABI Research】（搜索摘要）"I&M firms often are cautious regarding AI due to the fact they don't want their data to inform Large Language Models (LLMs) that will be used by competitors." |
| 2.10 | 全球约 70% 的劳动力不坐办公室 | 【外部来源 S13，TechInformed】（搜索摘要）"around 70% of the global workforce doesn't sit in an office at all" |
| 2.11 | 电网等场景：极端天气增多、熟练工短缺、基础设施老化 | 【外部来源 S5，IFS Resolve for Utilities 新闻稿】（搜索摘要）"skilled workforce shortages, extreme weather events increasing in frequency and severity, aging infrastructure requiring urgent modernization" |

---

## 3. 落地过程（FDE 怎么做的）

> 注意：William Grant & Sons 这一个项目的**完整时间线、驻场人数和评测方法都没有公开**。下面是把 IFS 公开的通用方法论（S1/S3/S15）和酒厂项目的零散细节（S0/S7/S8）拼起来的，每一步都标了来源。

**第 0 步：组织形态，厂商内部单独设一支 FDE 部队（2025-04 成立）**
- IFS 于 2025-04-23 在伯明翰 IFS Connect 大会上发布 Nexus Black，定位是"strategic innovation program"【S1】（搜索摘要）。
- 编制：一支 "dedicated delivery team"，由 "dedicated AI engineers, domain experts, and solution architects with deep expertise in industrial contexts and enterprise architecture" 组成【S1】。ABI 的说法是，这个独立单元里还有产品经理和 UX 专家【S19】。
- 方式："deploying a team of data engineers and scientists from IFS to work with a customer to develop an AI application"【S26，Aerospace Testing International】（搜索摘要）。
- 商业模式：**共同投资**。"Through a co-investment model, customers gain a fast-mover advantage… and influence solutions"，客户还能 "access capabilities ahead of general launch and directly engage in the creation process"【S1】（搜索摘要）。
- 2025-07 任命 Kriti Sharma 为 Nexus Black CEO（此前任 Thomson Reuters 法律科技 CPO，更早在 Sage 做 AI 副总裁）【S2/S18】（搜索摘要）。
- 官方的四阶段模型：**Problem Definition → Proof of Value → Accelerated Development → Digital Continuity**，目标是 "turn bold ideas into tangible outcomes in a matter of weeks"【S1】（搜索摘要）。

**第 1 步：进现场（CEO 本人也穿安全装备下车间）**
- 酒厂项目：Nexus Black 工程师在 Girvan 酒厂待了好几天，亲身学习工艺流程。搜索摘要原文："Nexus Black engineers spent days at the Girvan distillery learning processes first-hand"【S7，Manufacturing Dive 赞助内容】（搜索摘要，可能是转述）。
- 通用做法："placing engineers directly in the operational environment, where the real constraints live — last-minute orders, unexpected absences, emergency repairs, and the constant reshuffling"【S15，Emerj】（搜索摘要）。
- 负责人亲自下现场："She has been donning a hi-vis gilet, hard hat, boots and safety glasses to bring AI to vastly different industrial settings."【S18，diginomica】（搜索摘要）
- 访谈对象：工程团队、操作工、技术员，也就是 "the people who live the problem every day"【S16/S17】（搜索摘要，出自 Tech Talks Daily / GEC Newswire 的结果集）。

**第 2 步：量化痛点（先做诊断评估）**
- Nexus Black 的评估发现 38% 的维修是紧急或纠正性维修【S8】（搜索摘要，Kriti Sharma 原话见第 2 节）。这个 38% 是**厂商驻场评估得出的基线**，不是客户早就掌握的 KPI。

**第 3 步：挑破冰点（先窄后宽）**
- 用驻场学到的东西 "to pick the best starting point for AI to help the business shift to predictive maintenance"【S7】（搜索摘要）。也就是说，第一个场景定在**预测性维护**，而不是一上来铺全厂。
- IFS 公开的初期用例清单里也把预测性维护排在第一位："predictive maintenance, manufacturing scheduling optimization, AI copilots for service and sales, and intelligent automation for finance and supply chain"【S1】（搜索摘要）。

**第 4 步：接数据，不推翻原有系统，直接"插"进去**
- "IFS designed an AI solution model that plugged directly into the distillery's existing systems and sensors, reading detailed plant schematics and predicting which parts were likely to fail before they actually did."【S8】（搜索摘要）
- 能读 P&ID（管道仪表流程图）："plugs into every system and schematic in the operation, even piping and instrumentation diagrams typically analyzed by top engineers"【S7】（搜索摘要）。
- 实时和历史数据一起看，赶在报警之前预警："monitors live information from sensors alongside historic data about each asset and flags a potential problem **well before the sensor would trigger an alarm**"【S7】（搜索摘要）。
- 技术上用 MCP 连老系统、用 Skills 管理"几十年的工业数据上下文"【Claude原文 S0】。

**第 5 步：设计人机协作，一线工人的交互方式是整个设计的核心**
- 输入方式：**语音 + 自动转写**，工人说话就能报故障、记录修复（详见第 4 节反转 1）【S7】。
- 多模态诊断："captures video to detect abnormal movements, audio to interpret sounds like rattling pipes, and changes in temperature and pressure"【S8】（搜索摘要）；"Technicians can diagnose faults by capturing the sound of a rattling pipe, video of a part moving strangely or pressure fluctuations"【S4 等结果集】（搜索摘要）。
- 分工：AI 负责诊断，并给出 "step-by-step repair guidance"，维修还是人来做【S6，nexusblack.com/resolve】（搜索摘要）；Claude 原文的说法是 "acts as an extension of an engineer's expertise"【S0】。
- 闭环学习："feeds every fault and fix back into the system, getting smarter for next time"【S6】（搜索摘要）。

**第 6 步：从单点诊断扩展成智能体流程，并加上治理**
- 用 Agent SDK 串起 "initial diagnostics to parts ordering and final verification"【Claude原文 S0】。
- 治理机制："Implementing governance via supervisor agent frameworks to monitor autonomous workflows and mitigate hallucination risks"【S15，Emerj】（搜索摘要）。
- 信任问题："The challenge is not building the technology, it is building trust in it."【S16/S17】（搜索摘要）。IFS 引用了自家调研："88% of executives report AI has already improved profitability, only 29% are 'completely happy' to let AI make critical decisions without human review"【S17】（搜索摘要）。

**第 7 步：把项目做成产品，再复制到其他行业**
- "The solution that was built became Resolve – a product now available across manufacturing, field services, utilities, and more."【S7】（搜索摘要）
- 2025-11-13，Resolve 在纽约 IFS Industrial X Unleashed 大会上正式发布，是 IFS 与 Anthropic 合作的第一款产品【S4/S10】（搜索摘要）。
- 2026-02 推出 Resolve for Utilities（面向电力和燃气公司的抗灾抢修）【S5】（搜索摘要，镜像稿日期为 2026-02-04）。
- 同一届大会上，Nexus Black 还展示了航空适航指令分析、电网检修排序、多模态（视频、振动、热成像、压力）预测性维护等方案【S21，Futurum】（搜索摘要）。

**花了多长时间？**
- **William Grant 项目的具体周期：未找到公开信息。**
- 能找到的只有官方的通用说法："delivering breakthrough AI products and measurable customer results within weeks"【S3】；"in days and weeks, not years"【S17】；Emerj 概括的主题是 "Moving from multi-year implementations to **three-week** production-grade results"【S15】（以上均为搜索摘要。"三周"是 Emerj 对 IFS 高管访谈的主题概括，**不是**酒厂项目的实际用时，不能直接套用）。

---

## 4. 关键反转 / 转折点（最重要）

### 反转 1（最强）：从"工业聊天机器人"到"它不是聊天机器人，是一个能听、能看、能开口说话的同事"
- **原本的做法/默认形态**：行业默认的 AI 形态是 chatbot/copilot。Claude 原文把 Resolve 称为 "an AI assistant"【S0】；IFS 发布会上公开的初期用例里也写着 "AI copilots for service and sales"【S1】。
- **现场发现**：戴防护手套的工程师没法打字。【Claude原文 S0】"Engineers can't type into a chatbot when they're wearing gloves." 酒厂项目报道里明确写了这是**在现场学到的**。【S7】（搜索摘要，**可能是转述**）："working on the ground taught them that a chatbot with text input isn't much use to an engineer wearing protective gloves"
- **调整后的做法**：改成语音唤醒加自动转写，工人**张嘴就能诊断故障、上报维修**，同时支持拍视频（看异常动作）、录声音（听管道异响）、读压力和温度【S7/S8】。【S7】（搜索摘要）："so it has to be voice activated with automatic transcription so they can diagnose faults and report fixes just by talking"
- **效果/定位变化**：产品官网直接写 "Resolve isn't a chatbot – it interprets audio, video, or shifts in pressure to diagnose a fault"【S6】（搜索摘要）。酒厂结果见第 5 节（预计年省 £840 万，单厂）。
- **注意**：这个反转在 Claude 原文里只是一句"约束条件"，"原来以为→现场发现→改了"这条完整因果链只出现在 **IFS 赞助的 Manufacturing Dive 内容**里（S7），而且我们只看到了搜索摘要。**发布前必须打开原页核对原句。**

### 反转 2：扩建完产能上去了，效率却没上去
- **原本以为**：大规模扩建完成后效率会提升【S0】"had just completed a major expansion… saw an opportunity to improve efficiency"。
- **实际情况**："operations were not as efficient as hoped"，原因是 "ageing infrastructure and fragmented data"，结果是产量和批次损失【S8】（搜索摘要）。
- **调整**：不另起炉灶，直接接入现有传感器和图纸，从"报警后抢修"转向"报警前预判"【S7/S8】。
- **效果**：停机减少、产出提升【S0】"slashed downtime and boosted output"（Claude 原文没给停机时长的前后数字）。

### 反转 3：报警了才修 → 报警之前就预判
- **原本做法**：故障 "caught only after alarms sounded"（出现在含 S7 的搜索摘要里）。
- **调整后**：把实时传感器数据和每台设备的历史数据一起看，"flags a potential problem well before the sensor would trigger an alarm"【S7】（搜索摘要）。
- **效果**：首次修复率提升、停机减少、产出提升，这三项被列为 £840 万的来源："thanks to more first-time fix rates, less downtime, and higher output"【S7】（搜索摘要）。

### 反转 4：不给通用工具，先驻场几天再挑一个起点
- **行业常见做法**：发一个通用 AI 工具，然后陷进"试点炼狱"【S16】（搜索摘要）。
- **Nexus Black 的做法**：先驻场几天，"pick the best starting point"【S7】；"building solutions alongside customers rather than handing over generic tools leads to faster adoption"【S16】（搜索摘要）。
- **客户的评价**（验证了这个反转）：【Claude原文 S0】"they weren't trying to apply something generic… practical, fast, and connected to results, not theory."

### 反转 5：一个客户项目最后变成了公司的旗舰产品（FDE → 产品化）
- 酒厂项目里做出来的方案 "became Resolve"【S7】（搜索摘要），然后扩展到公用事业、航空航天等行业【S5/S21】。Claude 原文："Resolve represents the first major product from IFS Nexus Black's work with Anthropic"【S0】。
- IFS 官方也把这个模式写进了财报新闻稿："Forward-deployed engineers turn customer challenges into AI solutions. These AI solutions are productised at unprecedented speed and scale."【S3】（搜索摘要）

### 隐含反转（Claude 原文里）
- "Claude's capabilities opened up approaches that weren't possible before"【S0】：暗示多模态看图、读图纸之前做不到，但原文**没有**说以前试过什么方案、失败率是多少。**未找到公开信息**。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 救火式（紧急/纠正性）维修占比，William Grant | 38% | 原文没给"之后"的比例 | 【Claude原文 S0】"38% of repairs were reactive"；【S8】Kriti："38 percent of maintenance work was emergency or corrective repairs"；【S4】"38% of repairs carried out by engineers were emergency, not proactive" | 三个版本口径有细微差别：reactive repairs / emergency or corrective maintenance work / emergency repairs by engineers。基线出自 **Nexus Black 自己的评估**（S8）。另有一条搜索摘要写成 "Nearly 40%"（出自含 S7 的结果集，四舍五入的说法）。**没有公开"之后"的占比** |
| 年度节省，William Grant 单厂（Girvan） | — | **预计** £840 万/年 | 【Claude原文 S0】"estimates… £8.4 million a year at this one site alone—once they are in business-as-usual mode"；【S4】"estimated £8.4 million annual savings once operations stabilise"；【S12】"around £8.4m (US$11.1m)"；【S20 Techzine】"expects to save 8 million pounds"；【S7】"at Girvan… thanks to more first-time fix rates, less downtime, and higher output" | **是预估值，不是已实现的节省**，前提是"进入常态运营以后"。只算一个厂区。构成是首次修复率、停机、产出三项，但**没有拆分**。Techzine 取整写成 "8 million pounds" |
| 故障解决速度 | — | 快 25% | 【Claude原文 S0】"Resolves faults in assets at a plant, site or in the field 25% faster" | **外部没找到对应的客户、基线或统计周期**。只出现在 Claude 故事里（包括页面 meta 描述） |
| 冗余库存 | — | 减少 20%（公用事业客户） | 【Claude原文 S0】"20% reduction in excess inventory — Utilities cut unnecessary stock through predictive maintenance and smart sourcing" | **外部没找到来源**，哪家公用事业、什么时间段都不清楚（这条专门搜过，没有结果）|
| 极端天气后恢复供电的速度 | — | **最多**快 40% | 【S5】"Gas and utilities firms report restoring power up to 40% faster following major weather events"；【S13】"up to 40 per cent faster power restoration after major disruptions"；【S25】Ronald van Loon 在 X 上转述 Kriti 的话："cutting utility power restoration times by 40% during extreme weather" | 这个数字**不在 Claude 故事里**（Claude 原文讲抗灾场景时没给数字）。"up to"（最多）、"firms report"（客户自报），**没有点名具体公司** |
| 经验差距（产品主张） | 2 年工龄工程师 | 相当于 20 年老师傅的专业水平 | 【S6，nexusblack.com】"gives an engineer with two years on the job the expertise of one with twenty"（搜索摘要）| **营销口号**，不是测量出来的结果 |
| 交付周期（通用说法） | 多年期实施 | "weeks"/"three-week production-grade results" | 【S1/S3/S15/S17】（搜索摘要）| 通用宣传口径，**不是**酒厂项目的实际周期 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **厂商内部单独设 FDE 单元，用"共同投资"绑定客户**：客户出场景和数据，厂商出 AI 工程师、领域专家、方案架构师、产品经理和 UX，客户可以提前用上新能力，并参与塑造产品【依据 S1/S19】。
2. **四阶段节奏：定义问题 → 验证价值 → 加速开发 → 数字化延续**，先证明值不值得做，再加速【依据 S1】。
3. **先驻场，再选点**：工程师在现场待几天，搞清楚真实约束（插单、缺勤、急修），然后只挑一个最好的起点（酒厂挑的是预测性维护）【依据 S7/S15】。
4. **先用自己的评估把痛点量化成一个基线数字**（38% 救火式维修），后面的 ROI 叙事全都锚定在这个数上【依据 S8】。
5. **交互方式跟着一线工人的身体条件走**：戴手套就用语音，环境嘈杂就拍视频、录声音、读传感器，而不是把办公室里的聊天框直接搬到车间【依据 S0/S6/S7】。
6. **不推翻老系统，直接"插"进去**：接现有传感器、读 P&ID 图纸，用 MCP 连遗留系统【依据 S0/S7/S8】。
7. **人做决定，AI 做诊断和指导，监督型智能体做治理**：回应"只有 29% 的高管完全放心让 AI 不经人工复核就做关键决策"【依据 S6/S15/S17】。
8. **把一个客户的定制方案做成可复制的产品**，从酒厂到电网再到航空【依据 S3/S5/S7/S21】。

---

## 7. 数字严谨性 & "评论区喷子"防御

**A. 哪些是自报、口径是什么**
- **£840 万是"预计"值**，前提是"进入常态运营以后"，而且只算一个厂区【S0/S4】。说成"已经省了 £840 万"会被抓住。推荐说法："客户预计单厂每年可省约 840 万英镑"。
- **38% 是 Nexus Black 自己评估得出的基线**【S8】，而且公开材料里**没有"之后"降到多少**。
- **25% 和 20%**：只在 Claude 故事里出现，**没有客户名、基线和统计周期**，外部也找不到出处。建议只作为次要数字，并注明是厂商在 Claude 客户故事中的口径。
- **"最多快 40%"**：出自 IFS 的 Resolve for Utilities 新闻稿，措辞是 "up to" 和 "firms report"【S5】，没有点名具体公司。
- **Manufacturing Dive 那篇（S7）是赞助内容**（URL 路径是 `/spons/`），本质上是 IFS 付费发布的品牌稿。"驻场几天"和"手套→语音"这两个最关键的过程细节都出自这篇，属于**厂商自述**。
- **"两年工龄=二十年老师傅"**是营销口号【S6】。

**B. 可能被挑刺的地方**
- **"它不是聊天机器人"和 Claude 原文里的 "AI assistant" 说法不一样**：可以解释为产品形态从文本对话转向了语音加多模态（本质上还是 LLM 助手），视频里别说得太绝对。
- **"离线/海上风电没信号"**：Claude 原文把这列为挑战，但**没找到任何公开信息说明 Resolve 怎么做离线运行**。不要在视频里说"Resolve 能离线用"。
- **ABI Research 的质疑性标题**："Nexus Black from IFS: A Hands-on Approach for Helping Manufacturers Deploy AI, **but Will Everyone Be Happy?**"【S19】。摘要里提到工业企业担心自己的数据被用来训练、最后让竞争对手受益。这篇的正文我们没打开，具体质疑了什么（比如会不会挤压实施伙伴和系统集成商的生意）**不清楚**。
- **信任问题**：IFS 自己的调研也承认只有 29% 的高管完全放心让 AI 不经人工复核就做关键决策【S17】。这正好可以用来回应"AI 修设备出了事谁负责"这类质疑。
- **负面报道/事故**：在有限的搜索额度内**没有找到**针对 Resolve 或 William Grant 项目的负面报道。
- **行业标签**：Claude 页面的行业标签是 "Software"，因为 IFS 是软件厂商，最终客户是酒厂，视频里别混淆。

**C. 信息缺口（如实声明）**
- William Grant 项目：**开始时间、周期、驻场人数、有没有先做 PoC、怎么评测、上线以后 38% 降到多少**，全部**未找到公开信息**。
- 25% 和 20% 对应哪家客户：**未找到**。
- 除 William Grant 之外，**被点名的 Nexus Black 客户：未找到**（公用事业、航空都没有公开客户名）。
- 离线/弱网方案：**未找到**。
- 视频和播客（S14/S16/S18/S22/S23）没有拿到文字稿，里面可能还有更多过程细节。**建议人工去看 YouTube "How AI in Manufacturing Powers Predictive Maintenance: A Case Study with William Grant & Nexus Black"（S22）**，这是最可能有现场画面和过程细节的一手素材。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下都是创作建议，不是事实。每条都注明了依据哪个来源编号。

- **开场钩子 A**：“工人戴着手套，你让他在聊天框里打字？”【依据 S0/S7】
- **开场钩子 B**：“一家有 138 年历史的威士忌酒厂，刚扩完产，却发现将近四成维修都是在救火。”【依据 S7 标题中的"138-year-old"、S8 的扩建和 38%】
- **反转桥段（直接对应我们模板里的"对话框→工作台"）**：客户以为要的是"AI 聊天助手" → FDE 在酒厂待了几天，看到老师傅戴着厚手套、满手油 → 聊天框直接作废 → 改成"开口说话 + 拍一段视频 + 录一段管道异响"，AI 当场告诉你哪坏了、怎么修 → 产品官网的定位变成一句话："它不是聊天机器人"【依据 S0/S6/S7/S8】。
- **中国化类比**：可以比作老中医的"望闻问切"。**望**是看视频里零件的异常动作，**闻**是听管道异响，**问**是工人开口描述，**切**是读压力和温度传感器【依据 S8 的多模态描述；类比本身是创作】。
- **数字表达**：“单厂一年预计省 840 万英镑（按约 1:9.5 汇率粗算，约合 8000 万人民币，发布前核对当日汇率）”，一定要带上"预计""单厂""常态运营后"【依据 S0】。
- **升华句**：“FDE 真正交付的不是一个项目，而是一款产品：酒厂的方案后来变成了 IFS 卖给全行业的 Resolve。”【依据 S7/S3】
- **二段升华**：“AI 最大的变革发生在你看不见的地方：电线杆上、机房里、酒厂的管道边。”（呼应 Kriti 的 "quiet transformation" 和 S23 主题演讲标题 "Invisible Industrial Revolution"）【依据 S0/S23】
- **评论区预埋**：主动说一句“这个数字是客户预估，要等进入常态运营以后才兑现”，提前堵住喷子【依据第 7 节】。
- **可以借用的一句客户原话**：“他们没拿通用方案来套我们。”（"they weren't trying to apply something generic"）【依据 S0】

---

## 9. 来源清单

> "是否已打开核实"一栏：S0 打开并逐字核对过。S1–S26 在本环境中全部被出网代理拦截（EGRESS_BLOCKED / CONNECT 403），**仅搜索结果摘要可见，未能打开原页**，摘要里的英文可能被搜索引擎改写过。

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S0 | IFS Nexus Black builds industrial AI with Claude | https://claude.com/customers/ifs | Claude原文 | 页面未显示（推测 2025-11 以后，未核实）| **是**（WebFetch + curl，关键句逐字核对）|
| S1 | IFS launches Nexus Black | https://www.ifs.com/en/insights/news/ifs-launches-nexus-black | 公司新闻稿 | 2025-04-23（IFS Connect，伯明翰）| 否，仅搜索摘要可见 |
| S2 | IFS appoints Kriti Sharma as CEO of Nexus Black… | https://www.ifs.com/en/insights/news/ifs-appoints-kriti-sharma | 公司新闻稿 | 2025-07-08（据 Reuters/TradingView 结果链接日期）| 否，仅搜索摘要可见 |
| S3 | IFS Delivers 22% ARR Growth as Industrial AI moves from Promise to Performance | https://www.ifs.com/en/insights/news/ifs-delivers-arr-growth-as-industrial-ai-moves-from-promise-to-performance | 公司新闻稿（财报）| 2025-10-28 | 否，仅搜索摘要可见 |
| S4 | IFS Partners with Anthropic to Develop Powerful Industrial AI Solutions… | https://www.ifs.com/en/insights/news/ifs-partners-with-anthropic （PR Newswire 镜像：https://www.prnewswire.com/news-releases/ifs-partners-with-anthropic-to-develop-powerful-industrial-ai-solutions-accelerating-the-next-industrial-revolution-302614489.html ）| 公司新闻稿 | 2025-11-13（部分报道写 11-14）| 否，仅搜索摘要可见 |
| S5 | IFS Nexus Black Launches Resolve for Utilities | https://www.ifs.com/en/insights/news/ifs-nexus-black-launches-resolve-for-utilities | 公司新闻稿 | 2026-02（Manila Times 镜像为 2026-02-04）| 否，仅搜索摘要可见 |
| S6 | IFS Nexus Black – Resolve 产品页 | https://www.nexusblack.com/resolve | 公司产品页 | 未知 | 否，仅搜索摘要可见 |
| S7 | How do we take a 138-year-old distillery from fixing problems to predicting them? | https://www.manufacturingdive.com/spons/how-do-we-take-a-138-year-old-distillery-from-fixing-problems-to-predicting/823343/ | 媒体**赞助内容**（IFS 品牌稿）| 未知 | 否，仅搜索摘要可见 |
| S8 | Industrial AI: behind the barrel | https://www.fmcgceo.co.uk/industrial-ai-behind-the-barrel/ | 媒体（含 Kriti Sharma 采访）| 未知 | 否，仅搜索摘要可见 |
| S9 | Anthropic: Claude eyes real world impact, industrial use cases | https://www.constellationr.com/insights/news/anthropic-claude-eyes-real-world-impact-industrial-use-cases | 分析机构/媒体 | 2025-11（大会期间）| 否，仅搜索摘要可见 |
| S10 | IFS validates applied Industrial AI platform with real-world impact showcase | https://www.computerweekly.com/blog/CW-Developer-Network/IFS-validates-applied-Industrial-AI-platform-with-real-world-impact-showcase | 媒体（Computer Weekly 博客）| 2025-11-13 | 否，仅搜索摘要可见 |
| S11 | IFS, Anthropic partner on AI for industrial frontline workers | https://www.manufacturingdive.com/news/ifs-nexus-black-anthropic-claude-resolve-ai-industrial-frontline-workers/805534/ | 媒体 | 2025-11 | 否，仅搜索摘要可见 |
| S12 | How IFS & Anthropic are Shielding Supply Chains from Failure | https://supplychaindigital.com/news/anthropic-and-ifs-ai-supply-chains | 媒体 | 2025-11 | 否，仅搜索摘要可见 |
| S13 | Anthropic's bet: Industrial AI will matter more than office AI | https://techinformed.com/anthropics-bet-industrial-ai-will-matter-more-than-office-ai/ | 媒体 | 未知 | 否，仅搜索摘要可见 |
| S14 | The AI in Business Podcast: Solving Hard Industrial Problems with Fast AI Deployment – with Kriti Sharma | https://podcast.emerj.com/solving-hard-industrial-problems-with-fast-ai-deployment-with-kriti-sharma-of-ifs-nexus-black | 播客节目页 | 约 2025-11（Emerj 在 X 上的预告）| 否，仅搜索摘要可见 |
| S15 | Why Industrial AI Projects Stall Before Production | https://emerj.com/why-industrial-ai-projects-stall-before-production/ | 媒体（播客文章版）| 未知 | 否，仅搜索摘要可见 |
| S16 | How IFS Nexus Black Is Turning Industrial AI Into Real World Results（Tech Talks Daily）| https://techtalksnetwork.com/podcast/tech-talks-daily/episode/how-ifs-nexus-black-is-turning-industrial-ai-into-real-world-results （Apple：https://podcasts.apple.com/gb/podcast/how-ifs-nexus-black-is-turning-industrial-ai-into-real/id1018727913?i=1000757218444 ）| 播客节目页 | 2026-03-25 | 否，仅搜索摘要可见 |
| S17 | Industrial AI at ground zero: IFS Nexus Black CEO on solving the hardest real-world problems | https://gecnewswire.com/industrial-ai-at-ground-zero-ifs-nexus-black-ceo-on-solving-the-hardest-real-world-problems/ | 媒体采访 | 2025-11（大会期间）| 否，仅搜索摘要可见 |
| S18 | Executive Intelligence podcast – IFS's Kriti Sharma on harnessing AI for good and for industry | https://diginomica.com/executive-intelligence-podcast-ifss-kriti-sharma-harnessing-ai-good-and-industry | 媒体播客 | 未知 | 否，仅搜索摘要可见 |
| S19 | Nexus Black from IFS: A Hands-on Approach for Helping Manufacturers Deploy AI, but Will Everyone Be Happy? | https://www.abiresearch.com/market-research/insight/7786138-nexus-black-from-ifs-a-hands-on-approach-f | 分析机构（带质疑）| 未知（2025）| 否，仅搜索摘要可见 |
| S20 | One year of IFS Nexus Black: major impact on FSM and manufacturing | https://www.techzine.eu/blogs/analytics/141215/one-year-of-ifs-nexus-black-a-major-impact-on-fsm-and-manufacturing/ | 媒体 | 2026-05-13 | 否，仅搜索摘要可见 |
| S21 | IFS Industrial X: Will the Focus on Physical World Use Cases for AI Resonate? | https://futurumgroup.com/insights/ifs-industrial-x-will-the-focus-on-physical-world-use-cases-for-ai-resonate/ | 分析机构 | 2025-11 | 否，仅搜索摘要可见 |
| S22 | How AI in Manufacturing Powers Predictive Maintenance: A Case Study with William Grant & Nexus Black | https://www.youtube.com/watch?v=XaJlV7HxpVM | 视频（客户案例）| 未知 | 否，**只看到标题** |
| S23 | Keynote – Invisible Industrial Revolution: AI's Biggest Impact Where You Can't See It (Kriti Sharma) | https://www.youtube.com/watch?v=HUwyBW0KWFc | 视频（主题演讲）| 未知 | 否，**只看到标题** |
| S24 | Girvan distillery（维基百科）| https://en.wikipedia.org/wiki/Girvan_distillery | 百科（厂区背景：南艾尔郡的谷物威士忌酒厂，属 William Grant & Sons）| — | 否，仅搜索摘要可见 |
| S25 | Ronald van Loon 在 X 上的帖子（转述 Kriti Sharma 的 40% 数字）| https://x.com/Ronald_vanLoon/status/2009294131529486414 | 社交媒体（用户言论）| 约 2026-01 | 否，仅搜索摘要可见 |
| S26 | IFS launches development service for bespoke industrial AI applications | https://www.aerospacetestinginternational.com/news/ifs-launches-development-service-for-bespoke-industrial-ai-applications.html | 行业媒体 | 2025-04 | 否，仅搜索摘要可见 |
