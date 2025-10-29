Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27E634C99D
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 16:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755638; cv=none; b=B/uRytdE7vujW/hc4z28cGaqsEsiPCnESMn1JymZq4SfXB9zkNkvqm79+qFR/e4D1VIqV3mPQFto+O+9ziHIxqzHEHb78AG8tk4CScuTbStlLKS5jM7YguWaf33rC49CLA8iRqSKJUX2+4Xg4pvt/d8OQXBkCSJ2WfLDFEbotNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755638; c=relaxed/simple;
	bh=oprYoP8yymfB2u4RbgujgsNH+i0ZQOd4dygbCg75p/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBsUOvUoHjx45WZ09t5DyaEp72NQ8uPnMYkoYkH6Z+R6ON+zMIF8ZpYgjuYEls7Jnr+/rR4pNzp8/sUKKjM8KUqDcMOEQkKF9+i2kPu8DB9k7wYLQMpNPnajTTFXBkwSmJEeBfwlVkq97GYD2rn4ZOS48OLHsg7nIWCOewvL464=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmhFMbvy; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmhFMbvy"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso27662966b.0
        for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 09:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755634; x=1762360434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=;
        b=JmhFMbvyXwpQ9oLkL+lMnldkZCRQyA2KbP7VT0sxI0mOfb1SHZ6+7fYmVcWYEkJUMB
         nhCAAfcEivoSkf8owY/up6vlkE4SBE52MsVZdrzKdX5M+yL0OOThdLtH3Hg+ZZj8rj08
         BYiZQr+2/KNBSd2AOfRJzeq9z5LNA9NAeaJnZODpSBA4oANx3JOQ9UOhnzZwsTpHb+Ge
         Uh+Jz/vDZAPVaR4O0qxDrtYXeabMnuPDvkXUKnq5YNq0uaBjqKe62R1fiS1liUQimnip
         mqv62cc2dko0a5eUDdno1TZJYCtAs3g024Cv88JO/nj4KCWZhswphddG0zAo7U3JkOrd
         7kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755634; x=1762360434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=;
        b=eZlqQ0BI+YKIilIRM5knpvNzp4Sw4U+qOPwdvwBW21Z4hx35xoOkoD52FgjJnTop9F
         lCmqBfNzEnJVo9VUvgDsgtuWAIskYEorb8zGsDWplXhdzgTF0ZvjRytgiCixWcZ9B9jT
         w2SkVza48joFap7T4yLavKTrlo2CsDUXLJaJWcZd7jJ9pMOybj9p1kTxS9/kJ2BHifdZ
         +SGalix6sWUQfs1M06aAYDo3T7Vbspx6Qbiu3zhrXRH9GS38Kzyn5Tc1wIZMISmZjLJg
         3h7i9On5xCqq/VVuSmSn+YAY3Z49MQdquLijMrPfRY9saurjod1RJlowgh1OxfmO50Lm
         h4Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXWcJzSYJ+FfqmrfEUwzNNfSpXMctjUALyk2iAooXmxs1InM/mC4yJwpFMSnFYnvhCUhD/6HqpEREY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbAQGZcr4Kft4M5+Plhqms4n4pLU8BVq2tx4w9CryPcuirMF3H
	oYPHoIoPaG1RREoqWVPhRAaA42TokiK49J5RFV46zNdV8nDoQicu/+0Z
X-Gm-Gg: ASbGncusmVZLsutJWpoIpWhNfBlxonAuCnOjFFYn8sZmdzr72R9Qe5vRAgZRQVLSqGy
	cfVoX20a/v7cjAbAwNtWIJj0k/LoIaN/RVqKfv6f2HukqlRAaE3RC6zkbsuYUjQGkBWk3AMPfDS
	/kNbIMV1WIKvTLHMBlVeyQLHdILS59MC7w+tssBsJhmbJPyqi79+j6C6YmEQ108wG7yFmqYgSYL
	cdeIWpUoMzkFobBe5Eu5HJDoTP9/0OHMdHYa2yvAjWiHXVgew/dmzCrvLspcmLQggq+vtYHz1bj
	Rro/EISIS2gl2ffpdH0E3VzKaUK5dIYnt+PcMJNKZ552WeuNHaVw4I72UoffZ4T4igJ8hrTPg6z
	0//uQJJDeOGdvjI+dUY22i6fCEMsoyIobsntoSf9IwMUKytMPAYqV28nGK1yJgZAiYwTHGJQRl9
	hSP9EIrNWOsWR4VcioCT1+4JBJEq8FqxNzWkSzUmFC3zB4ryoNajcQnOv002v7pVtIEN3w
X-Google-Smtp-Source: AGHT+IGxst0GGPbE3zlpzuYvmZD7MtT+fgNns/2gbspQBUcAcExwpAJ9gNyBIh9hmr+9IwgchPtgzg==
X-Received: by 2002:a17:906:6a21:b0:b3f:f6d:1d9e with SMTP id a640c23a62f3a-b7051f278acmr28890666b.6.1761755633985;
        Wed, 29 Oct 2025 09:33:53 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853696a3sm1468789266b.27.2025.10.29.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] clk: mvebu: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:34 +0100
Message-ID: <20251029163336.2785270-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/clk/mvebu/common.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 5adbbd91a6db..8797de93472c 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,6 +189,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
+	struct syscore syscore;
 	spinlock_t *lock;
 	struct clk **gates;
 	int num_gates;
@@ -196,11 +197,10 @@ struct clk_gating_ctrl {
 	u32 saved_reg;
 };
 
-static struct clk_gating_ctrl *ctrl;
-
 static struct clk *clk_gating_get_src(
 	struct of_phandle_args *clkspec, void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
 	int n;
 
 	if (clkspec->args_count < 1)
@@ -217,12 +217,16 @@ static struct clk *clk_gating_get_src(
 
 static int mvebu_clk_gating_suspend(void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
+
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
 static void mvebu_clk_gating_resume(void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
+
 	writel(ctrl->saved_reg, ctrl->base);
 }
 
@@ -231,13 +235,10 @@ static const struct syscore_ops clk_gate_syscore_ops = {
 	.resume = mvebu_clk_gating_resume,
 };
 
-static struct syscore clk_gate_syscore = {
-	.ops = &clk_gate_syscore_ops,
-};
-
 void __init mvebu_clk_gating_setup(struct device_node *np,
 				   const struct clk_gating_soc_desc *desc)
 {
+	static struct clk_gating_ctrl *ctrl;
 	struct clk *clk;
 	void __iomem *base;
 	const char *default_parent = NULL;
@@ -288,7 +289,9 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 
 	of_clk_add_provider(np, clk_gating_get_src, ctrl);
 
-	register_syscore(&clk_gate_syscore);
+	ctrl->syscore.ops = &clk_gate_syscore_ops;
+	ctrl->syscore.data = ctrl;
+	register_syscore(&ctrl->syscore);
 
 	return;
 gates_out:
-- 
2.51.0

