# 官网「产品介绍」板块改版（原「落地路径」）

基于 raymount.tech 当前线上构建产物（`index-Ba_aRa6F.js` / `index-_BdK0d3g.css`）直接打补丁，
把第 03 屏「落地路径」改为「产品介绍」，结构由「认知→诊断→共创/落地→护航」改为
「诊断 → 主要方案（MVD 验证→智能体落地→护航与扩张）＋ 次要方案（部门共创）」。

## 文案

- 板块标题（角标）：`WHAT WE OFFER · 产品介绍`；导航与页脚同步改为「产品介绍」
- 主标题：先诊断、再证明、后上线、终扩张。
- 副文案（仅非演示模式显示）：一条主线四步推进，每一步独立交付、独立验收；部门共创作为次要方案，可单独切入。

| 编号 | 分组 | 标题 | 说明 |
| --- | --- | --- | --- |
| 01 | 起点 | 企业诊断 | 深入梳理企业业务流程，提炼能做、能推广、价值高的 AI 赋能场景，规划企业落地路线图。 |
| 02 | 主要方案 | 最小可行交付（MVD）验证 | 快速搭建交付演示，用企业真实历史数据回测，先验证投资回报，再决定是否落地。 |
| 03 | 主要方案 | 智能体落地 | 对接企业数据端口，搭建完整智能体。 |
| 04 | 主要方案 | 护航与扩张 | 上线后 90 天持续答疑。用实测投资回报决定下一个智能体场景。 |
| 05 | 次要方案 | 部门共创 | 与部门骨干共创 AI 工作流。交付智能体技能、工作流、提示词等轻量成果。 |

## 文件

- `index-Ba_aRa6F.js`：已打补丁的构建 JS（数据数组、路径图渲染、导航/页脚文案、标题）
- `index-_BdK0d3g.css`：原 CSS 末尾追加了 `.method-path-v2` 布局规则（桌面 / ≤1180 / ≤680 / 小高度）
- `preview/index.html`：本地预览页，用本地静态服务器打开 `preview/index.html#method`
- `preview/*.png`：桌面端 1440×900 与移动端 390×844 渲染截图

## 上线方式

1. 快速方式：把两份文件覆盖到线上 `assets/` 目录下同名文件（文件名保持不变，HTML 无需改动）。
2. 正规方式：把以下改动回移到 Vue 源码后重新构建：
   - 步骤数据数组（原 `AI通识/工作诊断/部门共创/智能体落地`）换成上表 5 项，并加 `lane: entry | primary | secondary` 字段；
   - 路径图模板：`article.path-step.path-entry` → `span.path-connector.connector-fork` → `div.path-lanes`，
     其中 `div.path-lane.lane-primary`（`p.lane-label` + `div.lane-steps` 内 3 张 `article.path-step`，中间 `span.connector-serial`）
     和 `div.path-lane.lane-secondary`（`p.lane-label` + `aside.path-step.path-escort`）；根节点类名 `method-path method-path-v2`；
   - 样式：见 CSS 文件末尾 `/* ===== 产品介绍 · 路径图 v2 ===== */` 之后的全部规则；
   - 导航项、SectionHeading 的 kicker/title/description、场景页脚 meta 文案同步更新。

## 验证

已用 Chromium 在 1440×900、1440×780、1280×720、1024×768、820×1180、600×800、390×844、375×667 下渲染，
路径图在演示模式（整屏固定高度）下均不与页脚重叠，无 JS 运行错误。
