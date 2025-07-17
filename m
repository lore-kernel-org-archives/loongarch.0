Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AB229ACF6
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 10:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752748380; cv=none; b=LdQ4pzMzC9Yn5+E+gimm4iEcyajnxUn6cSaG4PjH008KnZDvG/uAvwW4khpysrhAqu54bs1ZcM4c9x18s8p7iSf7SjFE0Gh+m6KixQlJ4VY0WzZSUSLAJ/GRTjsxv1umcYvibIVGFKUvScsWc+fA2V1zyVClk2kGbh2whVOb1Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752748380; c=relaxed/simple;
	bh=gxJPOLe/NygmZOPFvcbQJrkty4d46bYlbvQiaExURr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hca9q8qeTvhJRY4tu7I1ffecINNsMH18E04DC66fpzf0i6ludjmvSKZiC/RhDhykgBdWs4kgaHUy7En7STxYZZKG1rY4gFlPjHW8UEoAtmh3vnPiGZH8jMhVH97VfOGDqsnUqOrlkBE1/yFdr6t1ohxihFoXkHGMZJbtOCWZeYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E8teaaYT; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8teaaYT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so5456935e9.3
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 03:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748377; x=1753353177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KTffJpKMpn8uJ1Va+yFB5k6/yxUZURkt0Rt5PLMCHI=;
        b=E8teaaYTnS+Ue9NcQ/ruMSJx1Xv10cEo5jpBUDsxAJYm/jNQtqdyNLvw7HTTkQBXQI
         8y2DxwGrI18ldKyUUqjGhNFEmRR3reAsrZtNfhDMKSz8qznbcSldNquoIezUUVyzJa71
         bR5usV3ekVN+fmxHY+gX+u2Pxg4NLX0RMwrtObcpZtgUtfAEGS+HJX98wHIHxw8/J3bW
         zXYaqyHFt1CoE2r1PmGv+6HgF1kuHY0WxIqV3Dri/boGp+h5RV5tKXGU0ASPyXuhKBK+
         NG5WwT2h7aqAhAT7ov2WxB+ET+loUpa8Pmwz1gbxRNRs+sxCgsR5s6ww8jH7fNA2C5q4
         UgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748377; x=1753353177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KTffJpKMpn8uJ1Va+yFB5k6/yxUZURkt0Rt5PLMCHI=;
        b=mBOclOVKqxEbn+csSSWzh7+LD+D0SrmYGizLaaw6njLpGFz8EKWLYqrvPIUoGHdpTs
         KtaVy1Dx4hYsWIkOvinDlN3LaQcaAPVdE0/GmVIXRNa6pyoDiw+UFUH4qixuCBZwAxjV
         pyuPaVbnUyL236xVn4aIyuoML7a5fW6/KZ2KA1MVTM8hsZQZHLaquE8Qzt2hGvg0vDFv
         W6GyGYQzWcOv0wpDrw2WwmNUQ2sp+TA7Is8XNSNpk2eG2xmCK/9oZ6an5J2/fJjaiXb5
         MQV7B4UqH08uYLF0LgHrrvPmvx6o+nZeGaE+qzklDTrvwrP33KMkk7H06D1She85XZOP
         OmSw==
X-Forwarded-Encrypted: i=1; AJvYcCWmdXltOemFiuoeANAbNB4CF23ounsjDE5KGV/PjUJAq0IRpBgowBGjH+1m/ML3m1TH1la01TU0MB4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGy15nkMiBsG9sgzlQJFBQ9cx0SUjENTZZVAZPBvAKfVl2vLPS
	qOJ6peGqpbdB8J+CXkMWxZ3kjmIexmQ06aJgwWlDQDt3pyrPfNASpqHZ
X-Gm-Gg: ASbGncv9x69tc030llySErfLBBioRQJoq8cqgq5BYSbds1XxTAD/MMX09xCUl+DlDNl
	NR51CNlydN+tiAyFaFG9OoCVCNa447sdWGLgPgfwsHlXPbRgH+fi240zoGtH9Dz/IrouMoScYUV
	Dan70Scv5lcoz3VdFEGuYZhQdO6iLxjylN5maEea3l1dtCG6vaBZc2uNhtVotLymNUEVKZtr1O9
	nDJeSJd49XPhMAP3KkJwXa11F2F7M24l6NtOc5aUhKMT6uj4SIczLObUFn81fBmIYgfO7LOTvs7
	UOSBfEBxBCCnXahQM2FpzeqQ6BwHQzjwXOeM6nlkuy2mDG7qz9Jgalp96xOm2xacol4yuyPIMtS
	aJlEoNUU3Defp1m/j3TSa3O1jTpEFp0LfYJC68XDlVBz99VChPliQ2WtcvooUAl+lFR1Ms9+N4m
	/KiZnQrUSklloio3B/mjQ/ySW6
X-Google-Smtp-Source: AGHT+IHc8vQXtNpyThvJpHCdFDQv27nKu7NYwqVFIiEhHTf13nJ3NAM+LgvjkH4nGyp8L9aYlCB8Ng==
X-Received: by 2002:a05:600c:5246:b0:456:207e:fd86 with SMTP id 5b1f17b1804b1-4562e03bdf0mr74830065e9.2.1752748376435;
        Thu, 17 Jul 2025 03:32:56 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45634f4c34dsm18373635e9.6.2025.07.17.03.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:55 -0700 (PDT)
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
Subject: [PATCH v2 4/7] clk: ingenic: tcu: Embed syscore_ops in TCU context
Date: Thu, 17 Jul 2025 12:32:38 +0200
Message-ID: <20250717103241.2806798-5-thierry.reding@gmail.com>
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

This enables the syscore callbacks to obtain the TCU context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/ingenic/tcu.c | 54 ++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index 85bd4bc73c1b..503a58d08224 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -53,9 +53,9 @@ struct ingenic_tcu {
 	struct clk *clk;
 
 	struct clk_hw_onecell_data *clocks;
-};
 
-static struct ingenic_tcu *ingenic_tcu;
+	struct syscore_ops syscore;
+};
 
 static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
 {
@@ -332,6 +332,24 @@ static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initcon
 	{ /* sentinel */ }
 };
 
+static int __maybe_unused tcu_pm_suspend(struct syscore_ops *ops)
+{
+	struct ingenic_tcu *tcu = container_of(ops, typeof(*tcu), syscore);
+
+	if (tcu->clk)
+		clk_disable(tcu->clk);
+
+	return 0;
+}
+
+static void __maybe_unused tcu_pm_resume(struct syscore_ops *ops)
+{
+	struct ingenic_tcu *tcu = container_of(ops, typeof(*tcu), syscore);
+
+	if (tcu->clk)
+		clk_enable(tcu->clk);
+}
+
 static int __init ingenic_tcu_probe(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
@@ -430,7 +448,11 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 		goto err_unregister_ost_clock;
 	}
 
-	ingenic_tcu = tcu;
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		tcu->syscore.suspend = tcu_pm_suspend;
+		tcu->syscore.resume = tcu_pm_resume;
+		register_syscore_ops(&tcu->syscore);
+	}
 
 	return 0;
 
@@ -455,38 +477,12 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 	return ret;
 }
 
-static int __maybe_unused tcu_pm_suspend(struct syscore_ops *ops)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_disable(tcu->clk);
-
-	return 0;
-}
-
-static void __maybe_unused tcu_pm_resume(struct syscore_ops *ops)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_enable(tcu->clk);
-}
-
-static struct syscore_ops __maybe_unused tcu_pm_ops = {
-	.suspend = tcu_pm_suspend,
-	.resume = tcu_pm_resume,
-};
-
 static void __init ingenic_tcu_init(struct device_node *np)
 {
 	int ret = ingenic_tcu_probe(np);
 
 	if (ret)
 		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
-
-	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		register_syscore_ops(&tcu_pm_ops);
 }
 
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
-- 
2.50.0

