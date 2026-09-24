# 案例：Banner Health — 内部技术团队在自家 AWS 上搭建 Claude 平台 BannerWise，把肿瘤科"半夜阅卷"变成门诊内由医助完成的病历预整理

> **核实状态说明（第二轮，2026-09-24）**：
> - **第一轮已核实的 S1–S6（claude.com / anthropic.com）**：本轮重新打开了 S1、S3、S4、S5，关键句仍在原页。
> - **第一轮未核实的外部来源 S7–S20，共 14 个**：
>   - **8 个已打开原页核对，标 ✅**：S9、S10、S11、S12、S17、S18、S19、S20。其中 S11 的 Healthcare IT News 页面打不开，改用 HIMSS TV 官方视频页和视频本身核对；S18、S19 改用 Banner 官方新闻稿核对。
>   - **6 个无法访问，标 ❌**：S7、S13、S14、S15（Becker's）、S8（Modern Healthcare）、S16（Fierce Healthcare）。原因：
>     - 直接 curl 分别返回 Cloudflare / Akamai 的 403 挑战页；
>     - WebFetch 报 `EGRESS_BLOCKED`；
>     - archive.org 的查询接口显示 S7、S8、S16、S15 有 Wayback 快照，但 web.archive.org 本身在本环境连接被重置，打不开。
>
>     这些来源里独有的事实，本轮一律**降级或删除**，不再保留"摘要引文"。
> - **本轮新增 6 个来源（S21–S26），全部已打开核对**。其中最重要的两个是视频：
>   - **S21**：Anthropic 2026-01-12 线上发布会，Reagin 作为客户嘉宾出场。依据是 YouTube 自动字幕。
>   - **S11**：HIMSS TV 采访视频，没有官方字幕，本轮下载官方视频后做了机器转写（Whisper small.en 转写全片，关键段再用 medium.en 复核，两次一致）。
>
>   视频引文都注明了"自动字幕"或"机器转写"，用于成片前建议再对一遍视频原声。
> - **中文检索**：用中英文关键词查了 36氪、机器之心、虎嗅、动脉网等。**未找到针对 Banner Health / BannerWise 的中文报道**；动脉网只有一个 Banner Health 公司条目，里面没有提到 Anthropic / Claude / BannerWise。
> - 本轮之后，文中已经没有"仅搜索摘要"的引文。

- 行业：医疗（非营利综合医疗系统，含医院、诊所和健康保险计划）
- 企业规模 / 地区：
  - 33 家急症医院、400 家诊所、健康计划会员 120 万、员工 55,000+，服务 350 万+人，覆盖美国亚利桑那、加州、科罗拉多、内布拉斯加、内华达、怀俄明 6 个州【Claude原文 S1】
  - Banner 自己的口径是 576 个场所、55,000+ 员工【外部来源 S24 ✅】
  - 年营收约 156 亿美元：只在二手汇编里出现【外部来源 S17 ✅，IntuitionLabs："a 33-hospital system in Arizona with $15.6B revenue"】，一手来源没核到，慎用
  - 总部凤凰城【外部来源 S10 ✅："The Phoenix-based system"】
- Claude 产品标签：Claude Platform；合作伙伴 AWS（通过 Amazon Bedrock 调用，模型为 Claude Sonnet 4.5）【Claude原文 S1】
- Claude 故事发布日期：2026-01-11。依据是 claude.com/customers 列表页的数据字段 `"date":"2026-01-11T00:00:00.000Z"`【S2】；当天 Anthropic 也发布了医疗产品公告【S3】
- Claude 原文链接：https://claude.com/customers/banner-health
- 落地主体（谁是"FDE"）：**Banner 自己的技术团队**，由 EVP、首席技术官 Mike Reagin 牵头。证据有四条：
  - Claude 原文："Banner's technology teams brought the BannerWise vision to life"【S1】
  - Reagin 说过 "We've built our stack with Amazon Bedrock"【S1】
  - Reagin 在 HIMSS TV 上说："We've built our own in-house kind of enterprise class digital assistant we call BannerWise"【S11 ✅，机器转写】
  - Banner 官方新闻稿：Reagin 2024 年 6 月加入，担任新设的 EVP、CTO，原句 "Michael Reagin, MBA, will join Banner Health's senior leadership team in June, in the newly created role of executive vice president, chief technology officer. Reagin will be responsible for IT, data strategy and digital transformation"【S18 ✅，2024-04-18】

  **没有找到** Anthropic 或 AWS 派工程师驻场、前置部署的公开证据。
- 本案例推荐指数：**3 / 5（维持不变）**
  - 数字充分度：中高，比第一轮好。
    - Claude 原文有 NPS、85%、20%、2–3 小时、1,400 份病历、培训从"数月"缩到"数天"。
    - 本轮新增 CTO 本人公开说过的"之后"数字：病历预处理"hours → minutes"、"每天约省 2 小时"、"每位患者约省 8 分钟"【S11】。但这些都是 CTO 口头估算，口径不清。
    - **仍没有**夜间文档时间的"之后"数字。
  - 过程和反转素材：中等，比第一轮好。
    - 时间线被一手来源钉住了：2025 年 3 月还在试点，计划下季度上线【S10】；2025 年 12 月已全员部署【S24】。
    - 治理细节有两个版本：约 125 分的 CHAI 评分、每 6 个月复查【S21】。
    - CTO 自述过"一个月就改主意"的转向心态【S10】。
    - 但谁去科室、怎么改提示词、试点反馈改了什么，**仍无公开信息**。
  - 对中国听众的可迁移性：高。

---

## 1. Claude 原文要点（事实 + 数字）

以下全部来自 S1（https://claude.com/customers/banner-health ）。本轮重新打开核对，关键句仍在原页。

1. **医生每晚多干 2–3 小时**："After a full day of patient care, physicians were spending two to three hours more each night on chart preparation and intake processes."
2. **血液肿瘤科 20% 的文档时间落在夜里**："Twenty percent of hematology oncology physician documentation time was occurring between 6 PM and 6 AM."
3. **转诊病历动辄几百页**。Dr. Gary Walker（原文头衔："the Chief of the Division of Radiation Oncology at Banner MD Anderson Cancer Center"）："On extreme examples, you get a referral from perhaps another clinic where they could have 100, 200, 300 pages of documents that we have to go through."
4. **战略目标**："by the end of 2029, achieve a 50% reduction of administrative tasks for clinicians while improving patient and provider experience." 同页摘要的说法是 "Created a foundation for reducing provider administrative burden by 50% over four years."
5. **平台规模**："BannerWise—an enterprise AI platform powered by Claude Sonnet 4.5, now available to 55,000+ employees across Banner's hospitals and medical offices in six states."
6. **使用结构**："document analysis and summarization (32% of usage), content creation (20%), and development support with code optimization (16%)."
7. **肿瘤科场景的做法**："The system reviews incoming medical records—whether PDF documents from referring clinics or notes from within Banner's own system—and creates summaries that capture a patient's oncology journey, treatment history, and current status."
8. **30 天**。两处口径不同（见第 7 节）：
   - 正文说的是从立项到可用的概念验证（POC）："going from project approval to a functioning proof of concept in less than 30 days while fully focused on agent safety and reliability."
   - 页首摘要说的是部署："Deployed a privacy-preserving AI system within their existing AWS environment in under 30 days."
9. **为什么选 Claude**。CTO Mike Reagin："We began building BannerWise when hallucinations and incorrect outputs were more common across model providers, and we were drawn to Anthropic's focus on AI safety and Claude's Constitutional AI approach…"
10. **数据不出域**："Banner deployed Claude within its own AWS infrastructure to ensure patient data never left its secure environment."
11. **每月迭代**："They've continued to iterate on BannerWise with monthly releases, adding features like Bedrock Knowledge Bases, document upload capabilities, a prompt library, and a prompt improver, all designed to empower users to apply the tool to new applications in hours rather than weeks."
12. **真正的关键在提示词**。Reagin："Getting Claude activated in our AWS environment was straightforward… The real magic started as we honed prompt structures optimized for Claude."
13. **医助（scribe）培训从数月缩到数天**：
    - 原文："Where training a new scribe previously required months of physician coaching and on-the-job learning, BannerWise enables scribes with minimal medical background to produce high-quality documentation within days."
    - Walker："We can literally take a new scribe with very little training, and within a couple days they're producing a product that is better than our previous scribes would produce even after months or years of being a scribe."
14. **"劳动力放大器"和内置质控**："Built-in quality checks catch inconsistencies that humans would likely miss, such as records from a different patient inadvertently included in a file or mismatched dates of birth." 其中一例是出生日期不一致，Walker 的原话是 "something that no human would ever catch"。
15. **调查结果**："User surveys show a Net Promoter Score of +64, productivity impact ratings of 8.9 out of 10, and recommendation likelihood scores of 8.7 out of 10. Eighty-five percent of respondents report significant time savings alongside improvements in work accuracy and workflow efficiency."
16. **试点规模**："The oncology pilot has processed over 1,400 clinical notes since June 2025."
17. **扩展计划**：
    - "expanding chart preparation capabilities across multiple specialties including neurology, cardiology, and infectious disease"
    - "The team is also developing an automation agent using Anthropic technology to streamline the workflow, which will be critical for broader adoption."
18. **全员覆盖和下一步**："The organization put BannerWise in the hands of every Banner employee by the end of 2025 and is exploring Claude Code…"；后续方向包括 "customer experience centers, revenue cycle operations, and supply chain management"。
19. **最大受益者不只是医生**。Walker："It certainly can amplify the ability of the physician, but even more so the medical scribes, MAs, nurses that are doing some of this chart prep."

---

## 2. 背景与痛点（结构化）

| 维度 | 内容 | 来源 |
|---|---|---|
| 行业大背景 | 全美医护短缺，行政负担导致倦怠："a heavy and growing administrative burden was causing Banner's care providers to burn out" | 【Claude原文 S1】 |
| 夜间加班 | 看完一天诊后，每晚还要多花 2–3 小时做病历准备和接诊录入 | 【Claude原文 S1】 |
| 肿瘤科尤其严重 | 血液肿瘤科 20% 的文档时间发生在晚 6 点到早 6 点 | 【Claude原文 S1】 |
| "睡衣时间" | 在 Anthropic 发布会上，主持人向 Reagin 提问时说："Banner Oncologists have talked about the increasingly burdensome workload… they call this after hours work pajama time." 这是主持人转述，不是 Banner 自己的原话 | 【外部来源 S21 ✅，YouTube 自动字幕，约 00:55:56】 |
| 材料量（三个口径） | ① Walker：外院转诊一次"100, 200, 300 pages"【S1】<br>② Reagin 在 HIMSS TV："The average medical record is around 135 pages long for complex patients that can reach 500 pages."【S11 ✅，机器转写，约 03:28】<br>③ Reagin 在 Anthropic 发布会："the average kind of oncology chart is over 150 pages long"【S21 ✅，自动字幕，约 00:56:35】 | 见左 |
| 材料内容 | 化验、影像报告、治疗史、会诊记录，医生要据此写出"现病史"（history of present illness）【S1】。据 Modern Healthcare 记者文章的转发摘要，工具用于分析 "notes, pathology results, genetic tests, imaging, and lab data"【S9 ✅，LinkedIn 用户转述】 | 见左 |
| ~~单个病人阅卷约 8 小时~~ | **本轮降级，不作事实使用。** 原出处 Becker's（S7）打不开；唯一能打开的是二手汇编 IntuitionLabs（S17 ✅），原句 "manual summarization of oncology patient records (hundreds of pages) took ~8 hours per patient for physicians"，它注明引自 Becker's。Reagin 本人公开能核实到的说法只有 "took hours of time down to minutes of time"【S11】 | S7 ❌ / S17 ✅（二手） |
| 人力培养 | 新医助过去要靠医生带教、边干边学好几个月 | 【Claude原文 S1】 |
| 组织目标 | 行政负担减半。四种说法见第 7 节："2029 年底""四年内""未来五年""2030 年" | S1 / S10 / S21 / S17 |
| 治理起点 | 2025 年 3 月 13 日，Reagin 接受 Newsweek 采访时说，Banner 在 AI 上还"pretty early"，先搭治理体系，再大举投入生成式 AI | 【外部来源 S10 ✅】 |
| 同期 AI 版图 | ① Reagin："We've deployed the Oracle clinical digital system and it has kind of ambient voice built into it as well as some early stage AI functions… We're using it on a hybrid approach. We feel that developing our own AI as well as having kind of EHR AI is important."【S11 ✅，机器转写，约 04:06】<br>② "We have multiple technologies in place today because we don't see one that kind of does everything yet."【S11，约 02:53】<br>③ 另与 Regard 合作，在 33 家急症医院用 AI 做临床决策和文档【S20 ✅】<br>④ ~~约 1,700 名门诊医生在用 Oracle Health Clinical AI Agent~~：出处 S13 打不开，**本轮删除该数字** | 见左 |
| 投资背景 | 5 年 10 亿美元技术投资。CEO Amy Perry 的说法："a $1 billion investment in technology the health system plans to pay over the course of five years"【S23 ✅】；2026 年新闻稿的说法："investing more than $1 billion in AI, robotics, telemedicine and cloud-based technology"【S19 ✅】 | 见左 |

---

## 3. 落地过程（FDE 怎么做的）

> 总体判断：一手来源把**时间线**钉住了，但**仍没有**"谁去科室蹲点、访谈了谁、试点小组多少人、试点中改了什么"的细节。下面凡是推断都单独标注。

**第 0 步：换帅、定目标（2024 年 4 月宣布，6 月到任）**
- Banner 2024-04-18 发布新闻稿：Reagin 6 月加入，任**新设**的 EVP、CTO，负责 IT、数据战略和数字化转型【S18 ✅】。
- 新闻稿列出的此前任职单位是 "Cleveland Clinic Abu Dhabi, Sentara Healthcare/Optima Health Plan, and, most recently, Sharp Healthcare"，以及 "more than 27 years of experience"【S18 ✅】。
  - **第一轮摘要有误，已更正**：第一轮写了"Providence"和"Sharp 首席信息与创新官"两项，官方新闻稿里都没有，已删除。
- Reagin 到任一年后回顾，说头一年的重点是"modernizing the foundation"，涵盖 IT、数字前门和数据战略【S11 ✅，机器转写，约 01:21】。
- 组织级目标：行政负担减半【S1】。

**第 1 步：治理先行，同时自建通用 AI 助手（最晚 2025 年 3 月已在试点）**
- 以下据 Newsweek 2025-03-18 的报道（Reagin 3 月 13 日受访）【S10 ✅】。**第一轮把日期写成 2025-07-18，有误，已更正**；原页标注 "Published Mar 18, 2025 … updated Sep 06, 2025"。
  - 委员会与评分框架："it has formed a multidisciplinary committee—including ethicists, nurses and physicians—to evaluate any AI application before deployment and adopted the Coalition for Health AI's framework to evaluate and score those applications."
  - 持续监控："Banner will continuously monitor all AI applications for the first six months of their deployments to ensure safe and ethical use, then will move to an annual review to confirm that 'things are still stable and the model drift is not outside the bounds'"
  - 总体姿态："Reagin characterized the strategy as more cautious than bullish, though Banner isn't shying from AI."
  - **BannerWise 当时的状态（本轮新发现）**："The health system also built a general AI companion, based on the Claude family of anthropic large language models, that is currently in its pilot phase with the intention of launching next quarter." 也就是说，2025 年 3 月时它还在试点，计划 2025 年第二季度上线。
- 10 个月后（2026 年 1 月），Reagin 在 Anthropic 发布会上描述的治理做法有所变化【S21 ✅，YouTube 自动字幕，约 00:59:29】："we have an executive AI committee that oversees all the deployment of AI across Banner Health and we really use the CHI, the Coalition for Healthcare AI as kind of a framework… we score every single thing at about 125 point scale and… go back and recheck it every six months to make sure that it's still performing the same way it was in in the beginning." 这里的复查频率与 Newsweek 的"首 6 个月持续监控后转年度复审"不同，见第 7 节。
- 选型逻辑：项目启动时各家模型幻觉都更多，所以看重 Anthropic 的安全路线【S1】。
  - 据二手汇编，Reagin 说过 Claude 会 "tell you when it doesn't know an answer"【S17 ✅，但它引自 Becker's S7 ❌】。原始出处打不开，**只作参考，不作引文**。

**第 2 步：30 天内做出 POC，模型跑在自家 AWS 里**
- 从立项到可用 POC 不到 30 天；Claude 通过 Amazon Bedrock 部署在 Banner 自己的 AWS 环境里，患者数据不出域【S1】。
- 原句："Getting Claude activated in our AWS environment was straightforward… We've built our stack with Amazon Bedrock, so the Anthropic models are readily accessible."【S1】
- 【推算】S1 没有给 POC 的具体日期。Reagin 2024 年 6 月到任，2025 年 3 月已在试点【S10】，所以立项和 POC 大致落在 2024 年下半年到 2025 年初。这是按时间点推算的，不是公开事实。
- 本轮查了 AWS 博客（re:Invent 2025 医疗回顾）和几个 AWS 视频页，**没有找到 Banner 的 re:Invent 演讲或 AWS 官方案例**。

**第 3 步：先面向全员做通用助手，再打深度临床场景（肿瘤科病历预整理，2025 年 6 月起跑真实病历）**
- 2025 年 6 月前后，Reagin 在 HIMSS TV 上描述 BannerWise 的定位是"通用助手"【S11 ✅，机器转写，约 02:19】："which really helps all of our team members with kind of typical tasks that they might use AI on, whether that's summarizing a long document or whether that is, you know, getting insight or doing some planning. And we're continuing to customize and roll this out."
- 肿瘤科试点 2025 年 6 月起累计处理 1,400+ 份临床病历【S1】。
- **为什么选肿瘤科**：仍**没有找到** Banner 对这个决策过程的公开说明。能找到的线索有三条：
  - S1 说肿瘤科的问题"particularly acute"，也就是病历最厚、夜间文档占比最高；
  - Anthropic 发布会主持人说 "Banner Oncologists have talked about the increasingly burdensome workload"【S21】，暗示需求是肿瘤科医生自己提出来的；
  - 唯一具名的临床方是 Walker。他在 Banner 官网的医生主页上列有 "Preventive Medicine: American Board of Preventive Medicine/Clinical Informatics, 2017" 的委员会认证【S25 ✅】，也就是说，他同时是放射肿瘤科医生和临床信息学专科医生。
  - 【编剧建议·推断】痛点最尖锐、人群集中在一个科室、科室里有懂信息学的医生愿意站台（Walker），这三点叠加，是典型的破冰选题。**这是推断，不是 Banner 的说法。**
- **试点由谁执行**：公开材料里只有 Walker 一位具名医生；医助（scribes）、MA、护士都没有具名，试点人数也没有公开。
- 2025 年 9 月 2 日前后，Modern Healthcare 记者 Gabriel Perna 发表 "Banner and Anthropic showcase the healthcare AI space race"。
  - 原文打不开（S8 ❌）。标题、作者和日期由 Perna 本人 2025-09-02 的 LinkedIn 帖确认【S22 ✅】。
  - 帖中引用了 Anthropic 的 Zubair Jandali："When I speak with decision makers at large health systems, chief information officers, they bemoan the slowness of the deployment of this technology."【S22 ✅】
  - Healthcare Brew 2025-09-19 的转述："Banner created its own ChatGPT-like program called BannerWise via a partnership with AI company Anthropic to analyze data from things like physician notes and pathology results, Modern Healthcare reported earlier this month."【S23 ✅】

**第 4 步：人机分工，把活从医生夜里挪到门诊内的医助手上**
- 流程：系统读取外院 PDF 和院内病历，生成涵盖肿瘤诊疗经过、治疗史、当前状态的摘要；使用者是 "physicians and medical scribes"【S1】。
- 摘要形式：Reagin 的描述是 "we've used a kind of clawed [Claude] family of models to really synthesize that into a summary… it shows in a very, you know, discreet chronological timeline, everything that's happened to that patient… reduce the cognitive burden on the physician that that's preparing for this visit"【S21 ✅，自动字幕，约 00:56:35；"clawed"是字幕把 Claude 听错了】。
- 分工：医助、MA、护士做病历预整理，医生把精力放在诊室里的病人身上。Walker："It allows me to focus more on the patient in front of me… making sure I'm communicating well with the patient"【S1】。Reagin 在 HIMSS TV 上也说，省下的时间属于 "clinicians and for our kind of support staff who kind of have to do that work"【S11，约 03:46】。
- 质控：内置检查能发现混入其他患者的记录、出生日期不一致等问题【S1】。

**第 5 步：平台化，每月发版，让一线自己造应用；不追求一次设计到位**
- 每月发版，陆续加入 Bedrock Knowledge Bases、文档上传、提示词库、提示词改进器，目标是用户"in hours rather than weeks"就能把工具用到新场景【S1】。
- 为什么小步快跑？Reagin 在 2025 年 3 月的说法【S10 ✅】："We're really concerned about not overbuilding and not trying to get too far out ahead of things, because of the pace [at which] these things are changing… It's a little unnerving that you have an idea of what you want to do and how you want to do it, and then a month goes by, and all of a sudden, your whole perspective on life changes. And you're like, 'Wait a second, we should do it this way.'"
- Reagin 在 HIMSS TV 上把这叫作"innovation in small doses"，原话是 "I feel like it's really important to focus on just a couple… you need that dedicated focus to really bring it to life"【S11 ✅，机器转写，约 05:02】。
- 模型升级：当前平台跑在 Claude Sonnet 4.5 上【S1】，而 Sonnet 4.5 2025-09-29 才发布【S6】。可是 2025 年 3 月试点时已经是 "based on the Claude family"【S10】，肿瘤科试点 2025 年 6 月就在处理病历【S1】。【推断】早期用的是更早的 Claude 模型，后来才升级。具体换过哪些版本，没有公开信息。

**第 6 步：评测方式，用户调查、CTO 估算、治理评分**
- 用户调查：NPS +64、生产力影响 8.9/10、推荐意愿 8.7/10、85% 的受访者表示明显省时【S1】。
- CTO 口头估算【S11 ✅，机器转写，经 medium.en 复核】：
  - 病历预处理："by using AI, we've been able to streamline things that took hours of time down to minutes of time in this kind of pre-processing of the record… We estimate that we're saving about two hours a day on that."（约 03:35）
  - 整体："I think if we're right now about eight minutes saved per patient with AI, and you think about that across millions of patients a year, that's a big time savings."（约 05:48；指全部 AI 工具，包括 ambient，不是 BannerWise 单独的数字）
- 发布会上 Reagin 还说，减负目标 "we're really measuring down minutes and seconds"【S21，约 00:57:17】。
- 治理层面：CHAI 框架、约 125 分的评分表、定期复查【S10 / S21】。
- **仍没有公开**：摘要准确率的人工评测方法、样本量、对照组。

**第 7 步：全员推广，再往别的专科和部门扩**
- 2025 年底前向全体员工开放【S1】。Banner 官方新闻稿（2025-12-19）写道【S24 ✅】："In 2025, Banner built and deployed its own intelligent AI assistant powered by advanced language models to all team members across the organization. Called Bannerwise, it enhances employee productivity by assisting with document analysis, complex problem-solving, and daily workflow tasks in a secure, HIPAA-compliant environment."
- 下一步：病历预整理扩到神经科、心内科、感染科；开发 "automation agent"；试用 Claude Code；扩到客服中心、收入周期、供应链【S1】。
- 组织层面：2026 年 6 月，Banner 新设 SVP、首席 AI、数据与基础设施官，由 John Rares Almasan 担任（此前在 TIAA 任 "senior managing director and global head of AI and emerging technology"），6 月 1 日生效【S19 ✅】。
  - 同一份新闻稿写道："Banner's AI program prioritizes safety through rigorous reviews by ethicists and clinical leaders, annual audits, and partnerships with companies like Anthropic that are committed to building safer AI systems."【S19 ✅】
  - 【注意】公开材料没说 Almasan 与 Reagin 是什么汇报关系，也没说 Reagin 是否仍在任，脚本里不要推断。
- 并行路线是环境语音病历（ambient，Oracle 系统内置）加自研 AI 的"hybrid approach"【S11】。【编剧建议·推断】ambient 解决"看诊时的记录"，BannerWise 解决"看诊前的阅卷"，两条线互补。Banner 没有公开这样表述过。

**时长小结（本轮按一手来源修正）**：
- 2024 年 6 月 Reagin 到任【S18】
- 立项到 POC 不到 30 天【S1】，具体日期不详
- 2025 年 3 月通用助手在试点，计划下季度上线【S10】
- 2025 年 6 月肿瘤科试点开始跑真实病历【S1】
- 2025 年 12 月全员部署【S24 / S1】
- 2026 年起扩专科、做自动化 agent【S1】

**从 CTO 到任到全员上线约 18 个月；从有据可查的试点（2025 年 3 月）到全员约 9 个月。** 第一轮"整体约 6–7 个月"的推算偏短，已更正。

---

## 4. 关键反转 / 转折点（最重要）

**反转 1：以为 AI 是给医生减负的，结果最大的杠杆在医助（Claude 原文，证据最硬）**
- 原本：痛点被定义为"医生夜里多干 2–3 小时"【S1】。
- 现场发现：真正被放大的是学历、培训更少的医助、MA 和护士。原句："It certainly can amplify the ability of the physician, but even more so the medical scribes, MAs, nurses that are doing some of this chart prep… It allows them to function at a much higher level than they could with their level of training."【S1】CTO 在 HIMSS TV 上也把受益者列为 "clinicians and… support staff"【S11 ✅】。
- 调整后：病历预整理从"医生下班后自己做"变成"门诊内由医助借助 BannerWise 完成"【S1："Transformed oncology chart preparation from an after-hours labor to an efficient in-clinic process"】。
- 效果：新医助"within a couple days"做出的东西，比老医助干了"months or years"还好【S1，Walker 的主观评价】。

**反转 2：担心 AI 出错，结果 AI 抓出了人类的错（Claude 原文）**
- 原本：项目启动时 Banner 最担心幻觉，原句："We began building BannerWise when hallucinations and incorrect outputs were more common across model providers"【S1】。当时 Reagin 自称策略 "more cautious than bullish"【S10 ✅】。
- 现场发现：系统反过来发现了人没发现的问题，比如混进来的其他病人的记录、对不上的出生日期。原句："In one case, the system flagged a date of birth discrepancy buried in documentation, 'something that no human would ever catch'"【S1】。
- 效果：AI 从"要被盯防的风险"变成"质控员"，Walker 称之为"workforce amplifier"【S1】。Reagin 在发布会上也用了 "workforce enabler" 这个说法【S21】。

**反转 3：接模型只是开始，真正的活是提示词工程加平台化（Claude 原文）**
- 原本：大家以为难点在技术接入和合规环境。
- 实际：接入"straightforward"，"The real magic started as we honed prompt structures optimized for Claude."【S1】
- 调整后：每月发版，把提示词能力产品化成提示词库和提示词改进器，再加上知识库和文档上传，让一线员工几小时就能自己搭出新应用【S1】。
- 效果：使用结构里文档分析和摘要占 32%、内容创作 20%、开发支持 16%【S1】，说明用法已经扩散到临床以外。

**反转 4（本轮新增，一手来源）：原本想先把方案想清楚再建，结果"一个月就推翻一次"，于是改成不过度建设、按月发版**
- 原本：传统医院 IT 的节奏是按年规划。Reagin 的原话是 "Usually that happens over months or years"【S10 ✅】。
- 遇到的问题："you have an idea of what you want to do and how you want to do it, and then a month goes by, and all of a sudden, your whole perspective on life changes. And you're like, 'Wait a second, we should do it this way.'… now it's happening in weeks and months."【S10 ✅，2025 年 3 月】
- 调整后："We're really concerned about not overbuilding…"【S10】；落到做法上是每月发版【S1】，并且"focus on just a couple"【S11】。
- 效果：2025 年 3 月还在试点，2025 年底全员部署【S10 → S24】。
- 【口径提醒】Reagin 这段话是泛谈 AI 进展速度，没有点名某次具体的方案推翻；脚本可以讲成"CTO 的心态转变"，**不要**编成"某个功能被推翻重做"。

**反转 5：从"私有聊天机器人"走向"自动化智能体"（部分推断，需标注）**
- 原本：外部媒体和 Banner 自己最初都把 BannerWise 定位为通用助手，比如 "ChatGPT-like program"【S23 ✅】、"general AI companion"【S10 ✅】、"typical tasks… summarizing a long document"【S11 ✅】。
- 遇到的问题：【编剧建议·推断】靠人上传、人去问的对话式用法，推到更多专科时会卡住。原文依据："The team is also developing an automation agent… to streamline the workflow, which will be critical for broader adoption."【S1】
- 调整后：开发自动化 agent，扩到神经科、心内科、感染科【S1】。Reagin 在发布会上还强调了 "orchestration across all those other products"【S21】。
- 效果：**尚无公开数据**。

**反转 6：试点起步的模型不是现在的模型（时间线推断，需标注）**
- 2025 年 3 月已是 "based on the Claude family"【S10】，2025 年 6 月肿瘤科试点已在跑【S1】，而 Sonnet 4.5 是 2025-09-29 才发布的【S6】，平台现在跑在 Sonnet 4.5 上【S1】。
- 【推断】中途换过模型。可以讲成"平台先搭好，模型可以换"的故事，但不能讲成具体事实细节。

> 仍未找到公开信息的部分：试点小组规模、具名医助、医生对第一版摘要的具体吐槽、提示词改了哪些地方、失败案例或弃用的方案。

---

## 5. 结果数字（前后对比表）

| 指标 | 之前 | 之后 | 来源 | 口径说明 / 风险 |
|---|---|---|---|---|
| 血液肿瘤科夜间（18:00–06:00）文档时间占比 | 20% | **未公布** | 【Claude原文 S1】 | 只有基线。标题写"is changing that"，但没给之后的数字，**不能说"夜间文档降了 X%"** |
| 医生每晚额外做病历准备的时间 | 2–3 小时 | **未公布** | 【Claude原文 S1】 | 指全体医生，也只有基线 |
| 病历预处理耗时 | "hours of time" | "minutes of time" | 【外部来源 S11 ✅，CTO 口述，机器转写】 | 没有具体数字；没说是哪个科室 |
| 病历预处理节省的时间 | — | "about two hours a day" | 【外部来源 S11 ✅，CTO 口述，机器转写】 | CTO 估算，2025 年 6 月前后。没说明是每位临床人员每天还是别的口径，**不能当成"夜间加班减少 2 小时"** |
| 每位患者节省的时间（全部 AI 工具） | — | "about eight minutes saved per patient" | 【外部来源 S11 ✅，CTO 口述，机器转写】 | 回答的是"AI 是否省钱"这个泛问，包括 ambient 等工具，**不是 BannerWise 单独的数字** |
| ~~单个肿瘤患者人工预阅卷约 8 小时~~ | ~~约 8 小时~~ | — | S7 ❌ / S17 ✅（二手） | **本轮降级**，原始出处打不开，见第 7 节 |
| 新医助达到可用水平所需时间 | 数月（医生带教） | 数天（"within a couple days"） | 【Claude原文 S1】 | Walker 的主观描述，没有测量数据 |
| 用户省时比例 | — | 85% 的受访者表示明显省时，且准确率提高 | 【Claude原文 S1】 | 自报调查，"respondents"≠全体用户，样本量未公开。二手汇编 S17 写成"80–85% of users" |
| NPS / 生产力评分 / 推荐意愿 | — | +64 / 8.9 分 / 8.7 分（满分 10） | 【Claude原文 S1】 | 自报调查，样本量未公开 |
| 肿瘤科试点处理量 | — | 1,400+ 份临床病历（2025 年 6 月起） | 【Claude原文 S1】 | 截止时间没写明。二手汇编 S17 同一篇里一处写"1,400 clinical notes"、另一处写"1,400 pages"，自相矛盾，以 S1 为准 |
| 立项 → POC | — | 不到 30 天 | 【Claude原文 S1】 | 页首摘要写的是"部署"不到 30 天，正文写的是"POC"，见第 7 节 |
| 覆盖人数 | — | 55,000+ 员工可用（2025 年底前全员） | 【Claude原文 S1】；【外部来源 S24 ✅ Banner 新闻稿】 | "available to"≠活跃用户，没有 DAU/MAU。R&D World 称 "more than 22,000 clinical providers on the platform"【S26 ✅】，但一手来源没有这个数，出处不明，**不建议使用** |
| 行政负担 | 基线 | 目标减半 | S1 / S10 / S21 | **是目标，不是结果**；时间口径有四种，见第 7 节 |
| 使用结构 | — | 文档分析和摘要 32%、内容创作 20%、开发支持 16% | 【Claude原文 S1】 | 统计口径（按次数还是按用户）未说明 |

---

## 6. 方法论提炼（可复用到其他行业）

1. **破冰选"最厚的文档 × 最晚的加班"。** 肿瘤科同时有几百页转诊材料和 20% 的夜间文档时间，痛点可以直接量化【依据 S1；病历页数另见 S11、S21】。放到中国，可以对应三甲医院 MDT 会诊前的外院资料整理、保险理赔调阅病历等场景。
2. **"平台 + 标杆场景"双轨走。** 先给全员一个通用助手【S10、S11、S24】，再打一个深度临床标杆场景（肿瘤科病历预整理）【S1】。前者积累使用习惯和需求池，后者提供可以对外讲的数字。
3. **数据不出域是入场券。** 模型部署在客户自己的云账户里（Bedrock），"patient data never left its secure environment"【S1】；Banner 新闻稿也强调了"secure, HIPAA-compliant environment"【S24】。对应国内：私有化部署或专属云。
4. **把工作往下沉，不只是替医生打字。** 最大的 ROI 来自让培训较少的岗位（医助）产出高质量结果，医生只做审核和沟通【S1；S11 佐证】。这就是"劳动力放大器"的思路。
5. **让 AI 同时当质控员。** 核对身份和一致性（混入其他病人的记录、出生日期不一致）是低风险、感知强的价值点，能快速赢得临床信任【S1】。
6. **治理先行，并且量化打分、定期复查。** 多学科委员会（伦理、护理、医生）加 CHAI 框架，约 125 分的评分表，上线后定期复查【S10 ✅、S21 ✅、S19 ✅】。
7. **"不过度建设"，月度发版，把提示词工程产品化。** 模型一个月一变，所以不做大而全的前期设计【S10】；每月发版，做提示词库和提示词改进器，让业务方几小时搭出新应用【S1】；同一时间只深耕少数方向【S11】。
8. **从对话工具走向流程内智能体。** 规模化的前提是把"人去问 AI"变成"AI 嵌进流程"（automation agent）【S1 原句；"对话→智能体"是编剧提炼】。

---

## 7. 数字严谨性 & "评论区喷子"防御

**A. 数字都是公司自报，口径需要讲清楚**
- **"85%"**：正文写的是"Eighty-five percent of **respondents**"，页首摘要写成了"85% of **users**"【S1】。前者是调查受访者，不是全体用户，样本量和问卷方式都没公开。二手汇编写成"80–85%"【S17】。**脚本里建议说"85% 的受访用户"。**
- **"30 天"**：正文是 "project approval to a functioning proof of concept in less than 30 days"，页首摘要写成 "Deployed… in under 30 days"【S1】。**30 天是做出 POC 的时间，不是全员上线的时间**；2025 年 3 月还在试点【S10】，全员上线在 2025 年底【S1 / S24】。脚本别说"30 天全院上线"。
- **"50%"**：是**目标**，一共有四种时间口径：
  - "by the end of 2029"（S1 正文）
  - "over four years"（S1 页首摘要）
  - "reduce physicians' administrative burden by 50 percent over the next five years"（S10 ✅，2025 年 3 月；对象是 physicians）
  - "reduce the 50% of our administrative burden time for all of our clinical staff over the next five years"（S21 ✅，2026 年 1 月，自动字幕；对象是 all clinical staff）
  - "by 2030"（S17，二手）

  **第一轮引用的"Becker's 写 by 2029"来自 S14，本轮打不开，已删除。** 脚本只能说"目标是几年内减半"，**不能说已经减了 50%**。
- **"20%"和"2–3 小时"**：都是**上线前的基线**，没有公布"之后"的数字【S1】。喷子最可能问"那现在夜里还干几小时？"，只能如实回答"官方没公布"。能引用的最接近的"之后"数字是 CTO 口头估算的"每天约省 2 小时"（病历预处理）【S11】，但口径不同，不能拿来直接对比。
- **"8 小时/人"（本轮降级）**：原始出处 Becker's（S7）打不开；只在二手汇编 IntuitionLabs 里核到，而它又是转引 Becker's【S17】。而且这篇汇编里还有"1,400 pages"与"1,400 clinical notes"的混用，可靠性一般。Reagin 本人能核实的说法是"hours → minutes"【S11】。**脚本不要用"8 小时"。**
- **"病历多厚"有三个版本**：外院转诊"100、200、300 页"【S1，Walker】；平均病历约 135 页、复杂病人可达 500 页【S11，Reagin】；肿瘤病历平均 150 页以上【S21，Reagin】。三者口径不同，各自引用时要说明出处，不要混在一起。
- **"1,400 份病历"**：按 2025 年 6 月到 2026 年初约 6–7 个月算，每月约 200 份（【编剧建议·推算】），体量是试点级，和"55,000 人平台"不在一个量级。
- **"每 6 个月复查"和"首 6 个月监控后每年复审"**：Newsweek（2025 年 3 月）写的是后者【S10】，Reagin 在发布会（2026 年 1 月）上说的是前者【S21】，2026 年 6 月的新闻稿写的是"annual audits"【S19】。可能是制度调整过，也可能是口头表述不精确。**脚本里说"定期复查"最稳妥。**
- **医助"两天超过老员工几年"、"no human would ever catch"**：都是单个医生的主观引述和个案，不是统计结果【S1】。
- **视频引文**：S11 是本轮自己做的机器转写，S21 是 YouTube 自动字幕（字幕把 Reagin 写成了"Regan/Reagan"，把 Claude 写成了"clawed"）。关键数字（135/500 页、2 小时/天、8 分钟/患者）已经用第二个模型复核过，结果一致。成片前建议再听一遍原声。

**B. 可能的质疑和对应素材**
- "这就是个套壳 ChatGPT？"：媒体确实用过"ChatGPT-like program"来形容它【S23 ✅，转述 Modern Healthcare】。回应素材：部署在自家 AWS 里、患者数据不出域、配了知识库、文档上传和提示词工具、正在开发自动化 agent【S1】。
- "只用 Claude 吗？"（**本轮已查清**）：
  - "Banner Health launches AI assistant with Anthropic, OpenAI"只是 LinkedIn 用户 Inna Sheyn 2025-09-02 发帖的自动标题【S9 ✅】。帖子正文说的是 "Banner Health has partnered with Anthropic to launch BannerWise, an AI assistant built on Claude"；OpenAI 出现的上下文是 "OpenAI has partnered with Boston Children's"，即那篇报道同时写了两家公司在医疗的布局。**没有证据表明 BannerWise 使用 OpenAI**；Banner 所有公开材料（S1、S10、S11、S19、S21）里 BannerWise 都只和 Claude/Anthropic 一起出现。
  - 但 Banner **整体**并不只用一家 AI：Oracle 电子病历内置的 ambient 和 AI 功能【S11】、Regard【S20】，Reagin 也说过 "We have multiple technologies in place today"【S11】。**脚本可以说"BannerWise 基于 Claude"，别说"Banner 只用 Claude"。**
- "Anthropic 懂医疗吗？"：
  - Modern Healthcare 的报道角度是 AI 公司进医疗的"space race"【S22 ✅ 标题】。
  - 转发摘要说 "deep-pocketed tech firms with limited healthcare backgrounds are entering the industry"，并且 "Buyers tend to prefer established vendors like Epic and Microsoft, yet Anthropic's focus on 'constitutional AI'… helped win over Banner"【S9 ✅，LinkedIn 用户转述，非 Modern Healthcare 原文】。
  - Anthropic 的 Zubair Jandali 也承认 CIO 们 "bemoan the slowness of the deployment"【S22 ✅】。
- "AI 医疗安全吗？"：有治理委员会、CHAI 框架、约 125 分评分、定期复查【S10 / S21】；有伦理学者和临床领导审查、年度审计【S19】；原文强调了 "agent safety and reliability"【S1】。
- **负面报道**：本轮检索（英文加中文）**没有看到**针对 BannerWise 的负面报道、事故或员工投诉，但没有系统检索 Reddit / HN，**不能断言"没有争议"**。

---

## 8. 【编剧建议】钩子与叙事素材

> 以下都是创作建议，每一句依据的事实都注明了来源编号。

- **开场钩子**："晚上 6 点到早上 6 点，本该是医生睡觉的时间，却占了肿瘤科医生五分之一的文书时间。美国医生管这叫'睡衣时间'。"（S1：20%，18:00–06:00；"pajama time"见 S21 主持人的提问）
- **画面感**："一个转诊病人，带着 300 页外院病历进门。"（S1：Walker 原话"100, 200, 300 pages"）如果要接下一句，可以用 CTO 的原话："以前要几个小时，现在几分钟。"（S11："hours of time down to minutes of time"）**不要用"8 小时"。**
- **反转桥段 1（主推）**："所有人都以为这是给医生的工具，结果真正变强的是医生助理：新人培训两天，做出来的东西比干了几年的老手还好。"（S1）
- **反转桥段 2**："医院最怕 AI 胡说八道，结果 AI 先抓出了人的错：病历里有个出生日期对不上，'这种错人类永远发现不了'。"（S1）
- **反转桥段 3（本轮新增）**："CTO 说，以前一个想法能管好几年，现在一个月就得推翻：'等等，我们应该换个做法。'所以他们不做大而全的方案，每个月发一版。"（S10 + S1）
- **FDE 视角的金句**："接模型只用了不到 30 天，真正的魔法在后面：把提示词磨到适合这个模型。"（S1：Reagin，"The real magic started as we honed prompt structures"）
- **治理画面**："每一个 AI 应用上线前，都要过伦理学者、护士、医生组成的委员会，按一张约 125 分的表打分；上线后还要定期复查，看它有没有'漂移'。"（S10 + S21）
- **方法论升华**："先给全员一个安全的'私有 ChatGPT'，再用一个最痛的科室打出样板，最后把对话框变成流程里的智能体。"（S1、S10、S11；"对话框→智能体"是提炼）
- **类比（面向中国观众）**：可以类比国内三甲医院 MDT 会诊前，规培生熬夜整理外院资料。这是类比，不是事实。
- **对瑞蒙特的桥接**：Banner 有一个 5.5 万人的组织、一位专职 CTO、10 亿美元技术预算（S23 / S19），还专门新设了首席 AI 官（S19），所以能自己当 FDE。大多数中国医院和企业没有这样的内部团队，这正是外部 FDE 的价值。这是立场性观点，不能写成 Banner 的事实。
- **避坑提醒**：
  - 别说"夜间加班减少了 X%"，没有这个数；
  - 别说"30 天全员上线"，30 天是 POC；
  - 别说"行政负担已经减半"，那是目标；
  - 别说"Banner 只用 Claude"，Banner 还在用 Oracle、Regard 等；
  - 别用"8 小时/人"，原始出处未核实；
  - "每天省 2 小时"要说明是 CTO 的口头估算。

---

## 9. 来源清单

| 编号 | 标题 | 链接 | 类型 | 发布日期 | 是否已打开核实 |
|---|---|---|---|---|---|
| S1 | Banner Health battles physician burnout with Claude-powered AI platform | https://claude.com/customers/banner-health | Claude原文 | 2026-01-11（据 S2） | ✅ 本轮重新打开，关键句仍在 |
| S2 | Claude 客户故事列表页（数据字段含 banner-health 日期） | https://claude.com/customers | Claude原文（列表页） | — | ✅（第一轮）`"date":"2026-01-11T00:00:00.000Z"` |
| S3 | Advancing Claude in healthcare and the life sciences | https://www.anthropic.com/news/healthcare-life-sciences | Anthropic 公告（引用 Reagin） | 2026-01-11 | ✅ 本轮重新打开 |
| S4 | Healthcare \| Claude by Anthropic | https://claude.com/solutions/healthcare | Anthropic 产品页（Banner 列为客户） | — | ✅ 本轮重新打开 |
| S5 | The Briefing: Healthcare and Life Sciences（活动页） | https://www.anthropic.com/events/the-briefing-healthcare-and-life-sciences-virtual-event | Anthropic 活动页 | 2026-01-12 | ✅ 活动页已打开（页面没列嘉宾）；**本轮确认 Reagin 在 "Executive Customer Panel" 环节出场**，见 S21 |
| S6 | Introducing Claude Sonnet 4.5 | https://www.anthropic.com/news/claude-sonnet-4-5 | Anthropic 公告（用于时间线推断） | 2025-09-29 | ✅（第一轮） |
| S7 | Why Anthropic is targeting health systems with Claude（Becker's） | https://www.beckershospitalreview.com/healthcare-information-technology/ai/why-anthropic-is-targeting-health-systems-with-claude/ | 媒体 | 约 2026-01（archive.org 有 2026-01-16 快照） | ❌ 无法访问：Cloudflare 403 挑战页；WebFetch 报 EGRESS_BLOCKED；web.archive.org 连接被重置。其中独有的事实（8 小时/人、PDF/图片/传真）已降级 |
| S8 | Banner and Anthropic showcase the healthcare AI space race（Modern Healthcare，Gabriel Perna） | https://www.modernhealthcare.com/health-tech/ai/mh-banner-health-anthropic-partnership-ai/ | 媒体 | 约 2025-09-02（作者当天在 LinkedIn 发帖，见 S22） | ❌ 无法访问：Akamai "Access Denied"；WebFetch 报 EGRESS_BLOCKED；Wayback 快照（2026-01-11）打不开。**标题、作者、日期已由 S22、S23 间接确认** |
| S9 | LinkedIn 帖（Inna Sheyn）："Banner Health launches AI assistant with Anthropic, OpenAI" | https://www.linkedin.com/posts/innasheyn_banner-and-anthropic-showcase-the-healthcare-activity-7368748986209452032-hlJi | 社交媒体（用户转述 S8） | 2025-09-02 | ✅ 已打开。标题中的"OpenAI"是指报道同时写了 OpenAI，并非 Banner 使用 OpenAI |
| S10 | Health Systems' New AI Dilemma: Bet Now, or Wait for Better?（Newsweek，Alexis Kayser） | https://www.newsweek.com/health-systems-artificial-intelligence-ai-integration-2046465 | 媒体（Reagin 受访） | **2025-03-18**（Reagin 3 月 13 日受访；2025-09-06 更新） | ✅ 已打开，原句逐字核对。**第一轮日期"2025-07-18"有误，已更正** |
| S11 | Banner Health sees productivity gains with AI（HIMSS TV，Susan Morse 采访 Reagin；Healthcare IT News 同一视频页标题为 "CTO sees big productivity gains with AI at Banner Health"） | https://himsstv.brightcovegallery.com/detail/videos/ai-ml/video/6374830364112/banner-health-sees-productivity-gains-with-ai ；（Healthcare IT News 页 https://www.healthcareitnews.com/video/cto-sees-big-productivity-gains-ai-banner-health ） | 媒体视频（HIMSS 官方） | 2025-06-24（Brightcove 发布时间） | ✅ HIMSS TV 页和视频已打开；视频没有字幕，本轮下载官方视频做了机器转写（Whisper），关键段已复核。Healthcare IT News 页本身 ❌（Cloudflare 403） |
| S12 | How Banner Health uses AI for better care（Banner 官方 LinkedIn，#HIMSS25） | https://www.linkedin.com/posts/banner-health_himsstv-himss-himss25-activity-7345885924163010560-MApU | 客户方社交媒体 | 2025-07-01 | ✅ 已打开："our in‑house digital assistant and ambient voice technology are helping providers save time" |
| S13 | AI + the return to joyful medicine: Lessons from Banner Health & Hudson Physicians（Becker's） | https://www.beckershospitalreview.com/healthcare-information-technology/ai-the-return-to-joyful-medicine-lessons-from-banner-health-hudson-physicians/ | 媒体 | 不详 | ❌ 无法访问（Cloudflare 403；Wayback 没有快照）。"1,700 名医生用 Oracle"等说法已删除 |
| S14 | Banner Health bears down on strategy amid uncertainty（Becker's） | https://www.beckershospitalreview.com/hospital-management-administration/banner-health-bears-down-on-strategy-amid-uncertainty/ | 媒体 | 不详 | ❌ 无法访问（Cloudflare 403；Wayback 没有快照）。相关说法已删除 |
| S15 | Anthropic rolls out Claude for Healthcare: 7 notes（Becker's） | https://www.beckershospitalreview.com/healthcare-information-technology/ai/anthropic-rolls-out-claude-for-healthcare/ | 媒体 | 约 2026-01 | ❌ 无法访问（Cloudflare 403；Wayback 快照打不开）。正文没有依赖它 |
| S16 | JPM26: Anthropic launches Claude for Healthcare…（Fierce Healthcare） | https://www.fiercehealthcare.com/ai-and-machine-learning/jpm26-anthropic-launches-claude-healthcare-targeting-health-systems-payers | 媒体 | 2026-01 | ❌ 无法访问（Cloudflare 403；WebFetch 报 EGRESS_BLOCKED；Wayback 快照打不开）。正文没有依赖它 |
| S17 | Claude for Healthcare & Life Sciences: 2026 Technical Guide（IntuitionLabs） | https://intuitionlabs.ai/articles/claude-healthcare-life-sciences-ai-capabilities-2026 | 第三方汇编（二手） | 2026-02 首发，2026-08-09 更新 | ✅ 已打开。含"~8 hours per patient"、"80–85%"、"50% by 2030"、"$15.6B revenue"和 Reagin 的"tell you when it doesn't know an answer"，多处注明引自 S7，且有"1,400 pages / notes"混用。**只作二手参考** |
| S18 | Banner Health names new chief technology officer（Banner 新闻稿） | https://www.bannerhealth.com/newsroom/press-releases/banner-health-names-new-chief-technology-officer | 客户方新闻稿 | 2024-04-18 | ✅ 已打开。Becker's 版本（https://www.beckershospitalreview.com/hospital-executive-moves/banner-health-names-1st-technology-chief/ ）❌ Cloudflare 403。**第一轮的"Providence"和"Sharp 首席信息与创新官"原稿中没有，已删除** |
| S19 | Banner Health names new Chief Data Officer（Banner 新闻稿：Almasan 任 SVP、首席 AI、数据与基础设施官） | https://www.bannerhealth.com/newsroom/press-releases/banner-names-new-chief-data-officer | 客户方新闻稿 | 2026-06-05（6 月 1 日生效） | ✅ 已打开。Becker's（https://www.beckershospitalreview.com/hospital-executive-moves/banner-health-taps-chief-ai-data-and-infrastructure-officer/ ）❌ Cloudflare 403；Repertoire（https://repertoiremag.com/banner-health-creates-ai-focused-executive-role.html ）❌ 验证码页。第一轮"年份不确定"已确认为 2026 |
| S20 | Regard and Banner Health expand AI partnership to 33 acute care hospitals（AHA） | https://www.aha.org/role-hospitals-banner-health-regard-and-banner-health-expand-ai-partnership-33-acute-care-hospitals | 行业协会（背景：Banner 的其他 AI 供应商） | 页面没标日期 | ✅ 已打开 |
| S21 | The Briefing - Healthcare & Life Sciences（Anthropic YouTube 直播录像；Reagin 在 Executive Customer Panel 环节，约 00:41–01:01） | https://www.youtube.com/watch?v=UXyVMGAFLAs | Anthropic 活动视频（客户高管发言） | 2026-01-12 | ✅ 视频元数据和 YouTube 自动字幕已获取、逐句核对（自动字幕有错字，比如"Regan""clawed"） |
| S22 | Can OpenAI and Anthropic compete in healthcare?（Gabriel Perna，Modern Healthcare 记者本人的 LinkedIn 帖，分享 S8） | https://www.linkedin.com/posts/gabriel-perna-b41b114_banner-and-anthropic-showcase-the-healthcare-activity-7368750383428423680-YUFG | 社交媒体（记者） | 2025-09-02 | ✅ 已打开（含 Anthropic 的 Zubair Jandali 引语、S8 标题） |
| S23 | Banner Health CEO Amy Perry on running a health system with an insurance business（Healthcare Brew，Maia Anderson） | https://www.healthcare-brew.com/stories/2025/09/12/banner-health-ceo-health-system-insurance | 媒体 | 2025-09-19（页面 datePublished） | ✅ 已打开（10 亿美元 5 年技术投资、"ChatGPT-like program called BannerWise"） |
| S24 | Best Places to Work in IT 2026（Banner 新闻稿） | https://www.bannerhealth.com/newsroom/press-releases/best-places-to-work-in-it | 客户方新闻稿 | 2025-12-19 | ✅ 已打开（2025 年向全体员工部署 BannerWise） |
| S25 | Dr. Gary Walker, MD（Banner 医生主页） | https://doctors.bannerhealth.com/provider/gary-walker/449109 | 客户方官网 | — | ✅ 已打开（Clinical Informatics 委员会认证，2017） |
| S26 | Anthropic's Claude heads deeper into healthcare with HIPAA-ready tools（R&D World） | https://www.rdworldonline.com/anthropics-claude-heads-deeper-into-healthcare-with-hipaa-ready-tools/ | 媒体 | 2026-01-12 | ✅ 已打开（"more than 22,000 clinical providers on the platform"，一手来源没有，出处不明） |

**本轮未能突破的访问限制和建议人工补核的顺序**：
1. S7 Becker's：确认"8 小时/人"和"PDF、图片、纸质传真"的原句，以及 Reagin "tell you when it doesn't know an answer" 的原话。
2. S8 Modern Healthcare 原文：看有没有试点细节，以及 Anthropic 团队是否参与现场。
3. S13 / S14 Becker's：ambient 路线的数字（1,700 名医生等）。
4. S11 和 S21 视频：成片前再听一遍原声，核对机器转写和自动字幕里的数字（135/500 页、2 小时/天、8 分钟/患者、150 页、125 分、6 个月）。

另外："pajama time"这个说法在 S21 里得到确认，出自 Anthropic 主持人转述"Banner Oncologists"的说法。第一轮提到的"pajama time is almost eliminated with this technology"讲的是 ambient 工具，出处（Becker's）打不开，本文没有采用。
