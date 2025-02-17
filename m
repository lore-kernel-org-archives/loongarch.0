Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171CC226175
	for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810254; cv=none; b=Y+QGKT3zbHmwmYNCmeILJulC7i4LczKv34E+QXiaW59tk/IE+DVtMvD5/C3ReCuJSZSQiB+BVVNamTgxb43TUh7jEs2jW9wN1FVAJZcyBJH7Rk814yLjNPn4B1RjyUDlw4VcX5iFalmTs+r6hrGcDe6jp289DLposa1aCQQRFDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810254; c=relaxed/simple;
	bh=DuPHIcrT6Z5/GlVXfn7nt7Gawv/AJP9WOltQ42MmeC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=apQmSkDsf3zblBZ48d1DlSJkALm5eem9za7EmZtk2zC3/GohLuTrK7uCKX4xomDHEaCzE2ovFss7/GKNvEWPFefvHeApDF88a6CIguaqYtMC8/OCQfVPbivfGnvpBK9nGd1fdzl3lhPHV5MAyNOmTZpy0VqFsvdo/AdClsiptHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fX8v5fH7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fX8v5fH7"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f2c4382d1so1803555f8f.0
        for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 08:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810251; x=1740415051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX3Bs3MZrgBGo5LMWaEIe0GFuG33MQ381ctUNe/mVnI=;
        b=fX8v5fH78I1GyqbEmFs4UpoWV9MIujbVJunZUCLee1nKd9IO8w2nr0+t5GazpNqmzF
         x46mksVGQ1A32gf8KfnzQ8abX57ot92iW8h7fcCGIwboV4YWGCvux818M+TrdNd0E0BV
         wiwUNYMX1InhEvnY4PDQLG4+CIrdb10RNMiqNd8v3l110EuIANHzheV+slpic7XiDVZW
         xMsOcBHNunYW8CTxkrb48smR7vyH0CsepHrb/PmhRRK/aMk1IYbZIWq0CtTuzUKlFcqR
         svYADMOvo/2ZB35C2oniZQO2g1DlWAfFrX9cngKmJkArQy/PvytCswARw+7bYAsdYPUT
         IRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810251; x=1740415051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YX3Bs3MZrgBGo5LMWaEIe0GFuG33MQ381ctUNe/mVnI=;
        b=h6O94lvcHJEjDloRip6Cfmo30KUzt0WJcyV7Me0e4G0Ded/VSJN7mn5d727vtYLv0R
         36SL/N/bvt6CHEsyxZ4mcuqHhIRuvNODqHZ/plf51QNjV9WewIiT+ZHbEdT+2QivgYbg
         bfcZPz3fPr3Iav1SAuqE80oZv25/uni4SEr8CWz71lhW4evpmqHdkxN5P4obLJxhBamj
         +ry+Z5DeH++62nOtQf3aldFswjayId2nl2vkfqZiY/zXu61nbl8cNBaIcOTSv2AG4ove
         gyrQhoxY8xerUOUbg691LksBjYa5eduSwUgT8UI1afDHZyXaplSCMkkSDRcMmASZlGDr
         A8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYof6w9/CWB1QzkXi9DQdqEwQHbUPHaGoNEm4oVG2F3ebq9uRAU5vJ9naHEdnU5g8Sk3GcrcoYrZU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxb4GT591B/9+kbNmC1UcsnxrPYy6U0hqxuHWKFx+t1DLJoAbdO
	JoRzF6J3RHt91u29XoG1x+jRj5zocTIC3eB4yqJmZmW1ufJxMtSC
X-Gm-Gg: ASbGncthe9oOUjGQOx2o9MjT4cxdrom2Btfp8UgROtqqid4Es773BmrdhESuQmsVyKi
	c4qEPX0gjfiP1lSmHXzi9cNmBkX47A+/PSCVZa1FDuAYiErHMI6mkVvlp2qtMAzxo8jbDltZhqr
	7uvqapcBSw0vchmN0oftWXVvhYtEhwPiQtD+5Vr262UzFOFYFe6WMdyPiwnVGbSF4Ord0Azsjrk
	5cmtPmCXPXjZ88vz1/KGI0F4/amJAFUnbr2EDFG1pDf9fspo/GmAlxOKBHj9a4SVyjo3nI/gTqK
	VcmrNmIGnZ8SC1NsXGDBv497gGU99eTg6Af8mZI9FBZy/6sRrwZdazTqszjVBXYmPFGfgO3aSZg
	rWT6zYU0=
X-Google-Smtp-Source: AGHT+IGKeFn1JZI+61Y36W80rkeFL6tO0xV+0w/zCm2hwXiflv2MWSmUK04720sV0csGUnPk6PUGmQ==
X-Received: by 2002:adf:9bdd:0:b0:38d:dffc:c14f with SMTP id ffacd0b85a97d-38f24ce77dcmr14937408f8f.1.1739810251284;
        Mon, 17 Feb 2025 08:37:31 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259d5d8bsm12702877f8f.70.2025.02.17.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:30 -0800 (PST)
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
Subject: [PATCH 5/7] clk: mvebu: Embed syscore_ops in clock context
Date: Mon, 17 Feb 2025 17:37:11 +0100
Message-ID: <20250217163713.211949-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
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
2.48.1

