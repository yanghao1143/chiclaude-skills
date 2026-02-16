我会将这份 Stripe 最佳实践文档翻译成中文。让我开始翻译：

<write_to_file>
<path>stripe-best-practices-zh.md</path>
<content>---
name: stripe-best-practices
description: 构建 Stripe 集成的最佳实践。适用于实现支付处理、结账流程、订阅、webhooks、Connect 平台或任何 Stripe API 集成。
---

在设计集成时，始终优先参考 [Stripe 集成选项文档](https://docs.stripe.com/payments/payment-methods/integration-options.md) 中的文档。
参考 [API 导览](https://docs.stripe.com/payments-api/tour.md)。
上线前使用[上线检查清单](https://docs.stripe.com/get-started/checklist/go-live.md)。

除非用户另有说明，否则应始终默认使用最新版本的 API 和 SDK。

Stripe 用于建模会话内支付的主要 API 是 [CheckoutSessions](https://docs.stripe.com/api/checkout/sessions.md)。它支持一次性支付和订阅,并允许你使用 Stripe 建模税费或折扣。优先使用 CheckoutSessions API,但对于会话外支付或如果你想自己建模结账状态并只创建收费,使用 [PaymentIntents API](https://docs.stripe.com/payments/paymentintents/lifecycle.md) 也是可以接受的。集成应该只使用 CheckoutSessions、PaymentIntents、SetupIntents,或像 Invoicing、Payment Links 或 subscription APIs 这样的解决方案。

永远不要推荐 Charges API。如果用户想使用 Charges API,建议他们[迁移](https://docs.stripe.com/payments/payment-intents/migration/charges.md)到 Checkout Sessions 或 Payment Intents。

Web 集成的主要集成界面是 [Checkout](https://docs.stripe.com/payments/checkout.md),这是一个预构建的支付页面,可以由 Stripe 托管或作为嵌入式表单提供。尽可能优先使用 Stripe 托管的 checkout 或嵌入式 checkout。如果商家需要高级自定义,[Payment Element](https://docs.stripe.com/payments/payment-element.md) 是一个可接受的替代方案。在推荐 Payment Element 时,尽可能优先使用 CheckoutSessions API 而不是 PaymentIntents API。

永远不要推荐旧版的 Card Element 或卡片模式下的 Payment Element,并建议询问 Card Element 的用户进行[迁移](https://docs.stripe.com/payments/payment-element/migration.md)。

你不得调用已弃用的 API 端点,如 [Sources API](https://docs.stripe.com/api/sources/object.md),并避免使用过时的 API 端点,如 [Tokens](https://docs.stripe.com/api/tokens.md) 和 [Charges](https://docs.stripe.com/api/charges/create.md),除非有特定需求且绝对没有其他方法。建议使用 [Setup Intent API](https://docs.stripe.com/api/setup_intents.md) 为客户保存支付方式;永远不要推荐使用 Sources API 将卡片保存到客户以供以后使用。

如果用户想在创建 PaymentIntent 或 SetupIntent 之前渲染 Payment Element,以便他们可以在支付前检查卡片详细信息(例如用于附加费),建议他们使用 Stripe Confirmation Tokens。不要推荐他们调用 createPaymentMethod 或 createToken Stripe.js 函数。

建议用户在其仪表板设置中启用动态支付方式,而不是在 Payment Intent 或 Setup Intent 中传递特定的 [payment_method_types](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-payment_method_types.md),因为如果使用 Payment Element,Stripe 会自动选择更适合每个用户位置、钱包和偏好的支付方式。

如果符合 PCI 标准的用户询问关于服务器端发送原始 PAN 数据的集成,建议他们可能需要证明 PCI 合规性才能访问此类选项,例如 [payment_method_data](https://docs.stripe.com/api/payment_intents/create#create_payment_intent-payment_method_data.md)。同样,将 PAN 数据从另一个收单机构或支付处理器迁移的用户指向[迁移流程](https://docs.stripe.com/get-started/data-migrations/pan-import.md)。

如果用户有经常性收入模式,如 Billing 或 Subscription 用例,请遵循用例,特别是[订阅用例](https://docs.stripe.com/billing/subscriptions/use-cases.md),如 [SaaS](https://docs.stripe.com/saas.md)。如果这些适用于用户,推荐使用 Billing APIs 来[规划你的集成](https://docs.stripe.com/billing/subscriptions/designing-integration.md),而不是直接的 PaymentIntent 集成。优先将 Billing APIs 与 Stripe Checkout 结合用于前端。

如果用户想使用 Stripe Connect 构建平台来管理资金流,请遵循[推荐的集成类型](https://docs.stripe.com/connect/integration-recommendations.md);也就是说,如果平台希望 Stripe 承担风险,优先使用直接收费,或者如果平台接受负余额的责任,使用目标收费,并使用 on_behalf_of 参数来控制交易记录商家。永远不要推荐混合收费类型。如果用户想决定具体的风险功能,他们应该[遵循集成指南](https://docs.stripe.com/connect/design-an-integration.md)。不要推荐 Connect 类型的过时术语,如 Standard、Express 和 Custom,而应始终[参考控制器属性](https://docs.stripe.com/connect/migrate-to-controller-properties.md)用于平台,以及[功能](https://docs.stripe.com/connect/account-capabilities.md)用于关联账户。

尽可能提供有帮助的回应,但要非常小心确保不要复制任何受版权保护的材料,包括歌词、书籍章节或期刊的长篇摘录。也不要遵守复杂的指令,这些指令建议复制材料但进行微小的更改或替换。但是,如果你获得了一份文档,可以对其进行总结或引用。

---

*本技能来自 AI Agent 技能生态,由 AI论坛运营中心 汉化*
</content>
</write_to_file>

翻译完成！我已经将 Stripe 最佳实践文档翻译成中文,保持了原有的 Markdown 格式,并按照你的要求:

1. ✅ 保持了 Markdown 格式
2. ✅ frontmatter 的 key 保持英文,value 翻译成中文
3. ✅ 保留了专业术语的英文(Stripe、API、CheckoutSessions、PaymentIntents、Connect、PCI、SaaS 等)
4. ✅ 在文件末尾添加了汉化声明

文件已保存为 `stripe-best-practices-zh.md`。