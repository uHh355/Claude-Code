# 案例：N26 — 用 Claude 接管“文档重、多语言”的银行运营环节（退单争议、实体信件、金融犯罪调查报告、客服对话分析），一年铺开 15+ 个内部场景

> **核实状态说明（第二轮，2026-09-24）**
> - 第一轮时网络只放行 claude.com / anthropic.com，外部来源都只看到了搜索摘要。本轮网络放开后，第 9 节里的外部来源已逐条用 curl 打开原页，去标签后 grep 原句核对。
> - **第一轮的 19 个外部来源（S5–S23）：15 个 ✅，4 个 ❌。**
>   - ✅ 15 个：S5、S6、S7、S8、S10、S11、S12、S13、S14、S16、S17、S19、S20、S21、S22。其中 S8 的原页已 404，是用招聘聚合站的全文转载核对的。
>   - ❌ 4 个，原因如下：
>     - S9：N26 原页和 Greenhouse 接口都返回 404；archive.org 没有快照；web.archive.org 从本环境连接被重置。
>     - S15：medium.com 原页被 Cloudflare 拦截（403），WebFetch 也被出口代理拦截；InsideN26 的 RSS 只收录最近 10 篇，不含这篇。
>     - S18：fintechfutures.com 返回 403。
>     - S23：LinkedIn 返回 999（需要登录）。
>   - 这 4 条相关的事实，能换到其他 ✅ 来源的已经换掉，换不了的已降级或删除。
> - **本轮新增 17 个来源（S27–S43），全部已打开核对。** 其中 Qonto 的 5 篇 Medium 文章，原页同样是 Cloudflare 403，是通过 Medium 官方 RSS（medium.com/feed/qonto-way）取到的作者发布的全文核对的。
> - claude.com 和 anthropic.com 上的来源（S1–S3、S24–S26）第一轮已核对，本轮又抽查了 S1 的 7 条关键原句，全部仍在原页。
> - 第一轮摘要有误、本轮已更正的地方，集中列在第 7 节“第二轮更正记录”。
> - **中文检索**：用 WebSearch 查了 36氪、机器之心、虎嗅等关键词，也试了 36氪站内搜索和 cn.bing（两者都是 JS 渲染，或者返回空结果）。**没有找到关于 N26 或 Qonto 使用 Claude 落地的中文报道。** 中文结果基本都是“用 N26 的卡订阅 Claude”一类教程，和本案例无关。
>
> **⚠️ 主案例建议（本轮结论，文件名不改）：只看“已打开原页核实”的落地过程和反转素材，Qonto 现在明显比 N26 丰富，建议这一期改用 Qonto 做主线，N26 降为对照段落。**
> - **Qonto 有完整的落地链条，每一环都有原句：**
>   - 谁来做：内嵌在公司里的 15 人 AI Lab [S24][S31]
>   - 怎么进现场：先访谈几十位小企业主、坐在旁边看、端到端画出流程 [S31]
>   - 第一个场景：单笔转账智能体 [S31]
>   - 翻车与转向：V1 做成了，技术上没问题，但没人用；改成批量转账的 V2 [S31]
>   - 意外发现：客户敢直接委托 10 万欧的转账 [S24]
>   - 第二个转向：客户已经在自己接非官方连接器，Qonto 选择“收编”这种用法，推出 MCP [S32]
>   - 工程踩坑：生产环境的坑变成评测集 [S33]
>   - 时间线：2025-11 立项，6 周后 beta，2026-04-27 全量上线 [S24][S36]
> - **N26 到现在仍然缺关键素材**：
>   - 在 Claude 阶段，先做了哪个流程、谁做的、踩过什么坑，N26 的人都没有公开说过。
>   - 能核实的“过程”素材要么在 Rasa 时代（2018–2019 年的 Neon 机器人），要么是招聘描述，写的是“要做什么”，不是“已经做了什么”。
>   - 退单“15 欧以下直接认可”出自前员工 2026 年的撰文，页面标注为赞助内容，年份不详，而且作者现在就职于商户侧的退单服务公司。
> - N26 的优势仍然在于“企业内部运营团队落地”这个形态更贴合我们的脚本模板，而且 Claude 原文的数字更多。详见第 10 节。

- **行业**：金融服务。持牌的纯数字银行（Claude 原文："a fully licensed bank"）
- **企业规模 / 地区**：Claude 原文把规模标为 "Large"，地区为 "Europe"；业务覆盖 24 个欧洲市场（"serving diverse, digital-native customers across 24 European markets"）[S1]。N26 自己的招聘页写的是 "a 1,500 strong team of more than 80 nationalities" [S7]
- **Claude 产品标签**：Claude Platform（通过 AWS Bedrock 欧洲区调用）。原文还提到工程团队正在引入 Claude Code，并计划采用 Agent SDK [S1]。2026 年 N26 的后端招聘把 "Claude Code, Gemini Code, GitHub Copilot" 列为工程师日常使用的 AI 编码工具 [S29]
- **Claude 故事发布日期**：2025-11-05。原页正文没有写日期，这个日期取自 claude.com/customers 列表页数据里 N26 条目的 `"date":"2025-11-05T00:00:00.000Z"` 字段 [S2]。两天后（2025-11-07），Anthropic 在官方新闻中把 N26 列为在用 Claude 的欧洲数字原生企业之一 [S3]
- **Claude 原文链接**：https://claude.com/customers/n26
- **落地主体（谁是“FDE”）**：**N26 内部团队（推断）**，Anthropic 以“交流最佳实践的伙伴”身份参与。
  - 没有找到“Anthropic 派驻前置部署工程师”或第三方集成商参与 N26 Claude 项目的公开证据。Claude 原文只写了双方 "partnering closely to exchange best practices on AI development" [S1]。
  - 以下内部团队都已从原页核实（招聘页，2025–2026 年，不一定就是 2024 年项目启动时的组织形态）：
    - **“Intelligent Operations Platforms (IOP)” 板块下的 AI Products 团队**。原文："Our AI Products team acts as a central hub of innovation. We don't just build features; we build and manage AI capabilities that allow every other part of the bank - from Financial Crime and Risk to Growth and Marketing - to become smarter." [S10][S11]
    - **Platform Engineering 下的 AI Platform 团队**：负责 "MLOps and GenAI capabilities" 的基础设施，技术栈里列了 Bedrock。该职位 2025-05-08 已下架，说明这个团队最晚在 2025 年初已经存在 [S12]
    - **Conversational Banking 项目**：隶属 "Product - Assistance"，负责客服智能化 [S7]；配套的后端团队负责 "the backbone of our internal operations" [S29]
    - **Agentic Platform 团队**：隶属 "Tech - Developer Experience"，做的是**给工程师用的 AI 智能体平台**，不是运营自动化 [S8]
  - Claude 故事里唯一具名的人是 Carolina Tavares，头衔为 "Lead Product Manager" [S1]。第一轮引用的 LinkedIn 标题（"Product Lead Cards @ N26"）本轮无法打开（❌ S23），**已删除“她是卡业务产品负责人”的推断**。
- **本案例推荐指数：3 / 5（不变），并建议改用 Qonto 做主线（见文件顶部和第 10 节）**
  - **数字充分度 4/5**：Claude 原文有 70%、50%、15+、5 倍、1–2 周，但每个数字都加了 "up to"、"targeted"、"some" 之类的限定词。
  - **过程和反转素材 2/5（略有改善，但不到 3 分）**。本轮核实后多了几条可用素材：
    - 退单 15 欧规则的原文已核实。
    - Neon 前史：Rasa 时代由产品团队和客服一起挑用例，4 周从想法到生产。
    - 一个跨 7 年的“从回答到办事”：2019 年就写过要让 Neon 能改设置、建储蓄计划，2026 年招聘页才写 "now shifting ... to a system that acts on them"。
    - 但 **Claude 阶段的落地过程和 N26 当事人讲的反转，仍然一条都没有**。
  - **对中国听众的可迁移性 4/5**：信用卡中心的争议交易和拒付、反洗钱可疑交易报告、客诉纸质信件分拣，国内银行都有非常相似的场景。

---

## 1. Claude 原文要点（事实 + 数字）
以下全部为【Claude原文】，来源 [S1]，英文原句已逐字核对（本轮复查仍在原页）。

1. **最多 70% 的任务被自动化，限定在“目标流程”内。**
   > "Automated up to 70% of tasks across targeted processes, with ongoing improvements"
2. **第一年上线 15+ 个内部用例，AI 项目数量增长到 5 倍。**
   > "Deployed 15+ internal use cases within the first year, growing AI initiatives fivefold"
3. **特定流程的人工处理量最多减少 50%。**
   > "Reduced manual processing by up to 50% across specific processes"
4. **新场景最快 1–2 周，从构想走到初步评测。**
   > "Launched new implementations in as little as 1-2 weeks, from ideation to initial evaluation"

   正文里的说法略有不同，范围限定在“部分机会”，终点是“进入测试”：
   > "For some opportunities, the team went from initial implementation to testing after only 1-2 weeks"
5. **2024 年开始使用 Claude，已接入 15 个以上的内部应用。** 同一段又写“正朝 70% 的目标努力”，和第 1 条的“已实现”口径并存（见第 7 节）：
   > "Since beginning work with Claude in 2024, N26 has integrated the AI assistant into more than 15 internal applications, working toward their goal of 70% automation in targeted areas."
6. **痛点是文档重、多语言、靠人工。**
   > "Many essential processes remained manual, document-heavy, and time-consuming." / "Teams spent more and more time on document classification, information extraction, translation, and drafting materials based on complex multilingual sources."
7. **选型理由：推理能力和多模态能力；通过 AWS Bedrock 欧洲区满足合规要求。**
   > "N26 selected Claude for its advanced reasoning and multimodal capabilities" / "Claude's availability through AWS Bedrock in Europe provided the regulatory compliance, security, and scalability that N26 required as a fully licensed bank."
8. **原文列出的五类场景：**
   - **面向客户的虚拟助手**，五种语言，7×24 小时：
     > "N26's customer-facing virtual assistant now provides instant support in five languages, operating around the clock."
   - **客服对话分析**，每天数千通对话：
     > "Claude analyzes thousands of daily conversations, summarizing interactions and identifying trends"
   - **退单（chargeback）**：翻译材料、分析申诉，对有多重核验要求的复杂案件给出建议决定：
     > "For chargeback requests, Claude handles the entire process of translating documentation, analyzing claims, and recommending decisions on complex cases with multiple verification requirements."
   - **实体信件**：对寄来的纸质申诉信做分类，并把处理动作分派给对应团队：
     > "Claude also processes incoming physical claim letters, classifying documents and initiating appropriate actions within the relevant teams."
   - **金融犯罪分析**：综合客户数据、建议处置动作、自动起草调查报告：
     > "In financial crime analysis, the AI assists analysts by synthesizing customer data, recommending actions, and auto-drafting investigation reports."
9. **一线产品负责人的原话：**
   > "Claude was able to identify some details that the human eye missed," said Carolina Tavares, Lead Product Manager at N26.
   >
   > Tavares added: "Deployment was rapid."
10. **结果（定性）：**
    > "Manual processing time and backlogs have decreased significantly" / "The accuracy and traceability of decision-making has improved, meeting the high standards required in the highly regulated banking sector."
11. **下一步有三个方向**：扩大现有自动化；用 agentic 能力处理更复杂的客户交互；增长与个性化洞察。与 Anthropic 的合作涉及以下内容：
    > "multi-agent approaches and secure practices around Model Context Protocol (MCP) and agent-to-agent communication in highly regulated sectors. N26 is also integrating Claude Code to support their engineering teams"

---

## 2. 背景与痛点（结构化）

| # | 痛点 | 依据 |
|---|---|---|
| 1 | **增长压过服务质量**：客户量在多个欧洲市场快速扩张，服务质量跟不上。原文："ensuring service quality could keep pace with growth" | 【Claude原文】[S1] |
| 2 | **流程靠人工、文档多**：分类、抽取、翻译，再根据多语言材料起草文书。原文："document classification, information extraction, translation, and drafting materials based on complex multilingual sources" | 【Claude原文】[S1] |
| 3 | **积压**：互动量上升造成瓶颈。原文："The rising volume of customer interactions created bottlenecks"；结果部分也提到 "backlogs have decreased" | 【Claude原文】[S1] |
| 4 | **退单团队曾被积压逼到“按金额放行”**。前 N26 卡争议负责人 Ben Herut 在 2026-08-14 的专栏中写道（第一人称，逐字）："I saw this constraint firsthand running dispute operations at N26. When the backlog built up faster than the team could work it, the fix was never elegant. We ran internal hackathons to push volume through, and at times made the call to simply accept every claim under 15 euros rather than investigate it, purely to clear space for the higher-value cases that actually posed a real loss to the bank." 他还写道："an analyst's hour is worth more than a 15 euro dispute"。<br>**注意**：<br>- 文章**没写是哪一年**。<br>- 页面标注 "Sponsored Content"。<br>- 作者现任商户侧退单服务商 Chargeflow 的副总裁。<br>- 按他作者页的履历顺序，N26 在 Payoneer、Justt、Chargeflow 之前。<br>所以**不能说成“Claude 上线前”的状态**。 | 【外部来源 S5】✅ |
| 5 | Herut 的身份。原文："He led Card Disputes and Card Fraud Prevention at N26, the European neobank, where he worked the issuer side of chargebacks and first-party misuse. He then moved to Payoneer…" | 【外部来源 S6】✅ |
| 6 | **行业通病是分析师工时稀缺**。原文："Issuer economics have historically included a real constraint that rarely gets named directly: analyst bandwidth."（泛指发卡行，不是专指 N26） | 【外部来源 S5】✅ |
| 7 | **监管压力（反洗钱与合规）**：<br>- 2021 年 BaFin 罚款 425 万欧，并第一次指派特别监察员 [S21]<br>- 2021 年起限制新增客户：每月 5 万人，2023 年底放宽到 6 万人，2024-06-01 解除 [S20]<br>- 2024-05 BaFin 公布 920 万欧罚款，原因是 2022 年可疑交易报告迟报 [S19][S17]<br>- N26 声明称 2022 年起在人员和技术上投入 "over 80 million EUR" [S19]；TechCrunch 报道的数字是 "€100 million" [S20]，两个版本并存<br>- 2025-12-15 BaFin 又一次指派特别监察员，并禁止 N26 在荷兰新发放按揭贷款。原因是 2024 年专项审计发现 "serious deficiencies … in risk and complaint management and in the organization of the lending business" [S21][S22]<br>**N26 与 Claude 的公开材料都没有把 Claude 用例和 BaFin 整改联系起来**，只能当公司背景用，不能写成因果。 | 【外部来源 S17、S19–S22】✅ |
| 8 | **“不按人头同比扩张客服”的战略目标**。原文："Conversational Banking is how N26 scales support without scaling headcount at the same rate. Our ambition is banking as a non event: clients get help in their channel and language of choice, and most issues resolve before a human agent ever needs to be involved." | 【外部来源 S7】✅ N26 招聘页 |
| 9 | **人工客服的体量（2019 年）**：600 多名客服，分布在 7 个地点。原文："our team of more than 600 customer service agents, situated in seven locations around the world" [S27]；"Berlin, Düsseldorf, Münster, Poitiers, Lisbon, San Antonio and Athens is currently staffed by 600+ highly qualified representatives" [S28]。这是 Claude 之前 5 年的数字，只能当历史背景 | 【外部来源 S27、S28】✅ |

---

## 3. 落地过程（FDE 怎么做的）

> 先说结论：**Claude 阶段的具体落地过程仍然没有公开材料**，包括谁驻场、访谈了谁、第一个场景是哪个、中途改过什么。本轮核实后能用的“过程”素材有两类：一类在 Rasa 时代（Neon，2018–2019 年），一类是 2025–2026 年招聘页描述的**工作方式**（写的是“要做什么”，不是“已经做了什么”）。下面按时间顺序排列，缺口直接写明。

**第 0 步（前史，约 2018–2019 年）：自研 Neon 客服机器人，基于开源 Rasa。**
- Rasa 案例原文："Using Rasa, N26 was able to get from idea to production in just four weeks." [S14] ✅
- **当时的做法**。Rasa 案例原文："A product team consisting of data scientists, designers, developers, and product managers, worked closely with customer service to identify the major use cases." [S14]
  - 【编剧建议】这是公开材料里唯一一句接近“FDE 和一线一起挑场景”的原话。但它说的是 Rasa 时代，不是 Claude 时代。
- **选择自研而不是买云方案**。Rasa 案例原文："N26 found existing cloud-based solutions weren't able to fulfill its customization and data protection needs." [S14]
- **效果**。Rasa 案例原文："Soon after going live in the mobile app, N26 quickly saw 20% of customer service requests handled by the AI assistant. N26 is working on bringing this to 30% and beyond." [S14]
  - 页面标题 "30% Customer Service Deflection" 实际上是**目标值**，见第 7 节更正记录。
- **2019 年 N26 自己的说法**：
  - N26 官方博客（2019-06-17）写道："This chatbot speaks five different languages, is available 24/7, and can answer 30% of basic customer enquiries." [S27]
  - 同年 11 月，Martin Schilling 在 LinkedIn 的文章中写道："Based on the open-source machine learning framework Rasa, Neon currently speaks 5 different languages, is available to customers 24/7 and can answer 20% of transactional customer requests." [S28]
- **当时就想让它“办事”**。N26 博客原文（2019）："Our aim for the future is to firmly integrate Neon into our systems so that customers can use it to change app settings, create savings plans or receive urgent help in situations when a live agent isn't available." [S27]
- Claude 原文里“五种语言、7×24”的虚拟助手是不是 Neon 升级而来，**没有公开说明**。

**第 1 步（2024）：选模型，合规先行。** 【Claude原文】[S1]
- 选型理由是推理能力和多模态能力，外加一条硬约束：通过 "AWS Bedrock in Europe" 满足持牌银行的合规、安全和扩展要求。
- 原文："Since beginning work with Claude in 2024"。

**第 2 步：找 AI 的嵌入点，选“文档重 + 多语言 + 规则多”的后台环节。** 【Claude原文】[S1]
- 原文点名的任务类型是分类、抽取、翻译、起草。
- 落到具体场景就是：退单材料翻译和案件分析、实体信件分拣、金融犯罪调查报告起草、客服对话摘要和趋势分析，以及面向客户的虚拟助手。
- **第一个场景（破冰项目）是哪个：本轮重新检索后，仍然没有找到公开信息。** 原文列场景的先后顺序不代表上线顺序。

**第 3 步：人机分工是“AI 出建议和草稿，人拍板”。** 【Claude原文】[S1]
- 退单："recommending decisions"，AI 只推荐决定。
- 金融犯罪："assists analysts … recommending actions, and auto-drafting investigation reports"，AI 辅助分析师，给出处置建议，起草报告。
- 结果部分强调 "accuracy and traceability of decision-making"。
- 具体的审批界面、抽检比例、错误处理机制：**未找到公开信息**。

**第 4 步：短周期评测。**
- Claude 原文：部分场景 "from ideation to initial evaluation" 只用 1–2 周 [S1]。
- 招聘页对 AI 产品生命周期的描述，原文："moving from initial hypothesis, data scoping, and model evaluation harnesses to production deployment and post-launch monitoring" [S11] ✅（这是岗位职责，不是项目回顾）。
- 评测集怎么建、上线门槛是什么：**未找到公开信息**。

**第 5 步：谁在做？中心化 AI 团队、平台团队、产品线团队。** 【外部来源】招聘页已核实，时间在 2025–2026 年。
- **AI Products 团队（IOP 板块）**。原文："Act as the bridge between technical experts (Data Scientists, ML Engineers) and business or Product stakeholders to ensure our models solve real user problems." 工作重点之一是 "augmenting our Operations"。[S10]
  - 【编剧建议】这个角色描述和“FDE”最接近：在技术和业务之间搭桥，由内部人员担任。
- **高级 TPM（GenAI 与 Agentic 系统）**。原文："defining standards, blueprints, and self-service toolkits that allow product squads across N26 to integrate AI capabilities into their own features safely and independently"；重点包括 "automating back-office Operations, enhancing real-time fraud and AML detection (FinCrime)"。[S11]
- **AI Platform 团队**：隶属 Platform Engineering，负责 "scalable, secure, and compliant infrastructure solutions that support MLOps and GenAI capabilities" [S12]。
- **Conversational Banking 后端**。原文："Design, develop, and maintain high-availability, high-performance web applications that serve as the backbone of our internal operations"；"Implement new features and integrations with foundational models and automation systems to empower our back-office teams" [S29]。
- **Agentic Platform 团队（隶属 Developer Experience）**。原文："You will build the products that let hundreds of engineers and non-engineers at N26 work alongside AI every day"；"Build the integrations between AI agents and the systems engineers use every day: issue trackers, code review, CI" [S8]。
  - **注意，这是面向工程研发的 AI 平台，不是运营场景。** 第一轮把它当成运营自助化的证据，本轮已更正。
- ~~AI Developer Platform / AI Gateway / 多 LLM 厂商~~：原页已下线，无法核实，**已删除**（❌ S9）。

**第 6 步：规模化，并对外分享平台经验。**
- 第一年上线 15+ 用例，AI 项目数量增长到 5 倍 [S1]【Claude原文】。
- 2026-05-20 的 AWS Summit Hamburg（当天是星期三；博客写成了 Tuesday）上，N26 讲了一场 AIM303 "Build a well-architected foundation for scaling generative AI"。议程博客的当前原文是："N26's story of building the foundation for AI applications across the organization." [S13] ✅
- **本轮追查的结果**：
  - 查了 AWS Summit Hamburg 官网：资源页目前只有 2025 年的 PDF，2026 年的议程由 JS 动态加载。
  - 查了 AWS 德国博客的 2026 回顾：通篇没有提到 N26。
  - 在 YouTube 上搜索 "N26 AWS Summit Hamburg 2026"：没有这场演讲。
- **所以演讲人、视频、PPT 仍然都没有找到。**

**第 7 步（进行中）：从“能回答”走向“能办事”。**
- Claude 原文的方向是 agentic 能力、Agent SDK、多智能体、MCP 和 agent-to-agent 通信 [S1]。
- N26 招聘页原文（Lead PM - Conversational Banking，Greenhouse 首次发布于 2026-07-30）[S7] ✅：
  > "We build the intelligence in house — N26 owns its own orchestration and intelligence layer rather than renting it from vendors — and the programme is now shifting from an assistant that answers questions to a system that acts on them."
  >
  > "The segment has been newly formed and expanded, the platform foundations are proven, and the interesting work is just starting: taking journeys from containment to genuine autonomous resolution, on infrastructure the bank owns."
- 同一职位写明的**工作方法**（可以当作 N26 自述的方法论，但是岗位要求，不是项目回顾）：
  - "Lead discovery on the contact drivers behind your area, building problem statements from real client voice and operational data rather than assumption."
  - "Instrument your area with resolution first metrics and the counter metrics that prove quality isn't traded for efficiency."
  - "Collaborate with operations, service partners and peer product teams so that what you ship lands in the real workflows of agents and back office teams."
  - "Design compliance, auditability and client protection into every capability from the start."

**总耗时**：从 2024 年开始使用，到 2025-11 故事发布时大约一年（原文："One year after implementing Claude"）[S1]。

---

## 4. 关键反转 / 转折点（最重要）

> 官方故事里**没有**明写的“我们原本以为……结果……”。本轮核实后，反转 1 的前半段（Neon 的定位和“想办事”的旧愿景）有了 ✅ 原文。反转 4 第一轮的依据有误，已改写。**所有反转都不是 N26 当事人亲口讲的“我们踩了坑”。**

### 反转 1：客服助手从“会回答”到“会办事”，一个拖了 7 年的愿景（可信度：中高。两端都有 ✅ 原文，中间过程空白）
- **2019 年，原本的样子**：
  - Neon 基于 Rasa，定位是回答问题、分流。它 "can answer 30% of basic customer enquiries" [S27]，或 "20% of transactional customer requests" [S28]。
  - N26 当时就写下了愿景："so that customers can use it to change app settings, create savings plans…" [S27]
- **遇到的问题**：
  - 客户量增长快过服务质量 [S1]。
  - 战略目标是 "scales support without scaling headcount at the same rate" [S7]。
- **2025–2026 年的调整**：
  - Claude 原文："tackling more intricate customer interactions using advanced models and agentic capabilities" [S1]。
  - 招聘页："the programme is now shifting from an assistant that answers questions to a system that acts on them"；"taking journeys from containment to genuine autonomous resolution" [S7]。
- **效果**：新的分流率或解决率**没有公开数字**。
- 【编剧建议】可以这样讲：“2019 年他们就想让机器人帮客户改设置、建储蓄计划；七年后招聘启事里才写，现在正在从‘回答问题’转向‘把事办了’。”
  - 必须说明：中间这 7 年发生了什么、为什么花了这么久，N26 **没有公开解释**，不能替他们编理由。

### 反转 2：不买现成方案，自建“编排层”（可信度：中高，原文 ✅）
- **一般人的预期**：银行上客服 AI，通常会采购一个现成的厂商方案。
- **N26 的做法有连续性**：
  - Rasa 时代就因为 "existing cloud-based solutions weren't able to fulfill its customization and data protection needs" 而选择自研 [S14]。
  - 2026 年招聘页写的是 "N26 owns its own orchestration and intelligence layer rather than renting it from vendors" [S7]。
  - Claude 在其中是被调用的模型之一，底座是 Bedrock 欧洲区 [S1]。
- **意义**：流程和数据资产留在自己手里。
- **效果**：没有直接数字。
- 第一轮用来佐证“多模型网关”的 S9 已无法核实，**这一佐证已删除**。

### 反转 3（隐含，需谨慎）：退单处理从“按金额放行”走向“AI 读案卷、出建议”
- **原本做法**：积压压不下来时办黑客松冲量，15 欧以下的申诉不查直接认可，只为了腾出分析师时间 [S5] ✅。前员工撰文，**年份不详，页面标注赞助内容**。
- **后来的做法**：Claude 负责翻译材料、分析申诉，针对 "complex cases with multiple verification requirements" 给出建议决定。一线负责人说 "Claude was able to identify some details that the human eye missed" [S1]【Claude原文】。
- **效果**：原文没有给退单场景单独的数字，只有“积压显著下降”的定性描述 [S1]。
- ⚠️ **N26 从未公开说 Claude 取代了“15 欧规则”**。Herut 的文章通篇没提 Claude，也没提 N26 现在的做法。他讲的是 Visa、Quavo 这类发卡行工具的普遍趋势，原文："automation is precisely the kind of tool that removes the need to make that triage call at all"。
  - 脚本只能说“N26 自己的争议团队也曾经不得不这么做”，**不能说成是 Claude 直接带来的改变**。

### 反转 4（第一轮版本已作废，改写）：平台化和自助化
- **第一轮的写法**：“AI 团队逐个接项目 → 业务团队自助接入”，依据是 S8、S9、S10、S11。
- **本轮核实后的更正**：
  - S8（Agentic Platform）是**面向工程师**的 AI 研发平台。
  - S9（AI Gateway、技能市场）原页已下线，无法核实。
  - 能支撑“运营侧自助化”的只剩 S10、S11 两句岗位职责：
    - "Support creation and sharing of 'blueprints' and toolkits that allow other product teams across N26 to integrate AI into their own features autonomously and safely" [S10]
    - "self-service toolkits that allow product squads … safely and independently" [S11]
- **结论**：这只能算 N26 **宣称的方向**，算不上有证据的反转。公开材料里**没有**“业务部门主动找上门”这样的原话，"fivefold" 也没有给出基数 [S1]。

### 反转 5（小）：以为 AI 只是“帮人省事”，结果 AI 发现了人漏掉的东西
- 原文："Claude was able to identify some details that the human eye missed" [S1]【Claude原文】。
- 漏掉的是什么细节、发生过多少次：**未公开**。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 目标流程内的任务自动化率 | 未公开 | **最多 70%** | 【Claude原文】S1 | 原文是 "up to"，而且只算 "targeted processes"；同一篇文章另一处写的是 "working toward their goal of 70%"，“已实现”和“目标”两种口径并存 |
| 特定流程的人工处理量 | 基线未公开 | **最多减少 50%** | 【Claude原文】S1 | "up to"，而且只算 "specific processes" |
| 内部用例数 | 2024 年起步 | **第一年 15+** | 【Claude原文】S1 | 标题写 "use cases"，正文写 "internal applications"，口径可能不同 |
| AI 项目数 | 基数未公开 | **增长到 5 倍** | 【Claude原文】S1 | 从 1 个到 5 个也算 5 倍，基数不明 |
| 新场景从构想到初步评测 | 未公开 | **最快 1–2 周** | 【Claude原文】S1 | 只是“部分机会”，终点是进入评测或测试，**不是上线生产** |
| 虚拟助手 | Neon（Rasa，约 2018–2019 年）：上线后不久处理 20% 的客服请求，目标 30%；5 种语言；从想法到生产 4 周 | 5 种语言，7×24 小时（新的分流率未公开） | 之前：【外部来源 S14、S27、S28】✅；之后：【Claude原文】S1 | 20% 和 30% 的口径不同，见第 7 节；前后年份相差 5 年以上，**不能直接对比** |
| 客服对话分析 | 未公开 | 每天“数千通”由 Claude 做摘要和趋势分析 | 【Claude原文】S1 | 定性描述 |
| 退单积压的处理方式 | 办黑客松冲量；15 欧以下直接认可 | Claude 翻译、分析，对复杂案件给出建议决定 | 之前：【外部来源 S5】✅，年份不详，赞助内容；之后：【Claude原文】S1 | 没有量化结果；两者之间的时间衔接未证实 |
| 积压、处理时间 | — | "decreased significantly" | 【Claude原文】S1 | 只有定性描述 |
| （另一家厂商）内容设计类任务耗时 | — | 减少 58%，7 个团队在用，员工写作信心提升 50% | 【外部来源 S16】✅ WRITER 的客户故事（2024-11-06），受访人是 N26 内容设计负责人 Katie Louise Wright | **这是 WRITER，不是 Claude**，不要混用 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **先挑“文档重 + 多语言 + 规则多 + 量大”的后台环节**，别急着做炫酷的前台。N26 的切入点是分类、抽取、翻译、起草四类原子任务 [S1]。
   - 【编剧建议】可以迁移到国内：信用卡中心的争议交易和拒付材料、客诉纸质来函、反洗钱可疑交易报告初稿、跨境业务的外文单据。
2. **AI 推荐，人拍板，全程留痕。** 退单和金融犯罪场景用的都是 "recommending"、"auto-drafting" 这类措辞，结果部分强调 "traceability" [S1]。N26 招聘页原文："Design compliance, auditability and client protection into every capability from the start" [S7]。
3. **合规基础设施是选型的前置条件，不是事后补丁。** N26 用 "AWS Bedrock in Europe" 满足持牌银行的要求 [S1]。Qonto 的说法类似："Security is the foundational layer, and then it's about performance" [S24]。
4. **用极短的评测周期换决策速度**：1–2 周从构想到初步评测 [S1]。
5. **从一线的真实声音出发，同时盯“反向指标”**：
   - "building problem statements from real client voice and operational data rather than assumption" [S7]
   - "resolution first metrics and the counter metrics that prove quality isn't traded for efficiency" [S7]
   - 这是岗位职责里写的方法，不是项目复盘。
6. **内部“FDE”化**：中心 AI 团队在技术和业务之间搭桥 [S10]，再沉淀 blueprint 和工具包，让各产品团队自己接入 [S10][S11]。结果是一年 15+ 用例、项目数增长到 5 倍 [S1]。“搭桥、再沉淀工具包”这两步只有招聘页的描述，没有项目复盘。
7. **编排层自己握着，模型可以换**："owning its own orchestration and intelligence layer rather than renting it from vendors" [S7]。从 Rasa 时代起就是自研路线 [S14]。
8. **第二阶段从“回答”走向“执行”**（agentic、多智能体、MCP）[S1][S7]。执行类动作涉及权限和安全，N26 和 Anthropic 专门在交流 "secure practices around MCP and agent-to-agent communication" [S1]。

---

## 7. 数字严谨性 & “评论区喷子”防御

**所有数字都是 N26 自报，经 Anthropic 发布，没有第三方审计。** 以下几处要特别注意：
- **"up to 70%" 和 "goal of 70%" 在同一篇文章里并存** [S1]。一处说已实现，另一处说是目标。脚本建议写“在选定的流程里，最高做到了七成任务自动化”，不要写“七成业务自动化了”。
- **"up to 50%" 只针对 "specific processes"** [S1]。
- **"15+ use cases" 和 "more than 15 internal applications"** 用词不同 [S1]。另外，虚拟助手是面向客户的，并不算严格意义上的“内部”。
- **"1–2 weeks" 是到“初步评测”或“测试”，不是到“上线”**，而且只是 "some opportunities" [S1]。
- **"fivefold" 没有基数** [S1]。
- **Neon 的分流数字有三个版本（本轮已查清出处）**：
  - Rasa 案例：上线后不久处理 **20%**，**30%** 是目标（"working on bringing this to 30% and beyond"）[S14]；
  - N26 博客（2019-06）："answer 30% of basic customer enquiries" [S27]；
  - Schilling 的 LinkedIn 文章（2019-11）："answer 20% of transactional customer requests" [S28]。
  - 口径不同（全部请求 / 基础咨询 / 交易类请求），时间也不同。
- **N26 不是只用 Claude**：内容设计、法务、市场团队用的是 WRITER，耗时减少 58% [S16] ✅。所以不能把 N26 所有的 AI 成效都算到 Claude 头上。“AI Gateway 接入多家 LLM”这一条无法核实，已删除。
- **可能被质疑的点：一家因合规问题多次被罚的银行，拿 AI 做金融犯罪分析，靠谱吗？**
  - 事实背景（✅）：
    - 2021 年罚款 425 万欧，并指派特别监察员 [S21]；限制新增客户每月 5 万人，2023 年底放宽到 6 万人，2024-06-01 解除 [S20]。
    - 2024-05 公布 920 万欧罚款，原因是 2022 年可疑交易报告迟报 [S19][S17]。
    - 2025-12-15 BaFin 第二次指派特别监察员，禁止 N26 在荷兰新发放按揭贷款。原因之一是 "complaint management" 存在严重缺陷 [S21][S22]。
  - 防御要点：原文写的是 "assists analysts"、"recommending actions"、"auto-drafting"，AI 做辅助和起草，最终决定由人做 [S1]。
  - **公开材料没有把 Claude 用例和 BaFin 整改挂钩，脚本不要暗示两者有因果关系。**
  - 反过来，2025-12 BaFin 点名 "complaint management" 有缺陷，是在 Claude 故事发布**之后**。评论区可能有人拿这一点反问“AI 上了，投诉管理还是被罚”。
- **负面报道**：本轮用英文和中文重新检索，**没有找到**专门质疑 N26 使用 Claude 的报道或论坛讨论。
- **“15 欧以下直接赔”**出自前员工的个人专栏 [S5]。引用时必须写成“据前 N26 卡争议负责人撰文”，并且说明年份不详。另外两点要心里有数：
  - 页面标注 "Sponsored Content"，作者现任商户侧退单服务商 Chargeflow 的副总裁 [S5][S6]。
  - 他的论点是“发卡行的 AI 会让争议更多，而不是更少”，本来就带着商户侧的立场。

### 第二轮更正记录（第一轮摘要有误，本轮已按原页更正）
1. **S14（Rasa 案例）**：第一轮写 Neon“分流 30%”。原页写的是上线后不久 20%，30% 是目标。页面标题 "30% Customer Service Deflection" 容易误导。**已更正。**
2. **S5（Fraudbeat）**：
   - 第一轮写“作者、年份未知”，摘要用的是第三人称 "they ran"。原页是第一人称 "We ran internal hackathons…"，作者 Ben Herut，发布于 **2026-08-14**。
   - 页面可见标题是 "Issuer-Side Chargeback AI: The Other Half of the Chargeback Arms Race"，HTML title 仍是 "Chargeback AI: The Issuer Side of the Race to Automate Disputes"。
   - 页面标注 "Sponsored Content"。
   - **已补充。**
3. **S10、S11（AI Products 团队）**：第一轮的引文是摘要改写版（"central hub of innovation, building and managing…"）。**已换成原页逐字原句。**
4. **S8（Agentic Platform）**：第一轮把它当成“运营/业务团队自助接入 AI”的证据。原页显示它隶属 "Tech - Developer Experience"，做的是让 AI 智能体完成工程研发工作（issue tracker、code review、CI）的平台。**反转 4 已改写。**
5. **S9（AI Developer Platform / AI Gateway / 多 LLM 厂商）**：原页 404，无法核实。**第一轮引文已删除。**
6. **S13（AWS Summit 议程博客）**：第一轮摘要是 "the platform that supports all AI applications across the organization"。原页当前文字是 "N26's story of building the foundation for AI applications across the organization"，页面注明 2026-08-17 修订过。**已更正。** 博客写的 "Tuesday, May 20, 2026" 与日历不符，那天是星期三。
7. **S17 至 S22（BaFin 相关）**：
   - 第一轮写“2024 年罚 920 万欧并派驻特别监察员”，时间线混在了一起。已核实：特别监察员分别在 2021 年 [S21] 和 2025-12 [S21][S22] 指派；920 万欧罚款公布于 2024-05，针对的是 2022 年的违规 [S19]。
   - 第一轮“无法确认出处”的 "over 80 million EUR"，已确认出自 N26 官方声明 [S19]；TechCrunch 报道的是 €100 million [S20]。
   - S17 的日期是 2025-12-16。
   - **已更正。**
8. **第一轮“待核实”的客户增长限制数字**：已由 TechCrunch 核实，2021 年每月 5 万人，2023 年底 6 万人，2024-06-01 解除 [S20]。
9. **Carolina Tavares 的 LinkedIn 头衔**（S23）：无法打开，**已删除**“她是卡业务产品负责人”的推断。
10. **N26 不只用 Claude 的证据**：只保留 WRITER [S16]；AI Gateway 一条已删除。

---

## 8. 【编剧建议】钩子与叙事素材
> 本节是创作建议，不是事实。每条依据都标了上文的来源编号。
> **本轮建议：这一期改用 Qonto 做主线（见第 10 节），N26 的素材作为“银行内部运营”的对照段落。** 下面保留 N26 线的写法，供对照段落使用。

- **钩子 A（反常识）**：“有一家欧洲银行的争议团队，曾经做过这样一个决定：15 欧以下的争议，一律不查，直接赔。”
  - 依据：S5 ✅。必须加“据前 N26 卡争议负责人撰文”，年份不详，不能说成是 Claude 之前的状态。
- **钩子 B（速度）**：“从一个想法到第一次评测，只要两周。一年做了 15 个场景。”
  - 依据：S1。注意是“到评测”，不是“到上线”。
- **钩子 C（人机对照）**：“他们的产品负责人说了一句话：Claude 找到了一些人眼漏掉的细节。”
  - 依据：S1 原话。
- **钩子 D（新，7 年愿景）**：“2019 年，这家银行就说要让客服机器人帮客户改设置、建储蓄计划。七年后，他们的招聘启事上写着：我们正在从‘回答问题’转向‘把事办了’。”
  - 依据：S27 和 S7，都已核实。**不能编造中间 7 年的原因。**
- **类比**：退单（chargeback）可以比作“银行版的网购退货仲裁”：客户说这笔钱不该扣，银行要翻聊天记录、单据、商户回复，而且材料常常是好几种语言。
  - 依据：S1 原文写到退单需要 "translating documentation, analyzing claims … multiple verification requirements"。
- **叙事结构（N26 对照段落版）**：
  1. 痛点：客户暴涨，客服和运营跟不上，积压 [S1]；争议团队一度只能按金额放行 [S5，要加限定]
  2. “FDE”是谁：银行内部的 AI 产品团队，技术和业务之间的桥 [S10]。**不要说“Anthropic 派人驻场”，没有证据**
  3. 切入点：从最“脏”的文档活开始，也就是分类、抽取、翻译、起草 [S1]。**不要编造“第一个项目是退单”，公开信息没说**
  4. 人机分工：AI 出建议和草稿，人拍板，留痕 [S1]
  5. 反转：从“能回答的机器人”到“能办事的系统”，这个愿景拖了 7 年 [S27、S7、S1]
  6. 结果：一年 15+ 场景、项目数翻 5 倍、选定流程最高七成自动化、人工处理量最高减半 [S1]
  7. 升华：“AI 不替你做决定，而是把决定所需的材料在两周内帮你准备好。”（提炼，非原话）
- **中国听众的迁移点**：信用卡中心拒付和争议、客诉来函分拣、反洗钱可疑交易报告初稿、外文贸易单据翻译审核。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S1 | N26 automates customer operations with Claude | https://claude.com/customers/n26 | Claude原文 | 2025-11-05（见 S2） | ✅ 已打开，英文原句逐字核对（第二轮复查 7 条原句仍在） |
| S2 | Claude 客户故事列表页（数据中 N26 的 date 字段） | https://claude.com/customers | Claude官网 | — | ✅ 已打开（第一轮读到 `"date":"2025-11-05..."`；Qonto 2026-09-03，Brex 2025-06-24） |
| S3 | New offices in Paris and Munich expand Anthropic's European presence | https://www.anthropic.com/news/new-offices-in-paris-and-munich-expand-european-presence | Anthropic 新闻 | 2025-11-07 | ✅ 已打开，原句："digital-native companies like Lovable, N26, Pigment, Qonto, and Doctolib" |
| S5 | Issuer-Side Chargeback AI: The Other Half of the Chargeback Arms Race（HTML title：Chargeback AI: The Issuer Side of the Race to Automate Disputes），作者 Ben Herut | https://www.fraudbeat.com/chargeback-ai-issuer-side/ | 行业媒体专栏 / 前员工撰文（页面标注 Sponsored Content） | 2026-08-14 | ✅ 已打开，原句已逐字核对 |
| S6 | Ben Herut 作者页（Chargeflow） | https://www.chargeflow.io/authors/ben-herut | 作者简介 | — | ✅ 已打开，原句："He led Card Disputes and Card Fraud Prevention at N26" |
| S7 | Lead Product Manager - Conversational Banking（N26，Barcelona，Product - Assistance） | https://n26.com/en-eu/careers/positions/8079658（Greenhouse 接口：https://boards-api.greenhouse.io/v1/boards/n26/jobs/8079658） | 客户方招聘页 | Greenhouse 首次发布 2026-07-30，更新于 2026-09-11 | ✅ 已打开，原句已逐字核对 |
| S8 | Backend Engineer - Agentic Platform（N26，Tech - Developer Experience） | 原页 https://n26.com/en-eu/careers/positions/8108866 已 404；核对用的转载：https://www.remocate.app/jobs/backend-engineer-agentic-platform-n26 、https://zapply.jobs/jobs/312d71ef-6e65-413f-b111-0e6a1b999998/ | 客户方招聘页（转载） | 转载页标注 2026-08-25 | ✅ 两个转载页全文一致，已核对（原页 404，Greenhouse 也已下架） |
| S9 | Backend Engineer - AI Developer Platform（N26） | https://n26.com/en-eu/careers/positions/7739236 | 客户方招聘页 | — | ❌ 无法访问：N26 原页和 Greenhouse 接口都返回 404；archive.org 没有快照；web.archive.org 连接被重置；remocate 对应链接 404。**相关引文已删除** |
| S10 | Product Manager - AI Products @ N26（IOP 板块） | https://jobs.earlybird.com/companies/n26/jobs/74688051-product-manager-ai-products（同一职位：https://jobs.insightpartners.com/companies/n26/jobs/85290239-product-manager-ai-products） | 招聘转载（VC 职位板） | 2026-04-17 / 2026-07-04（均已停止接受申请） | ✅ 已打开，原句已逐字核对 |
| S11 | Senior Technical Product Manager — GenAI & Agentic Systems（N26） | Greenhouse 原始：https://boards-api.greenhouse.io/v1/boards/n26/jobs/8028183 ；转载：https://freehire.me/jobs/senior-technical-product-manager-genai-agentic-systems-n26-6jpkkhm4 | 客户方招聘页 | 2026-09-11 | ✅ 原始接口和转载都已打开，原句一致 |
| S12 | Senior Site Reliability Engineer - AI Platform - N26 | https://builtin.com/job/senior-site-reliability-engineer-ai-platform/4485735 | 招聘转载 | 页面注明 2025-05-08 下架 | ✅ 已打开 |
| S13 | The AI Track at AWS Summit Hamburg 2026: From Demo to Deployment（Stefan Christoph，AWS 员工个人博客） | https://schristoph.online/blog/ai-track-summit-hamburg-2026/ | 会议议程博客 | 2026-04-30（2026-08-17 修订）；会议日 2026-05-20 | ✅ 已打开；原文措辞与第一轮摘要不同，已更正 |
| S14 | N26 Case Study: 30% Customer Service Deflection | https://rasa.com/customers/n26 | 供应商案例（Rasa） | 页面无日期；按内容（“200 万客户”“计划进军美国”）推断约为 2018–2019 年 | ✅ 已打开；30% 是目标，已上线的是 20% |
| S15 | History of Neon — Our Customer Service Chatbot（Jean-Pierre Sleiman，InsideN26） | https://medium.com/insiden26/history-of-neon-our-customer-service-chatbot-e86e7d9ba7ea | 客户方技术博客 | 未知 | ❌ 无法访问：Medium 返回 Cloudflare 403，WebFetch 被出口代理拦截，web.archive.org 连接被重置；InsideN26 的 RSS 只含最近 10 篇（最新一篇是 2023-01），不含这篇 |
| S16 | How N26 removes bottlenecks and makes better decisions with WRITER（受访人 Katie Louise Wright） | https://writer.com/blog/n26-customer-story/（58% 另见：https://theapplied.co/use-cases/how-n26-uses-writer-to-scale-content-design-and-cut-time-spent-by-58 ，2025-10-17） | 其他 AI 厂商的案例 | 2024-11-06 | ✅ 已打开 |
| S17 | N26 AML Flaws Prompt Sanctions and €9.2 Million Bafin Penalty | https://fincrimecentral.com/n26-bafin-9m-euros-aml-fine-compliance-flaws/ | 媒体 | 2025-12-16 | ✅ 已打开 |
| S18 | N26 pays €4.25m fine for money laundering failures | https://www.fintechfutures.com/aml-solutions/n26-pays-4-25m-fine-for-money-laundering-failures | 媒体 | 2021 年事件 | ❌ 无法访问：返回 403，web.archive.org 连接被重置。425 万欧这个事实已改用 S21 支撑 |
| S19 | Statement on the fine issued to N26 Bank AG by BaFin on May 9th, 2024 | https://n26.com/en-eu/press/press-release/statement-on-the-fine-issued-to-n26-bank-ag-by-the-federal-financial-supervisory-authority | 客户方新闻稿 | 2024-05-21 | ✅ 已打开，原句："investing over 80 million EUR in personnel and technical infrastructure" |
| S20 | Germany's financial regulator ends anti-money laundering cap on N26 signups after $10M fine（Romain Dillet） | https://techcrunch.com/2024/05/29/german-financial-regulator-lifts-restrictions-on-n26-signups | 媒体 | 2024-05-29 | ✅ 已打开 |
| S21 | BaFin hits N26 with additional oversight（Gabrielle Saulsbery） | https://www.bankingdive.com/news/bafin-orders-n26-additional-oversight-monitor-mortgage-lending-netherlands/807914/ | 媒体 | 2025-12-15 | ✅ 已打开 |
| S22 | BREAKING: N26 blocked from issuing mortgages in the Netherlands over AML concerns | https://www.amlintelligence.com/2025/12/breaking-n26-blocked-from-issuing-mortgages-in-the-netherlands-over-aml-concerns/ | 媒体 | 2025-12-15 | ✅ 已打开 |
| S23 | Carolina Tavares - LinkedIn 个人页 | https://es.linkedin.com/in/carolina-tavares-3b680068 | LinkedIn | — | ❌ 无法访问：LinkedIn 返回 999，需要登录。相关推断已删除 |
| S24 | How Qonto delegates financial admin for small businesses with Claude on Amazon Bedrock | https://claude.com/customers/qonto | Claude原文 | 2026-09-03（见 S2） | ✅ 已打开，第二轮重新逐字核对 |
| S25 | Brex reimagines spend management with Claude in Amazon Bedrock | https://claude.com/customers/brex | Claude原文 | 2025-06-24（见 S2） | ✅ 已打开，第二轮重新逐字核对 |
| S26 | Claude for Financial Services（用于确认该发布中未提及 N26） | https://www.anthropic.com/news/claude-for-financial-services | Anthropic 新闻 | 2025-07-15 | ✅ 已打开（页面未提及 N26、Qonto、Brex） |
| S27 | Here's how we're building the most reliable customer service in the world | https://n26.com/en-eu/blog/building-the-most-reliable-customer-service-in-the-world | 客户方官方博客 | 2019-06-17 | ✅ 已打开（本轮新增） |
| S28 | N26 Service Experience of the Future（Martin Schilling） | https://www.linkedin.com/pulse/n26-service-experience-future-martin-schilling | LinkedIn 文章（N26 高管撰写） | 2019-11-14 | ✅ 已打开，公开文章正文可见（本轮新增） |
| S29 | Lead Backend Engineer - Conversational Banking（N26） | https://boards-api.greenhouse.io/v1/boards/n26/jobs/8104979（站内链接：https://n26.com/en-eu/careers/positions/8104979） | 客户方招聘页 | 2026-08-06 首次发布 | ✅ 已打开（本轮新增） |
| S30 | AI & Automation Manager（N26 市场部）/ Information Security Controls Manager - Cloud & AI Governance | https://boards-api.greenhouse.io/v1/boards/n26/jobs/7845575 ；https://boards-api.greenhouse.io/v1/boards/n26/jobs/7992395 | 客户方招聘页 | 2026-04-28 / 2026-06-15 | ✅ 已打开（本轮新增；只能证明 N26 在市场部和 AI 治理方向也在招人，与运营案例无直接关系） |
| S31 | Ship to think: how we build AI at Qonto（Sophie Cornay） | https://medium.com/qonto-way/ship-to-think-how-we-build-ai-at-qonto-442154f00683 | 客户方博客（Qonto） | 2026-04-27 | ✅ 原页被 Cloudflare 拦截（403），通过 Medium 官方 RSS（https://medium.com/feed/qonto-way）取到全文逐字核对（本轮新增） |
| S32 | Are we killing the Qonto interface by launching MCP?（Sophie Cornay） | https://medium.com/qonto-way/are-we-killing-the-qonto-interface-by-launching-mcp-aa2b81842971 | 客户方博客（Qonto） | 2026-07-21 | ✅ 同上，经 RSS 全文核对（本轮新增） |
| S33 | How We Made LLM-to-SQL Reliable on Real Financial Data（Marianne Ducournau） | https://medium.com/qonto-way/how-we-made-llm-to-sql-reliable-on-real-financial-data-8de07f583ed3 | 客户方工程博客（Qonto） | 2026-05-04 | ✅ 同上，经 RSS 全文核对（本轮新增） |
| S34 | AI at Qonto — Vision Statement（Steve Anavi，联合创始人） | https://medium.com/qonto-way/ai-at-qonto-vision-statement-725a7e2f659b | 客户方博客（Qonto） | 2026-03-23 | ✅ 同上，经 RSS 全文核对（本轮新增） |
| S35 | Humans Don't Disappear. They Reskill.（Steve Anavi） | https://medium.com/qonto-way/humans-dont-disappear-they-reskill-47018ac1b05d | 客户方博客（Qonto） | 2026-06-12 | ✅ 同上，经 RSS 全文核对（本轮新增） |
| S36 | Qonto transforms into an AI-native fintech, deploying intelligent agents across 600,000 businesses（新闻稿 PDF） | https://qonto-assets.s3.eu-central-1.amazonaws.com/blog/images/cache/270429026_press%20release_global_qonto%20ai.pdf | 客户方新闻稿 | 2026-04-27 | ✅ 已下载 PDF 并提取全文（本轮新增） |
| S37 | Qonto rolls out AI agents for banking operations across 600,000 SME customers（Iulia Musat） | https://thepaypers.com/fintech/news/qonto-rolls-out-ai-agents-for-banking-operations-across-600000-sme-customers | 媒体 | 2026-04-29 | ✅ 已打开（本轮新增） |
| S38 | Qonto AI 产品页 | https://qonto.com/en/ai | 客户方产品页 | 访问于 2026-09-24 | ✅ 已打开（本轮新增） |
| S39 | Twin's first AI agent is an invoice-retrieval agent for Qonto customers（Romain Dillet） | https://techcrunch.com/2025/03/27/twins-first-ai-agent-is-an-invoice-retrieval-agent-for-qonto-customers | 媒体 | 2025-03-27 | ✅ 已打开（本轮新增） |
| S40 | Full Story of Brex's AI Hail Mary（Allen Park；Latent Space 播客节目页，含 CTO James Reggio 访谈文字稿） | https://www.latent.space/p/brex | 播客节目页 + 文字稿 | 2026-01-17 | ✅ 已打开（本轮新增） |
| S41 | Brex Agent + Human Ops: How AI is Changing Roles and Workflows at Brex | https://www.firstround.com/ai/brex | 媒体访谈（First Round） | 2025-09-25 | ✅ 已打开（本轮新增） |
| S42 | Long-running agents don't need tools or hosted sandboxes; they need bash（Hercules Gimenes） | https://www.brex.com/journal/long-running-agents-need-bash | 客户方工程博客（Brex） | 2026-07-06 | ✅ 已打开（本轮新增） |
| S43 | 7 ways AI can accelerate expense management | https://www.brex.com/journal/accelerate-expense-management-with-ai | 客户方博客（Brex） | 2025-06-12（2026-01-05 修改） | ✅ 已打开（本轮新增） |

**第一轮“人工继续追”的线索，本轮处理结果：**
- N26 官方博客 "building the most reliable customer service"：✅ 已打开，编入 S27。另外打开了同期的 "Customer support at N26"（2019-04-01，https://n26.com/en-de/blog/customer-support-at-n26）。其中写到 Neon "can handle simple queries" 且营业时间内可随时转人工，**内容与本案例关系不大，未编号**。
- Martin Schilling 的 LinkedIn 文章：✅ 已打开，编入 S28。
- FinTech Futures 视频页 "N26 at FinovateEurope 2023"：❌ 原页返回 403。在 YouTube 找到同名视频（https://www.youtube.com/watch?v=ImX_BLSQEpU ，频道 FinTech Futures）。标题已通过 YouTube oEmbed 核对，**视频内容未审看，也没有取到字幕**，不作为事实来源。搜索摘要称受访人是 N26 数字运营负责人 Jean-Pierre Sleiman，这一点未核实。
- AWS Summit Hamburg 2026 AIM303 的视频或 PPT：**未找到**。官网资源页只有 2025 年的 PDF，YouTube 上也搜不到。
- AWS 德国博客 Summit 回顾（https://aws.amazon.com/de/blogs/germany/aws-summit-hamburg-2026-recap/）：✅ 已打开，**通篇没有提到 N26**。
- 客户增长限制的具体数字：✅ 已由 S20 核实。
- 其他 Neon 相关视频线索，**都只核对了标题，内容未审看**：Rasa Developer Summit 2019 的 "Building Scalable Chatbots by Empowering Content Creators (N26)"（https://www.youtube.com/watch?v=7u28QgFGDp8）；"Fireside Chat Rasa & N26"（https://www.youtube.com/watch?v=N_ZGzDpEe5g）。

---

## 10. 三家对比（N26 / Qonto / Brex）与主案例选择

> 本节第一轮只用了 claude.com 原文。本轮补充了 Qonto 和 Brex 的外部来源（S31–S43），全部已打开核对。

| 维度 | N26（本文件原定主案例） | Qonto | Brex |
|---|---|---|---|
| Claude 原文 | https://claude.com/customers/n26 （2025-11-05） | https://claude.com/customers/qonto （2026-09-03） | https://claude.com/customers/brex （2025-06-24） |
| 形态 | **银行内部运营自动化**：退单、信件、金融犯罪、客服分析 | **面向小微企业客户的产品内智能体**：转账、开票、工资、数据问答，另有 MCP | **面向企业客户的产品内 AI 加内部运营 AI**：报销、审计、政策解读；授信和 KYC 运营 |
| 落地主体 | 内部 AI Products 团队和平台团队（招聘页 ✅，是推断） | "its 15-person AI Lab" [S24]；负责人 Sophie Cornay 的原话："Qonto AI, a startup embedded into Qonto that Steve and I created to ship AI agents directly into the product" [S31] | CTO James Reggio 的原话："another team of just roughly about 10 people who are focused primarily on LLM applications"，出发点是 "what would a company that was founded today to disrupt Brex look like?" [S40]；内部 agent 平台由约 25 人的 systems engineering 团队维护 [S41]。Claude 原文另点名 David Horn、Tim Foster、Jin Shao [S25] |
| 怎么进现场 | **未找到**（Claude 阶段）。Rasa 时代："A product team … worked closely with customer service to identify the major use cases" [S14] | **明确**。原文："Before we write a single line of code, we interview dozens of business owners. We sit with them, map their full workflows end to end, understand where they lose time…" [S31] | 运营侧：COO Camilla Matias 让运营人员从 "people who kind of execute against an SOP" 转为 "build prompts, build evals" [S40]；原文："Rebuild workflows around what AI does best" [S41] |
| 过程时间线 | 2024 年开始；部分场景 1–2 周到初步评测；一年 15+ 用例 [S1] | 2025-03 先与外部初创公司 Twin 合作推出发票抓取智能体（基于 OpenAI CUA）[S39]；2025-11 AI Lab 立项，6 周后首个智能体带着数千名 beta 客户上线 [S24]；2026-04-27 向全部客户开放 Operator 和 Analyst 两个智能体 [S36]；2026 年推出 MCP，首周数千家组织试用，之后办了 191 人报名的黑客松 [S32] | "This effort started in March 2023, when we started kicking the tires on LLMs" [S41]；2025 年夏组建 10 人 AI 团队 [S40]；"After exploring various AI models beginning in 2023" [S25] |
| **已核实的反转** | 没有当事人讲的反转。只有隐含反转（"details that the human eye missed"）和跨 7 年的“回答→办事”（S27 和 S7 两端有原文，中间空白） | **4 条，都有原句**：<br>① **V1 翻车**："We launched V1 of our transfer agent as a single-transfer feature… Technically, it was solid. Adoption didn't follow… We had built the right thing at the wrong scale." 于是改做批量转账的 V2 [S31]<br>② **信任超预期**："We were quite surprised to see transfers of 100,000 euros with agents. We were thinking maybe people would start with a very low amount" [S24]<br>③ **MCP 是被用户逼出来的**："We didn't create the usage. We decided to frame it… We already had customers wiring their own AI agents to their Qonto data… They were using unofficial connectors." [S32]<br>④ **工程踩坑**：一次性内存数据库（ephemeral DuckDB），"It started as a performance choice, but became our strongest security primitive"；"Most of these edge cases came from things that broke or behaved unexpectedly in production"；"faster but wrong is worse than slower but right" [S33] | **3 条，都有原句**：<br>① **单智能体塞满工具不行**，改成多智能体网络："a couple other approaches that we tried along the way that just didn't perform well, which is to overload the the agent with a variety of tools… didn't perform as well as actually having a reimbursement agent that it would collaborate with"；"We kind of just hit the eject button and built our own framework" [S40]<br>② **用强化学习做授信失败**（节目页作者的总结）："one expensive initiative that didn't work at all was using RL for credit decisions & underwriting… the end performance was actually inferior to a simple web research agent" [S40]<br>③ **审计智能体重做**："Our first implementation gave the model purpose-built tools…"，结果上下文被塞满，改成 bash 工作台后，"P90 token usage fell from peaks near 3M tokens per execution to roughly 600k-700k, and P95 execution time dropped by about half" [S42] |
| 人机分工 | AI 建议和起草，人拍板 [S1] | "the agent can prepare, the agent can recommend… but the user makes the decision" [S24]；每笔资金操作都要用户确认，并且要过双因素认证 [S36]；最敏感的场景 "deterministic checks sit alongside the model" [S24] | "review by exception rather than review as the default" [S25]；审计智能体 "escalates the highest-value actions to finance teams" [S42] |
| 关键数字 | 最多 70% 任务自动化；人工处理量最多 -50%；15+ 用例；项目数 5 倍；1–2 周 [S1] | 转账快 2 倍；开票耗时降为 1/3；工资快 5 倍；最高委托 €10 万；一次批量生成 500+ 张发票 [S24]；客服机器人 Moshi 处理 60% 的常见请求 [S36]，两个月后的说法是 70% 的工单 [S35] | 标题：75% 自动化、169,000 小时/月、$56.5M；正文：60%、73,600 小时/月 [S25]；Brex 自家博客："75% of expenses are prepared entirely with automations"，94% 合规率 [S43] |
| 数字口径问题 | 见第 7 节 | ① **“每月 8 小时”还是“每周 8 小时”**：Claude 原文写 "up to 8 hours every month"，说是 Forrester 分析 [S24]；Qonto 新闻稿和 The Paypers 写 "up to 8 hours per week"，脚注同样是 Forrester TEI 报告 [S36][S37]。**两者相差约 4 倍，上片前只能二选一并注明出处**<br>② Moshi 的 60% 和 70% 口径、时间都不同（常见请求 vs 工单）<br>③ “50 张发票”是供应商付款批量上限 [S36]，“500+ 张”是某个客户的开票批量 [S24]，是两个不同功能 | 75% 和 60%、169,000 和 73,600 小时的差异，**没有找到任何来源解释**。Brex 自家博客里 75% 的定义是 "prepared entirely with automations" [S43]；Claude 正文的 60% 和 73,600 小时是和 "auto-generated receipts and expense documentation" 连在一起写的 [S25]。【推断】两组数字可能统计的是不同范围，但**这一点未证实** |
| 中文报道 | 未找到 | 未找到 | 未检索（不在本文件范围内） |

**主案例建议（本轮更新）：**
1. **只看“已打开原页、逐字核实过”的过程和反转素材，Qonto 已经明显比 N26 丰富。** Qonto 的链条每一环都有原句：
   - 15 人 AI Lab
   - 访谈几十位小企业主，端到端画流程
   - V1 单笔转账没人用，V2 改批量
   - 客户直接委托 10 万欧
   - MCP 是把用户自己的做法收编进来
   - 生产环境的坑变成评测集
   - 时间线：6 周出 beta，5 个月全量上线

   N26 在 Claude 阶段的过程和反转，仍然没有一条是当事人讲的。**建议这一期改用 Qonto 做主线，N26 降为“银行内部运营”的对照段落。** 文件名不改。
2. N26 仍然保留的优势：
   - **形态**：企业内部运营团队落地，更贴合“FDE 进业务现场”的模板。Qonto 是把智能体做进卖给客户的产品里，“现场”是客户的工作流，不是银行后台。
   - **数字**：N26 的 Claude 原文数字更多。
   - 如果脚本坚持讲“内部运营”，N26 仍然可以做，但反转段落只能用反转 1（7 年愿景）和反转 3（退单 15 欧规则，要加限定）。
3. **Brex** 的工程反转很硬（多智能体网络、授信 RL 失败、bash 工作台），适合技术向的听众。但 Claude 原文的标题数字和正文数字不一致，上片前必须处理。另外，Brex 的反转素材大多没有写明用的是哪家模型：S42 的基准测试用了 Haiku、Sonnet、Opus；S40 提到员工可以自选 ChatGPT、Claude、Gemini。
4. Qonto 的推荐指数【编剧建议】可以给 **4.5/5**：
   - 数字 4/5：有“每月还是每周 8 小时”的口径冲突要处理。
   - 过程和反转 5/5。
   - 对中国听众的可迁移性 4/5：对应国内面向小微企业的数字银行和财税 SaaS。
