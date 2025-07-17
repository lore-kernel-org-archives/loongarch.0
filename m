Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D00529B781
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752748381; cv=none; b=s84ht9XnWuTnApGcdJGYqjLHGmtZjZOtONZ42+YYCmy4gW2fMGS9m5LUxGeZ3y1m0vIT1cBU5x7aXamNLNcoidMWtbTW3wy24df7znRQqUjD6ExTBfm+m2PiaWwE6AsszHf55y6KNYMsKtzmIoTBXOIt+ec905UeiBrgyVNgB5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752748381; c=relaxed/simple;
	bh=vp8F/aC/cZooJCbJwE+TaQJZ/3NVmFILN3IZLxtFeec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0i6FyWwmCrwuZi1qlp1PLz/8K5zSX/6yHnT8gdwXwmJ8Np8PN+bpKf0EK5rD3LqTu67ach40NXF3Bg8Htie1psKZyE8u7NAsr5B9ydv+IZ6RNV+SEgnFS9rX947YMdZf5qvwGQ3EZunL8Z6rA3zJRPF77U0kuCGy5K60hSzygE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B80EA2ZW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B80EA2ZW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so568241f8f.2
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748378; x=1753353178; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAFLXGS25z8S0WanVyIjmw4Vp4se3d5lBR+FdNubaFk=;
        b=B80EA2ZWyAWBJGdsvl+mwCUN9u9ZjymxXU/R2K3mKdfjpLAQcfKGMoDsePPwkS20Aw
         oAyz/1q8feN7IqAaiOq3BIYMQMwFGcbad443GkBpEGK7zSJXWEVrFM20nzODE65i3Xjp
         dWCVu9ouexz4r70KrLn39bDq/QeiI85Yjjq6eGetCR0dyy9Qs7ie+9cfJ803v6DgIPne
         rhXpoPZIsg1aUvotCp541U2g5jnVsJPLAtkvLuH4PaGC5Jn8NX70/2/kYtpklVM1Zj0h
         ZaSVH9iHwTLDjBJuqR/dMbZ54FmnKzsAibg6+a6A8ywg7/rBXU9mj3qLyDXFCyc9CXgW
         4dSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748378; x=1753353178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAFLXGS25z8S0WanVyIjmw4Vp4se3d5lBR+FdNubaFk=;
        b=t/aACidxmatC3BWdz5IHUL3KULNYwtEtecRA9yQNw8uKuEtYKKjsGAVD9eTzbbKTmQ
         2VZCJ6uPtu6nw0ytk5OHS+e6xBcBXx2U5u1YJJHGaxF5ohm2MgtVR7KKvoBgEZqXJn7e
         Wd9t9opgzhLOjpJzoCXn5rzmEJJ4GxeFxIVtJYWyWI7C4CPKdzVvaEr5qJvxn1D8kird
         QM3a9bNRa+sTXI9fNumIK/YCWAeECbc/NS+zE3RIhIqNYVZvhpcrY8Ns6h6CPt5mhj85
         THBVd+eRpjPZb6Y9ZzOLA0UDAe87duqosowyIkrYnD/8rZgBJBmTxkZIboj9xdYuxDNe
         Q5fQ==
X-Forwarded-Encrypted: i=1; AJvYcCX285EnuQCskOxTZxnIgJgp2TIgEGko9OPDkiSQUumeKx1Md65HwvPjqYXDtYzfSJW6Dq6aGyGl2OE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYEpjL2MIbH8Ob5uvEeFB06UJ8fV+bYUdOIuQTl1aHGNQHRygg
	nva38MKZ+fvqjYUC8m1j/KWhM59t6oYG4vq7KBH9pDHhrykEP2LBLG04
X-Gm-Gg: ASbGncuL+8tTjaxN7T5BKwgd8IAKtH+vhsMtyH0Fr5K7bVvrDtKnxvukX3nbWVIWBej
	MJctDdSgGlnHN7aSM9vsFVQNiDjYmBTBqLy30QOuoqJ1aJfIQ/+0nCcIVmCPO5jnS5b9TJeTcgR
	yUT2onKnj9prqNFudBqsxTFFLu3GgLr15tft5EhFhk54WSHMrOeVq7XCdGadh8NVKjEr5Nv5RuG
	M/xrSRFhJ7XfoZzvmdwQZK9Jc5fL8gQ0pIb4nv54MoSnLCSSDLE09HnvKOCBhHy9G+qOO67XMKF
	bw60v7sSN6NRUZRvk2EVMF3QOLTbxtIgwokzESWdUc2Z4SR6qCweX1FLM/Xuj21T6hDJrPu4qsN
	xrs9Ktrk0MTIvsRNZkRk+J39SLK8hmpd64+nqBP/CgzA9NYnIC3CwRi7VeJNrHCmyBhQ7lco0JJ
	k8NL2EIoFZFca3IA==
X-Google-Smtp-Source: AGHT+IEdwrBNkg9M8guchW0vI+6tEPzp3HT7pxcYs5sGp6dD4O7OxQ4GRP3g0Y8ml2hczWmCiC6jOQ==
X-Received: by 2002:a05:6000:1887:b0:3a4:cfbf:519b with SMTP id ffacd0b85a97d-3b60e5103fcmr4782590f8f.44.1752748378428;
        Thu, 17 Jul 2025 03:32:58 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc91d8sm20127132f8f.42.2025.07.17.03.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:57 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Subject: [PATCH v2 5/7] clk: mvebu: Embed syscore_ops in clock context
Date: Thu, 17 Jul 2025 12:32:39 +0200
Message-ID: <20250717103241.2806798-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the clock context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/mvebu/common.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index ee77d307efe0..53712c3e5087 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,6 +189,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
+	struct syscore_ops syscore;
 	spinlock_t *lock;
 	struct clk **gates;
 	int num_gates;
@@ -196,11 +197,15 @@ struct clk_gating_ctrl {
 	u32 saved_reg;
 };
 
-static struct clk_gating_ctrl *ctrl;
+static inline struct clk_gating_ctrl *from_syscore(struct syscore_ops *ops)
+{
+	return container_of(ops, struct clk_gating_ctrl, syscore);
+}
 
 static struct clk *clk_gating_get_src(
 	struct of_phandle_args *clkspec, void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
 	int n;
 
 	if (clkspec->args_count < 1)
@@ -217,23 +222,23 @@ static struct clk *clk_gating_get_src(
 
 static int mvebu_clk_gating_suspend(struct syscore_ops *ops)
 {
+	struct clk_gating_ctrl *ctrl = from_syscore(ops);
+
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
 static void mvebu_clk_gating_resume(struct syscore_ops *ops)
 {
+	struct clk_gating_ctrl *ctrl = from_syscore(ops);
+
 	writel(ctrl->saved_reg, ctrl->base);
 }
 
-static struct syscore_ops clk_gate_syscore_ops = {
-	.suspend = mvebu_clk_gating_suspend,
-	.resume = mvebu_clk_gating_resume,
-};
-
 void __init mvebu_clk_gating_setup(struct device_node *np,
 				   const struct clk_gating_soc_desc *desc)
 {
+	static struct clk_gating_ctrl *ctrl;
 	struct clk *clk;
 	void __iomem *base;
 	const char *default_parent = NULL;
@@ -284,7 +289,9 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 
 	of_clk_add_provider(np, clk_gating_get_src, ctrl);
 
-	register_syscore_ops(&clk_gate_syscore_ops);
+	ctrl->syscore.suspend = mvebu_clk_gating_suspend;
+	ctrl->syscore.resume = mvebu_clk_gating_resume;
+	register_syscore_ops(&ctrl->syscore);
 
 	return;
 gates_out:
-- 
2.50.0

