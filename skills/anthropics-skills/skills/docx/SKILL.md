# DOCX - Word 文档处理

📦 **仓库**: `yanghao1143/chiclaude-skills`
🔥 **安装量**: 358K
🔗 **出处**: https://github.com/yanghao1143/chiclaude-skills

---

## 技能简介

用于创建、读取、编辑和操作 Word 文档（.docx 文件）的技能。支持专业文档格式化，包括目录、标题、页码、信头等。支持提取或重组 .docx 文件内容、插入或替换图片、查找和替换、跟踪修订和评论等功能。

---

## 概述

.docx 文件是一个包含 XML 文件的 ZIP 归档。

---

## 快速参考

| 任务 | 方法 |
|------|----------|
| 读取/分析内容 | `pandoc` 或解包获取原始 XML |
| 创建新文档 | 使用 `docx-js` - 参见下方创建新文档 |
| 编辑现有文档 | 解包 → 编辑 XML → 重新打包 |

---

### 将 .doc 转换为 .docx

旧版 `.doc` 文件必须先转换才能编辑：

```bash
python scripts/office/soffice.py --headless --convert-to docx document.doc
```

---

### 读取内容

```bash
# 带跟踪修订的文本提取
pandoc --track-changes=all document.docx -o output.md

# 原始 XML 访问
python scripts/office/unpack.py document.docx unpacked/
```

---

### 转换为图片

```bash
python scripts/office/soffice.py --headless --convert-to pdf document.docx
pdftoppm -jpeg -r 150 document.pdf page
```

---

### 接受跟踪修订

要生成一个接受所有跟踪修订的干净文档（需要 LibreOffice）：

```bash
python scripts/accept_changes.py input.docx output.docx
```

---

## 创建新文档

使用 JavaScript 生成 .docx 文件，然后验证。安装：`npm install -g docx`

### 设置

```javascript
const { Document, Packer, Paragraph, TextRun, Table, TableRow, TableCell, ImageRun,
        Header, Footer, AlignmentType, PageOrientation, LevelFormat, ExternalHyperlink,
        TableOfContents, HeadingLevel, BorderStyle, WidthType, ShadingType,
        VerticalAlign, PageNumber, PageBreak } = require('docx');

const doc = new Document({ sections: [{ children: [/* content */] }] });
Packer.toBuffer(doc).then(buffer => fs.writeFileSync("doc.docx", buffer));
```

### 验证

创建文件后，验证它。如果验证失败，解包、修复 XML，然后重新打包。

```bash
python scripts/office/validate.py doc.docx
```

---

### 页面大小

```javascript
// 关键：docx-js 默认使用 A4，不是 US Letter
// 始终明确设置页面大小以获得一致的结果
sections: [{
  properties: {
    page: {
      size: {
        width: 12240,   // 8.5 英寸（DXA 单位）
        height: 15840   // 11 英寸（DXA 单位）
      },
      margin: { top: 1440, right: 1440, bottom: 1440, left: 1440 } // 1 英寸边距
    }
  },
  children: [/* content */]
}]
```

**常见页面尺寸（DXA 单位，1440 DXA = 1 英寸）：**

| 纸张 | 宽度 | 高度 | 内容宽度（1英寸边距）|
|-------|-------|--------|---------------------------|
| US Letter | 12,240 | 15,840 | 9,360 |
| A4（默认）| 11,906 | 16,838 | 9,026 |

---

### 样式（覆盖内置标题）

使用 Arial 作为默认字体（通用支持）。保持标题为黑色以提高可读性。

```javascript
const doc = new Document({
  styles: {
    default: { document: { run: { font: "Arial", size: 24 } } }, // 12pt 默认
    paragraphStyles: [
      // 重要：使用精确的 ID 覆盖内置样式
      { id: "Heading1", name: "Heading 1", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 32, bold: true, font: "Arial" },
        paragraph: { spacing: { before: 240, after: 240 }, outlineLevel: 0 } },
      { id: "Heading2", name: "Heading 2", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 28, bold: true, font: "Arial" },
        paragraph: { spacing: { before: 180, after: 180 }, outlineLevel: 1 } },
    ]
  },
  sections: [{
    children: [
      new Paragraph({ heading: HeadingLevel.HEADING_1, children: [new TextRun("标题")] }),
    ]
  }]
});
```

---

### 列表（不要使用 unicode 项目符号）

```javascript
// ❌ 错误 - 永远不要手动插入项目符号字符
new Paragraph({ children: [new TextRun("• 项目")] })  // 错误

// ✅ 正确 - 使用带有 LevelFormat.BULLET 的编号配置
const doc = new Document({
  numbering: {
    config: [
      { reference: "bullets",
        levels: [{ level: 0, format: LevelFormat.BULLET, text: "•", alignment: AlignmentType.LEFT,
          style: { paragraph: { indent: { left: 720, hanging: 360 } } } }] },
      { reference: "numbers",
        levels: [{ level: 0, format: LevelFormat.DECIMAL, text: "%1.", alignment: AlignmentType.LEFT,
          style: { paragraph: { indent: { left: 720, hanging: 360 } } } }] },
    ]
  },
  sections: [{
    children: [
      new Paragraph({ numbering: { reference: "bullets", level: 0 },
        children: [new TextRun("项目")] }),
      new Paragraph({ numbering: { reference: "numbers", level: 0 },
        children: [new TextRun("编号项目")] }),
    ]
  }]
});
```

---

### 表格

**关键：表格需要双重宽度** - 在表格上设置 `columnWidths` 并在每个单元格上设置 `width`。没有两者，表格在某些平台上会渲染错误。

```javascript
// 关键：始终设置表格宽度以获得一致的渲染
// 关键：使用 ShadingType.CLEAR（不是 SOLID）以防止黑色背景
const border = { style: BorderStyle.SINGLE, size: 1, color: "CCCCCC" };
const borders = { top: border, bottom: border, left: border, right: border };

new Table({
  width: { size: 9360, type: WidthType.DXA }, // 始终使用 DXA（百分比在 Google Docs 中会出错）
  columnWidths: [4680, 4680], // 必须等于表格宽度（DXA: 1440 = 1 英寸）
  rows: [
    new TableRow({
      children: [
        new TableCell({
          borders,
          width: { size: 4680, type: WidthType.DXA }, // 也在每个单元格上设置
          shading: { fill: "D5E8F0", type: ShadingType.CLEAR }, // CLEAR 不是 SOLID
          margins: { top: 80, bottom: 80, left: 120, right: 120 },
          children: [new Paragraph({ children: [new TextRun("单元格")] })]
        })
      ]
    })
  ]
})
```

---

### 图片

```javascript
// 关键：type 参数是必需的
new Paragraph({
  children: [new ImageRun({
    type: "png", // 必需：png, jpg, jpeg, gif, bmp, svg
    data: fs.readFileSync("image.png"),
    transformation: { width: 200, height: 150 },
    altText: { title: "标题", description: "描述", name: "名称" } // 三个都需要
  })]
})
```

---

### 分页符

```javascript
// 关键：PageBreak 必须在 Paragraph 内
new Paragraph({ children: [new PageBreak()] })

// 或使用 pageBreakBefore
new Paragraph({ pageBreakBefore: true, children: [new TextRun("新页面")] })
```

---

### 目录

```javascript
// 关键：标题必须只使用 HeadingLevel - 不使用自定义样式
new TableOfContents("目录", { hyperlink: true, headingStyleRange: "1-3" })
```

---

### 页眉/页脚

```javascript
sections: [{
  properties: {
    page: { margin: { top: 1440, right: 1440, bottom: 1440, left: 1440 } } // 1440 = 1 英寸
  },
  headers: {
    default: new Header({ children: [new Paragraph({ children: [new TextRun("页眉")] })] })
  },
  footers: {
    default: new Footer({ children: [new Paragraph({
      children: [new TextRun("第 "), new TextRun({ children: [PageNumber.CURRENT] })]
    })] })
  },
  children: [/* content */]
}]
```

---

## 编辑现有文档

**按顺序执行所有 3 个步骤。**

### 步骤 1：解包

```bash
python scripts/office/unpack.py document.docx unpacked/
```

提取 XML，美化打印，合并相邻运行，并将智能引号转换为 XML 实体（`&#x201C;` 等），以便它们在编辑后仍然有效。使用 `--merge-runs false` 跳过运行合并。

### 步骤 2：编辑 XML

编辑 `unpacked/word/` 中的文件。参见下方的 XML 参考。

**使用 "Claude" 作为跟踪修订和评论的作者**，除非用户明确要求使用不同的名称。

**关键：对新内容使用智能引号。** 当添加带有撇号或引号的文本时，使用 XML 实体生成智能引号：

```xml
<!-- 使用这些实体实现专业排版 -->
<w:t>这是一个引用：&#x201C;你好&#x201D;</w:t>
```

| 实体 | 字符 |
|--------|-----------|
| `&#x2018;` | '（左单引号）|
| `&#x2019;` | '（右单引号/撇号）|
| `&#x201C;` | "（左双引号）|
| `&#x201D;` | "（右双引号）|

### 步骤 3：打包

```bash
python scripts/office/pack.py unpacked/ output.docx --original document.docx
```

使用自动修复进行验证，压缩 XML，并创建 DOCX。使用 `--validate false` 跳过。

---

## 依赖项

- **pandoc**: 文本提取
- **docx**: `npm install -g docx`（新文档）
- **LibreOffice**: PDF 转换（通过 `scripts/office/soffice.py` 自动配置）
- **Poppler**: 用于图片的 `pdftoppm`

---

## 典型应用场景

- 创建专业报告和文档
- 生成带有格式化的合同和协议
- 批量处理和编辑 Word 文档
- 从数据库生成邮件合并文档
- 创建带有目录的技术文档

---

*翻译搬运自 [skills.sh](https://github.com/yanghao1143/chiclaude-skills)*

📌 *Skills市场搬运计划 - 热门技能系列*
