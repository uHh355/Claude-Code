# 案例：Carta Healthcare — 用 Claude 驱动的“混合智能”平台 Lighthouse，把医院登记库的临床数据摘录从“人翻病历找答案”变成“AI 找证据、人来核验”

> **选题说明（医药槽位，二选一）**：本期主案例选 **(B) Carta Healthcare**，没选 (A) Bluenote。原因：Carta 有第二篇 Claude 官方长文（2026-04-08 工程博客，已打开核实），公开写了**技术路线怎么转向（NLP → LLM）、为什么难点在“上下文工程”而不在 prompt、人机分工、摘录员反馈怎么当天变成线上 prompt、一个最怀疑 AI 的资深摘录员怎么变成共建者**；第二轮又在 Carta 官网找到并打开了多份客户案例 PDF（含一份专门写“上线中途出了什么问题”的《You're Going to Replace Us》）和创始人访谈视频的字幕。Bluenote 在 claude.com 上只有一篇客户故事，外部来源几乎都是融资稿和会议标题，落地过程的公开信息明显更少。Bluenote 的要点见文末附录。
>
> **核实状态说明（第二轮，2026-09-24）**：第一轮环境只放行 claude.com / anthropic.com，外部来源全是搜索摘要。本轮网络放开后，逐条用 curl 打开原页、去标签后 grep 原句核对：
> - **主案例外部来源（第一轮的 S5–S21，共 17 条）**：✅ 已打开核对 15 条；❌ 无法访问 2 条——S8（Carta 博客“Meet the founders”页已 404，Wayback 快照连接被重置），S13（BusinessWire 被 Cloudflare/出网策略 403 拦截；其中“2023 年 3 月 2,500 万美元 B 轮”这一事实已在 Carta 官网新闻稿 S9 里核实到）。S18 视频只核到标题和发布者（YouTube oEmbed），视频内容因 YouTube 要求登录验证未能看；S19 通过 YouTube 自动字幕读到了全文。
> - **本轮新增 13 条外部来源（S22–S34）**，全部已打开原页核对（Carta 官网案例 PDF、官网新闻稿、MedCity News 报道）。
> - **Bluenote 附录外部来源（B2–B7）**：✅ 5 条，❌ 1 条（B6 Fierce Biotech 被 Cloudflare 拦截，WebFetch 也被出网策略拦截）。DIA 2026 演讲“I want to hug your engineers”只能看到议程页摘要，演讲内容本身未公开。
> - **第一轮摘要有误、本轮已更正的地方**：见第 7 节第 12 条（共 6 处：“斯坦福 18 个月”故事细节、官网首页数字、“300+ 摘录员”的出处、Bluenote 的“本地部署”说法、S6 页面内容、摘录员故事的出处）。
> - 标 **【Claude原文】** 的是 claude.com / anthropic.com 原文；标 **【外部来源】** 的本轮都已打开原页核对（✅），除非特别注明 ❌。
> - **中文检索**：用中文关键词检索 Carta Healthcare 和 Bluenote（含 36氪），**没有找到中文报道**；36氪有一篇“字节与 Anthropic 打响 AI 制药暗战”的文章，打开看过，里面没有提到 Carta 或 Bluenote。

- **行业**：医疗（Healthcare）/ 临床数据管理（登记库数据摘录，clinical registry abstraction）
- **企业规模 / 地区**：Claude 标签 “Company size: Medium”，North America【Claude原文 S1】；成立于 2017 年，CEO Brent Dover，“10x growth in the last 3 years, supporting 125+ hospitals”【Claude原文 S2】；总部旧金山（官网页脚地址 “2443 Fillmore St … San Francisco, CA”）【外部来源 S20 ✅】
- **Claude 产品标签**：Claude Platform；Partner: AWS（通过 Amazon Bedrock 调用 Claude）【Claude原文 S1】；Carta 自己的新闻稿说它是 “a real-world implementer of Claude models including Claude Opus 4.5”【外部来源 S31 ✅】
- **Claude 故事发布日期**：2026-01-11（取自 claude.com 客户列表的数据字段，故事页面本身没写日期）；配套工程博客发布于 2026-04-08【S2】
- **Claude 原文链接**：https://claude.com/customers/carta-healthcare ；配套博客 https://claude.com/blog/carta-healthcare-clinical-abstractor
- **落地主体（谁是“FDE”）**：**Carta 自己的团队**，没有第三方咨询方。公开可见的角色有：产品团队和工程团队（跟客户方的摘录员一起打磨平台）【S1、S22】、Applied AI Applications 团队（Hannah Glaser，职位是 Applied AI Applications Manager）【S2】、软件工程经理 Matthew Mazzanti【S2】、工程副总裁兼 CISO Andrew Crowder【S1】，还有 Carta 自己的临床摘录员（博客原话 “Our clinical abstractors”【S2】；官网首页原句 “it’s our 300+ expert abstractors with 200+ years of clinical experience that ensure superior results”【外部来源 S20 ✅】；负责人是临床数据摘录副总裁 Betsy Castillo，“35 years of nursing expertise”【外部来源 S7 ✅】）。Carta 的模式本身就是“技术 + 外包摘录服务”：自家摘录员一直在一线干活、一直给工程团队提反馈，起的作用类似“人肉 FDE”。Carta 招的兼职摘录员是 “100% Remote”【外部来源 S16 ✅】。**有没有工程师驻场、驻了多久，仍未找到公开信息**；公开的案例 PDF 描述的是“客户摘录员测完把问题带回给 Carta 团队、Carta 回去改”的远程反馈回路【S23】。
- **本案例推荐指数：4.5 / 5**（第一轮 4 分，本轮上调 0.5 分）
  - 数字充分度 ★★★★★：22,000 例/年、14 家医院、11,000+ 工时、单例 30 分钟降到 15–22 分钟、复杂病例 5–6 小时降到 90 分钟、年省 3,667–6,050 小时、IRR 98–99%、单个登记库上线从“数月”缩到“一周”，来自 Claude 官方原文；本轮又补了另外两个客户的数字（全国性医疗系统试点医院周转从 60 天缩到 15 天；一个心导管团队年省约 525 小时）。
  - 过程与反转素材 ★★★★★（上调理由）：本轮核到了**创始人亲口讲的起源**（数据收集 18 个月、建模 3 天、变更管理 6 周）、**NLP 时代的原话**（2022 年“让 AI 看摘录员干活、像猴子一样模仿”）、**转 LLM 的年份**（官网写 2023 年）、**一家医疗系统上线的“混乱中段”**（第一次测试一个病例查了 6 小时、数据抓多了、Epic 日志接不进来）、**全国性医疗系统“先一家医院试点、两年后推到 125 家以上”**的上线路径，以及“网络断了，老护士才发现离不开它”的故事。
  - 对中国听众的可迁移性 ★★★★：医院质控数据上报、病历结构化是国内医院的普遍痛点（这是【编剧建议】层面的类比，见第 8 节）。
  - 仍扣 0.5 分：所有过程素材都是 Carta 自己发布的营销材料（案例 PDF 全部匿名，只有 Northern Arizona Healthcare 具名，而它的案例讲的是摘录外包服务，没提 Claude/Lighthouse）；14 家医院那家医疗系统至今没具名；没有找到独立第三方的验证或负面报道。

---

## 1. Claude 原文要点（事实 + 数字）

以下全部出自 S1（客户故事）或 S2（工程博客），均已打开原页核对。

1. **起源**：从斯坦福儿童医院的一个挫败感开始，手工收集数据太慢。
   > “Carta Healthcare began with a simple frustration at Stanford Children’s Hospital: slow, manual data collection was holding back meaningful progress.” 【S1】
2. **定位是“混合智能”**：AI 加上临床专业人员。
   > “…to pair AI with clinical expertise… what Carta refers to as ‘hybrid intelligence.’” 【S1】
3. **痛点基线**：训练有素的摘录员平均每例约 1 小时，复杂病例 5–6 小时；一家医疗系统每年要摘录 2.2 万多例手术，耗费 1.1 万多工时。
   > “Trained abstractors spend, on average, one hour per case… For complex cases, that time can stretch to five or six hours. A single health system might need to abstract more than 22,000 surgical cases per year, spending over 11,000 hours of labor annually.” 【S1】
4. **难点不只在量，还在于病历又乱又不一致**：同一个问题的“正确答案”要靠解读、要调和互相矛盾的记录。
   > “Even within the same hospital, the ‘right answer’ to a registry question may require interpretation, reconciliation of conflicting notes, and deep understanding of clinical intent.” 【S1】
5. **医院内部的传统集成很脆**，EMR 一升级就坏：
   > “…traditional data extraction and integration workflows inside hospitals are notoriously brittle, vary widely from system to system, and often break when electronic medical records are upgraded.” —— Andrew Crowder, VP of Engineering & CISO 【S1】
6. **选模型时，安全是决定因素**；另一个关键是 Anthropic 公开的偏见与对齐研究，这帮他们通过了医院的 AI 审查。
   > “Security was the deciding factor in Carta Healthcare's model selection.” 【S1】
   > “…the published research on bias and model alignment has allowed us to pass rigorous hospital AI reviews.” —— Crowder 【S1】
7. **两阶段流水线**：第一阶段用 Haiku 3.5 和 Sonnet 4 抽取信息，第二阶段用 Sonnet 综合证据、给出建议答案，并对证据打分排序。
   > “In the first phase, Claude Haiku 3.5 and Sonnet 4 extracted relevant information… In the second phase, Claude Sonnet synthesized all extracted evidence to formulate suggested answers to registry questions, scoring and ranking the evidence.” 【S1】
8. **角色转变**：摘录员从“找答案”变成“核验答案”。
   > “They now validate findings rather than hunt for them.” 【S1】
9. **临床专家可以直接改系统**：发现问题就改 prompt，不用改代码，当天就能在生产环境测试。
   > “When abstractors notice an issue, the team adjusts prompts rather than rewriting code—changes that can be tested in production the same day.” 【S1】
10. **结果（一家大型医疗系统，14 家医院，每年 2.2 万多例）**：常规病例从 30 分钟降到 15–22 分钟；复杂病例降到 90 分钟；每年省 3,667–6,050 小时；IRR 稳定在 99%。
    > “Time per case dropped from 30 minutes to 15-22 minutes for routine cases. For complex cases… time dropped to 90 minutes. Annual time savings reached between 3,667 and 6,050 hours, with Inter-rater Reliability consistently at 99%.” 【S1】
    - 本轮核到这组数字的**原始出处**是 Carta 官网 2025 年 9 月的案例 PDF《From Skepticism to Trust: How One Health System Transformed Clinical Data Abstraction for NSQIP Registry》，数字与 S1 完全一致，登记库是 NSQIP（外科质量改进项目）【外部来源 S22 ✅】。
11. **标题数字**：摘录时间最多减少 66%，成本节省 50% 以上，IRR 98–99%。
    > “Reduces clinical data abstraction time by up to 66% while improving data quality” / “+50% cost savings” / “Achieve 98-99% Inter-rater Reliability (IRR) scores” 【S1】
12. **商业结果**：100% 客户留存，90% 的客户会扩大合作。
    > “Carta Healthcare reports 100% customer retention; 90% of customers also expand their engagement over time.” 【S1】
13. **技术路线转向**：早期用 NLP，后来转向 LLM。
    > “Carta Healthcare’s early systems used natural language processing (NLP)… Pattern recognition, it turned out, can't replicate clinical judgment.” 【S2】
14. **最难的是上下文构造，不是 prompt**：
    > “The hardest problems we solved weren't about building a perfect prompt, they were about context construction.” —— Matthew Mazzanti 【S2】
15. **上线提速**：
    > “What used to take months of engineering and QA per registry now ships in a week.” —— Hannah Glaser 【S2】
16. **下一步**：扩展到更复杂的登记场景，比如一个病例里有多台手术。
    > “…including cases with multiple procedures.” 【S1】

---

## 2. 背景与痛点（结构化）

| 痛点 | 说明 | 来源 |
|---|---|---|
| 量大 | 一家医疗系统每年要摘录 2.2 万多例手术，耗费 1.1 万多工时 | 【Claude原文 S1】；原始案例 PDF 同【外部来源 S22 ✅】 |
| 单例耗时 | 平均约 1 小时/例，复杂病例 5–6 小时（博客说“routine case 可达 60 分钟”） | 【Claude原文 S1、S2】 |
| 病历不一致 | 同一个临床发现，在 A 医院是结构化字段，在 B 医院是自由文本。“The same finding might appear as a structured field at one hospital and buried free-text at another.” | 【Claude原文 S2】 |
| 需要临床判断 | 三名摘录员看同一个心脏病例，可能得出不同但都说得通的答案。“three abstractors can review the same cardiac case and reach different but defensible answers” | 【Claude原文 S2】 |
| 时间逻辑陷阱 | “术前体重”必须是手术开始之前记录的。“The most recent weight may have been recorded two days after the operation. That value is inadmissible.” | 【Claude原文 S2】 |
| 出院带药还是住院用药 | “Was aspirin prescribed at discharge?” 要分清是开给病人带回家的，还是住院期间给的 | 【Claude原文 S2】 |
| 集成很脆 | 各家医院系统不一样，EMR 一升级数据管道就断（Crowder 原话见第 1 节第 5 条） | 【Claude原文 S1】 |
| 合规门槛 | 处理受保护的健康信息（PHI），要先过医院 IT 和 AI 审查委员会，否则无法进场 | 【Claude原文 S1】 |
| 起源痛点（本轮更正） | 创始人 Matt Hollingsworth 读斯坦福 MBA 时加入斯坦福的医疗运营研究组 SURF，第一篇论文做手术室“偏好卡”（术前备什么耗材）优化。他说这类项目的时间比例都一样：**数据收集 18 个月（护士往 REDCap 里手工录入），建模只花了约 3 天（一个周末），变更管理约 6 周**。于是他试着用 AI 自动抽数据来复现这些项目，一位合作过的临床医生看了说“你做的是一个 AI 辅助的数据摘录系统”，并介绍他认识了斯坦福儿童医院里**约 120 个整天只做填表（质量上报或科研）的人**。原句（YouTube 自动字幕，逐字照录）：“18 months of data collection which look like a bunch of nurses typing into this thing that's called Red Cap … about three days for me to build the model it was a weekend and then about six weeks of change management” | 【外部来源 S19 ✅，访谈视频自动字幕，约 12:37 起】；时间线“2016 年 MBA 学生在斯坦福儿童医院做手术室效率”见【外部来源 S7 ✅】 |
| 学术 NLP 路线为什么没法商业化（创始人口述） | 学术论文的典型结果是“10 个临床概念里 7 个能复现、3 个不行”；更致命的是在斯坦福训好的模型换一家医院要重新做金标准验证，“it takes years”，净现值算下来是亏的。原句：“on average what you'll find seven out of the 10 … can be replicated three can't” | 【外部来源 S19 ✅，自动字幕约 20:17 起】 |
| 摘录员的心理门槛 | 客户方摘录员第一反应是“You’re going to replace us. We’re going to lose our jobs.”，而且看过太多厂商“promise the moon and deliver a mess” | 【外部来源 S23 ✅】 |
| 客户侧的选择 | Northern Arizona Healthcare（NAH）的管理层曾考虑把摘录外包给第三方，质量经理 Danielle Steven 担心外包会影响数据质量；最后选了 Carta。原句：“a potential shift loomed when management considered outsourcing their data abstraction to a third-party vendor” | 【外部来源 S10 ✅】 |
| 人员断层 | 一家全国性医疗系统的旗舰医院，一位 15 年经验的资深摘录员退休，接任者没有摘录经验；集团同时在找比现有外包商更好的方案，“particularly for the complex CathPCI registry” | 【外部来源 S24 ✅】 |

---

## 3. 落地过程（FDE 怎么做的）

> 说明：Claude 原文给的是“做法 + 原则”，没有具体时间线。本轮用 Carta 官网新闻稿和案例 PDF 补出了**公司层面的时间线**（第 0 步前）和**单个医疗系统的上线过程**（第 11 步）。其余步骤仍是按逻辑顺序整理的，不代表真实的时间先后。

**公司时间线（本轮新增，均已打开原页核对）**

| 时间 | 事件 | 来源与原句 |
|---|---|---|
| 2016 | 一名斯坦福 MBA 学生在斯坦福儿童医院做手术室效率项目，被手工数据的成本和耗时震惊 | “An MBA candidate at Stanford tackled operating room efficiency at Stanford Children's Hospital.”【S7 ✅】 |
| 2017 | 拿到美国心脏病学会（ACC）的一笔资助，公司成立 | “A grant from the American College of Cardiology provided the spark, and Carta Healthcare was born”【S7 ✅】 |
| 2021-07 | 成为 ACC 旗下 NCDR CathPCI 登记库的认证软件供应商，当时的产品叫 Atlas | “Carta’s Atlas data abstraction solution uses AI to abstract data from electronic medical records”【S15 ✅】 |
| 2021-09 | 新闻稿明确写 Atlas 用 **NLP** 读非结构化病历；合作方达 20 个医疗系统的 150 家医院，同比增长 4 倍 | “Atlas uses natural language processing (NLP) to “read” through unstructured data such as clinical notes”【S14 ✅】 |
| 2022-11 | B 轮 2,000 万美元；创始人对 MedCity News 形容当时的技术是“让 AI 看摘录员干活，然后像猴子一样模仿” | “Our technology uses AI to watch an abstractor do their work, and it replicates what they do like a monkey”【S27 ✅】 |
| 2023 | **转向大语言模型** | “In 2023, Carta Healthcare revolutionized clinical data abstraction with Large Language Models”【S7 ✅】 |
| 2023-03 | B 轮扩至 2,500 万美元 | “The $25 million series B funding round in March of 2023”【S9 ✅】 |
| 2023-12 | Brent Dover 接任 CEO，创始人 Hollingsworth 留任董事；2023 年收入涨到 3 倍 | “Dover succeeds former CEO Matt Hollingsworth who co-founded Carta Healthcare in 2017 and who remains a member of the board.”【S9 ✅】 |
| 2024-10 | CEO 称其流程“不绑定某一个大模型” | “our large language model-agnostic process”【S30 ✅】 |
| 2025-05 | B1 轮 1,825 万美元，由 UPMC Enterprises 领投，多家医疗系统的投资基金跟投 | 【S34 ✅】 |
| 2026-01 | Claude for Healthcare 在 J.P. Morgan 医疗大会发布，Carta 同步发稿；Claude 客户故事上线 | 【S31 ✅、S1】 |
| 2026-04 | Claude 工程博客（上下文工程） | 【S2】 |
| 2026-06 | Lighthouse 新增支持 21 个登记库，公司共支持 70 个以上登记库 | “supporting more than 70 clinical registries”【S33 ✅】 |

**第 0 步：从一个医院现场的真问题出发**
- 起点是斯坦福儿童医院的数据收集痛点【Claude原文 S1】。创始人在访谈里讲的细节（本轮已看字幕核实）：研究项目“18 个月收数据、3 天建模、6 周变更管理”，他意识到瓶颈在收数据而不在模型，于是用 AI 自动抽数据复现项目结果；一位临床医生看了演示说“you built a an AI assisted uh data abstraction system”，并带他认识了斯坦福儿童医院约 120 个整天填表的人【外部来源 S19 ✅】。
- 创始人背景：此前做了 6 年高能物理，在 CERN 参与了发现希格斯玻色子的团队。播客节目页原句：“research conducted at CERN as part of the team credited with discovering the Higgs boson”【外部来源 S17 ✅】；访谈字幕里他本人也说 “spent six years lab called [CERN] in Switzerland part of the team there that found a particle called the [Higgs boson]”（自动字幕把 CERN 识别成 “sarin”、Higgs boson 识别成 “hick bosan”）【外部来源 S19 ✅】。
- 早期的另一个“人在环里”的做法：偏好卡项目里，AI 不直接改清单，而是把建议交给护士长决定。创始人原话：“this is a theme that we'll come back in the company later we gave recommendations to the lead nurse”【外部来源 S19 ✅】。

**第 1 步：先试规则和 NLP，发现走不通**
- 早期系统用 NLP 自动抽取登记库数据，后来发现模式识别替代不了临床判断【Claude原文 S2】。
  > “That's where Carta Healthcare started years ago with NLP, and it's exactly why we moved to LLMs.” —— Hannah Glaser 【S2】
- 规则路线的逻辑是“把医生怎么记录某个发现整理成映射，照着写抽取逻辑，再推广”，但病历的一致性撑不起这种做法【S2】。
- NLP 时代的商业解法（创始人 2024 年访谈）：因为纯 NLP 每换一家医院都要重做验证、算不过账，Carta 选择**先承担风险、先卖服务**：医院原来每份表花 100 美元，Carta 报 60 美元，先用人工做，再让系统从摘录员身上学习、逐步降低人工成本。原句：“when they come in Day Zero they're doing it manually when they come in in day 30 it's saving them time when they come in in day 60 it's [saving] them more time”【外部来源 S19 ✅】。2022 年他对媒体说：“Learning from data abstractors works, but trying to replace them entirely does not”【外部来源 S27 ✅】。
- 转 LLM 的年份：官网“Our Story”写的是 **2023 年**【外部来源 S7 ✅】。S2 只说 “years ago” 用 NLP。

**第 2 步：先过医院的安全和 AI 审查（进场门票）**
- 安全是选模型的决定因素。Claude 在 Amazon Bedrock 上可用，有数据隐私保护，并承诺客户数据不用于训练【Claude原文 S1】。
- Anthropic 公开的偏见和对齐研究帮他们通过了医院的 AI 审查【Claude原文 S1】。
  > “That combination of security infrastructure, reasoning capability, and documented research on model alignment allowed Carta Healthcare to clear the high bar of hospital IT and AI review boards, a prerequisite for any system handling patient data.” 【S1】
- 模型选型：评估过好几个模型。“No other model we evaluated showed the same capability for understanding and interpreting clinical documentation.” —— Glaser【S2】

**第 3 步：绕开“按医院逐家定制”的脆弱集成**
- 目标是不被各家医院的特定流程绑住。“We needed an approach that insulated us from these inconsistencies and allowed us to deliver value without being tied to fragile, site-specific processes.” —— Crowder【Claude原文 S1】
- 做法是让 Claude 在语义层面理解结构化和非结构化数据，并给出理由和原文引用【Claude原文 S1】。

**第 4 步：设计两阶段流水线**
- 第一阶段：Haiku 3.5 和 Sonnet 4 从病历中抽取相关信息；第二阶段：Sonnet 综合证据、提出建议答案、给证据打分排序【Claude原文 S1】。
- 效果：准确率提高，摘录员的核验负担变轻【S1】。

**第 5 步：把功夫花在上下文工程上**
- 每个数据点需要的源文档、时间窗、上下文量都不一样【Claude原文 S2】。
- 运行时注入患者特定的上下文，比如“术前血糖”的 prompt 里直接写明手术开始时间，只找这个时间点之前最近的一次血糖【S2】。
  > “Integrating, organizing, and surfacing the right data at the right time is the real work. A perfectly written prompt with bad context gives bad answers.” —— Mazzanti 【S2】

**第 6 步：尽早建细粒度的评测框架**
  > “When something underperforms, you can trace it back to a specific prompt, a context issue, or a retrieval gap rather than staring at an aggregate score… Build your evaluation framework early, make it granular, and design it to isolate variables.” —— Mazzanti 【Claude原文 S2】

**第 7 步：人机分工，AI 出证据，人做判断**
- AI 负责给出建议答案、理由和病历原文引用；人负责核验，行使临床判断【Claude原文 S1、S2】。
  > “Lighthouse isn't a black box. For every data point it extracts, abstractors see the supporting evidence and Claude's rationale.” 【S2】
- 系统能找到人工复核容易漏掉的证据，比如埋在病历深处、或者来自几年前某次就诊的记录【S1】。
- 客户侧的一个具体画面：摘录员说打开病例前就知道“临床故事”了，不用再进 Epic 翻手术记录、化验、生命体征。原句：“We know what we are walking into every case and don’t have to go into Epic. The Lighthouse patient summary is invaluable.”【外部来源 S23 ✅】

**第 8 步：拉最挑剔的一线用户进来共建**
- 一家大型多实体医疗系统里，一位资深、临床功底很强的摘录员起初很怀疑 AI。她和 Carta 产品团队见面，给了详细反馈，并跟工程团队紧密合作打磨平台【Claude原文 S1】。
  > “She met with Carta Healthcare’s product team, shared detailed feedback, and worked closely with engineering to refine the platform.” 【S1】
- 这段故事的原始出处是 Carta 官网案例 PDF（S22），措辞几乎一致，PDF 多一个细节：“She didn’t trust the AI at first and double-checked everything.”；如今 “she trusts Lighthouse 99–100%”【外部来源 S22 ✅】。

**第 9 步：把专家反馈直接变成 prompt，当天上线**
  > “Our clinical abstractors regularly hand us long explanations of how a specific data point works in practice… Instead of spending weeks translating that into data science models and custom code, we use that feedback directly in the prompts.” —— Glaser 【Claude原文 S2】
- 某个字段抽错了，摘录员解释为什么错（有哪些边缘情况、医生通常怎么写、prompt 缺了什么），这段解释直接成为这个字段的输入，修订后的 prompt 当天发布【S2】。

**第 10 步：规模化和扩展**
- 在一家 14 家医院、每年 2.2 万多例的医疗系统上跑 NSQIP（外科质量登记）摘录【Claude原文 S1；外部来源 S22 ✅】。
- 单个登记库的开发加 QA，从“数月”缩短到“一周”【Claude原文 S2】。2026 年 6 月一次性新增 21 个登记库，覆盖 ACC/NCDR、STS、AHA GWTG、ACS、SVS VQI、肿瘤、围产期和核心指标八大类【外部来源 S33 ✅】。
- 公司层面：3 年增长 10 倍，服务 125 家以上医院【Claude原文 S2】；2025 年收入翻倍、新签 25 份合同、10 家医院从别的摘录服务商转来、新招 144 人【外部来源 S32 ✅】；下一步是多手术病例等更复杂的场景【S1】。

**第 11 步（本轮新增）：一家医院/医疗系统具体怎么上线——三份客户案例**

*(a) 全国性医疗系统：先一家医院试点，两年后推到全系统*【外部来源 S24 ✅，匿名】
- 起因：旗舰医院资深摘录员退休 + 集团对现有外包商不满意。
- 做 ROI 测算后分阶段上线，先在一家医院试点，同时用 Carta 的摘录员和 AI 平台。原句：“After a thorough Return on Investment (ROI) analysis … the health system initiated a phased rollout … They began with a pilot program at the initial hospital, leveraging both Carta Healthcare’s expert abstractors and their AI-powered technology platform.”
- 两年结果：摘录周转从 60 天缩到 15 天，IRR 平均 98%–99%。原句：“slashed their data abstraction turnaround time from a lengthy 60 days to a mere 15 days”
- 扩展：决定推到旗下全部 125 家以上医院。原句：“deploy Carta Healthcare’s AI technology and expert abstractors across all 125+ of its hospitals”
- 注意：PDF 没写是否用了 Claude/Lighthouse，只说 “AI-powered technology platform”。

*(b) 一家多实体医疗系统的心导管团队：从“你们要取代我们”到“离不开”*【外部来源 S23 ✅，匿名，2026-05 发布】
- 宣布时：“The room got quiet when leadership brought up the idea.” 团队原话 “You’re going to replace us.”
- 验证：团队挑了一个 STS 病例逐字段核对，**第一次复核一个病例花了 6 小时**。“One case, six hours, because the abstractors checked every single data element.”
- 反馈回路：团队把问题带回 Carta，Carta 回去改。原句：“The Carta Healthcare team listened, went back to the drawing board, and made changes. No defensiveness. No excuses.”
- 混乱中段：转到 CathPCI 登记库时，Lighthouse 在某些地方数据抓多了；Epic 的 Cupid 日志（带时间戳）因医院内部系统限制接不进来，摘录员觉得信息不完整，产生了不信任。原句：“Lighthouse was over-pulling data in certain areas. There were problems getting Epic’s Cupid log to come through due to internal system restrictions … It created distrust.”
- 转机：数据集成问题解决、平台变好，摘录员发现自己“进病例前就有准备了”。
- 结果：最想证明它不行的那位摘录员后来用得最多；常规病例省 5–10 分钟收集上下文的时间，复杂病例每例省 20 分钟；2025 年预计 2,315 例，年省约 525 小时。
- 这份 PDF 没有直接提 Claude；但 Lighthouse 就是 S1 里用 Claude 驱动的产品。时间上看（“Projected Cases for 2025”）大致对应 Claude 驱动时期，但 PDF 本身没说用的是哪个模型。

*(c) Northern Arizona Healthcare（唯一具名客户）：从“黄灯”到“绿灯”*【外部来源 S10、S11 ✅】
- 2023 年第三季度，NAH 的 CathPCI 登记库某项关键质量指标是“黄灯”，原因是 pre-TIMI flow、post-stenosis 等字段缺失，根子在医生病历记录不足。原句：“The core issue wasn’t the clinical care itself, but rather the insufficient documentation being provided by physicians within the Electronic Medical Record.”
- 同一季度引入 Carta 做摘录合作方。做法：每月至少抽 5% 病例做 IRR 评估，平均准确率 98% 以上；共享表格每天复核；Carta 每周出进度和缺失数据报告、每周开协作会；每周向 NCDR 提交数据。
- 转折：和 NAH 质量部门、医生团队一起改记录习惯，最后签了一封 PCI 流程确认函，写明常漏的字段和 NCDR 认可的记录方式。
- 结果：到 2024 年第二季度，基准状态稳定为“绿灯”。
- 人物：NAH 的 Danielle Steven，RN 出身、原来做 STS 摘录，升任质量经理（案例 PDF 写 “Manager of Quality”，ACC 讲稿署名 “Director Quality Outcomes”）；讲稿另一位署名人是 Carta 的 Krystal Stanczyk（Associate Abstraction Manager）【S11】。
- 注意：NAH 案例讲的是 Carta 的**摘录外包服务**，全文没提 Claude、LLM 或 Lighthouse。

**信息缺口（如实标注）**
- 有没有工程师驻场、驻了多久：**仍未找到公开信息**。公开材料里的反馈回路是“客户摘录员测试 → 把问题带回 Carta → Carta 修改”【S23】，加上 Carta 自家远程摘录员的日常反馈【S2、S16】。
- 14 家医院的 NSQIP 医疗系统、S23 的心导管团队、S24 的全国性医疗系统：**都没有具名**。
- 第一个用 LLM 的登记库是哪个、第一家用 Lighthouse 的医院是哪家：**未找到公开信息**。公司最早的现场是斯坦福儿童医院（研究项目阶段）【S7、S19】。
- 从 NLP 切到 LLM：官网写 2023 年【S7】；具体哪个月、先用的哪家模型、何时换成 Claude：**未找到公开信息**（2024 年 10 月 CEO 说流程是 “large language model-agnostic”【S30】）。
- 上线失败或回滚：S23 公开了“抓多了数据”“Epic 日志接不进来”两个问题，但没有写回滚。

---

## 4. 关键反转 / 转折点（最重要）

**反转 0（本轮新增，起源）：以为难在建模 → 其实难在收数据**
- **原本以为**：项目最难的是“建一个厉害的预测模型”。
- **现场发现**：18 个月收数据、3 天建模、6 周变更管理，“the vast majority of that time was in data collection”【外部来源 S19 ✅，自动字幕】。
- **调整**：不做模型了，改做“用 AI 把收数据这一步自动化”，一位医生指出这就是“AI 辅助数据摘录”，并带他见了斯坦福儿童医院约 120 个整天填表的人【S19 ✅】。
- **效果**：公司方向从手术室运营分析转向登记库摘录；2017 年拿到 ACC 资助成立公司【S7 ✅】。

**反转 1：规则和 NLP 路线 → 放弃，改用 LLM 做“临床推理”**
- **原本做法**：把医生怎么记录某个发现整理成规则，用 NLP 模式识别自动抽数【S2】；2021 年的新闻稿明写 Atlas 用 NLP 读病历【S14 ✅】；2022 年创始人形容技术是“让 AI 看摘录员干活、像猴子一样模仿”【S27 ✅】。
- **现场发现的问题**：病历一致性太差，同一个发现在不同医院的写法完全不同；三名摘录员可能给出三个都说得通的答案。“Pattern recognition, it turned out, can't replicate clinical judgment.”【S2】创始人还从经济账上讲过：学术 NLP 一般 10 个概念只能复现 7 个，换一家医院就要重新验证，“it takes years”【S19 ✅】。
- **调整后的做法**：2023 年转向 LLM【S7 ✅】，按训练有素的摘录员的思路来推理：在上下文中读临床语言、权衡互相矛盾的证据、以手术时间为锚做时间推理、处理模糊情况【S2】。
- **效果**：原文说能处理“以前无法自动化的临床复杂问题”。“Enabled processing of clinically complex questions that were previously impossible to automate”【S1】

**反转 2：以为难在写 prompt → 其实难在“喂什么上下文”**
- **原本以为**：把 prompt 写好就行（隐含）。
- **遇到的问题**：“最近一次体重”可能是术后两天量的，这个值不能用；模型再强，没有手术开始时间这个边界也会答错【S2】。客户侧也遇到过同类问题：Epic 的 Cupid 日志（带时间戳）接不进来，摘录员就觉得“信息不完整”，并因此不信任系统【S23 ✅】。
- **调整后的做法**：在运行时组装“对的文档、对的时间窗、对的优先级”，把患者的时间锚点直接写进 prompt【S2】。
  > “The hardest problems we solved weren't about building a perfect prompt, they were about context construction.” 【S2】
- **效果**：S2 把 IRR 达到 98–99% 和“把上下文工程做对”联系在一起（副标题：“how the team reached 99% accuracy by getting context engineering right”）【S2】。注意：这是博客的叙述，两者之间不是严格的因果证明。

**反转 3：最怀疑 AI 的资深摘录员 → 成了共建者和最坚定的用户（最适合做短视频桥段）**
- **一开始**：她经验丰富、临床功底很强，担心 AI 达不到她的标准。“one experienced abstractor was quite skeptical of AI”【S1】；原始 PDF：“She didn’t trust the AI at first and double-checked everything.”【S22 ✅】
- **转折**：她没有拒用，而是跟产品和工程团队坐下来给详细反馈，一起打磨。“her input helped shape Lighthouse into a tool she could rely on”【S1、S22】
- **结果**：她现在完全信任 Lighthouse（PDF：“trusts Lighthouse 99–100%”），复杂病例还拿它当“第二双眼睛”，能抓到术后用药这类容易漏的细节。
  > “Lighthouse doesn’t replace my judgment, it enhances it.” 【S1、S22】
- **同类故事还有两个（本轮新增）**：
  - 心导管团队里“最想证明它不行”的摘录员后来成了用得最多的人：“She could not prove it wrong. Not because the technology was perfect, but because it kept making her job easier.”【S23 ✅】
  - 一位 30 多年经验的护士摘录员，某天晚上网络中断，EHR 和摘录工具都用不了，手上还有 8 个病例当晚要交，她才发现自己已经离不开这个工具。原句：“a network outage cut off access to both the electronic health record and the abstraction tool, leaving eight cases due that night.” 文中她的数字与 S1 那组数字基本一致（常规病例从 30 多分钟降到 15–20 分钟，复杂病例从 5 小时降到约 90 分钟）【S26 ✅】。S26 没说她就是 S1/S22 那位摘录员，脚本里不要把两人写成同一个人。
- **口径注意**：S1 说她在“一家大型多实体医疗系统”（读起来像医院方员工）；S2 引用同一句话时写的是 “As one of Carta Healthcare’s abstractors put it”（Carta 自己的摘录员）。本轮打开的原始 PDF（S22）只写 “When an experienced abstractor began using Carta Healthcare’s Lighthouse platform”，**也没说她是哪一方的人**。脚本里建议统一说“一位资深临床摘录员”。

**反转 4：专家反馈要“翻译成代码”，花几周到几个月 → 反馈直接写进 prompt，当天上线**
- **原本做法**：临床专家的解释要由数据科学团队翻译成模型和定制代码，要几周；每个登记库的工程加 QA 要几个月【S2】。
- **调整后的做法**：摘录员的长篇解释直接进 prompt【S1、S2】。
- **效果**：单个字段的修正当天就能在生产环境测试和发布；一个登记库的上线周期缩到一周。“What used to take months of engineering and QA per registry now ships in a week.”【S2】2026 年 6 月一次性新增 21 个登记库【S33 ✅】。

**反转 5（商业模式层面）：卖人工摘录工时 → 卖“AI 找、人核”的混合服务**
- Crowder 原话：“Selecting Claude as the core LLM has fundamentally changed Carta Healthcare's business model.” 摘录员从 “manual data hunters” 变成 “high-value validators”【S1】。
- 本轮补充：这个“服务先行、系统在服务中学习”的思路在 LLM 之前就有了——创始人 2024 年访谈说，因为纯软件算不过账，Carta 选择 “risk bearing”，按每份表格收费（医院原来花 100 美元，Carta 报 60 美元），再靠系统学习把成本降下来【S19 ✅】。LLM 让这个模式的“学习”从训模型变成了改 prompt【S2】。
- 隐含反转：原文没说“替代摘录员”，而是说“转型”，人始终在环里。心导管团队案例的结尾原句：“Nobody lost their job. The job just got better.”【S23 ✅】

**（隐含）反转 6：先解决“能不能进医院”，再谈“好不好用”**
- 选模型的第一条标准不是效果，而是安全和能不能通过医院的 AI 审查。“Security was the deciding factor”；对齐研究帮他们 “pass rigorous hospital AI reviews”【S1】。

**反转 7（本轮新增，客户侧）：以为问题在摘录 → 其实问题在医生的病历记录**
- **原本情况**：NAH 的 CathPCI 指标是“黄灯”，看上去像数据质量问题。
- **发现**：根子不在摘录，也不在临床治疗本身，而在医生病历里缺少 pre-TIMI flow、post-stenosis 的记录【S10 ✅】。
- **调整**：Carta 每周报告缺失数据 + 每周协作会，推动医生改记录习惯，最后签了一封 PCI 流程确认函。
- **效果**：2024 年第二季度转为“绿灯”。原句：“effective abstraction is More Than Just Abstraction”【S10 ✅】。注意：这是摘录外包服务的案例，不是 Claude/LLM 的案例。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明/风险 |
|---|---|---|---|---|
| 常规病例单例耗时（某 14 院医疗系统，NSQIP） | 30 分钟 | 15–22 分钟 | 【Claude原文 S1；外部来源 S22 ✅】 | 降幅约 27%–50%（本文计算）；同一篇 S1 前文说行业平均 1 小时/例，口径不同 |
| 复杂病例单例耗时 | 5–6 小时 | 90 分钟 | 【Claude原文 S1】 | 降幅约 70%–75%（本文计算）；“复杂病例”怎么定义没披露。S22 的 PDF 里**没有**这一条 |
| 年摘录量 / 年工时 | 22,000+ 例 / 11,000+ 小时 | — | 【Claude原文 S1、S2；S22 ✅】 | 22,000 × 30 分钟 = 11,000 小时，内部自洽 |
| 年节省工时 | — | 3,667–6,050 小时 | 【Claude原文 S1；S22 ✅】 | 约为 11,000 小时的 33%–55%（本文计算） |
| 摘录时间降幅（标题） | — | 最多 66% | 【Claude原文 S1；Carta 官网首页 S20 ✅、新闻稿 S31–S33 ✅】 | Carta 自己一律写 “up to 66%”；Anthropic 的创业者手册 PDF 写成了 “reducing data abstraction time by 66%”（去掉了 “up to”）【S5 ✅】 |
| 成本 | — | 节省 50% 以上 | 【Claude原文 S1；S20 ✅】 | 没给基线和计算方法 |
| 数据质量（IRR） | 未披露 | 98–99%（S1 标题、官网首页）/ 稳定在 99%（S1 案例段）/ “greater than 98%”（S33） | 【Claude原文 S1、S2；S20、S33 ✅】 | IRR 是评分者间一致性，不等于“准确率”；claude.com 行业页卡片写成 “99% accuracy”【S4】；Carta 自己的 NAH 案例也把 IRR 写成 “average accuracy rate exceeding 98%”【S10】 |
| 单个登记库上线周期 | 数月（工程 + QA） | 一周 | 【Claude原文 S2】 | Glaser 自述 |
| 单点 prompt 修正上线 | 几周（翻译成模型和代码） | 当天 | 【Claude原文 S1、S2】 | 自述 |
| 客户留存 / 扩展 | — | 100% 留存；90% 扩展 | 【Claude原文 S1；S31、S32 ✅】 | 公司自报；2023 年 12 月新闻稿称是“第四个连续 100% 留存年”【S9 ✅】 |
| 公司增长 | — | 3 年 10 倍，125+ 家医院 | 【Claude原文 S2】 | 没说“10 倍”指收入还是别的指标；医院数口径和早年说法对不上，见第 7 节第 13 条 |
| 公司年度数字（本轮新增） | — | 2023 年收入 3 倍、医疗系统客户 +50%；2025 年收入 2 倍、新签 25 份合同、10 家医院从别家转来、新招 144 人 | 【外部来源 S9 ✅、S32 ✅】 | 公司新闻稿自报 |
| 全国性医疗系统试点医院的摘录周转（本轮新增） | 60 天 | 15 天 | 【外部来源 S24 ✅】 | 匿名；试点两年；PDF 没说用的是哪个 AI 模型 |
| 心导管团队（CathPCI）年节省（本轮新增） | — | 每例省 5–20 分钟，2,315 例/年，约 525 小时/年 | 【外部来源 S23 ✅】 | 匿名；2025 年是“预计病例数”；PDF 原文写 “Those are not hypothetical numbers” |
| Northern Arizona CathPCI 指标 | 2023Q3“黄灯” | 2024Q2 后“绿灯” | 【外部来源 S10、S11 ✅】 | 摘录外包服务案例，没提 Claude；IRR 抽查每月至少 5% 病例 |
| 斯坦福儿童医院偏好卡项目节省（本轮新增，起源故事） | — | 约 500 万美元/年（创始人口述）/ 400 万美元（媒体转述） | 【外部来源 S19 ✅ / S27 ✅】 | 两个数字、两个机构名（Stanford Children's vs Stanford Health Care）不一致，见第 7 节；这是手术室耗材项目，不是登记库摘录 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **先过“进场门票”，再谈效果**：受监管行业的第一个关卡是安全、隐私和客户方的 AI 审查委员会。Carta 选模型的决定因素是安全，另外拿公开的对齐研究材料去过医院审查【依据 S1】。
2. **先找到真正的瓶颈**：创始人发现研究项目 18 个月花在收数据上、建模只要 3 天，才决定去做“收数据”这一步【依据 S19】。
3. **别用规则去对抗“不一致”**：同一件事在不同单位写法不同时，规则和 NLP 会不断碰到新的边缘情况；应该让模型按专家的推理方式处理【依据 S2、S19】。
4. **Prompt 是最后一公里，上下文才是主战场**：给每个问题配齐对的文档、时间窗和优先顺序，比如把“手术开始时间”作为锚点写进 prompt；数据源接不全（例如带时间戳的日志）时，用户会直接失去信任【依据 S2、S23】。
5. **AI 负责“找和给证据”，人负责“判和签字”**：两阶段流水线（抽取 → 综合打分）加上可追溯的证据和理由，让专家从“找答案”变成“核答案”【依据 S1、S2、S26】。
6. **找最挑剔的一线专家做共建者**：让怀疑者参与打磨，她的专业判断会变成系统能力，她本人也会变成最有说服力的“代言人”【依据 S1、S22、S23】。Carta 自己总结的说法是：“treat the abstractor's skepticism as information rather than obstruction”【S26 ✅】。
7. **把专家反馈回路缩短到“当天”**：用自然语言 prompt 承载领域规则，业务专家的解释能直接变成系统行为，不用排工程需求【依据 S1、S2】。
8. **评测要细到能定位问题**：出错时能分清是 prompt、上下文还是检索的问题，而不是只盯着一个总分【依据 S2】。
9. **先一家医院试点、算清 ROI，再推全系统**：全国性医疗系统的路径是“ROI 测算 → 一家医院试点（服务 + 平台）→ 两年 → 推到 125 家以上医院”【依据 S24】。
10. **服务先行、边做边学**：先用人工按结果交付（按表格计价），让系统从专家身上学习、逐步降低成本；客户第一天就能拿到价值【依据 S19】。

---

## 7. 数字严谨性 & “评论区喷子”防御

1. **“最多 66%”对不上案例数字**：S1 披露的唯一具名规模案例里，常规病例降幅约 27%–50%，复杂病例约 70%–75%，年工时节省约 33%–55%。“up to 66%”是 Carta 公司层面的营销口径，官网首页原文就是 “Reduce abstraction time by up to 66%”【S20 ✅】；Anthropic 的创业者手册 PDF 更是写成了 “reducing data abstraction time by 66%”，把 “up to” 去掉了【S5 ✅】。**建议脚本用“常规病例从 30 分钟降到 15–22 分钟、复杂病例从 5–6 小时降到 90 分钟”这组具体数字**，不要主打 66%。
2. **基线口径不一致**：S1 前文说“平均 1 小时/例”，案例段又说这家医疗系统“每例约 30 分钟”。前者是行业一般水平，后者是这家系统的 NSQIP 病例，不要混用。
3. **“99% 准确率”的说法有风险**：原文指标是 IRR（评分者间一致性），不是对照金标准的准确率。claude.com 医疗行业页的卡片写成了 “99% accuracy”【S4】，S2 副标题也写了 “99% accuracy”；Carta 自己的 NAH 案例也把 IRR 称作 “average accuracy rate”【S10】。脚本建议说“评分者间一致性 98–99%”。
4. **都是公司自报**：66%、50%、100% 留存、90% 扩展、10 倍增长，以及本轮新增的 S22–S26 案例，全部是 Carta 自己发布的材料。14 家医院的医疗系统、心导管团队、全国性医疗系统**都没具名**。本轮仍**没有找到独立第三方或同行评审的验证，也没找到负面报道**（检索了英文和中文）。
5. **利益关系**：S1 带 AWS 合作伙伴标签，是 AWS 和 Anthropic 联合叙事的一部分；Crowder 的同一句话同时出现在 Anthropic 新闻稿【S3】和 claude.com 行业页【S4】；Carta 在 Claude for Healthcare 发布当天发了配合新闻稿【S31】。另外，Carta 的投资方里有多家医疗系统（Memorial Hermann、Mass General Brigham、UPMC 等）【S28、S34 ✅】，客户和股东有重叠。
6. **“摘录员”身份不一致**：见第 4 节反转 3。S1、S2 说法不同，原始 PDF S22 也没写清楚。
7. **“AI 抢饭碗”质疑**：官方叙事是“hybrid intelligence”，人始终在环里核验。Carta 在招兼职远程摘录员（要求 IRR 98% 以上、至少 60 小时摘录工时）【S16 ✅】，但注意这个职位页显示 “this job was removed … on Tuesday, Feb 17, 2026”，已下架。官网首页称有 “300+ expert abstractors”【S20 ✅】；2025 年新招 144 人【S32 ✅】。
8. **CEO 更替**：2023 年 12 月 Brent Dover 接任 CEO，创始人 Hollingsworth 留在董事会【S9 ✅】。本轮打开的官网“Our Story”领导团队名单里已经没有 Hollingsworth，联合创始人里只列了 Jamie Matheson【S7 ✅】。脚本里如果讲“创始人故事”，注意现任 CEO 不是创始人，而且创始人 2024 年访谈里讲的是“风险共担、按表格计价”的 NLP 时代思路，不是 Claude 时代的做法。
9. **成立年份**：S2、S9 写 2017 年成立；官网时间线写 2016 年是 MBA 学生的项目、2017 年拿 ACC 资助成立【S7 ✅】。两者不矛盾。
10. **名称易混淆**：Carta Healthcare 和做股权管理的 Carta 是两家公司（claude.com 上还有一个 “carta” connector，指的是后者）。旁白要说全称。
11. **产品名（本轮已理清）**：2021–2022 年的旗舰产品叫 **Atlas**，基于 Cartographer 平台，用 NLP【S14、S15、S29 ✅】；现在官网产品线是 Voyager（AI 数据平台）、**Lighthouse（AI 辅助摘录）**、Navigator（分析）和专家摘录服务【S7 ✅】。摘录服务页上 Atlas 仍作为“登记库摘录与提交”方案出现【S12 ✅】。Claude 驱动的是 Lighthouse【S1】。
12. **第一轮摘要有误、本轮已更正**：
    - (a) **“斯坦福 18 个月”**：第一轮写“光拿数据就花了 18 个月；他写了个算法自动抽数，项目负责人（PI）建议用到登记库摘录上”，并归到 S6。本轮核实：S6 页面只是播客简介，**没有**这些细节；细节出自同一期访谈的视频（S19），原话是“18 个月收数据、3 天建模、6 周变更管理”，这是他对研究项目时间比例的概括；把他引向登记库的是“one of the clinicians”（一位临床医生），不是 PI。已按 S19 更正。
    - (b) **官网首页数字**：第一轮摘要写 “reduce abstraction time by 2/3 or more… IRR above 99%”。本轮打开首页，原文是 “Reduce costs by 50% or more / Reduce abstraction time by up to 66% / Improve IRR scores to 98-99%”【S20】。已更正。
    - (c) **“300+ expert abstractors… 200+ years of clinical experience”** 的出处是官网首页（S20），不是摘录服务页（S12）；S12 写的是 “200+ seasoned clinicians … 200 years of abstraction experience and 1,000+ years of clinical practice”。两处人数口径不同（300+ 对 200+）。已更正。
    - (d) **CERN / 希格斯玻色子**：第一轮挂在 S8，S8 已 404；本轮在播客节目页 S17 和访谈字幕 S19 核实到，改挂 S17、S19。
    - (e) **Bluenote“本地部署”**：第一轮说 B4 提到支持 on-premise 部署、“混合系统”。本轮打开 B4 原文，**没有** on-premise 字样，也没有 “hybrid” 一词，已删除（见附录）。
    - (f) S1 的摘录员故事，本轮找到原始出处 PDF（S22），措辞与 S1 基本一致。
13. **医院数口径打架（本轮新发现）**：2021 年 9 月 Carta 说 “150 hospitals across 20 health systems”【S14】，2022 年 7 月同样说 150 家【S29】，2022 年 11 月创始人对媒体说 “245 hospitals across 18 health systems”【S27】，2026 年 S2 说 “supporting 125+ hospitals”。数字不是单调增长，可能是“平台覆盖医院”和“实际服务医院”的口径不同，公开材料没解释。**脚本里不要引用医院总数做增长叙事。**
14. **斯坦福节省金额不一致**：创始人访谈说偏好卡项目给斯坦福儿童医院 “saved about $5 million a year”【S19】；MedCity News 转述为 “Stanford Health Care … saved $4 million”【S27】。要用就说“数百万美元”，并注明这是手术室耗材项目。
15. **自动字幕的引用风险**：S19 的原句来自 YouTube 自动生成字幕，有识别错误（如 CERN → “sarin”）。第 2、3 节引的原句已照字幕逐字保留；脚本用时建议意译，不要当作逐字引语上屏。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下全部是**创作建议**，不是事实；每条后面标了所依据的来源。

- **开场钩子（数字型）**：“一家有 14 家医院的医疗集团，每年要靠人工翻 2.2 万份手术病历，耗掉 1.1 万个工时，只为把数据填进质量登记库。”【依据 S1、S22】
- **开场钩子（创始人型，本轮已核实）**：“一个做过希格斯玻色子实验的物理学家，在斯坦福做医院研究时发现：数据收集 18 个月，建模只要 3 天。”【依据 S17、S19】
- **开场钩子（反常识型）**：“病历里记了好几次体重，AI 该用哪一个？答案是：术后两天量的那个不能算。”【依据 S2】
- **反转桥段 1（技术路线）**：“他们先用 NLP 干了好几年，2022 年创始人还说自家 AI 是‘看摘录员干活、像猴子一样模仿’；2023 年他们转向大模型，承认模式识别学不会临床判断。”【依据 S27、S7、S2】
- **反转桥段 2（人）**：“最反对 AI 的，是那位干了很多年的老摘录员。结果她成了产品最重要的共建者，现在复杂病例都让 AI 当她的第二双眼睛。她的原话是：它不替代我的判断，它增强我的判断。”【依据 S1、S22】（注意：不要写死她属于医院还是 Carta，见第 4 节）
- **反转桥段 3（上线现场，本轮新增）**：“医院宣布引入 AI 那天，会议室一片安静，摘录员说：你们是来取代我们的。她们挑了一个最难的病例，一个字段一个字段地核，花了 6 小时。然后把问题清单甩给厂商。”【依据 S23】
- **反转桥段 4（“断网”彩蛋，本轮新增）**：“一个干了 30 多年的护士，某天晚上断网了，手上还有 8 个病例当晚要交。她本以为回到手工很容易，结果发现自己已经离不开它了。”【依据 S26；注意不要说她就是 S1 里那位】
- **FDE 方法论金句**：“不是写一个完美的 prompt，而是在对的时间，把对的资料按对的顺序喂给模型。”【依据 S2 Mazzanti 原句的意译】
- **人机协作画面**：左边是 AI 标出来的证据和理由，右边是摘录员点“确认”或“驳回”。从“找答案的人”变成“签字的人”。【依据 S1、S2】
- **节奏点**：“以前一个专家意见要排几周工程需求，现在当天上线；一个新登记库以前要几个月，现在一周。”【依据 S1、S2】
- **上线路径画面**：“先在一家医院试点，两年后周转从 60 天缩到 15 天，集团决定推到旗下 125 家以上医院。”【依据 S24；注意这个案例没说用了 Claude】
- **中国化类比**：可以类比国内医院的质控数据上报、病历结构化和科研数据采集，都是“从非结构化病历里按规则找答案、还得符合时间逻辑”的活。**这只是类比，没有任何中国落地数据，旁白不要暗示 Carta 在中国有业务。**
- **结尾升华**：“AI 智能体落地，先要进得了医院的门（安全审查），再要读得懂医生的字（上下文），最后要让最挑剔的专家愿意签字（人机协作）。”【依据 S1、S2】
- **慎用**：“66%”和“99% 准确率”（理由见第 7 节）；医院总数（口径打架，见第 7 节第 13 条）；“斯坦福 18 个月”要讲成“数据收集 18 个月、建模 3 天”，不要讲成“拿数据花了 18 个月然后导师建议做摘录”（第一轮的版本不准确）。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S1 | Carta Healthcare cuts clinical data processing time by 66% with Claude | https://claude.com/customers/carta-healthcare | Claude原文（客户故事） | 2026-01-11（claude.com 列表数据字段） | ✅ 已用 curl 打开，关键句逐一 grep 核对 |
| S2 | How Carta Healthcare gets AI to reason like a clinical abstractor | https://claude.com/blog/carta-healthcare-clinical-abstractor | Claude原文（官方工程博客） | 2026-04-08 | ✅ 已打开核对 |
| S3 | Advancing Claude in healthcare and the life sciences | https://www.anthropic.com/news/healthcare-life-sciences | Claude原文（Anthropic 新闻，含 Crowder 引语） | 2026-01-11 | ✅ 已打开核对 |
| S4 | Healthcare \| Claude by Anthropic（行业解决方案页） | https://claude.com/solutions/healthcare | Claude原文（含 “66%…99% accuracy” 卡片和 Crowder 引语） | 未标注 | ✅ 已打开核对 |
| S5 | The founder's playbook: Building an AI-native startup（博客页 + PDF） | https://claude.com/blog/the-founders-playbook ；PDF：https://cdn.prod.website-files.com/6889473510b50328dbb70ae6/69fe2a55b93bb0732b1fe33c_The-Founders-Playbook-05062026_v3%20(1).pdf | Claude原文 | 2026-05-14 | ✅ 博客页和 PDF 均已打开。PDF 里 Carta 只在第 33 页 “Resources” 出现一句：“Carta Healthcare uses Claude to power their clinical abstraction platform, processing 22,000 surgical cases per year and reducing data abstraction time by 66%.” **没有创始人故事章节**（博客页说的“founder stories”对 Carta 而言只有这一句） |
| S6 | Interview with Carta Healthcare co-founder Matt Hollingsworth — Health Business Group | https://www.healthbusinessgroup.com/blog/interview-with-carta-healthcare-co-founder-matt-hollings | 外部来源（播客节目页） | 2024-03-07 | ✅ 已打开。页面只有简介：“Matt shares how his mother's battle with cancer ignited his quest…”“he didn't actually plan to start a company”；**没有**“18 个月”等细节（细节在 S19 视频里） |
| S7 | Our Story \| Carta Healthcare | https://www.carta.healthcare/our-story/ | 公司官网 | 未标注 | ✅ 已打开核对（2016/2017/2023/2025 时间线、领导团队名单） |
| S8 | Matt Hollingsworth, Co-founder and CEO of Carta Healthcare（Meet the founders） | https://www.carta.healthcare/blog/meet-the-founders-matt-hollingsworth-co-founder-and-ceo-of-carta-healthcare/ | 公司博客 | 未知 | ❌ 无法访问：原页 404（“Sorry! That page doesn't seem to exist.”），Wayback 无存档/连接被重置。CERN、母亲抗癌等事实已改由 S17、S19、S6 支撑 |
| S9 | Carta Healthcare Appoints Brent Dover as New CEO（HIT Consultant）；Carta Healthcare Names Brent Dover CEO（Carta 官网新闻稿原文） | https://hitconsultant.net/2023/12/06/carta-healthcare-appoints-brent-dover-as-new-ceo/ ；https://www.carta.healthcare/news-and-pr/carta-healthcare-names-brent-dover-ceo/ | 媒体 / 公司新闻稿 | 2023-12-06 | ✅ 两页均已打开核对（BusinessWire 版本 403，改用 Carta 官网原文） |
| S10 | Northern Arizona Hospital Abstraction Case Study；Case-Study_Northern-Arizona-Healthcare.pdf；Case-Study_From-Yellow-to-Green.pdf | https://www.carta.healthcare/resource/northern-arizona-hospital-abstraction-case-study-2/ ；https://www.carta.healthcare/wp-content/uploads/2025/06/Case-Study_Northern-Arizona-Healthcare.pdf ；https://www.carta.healthcare/wp-content/uploads/2025/10/Case-Study_From-Yellow-to-Green.pdf | 客户案例（厂商发布） | 2025-06 / 2025-10（按 URL 路径） | ✅ 两份 PDF 已下载并提取全文核对；资源页本身只是空壳落地页 |
| S11 | More Than Just Abstraction – Partners for Success（ACC Quality Summit 讲稿） | https://www.carta.healthcare/wp-content/uploads/2025/12/ACC-Quality-Summit-More-Than-Just-Abstraction.pdf | 会议演讲材料（署名 NAH 的 Danielle Steven 和 Carta 的 Krystal Stanczyk） | 2025-12（按 URL 路径） | ✅ 已下载并提取全文核对 |
| S12 | Expert Clinical Data Abstraction Services \| Carta Healthcare | https://www.carta.healthcare/clinical-data-management/abstraction-services/ | 公司官网 | 未标注 | ✅ 已打开核对（写的是 “200+ seasoned clinicians”“30+ registries”；第一轮把“300+ abstractors”归到这里有误，见第 7 节） |
| S13 | Carta Healthcare Secures 25 Million in Series B Funding with Additional Investments from Memorial Hermann Health System and UnityPoint Health | https://www.businesswire.com/news/home/20230608005156/en/Carta-Healthcare-Secures-25-Million-in-Series-B-Funding-with-Additional-Investments-from-Memorial-Hermann-Health-System-and-UnityPoint-Health | 新闻稿（融资） | 2023-06-08（按 URL） | ❌ 无法访问：BusinessWire 返回 403（Cloudflare），WebFetch 被出网策略拦截。“2023 年 3 月 2,500 万美元 B 轮”已由 S9 的 Carta 新闻稿核实；标题中的 Memorial Hermann、UnityPoint 投资未核实（Memorial Hermann 作为投资方另见 S34） |
| S14 | Carta Healthcare Celebrates Triple-Digit Growth Among Expanding Partner Base and Leadership Team | https://www.carta.healthcare/news-and-pr/carta-healthcare-celebrates-triple-digit-growth-among-expanding-partner-base-and-leadership-team-2/ （BusinessWire 原链接 403） | 公司新闻稿 | 2021-09-15 | ✅ 已打开 Carta 官网版本核对（Atlas 用 NLP、150 家医院/20 个医疗系统、4 倍增长） |
| S15 | Carta Healthcare Designated as a Certified Software Vendor for the CathPCI Registry | https://citoday.com/news/carta-healthcare-designated-as-a-certified-software-vendor-for-the-cathpci-registry | 行业媒体（Cardiac Interventions Today） | 2021-07-01 | ✅ 已打开核对 |
| S16 | STS Thoracic Data Abstractor : Part Time | https://builtin.com/job/sts-thoracic-data-abstractor-part-time/6638645 | 招聘 | 下架于 2026-02-17 | ✅ 已打开核对（页面显示职位已下架，但职位描述仍在） |
| S17 | Improving Healthcare Outcomes With a Hybrid Approach w/ Carta Healthcare Co-Founder, Matt Hollingsworth（CareTalk） | https://healthpodcastnetwork.com/episodes/caretalk/improving-healthcare-outcomes-with-a-hybrid-approach-w-carta-healthcare-co-founder-matt-hollingsworth-healthbiz-brief/ （现重定向到 https://healthpodcastlibrary.com/shows/caretalk-healthcare-unfiltered/episodes/improving-healthcare-outcomes-with-a-hybrid-approach-w-carta-healthcare-co-founder-matt-hollingsworth-healthbiz-brief） | 播客节目页 | 未标注 | ✅ 已打开核对（CERN / 希格斯原句） |
| S18 | Carta Healthcare \| Northern Arizona Case Study（视频） | https://www.youtube.com/watch?v=j3P2bex0FCQ | 视频 / 客户方案例 | 未知 | ✅ 仅核到标题和发布者（YouTube oEmbed：发布者 Carta Healthcare）；❌ 视频内容未看（YouTube 要求登录验证，字幕无法下载） |
| S19 | Interview with Carta Healthcare founder Matt Hollingsworth（视频） | https://www.youtube.com/watch?v=Bd6jloolzzs | 视频访谈（HealthBiz Podcast with David E. Williams，约 38 分钟） | 2024-03-07 | ✅ 已通过 YouTube 自动字幕读全文并 grep 核对（自动字幕有识别错误，见第 7 节第 15 条） |
| S20 | Healthcare AI Platform for Clinical Data \| Carta Healthcare（官网首页） | https://www.carta.healthcare/ | 公司官网 | 未标注 | ✅ 已打开核对（第一轮的摘要数字有误，已更正，见第 7 节） |
| S21 | Carta Healthcare - Abstraction Management \| The Org | https://theorg.com/org/carta-healthcare/teams/abstraction-management | 组织架构页（用户可编辑，页面自标 “Unverified”） | 未知 | ✅ 已打开；页面显示 Hannah Glaser 为 “Head of Clinical AI Research”（与 S2 职位不同），因为是未经核实的用户编辑内容，正文未采用 |
| S22 | From Skepticism to Trust: How One Health System Transformed Clinical Data Abstraction for NSQIP Registry | https://www.carta.healthcare/wp-content/uploads/2025/09/Case-Study_From-Skepticism-to-Trust.pdf | 客户案例 PDF（匿名，S1 故事的原始出处） | 2025-09（按 URL 路径） | ✅ 已下载提取全文核对 |
| S23 | “You’re Going to Replace Us.” How an Abstraction Team Went from Fighting AI to Refusing to Work Without It | https://www.carta.healthcare/wp-content/uploads/2026/05/Case-Study_Youre-Going-to-Replace-Us.pdf | 客户案例 PDF（匿名，多实体医疗系统，CathPCI） | 2026-05（按 URL 路径） | ✅ 已下载提取全文核对 |
| S24 | Hybrid Transformation: System-Wide Improvement in Cardiovascular Data Management | https://www.carta.healthcare/wp-content/uploads/2025/06/Case-Study_Transforming-Abstraction-Across-a-National-Health-System.pdf | 客户案例 PDF（匿名，全国性医疗系统） | 2025-06（按 URL 路径） | ✅ 已下载提取全文核对 |
| S25 | How Lighthouse Elevated Speed, Accuracy, and Confidence in Clinical Abstraction | https://www.carta.healthcare/wp-content/uploads/2026/01/Case-Study_How-Lighthouse-Elevated-Speed.pdf | 客户案例 PDF（匿名个人故事；官网首页引语 “complete re-invention and upgrade of the medical record” 出自这里） | 2026-01（按 URL 路径） | ✅ 已下载提取全文核对（正文未单独引用，备用素材：邮轮心梗病人的溶栓时间戳要找 20 分钟） |
| S26 | From Skepticism to Trust: How Clinical Teams Actually Adopt AI | https://www.carta.healthcare/resource/from-skepticism-to-trust-how-clinical-teams-actually-adopt-ai/ | 公司博客 | 2026-07-07（页面 datePublished） | ✅ 已打开核对（断网故事） |
| S27 | Carta Healthcare Rakes in $20M with Hopes of Selling its Tech to More Hospitals | https://medcitynews.com/2022/11/carta-healthcare-rakes-in-20m-with-hopes-of-selling-its-tech-to-more-hospitals/ | 媒体（MedCity News） | 2022-11-02 | ✅ 已打开核对（“like a monkey” 原句、245 家医院、斯坦福 400 万美元） |
| S28 | Carta Healthcare Secures $20 Million Series B Funding… | https://www.carta.healthcare/news-and-pr/carta-healthcare-secures-20-million-series-b-funding-to-help-additional-health-systems-improve-patient-care-amid-challenging-global-economy-pandemic-turbulence-and-downturn-in-vc-funding/ | 公司新闻稿（投资方含 ACC、Mass General Brigham；导师 David Scheinker 引语） | 2022-11-02 | ✅ 已打开核对 |
| S29 | Carta Healthcare Celebrates Five Years of Significant Growth… | https://www.carta.healthcare/news-and-pr/carta-healthcare-celebrates-five-years-of-significant-growth-and-expansion-of-its-ai-platform-to-include-4-of-u-s-patients/ | 公司新闻稿（Atlas/Cartographer、20 个登记库、138 名员工） | 2022-07-18 | ✅ 已打开核对 |
| S30 | Carta Healthcare Earns ‘Best Use of AI in Healthcare’ in 2024 Merit Awards for Technology | https://www.carta.healthcare/news-and-pr/carta-healthcare-earns-best-use-of-ai-in-healthcare-in-2024-merit-awards-for-technology/ | 公司新闻稿（“large language model-agnostic process”） | 2024-10-08 | ✅ 已打开核对 |
| S31 | Claude for Healthcare Powers Carta Healthcare's Hybrid Intelligence | https://www.carta.healthcare/news-and-pr/claude-for-healthcare-powers-carta-healthcares-hybrid-intelligence/ | 公司新闻稿（Opus 4.5、Amazon Bedrock） | 2026-01-12/13（JPM 大会期间；页面时间戳 2026-01-13 UTC） | ✅ 已打开核对 |
| S32 | Carta Healthcare Achieves Breakout Growth in 2025, Expands Customer Footprint and Retains 100% of Clients | https://www.carta.healthcare/news-and-pr/carta-healthcare-breakout-growth-2025-expands-customer-footprint/ | 公司新闻稿 | 2026-01-11 | ✅ 已打开核对 |
| S33 | Carta Healthcare Expands Lighthouse Platform to 21 Additional Clinical Registries | https://www.carta.healthcare/news-and-pr/carta-healthcare-expands-lighthouse-platform-to-21-additional-clinical-registries/ | 公司新闻稿 | 2026-06-15 | ✅ 已打开核对 |
| S34 | Carta Healthcare Secures $18.25 Million in Series B1 Funding… | https://www.carta.healthcare/news-and-pr/carta-healthcare-secures-18-25-million-in-series-b1-funding-to-accelerate-ai-powered-clinical-data-abstraction-and-analytics/ | 公司新闻稿（UPMC Enterprises 领投） | 2025-05-06 | ✅ 已打开核对 |

---

## 附录：另一候选 (A) Bluenote（未选为主案例）

- 【Claude原文 B1，✅ 已打开核对】https://claude.com/customers/bluenote （2025-05-21）：给制药、生物技术公司做法规和质量文档智能体。法规文档产出提速 50–75%；科学家解析复杂方案（protocol）快 10 倍；Guardant Health 的 QC 智能体让专门工作流效率提升 40–50%。多模型智能路由，Claude 是高风险法规文档的默认模型。
  > “In lab operations, our QC agents have boosted specialized workflow efficiency by 40-50%.” —— Kenny Speer, Guardant Health
  > “Claude is our default for high-stakes regulatory and compliance documentation.” —— Katsuya Noguchi, CTO
- 【外部来源 B2，✅ 已打开核对】PRNewswire《Bluenote Raises $10M from Lux Capital & Elad Gil to Transform Life Sciences Workflows with AI》：https://www.prnewswire.com/news-releases/bluenote-raises-10m-from-lux-capital--elad-gil-to-transform-life-sciences-workflows-with-ai-302337118.html （**2024-12-20**）。联合创始人 Fatima Sabar 和 Katsuya Noguchi 都是 Color Health 早期高管（“Co-founders Fatima Sabar and Katsuya Noguchi were early executives at Color Health”）；投资方包括 **Anthropic & Menlo Ventures Anthology Fund**、McKesson Ventures，个人投资者含 Fidji Simo（稿中头衔 “CEO Instacart … OpenAI Board”）。原文要点：
  > “Bluenote has deployed 15+ applications for scientists, engineers, quality, regulatory and manufacturing teams. Bluenote has developed fine-tuned models that are 90% preferred over off-the-shelf models.”
  > “Bluenote finds that there is no one-size-fits-all model, and instead, combines the best models from Anthropic, OpenAI, Google, and its own fine-tuned models based on proprietary datasets.”
  > “…inserting call-to-action placeholders for human reviewers to provide details where additional context is needed.”
  - Guardant 的 Kenny Speer 在这篇稿里说 Bluenote “flags areas that need human-in-the-loop review”。注意：Anthropic 关联基金投了 Bluenote，评论区可能有人质疑利益关系。
- 【外部来源 B3，✅ 已打开，仅标题和导语（付费墙）】Endpoints News 独家《Color Health alums raise $10M for new startup, using AI for regulatory work》：https://endpoints.news/ex-color-health-execs-raise-10m-to-bring-ai-to-pharma/ 。导语原句：“Employees Nos. 1 and 2 of the $4.6 billion health tech startup Color Health have started their own company, aiming to tackle pharma’s regulatory burden …”
- 【外部来源 B4，✅ 已打开核对（本轮更正）】Bluenote 官网新闻《Bluenote Launches First Agentic Regulatory Platform to Accelerate Drug & Device Submissions》：https://www.bluenote.ai/news/bluenote-launches-agentic-regulatory-platform （**2026-01-12**）。宣布 Regulatory AI Platform 正式可用，覆盖 IND/NDA 模块撰写、监管问询答复、提交前核验、风险预判。原句：
  > “The platform connects directly to a company's existing data infrastructure, including ELNs, LIMS, QMS, SharePoint, Snowflake, Veeva, and other systems … Every sentence, table cell, and derived fact links directly to its source, allowing reviewers to verify accuracy with a single click.”
  - **更正**：第一轮摘要称此文提到“混合系统”和“支持本地（on-premise）部署”，原文里**没有**这两个说法，已删除。原文提到的是 “OCR, vision AI, and deterministic algorithms”。稿中引语来自 Eledon Pharmaceuticals 首席医疗官和一位 Takeda 前非临床法规写作负责人，都是观点性引语，不是落地描述。
- 【外部来源 B5，✅ 已打开议程页；❌ 演讲内容未公开】DIA 2026 Global Annual Meeting 创新剧场 #429.1：“‘I want to hug your engineers. I really do. Tell them thank you.’ - VP of Regulatory, Major Public Pharma. The Art & Science of Deploying AI Solutions that Your Teams Love”：https://live.diaglobal.org/event/2026-global-annual-meeting/planning/UGxhbm5pbmdfNDQ3Njk2NA== 。时间 **2026-06-15 13:45–14:15**（美东），讲者 Bluenote 创始人兼 CEO Fatima Sabar。议程摘要原句：
  > “Bluenote Founder and CEO Fatima Sabar will share lessons from a decade of deploying AI to the world's largest life sciences and healthcare institutions. What separates the solutions teams love and use every day from the ones that wasted everyone's time?”
  > 学习目标：“How a product fits into the way experts already think and work, how it earns trust through every interaction … Why user experience is the line between adoption and abandonment.”
  - 本轮检索了 DIA 页面、Bluenote 官网新闻页和 sitemap、网页搜索，**没有找到演讲录像、讲稿或会后文章**。标题里的引语出自一家大型上市药企的法规副总裁（未具名）。
- 【外部来源 B6，❌ 无法访问：Cloudflare 拦截 + 出网策略拦截 WebFetch，Wayback 连接被重置】Fierce Biotech《Bluenote CEO: AI can cut drug development time, restore scientific focus》：https://www.fiercebiotech.com/sponsored/bluenote-ceo-ai-can-cut-drug-development-time-restore-scientific-focus 。URL 路径含 “/sponsored/”，是付费内容。第一轮摘要里的内容（“混合系统把生成式 AI 和确定性逻辑结合”）无法核实，**不再采用**。
- 【外部来源 B7，本轮新增，✅ 已打开核对】Bluenote 官网新闻：日本 CRO 公司 CMIC 与 Bluenote 战略合作（2026-03-10）：https://www.bluenote.ai/news 。原句：“CMIC will integrate Bluenote's AI agents across end-to-end clinical development workflows, moving beyond standalone AI tools. CMIC expects this will accelerate select regulatory and clinical documentation processes by up to 75%.” 这是**预期值**，不是结果；对亚洲听众有一定参考价值。
- **没选的原因**：公开信息里仍然找不到“谁去客户现场、先做哪个场景、什么地方没走通又怎么改的”这类过程细节；DIA 演讲标题最接近“落地过程”，但内容没公开；具名客户只有 Guardant（Eledon、Takeda 前员工只是观点引语，CMIC 是合作预期）。
