Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83369348894
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 16:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755637; cv=none; b=qbRMw78q2zIYsRRe8NNXoiH5qdZzFyivNEkjYUp5LC8uYHtnRnGpHIHqSf5ag/SVa8YWVvWp08vRbS8d57aAYiYibBIuyxVzfMgxZAwvYjembxBN7Sc4+TTzsHE936rBgcOaL16L+EmePL3w/RU3azvB6rWcJYGmca2vJ29g968=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755637; c=relaxed/simple;
	bh=x/c8Gau2O3gfj3+358hMm8pmNs7v1wm+QbURDM7KfoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHbE9wtv95WKu1HF/CciF5l6TNBZ+BCpFvqNstdOGBTC0PfDkJ20AqjYS4wa4ti6gkGzrvpedZT6cSdfK7Fa5rNWMulTUxtHg5RagmAKX4W73rH5AERkTpzHsjfsWB8Ly3SyL88t15QyvBIEMlGlrfrDmKxVNRsSfAbFtXvIsWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Scjrz7L9; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Scjrz7L9"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b6d5c59f2b6so14861566b.2
        for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 09:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755632; x=1762360432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=;
        b=Scjrz7L94iC+uv/2hTeeE/cgLxSMYacaZHjhhrRJYd6xwmK0k75TU6d5flb1pQbl3S
         jcMsiA2H/zjUkZrYI/PAePPGYNs8AqmQTee6iiym13bug6HY7NKyNcqLLfshuXw6d/P8
         CJrtW8ijUMzG7St+3ZHbIa5UTN6AcGHrpTCffbfK6NPSl3cL+9fpYRog+24Su1+K9/Jh
         gIMcOA/zp4PyLHRVz8nJ3RVswlkeD8RvErA/WvvCfxgp3Fs8kVVrbXk/8mT7yW8mFR34
         CSWWoFFye6NewHXuRLuTP2eNYYeNMhsbp+07ZwqAYpt7HLQtVp06jHooa1MnsC5k5EVG
         UiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755632; x=1762360432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=;
        b=rJpPSRRrC90mbFPZvYtUCRKigCLOyVaBPT0mHyxNHuHmMT11U1JUMcbCPHpd6rK9z4
         kg9Grz8CLeuubW2fGmcUqEYH4tzHFO4qDfLHskyQKiTmJMeKVAaEbn2ZP0V5427r9oA8
         HIzDe0dsPLiZ3iCL9Z1axvxWbPU5HIMMI/9IWroFtETkQD+Jbc9IbhYet5Cq8xkFAjus
         YHbvz9AAOH10YQtR/U194wM6J8F5jt1pNFqlwwDLDTRTE0NRTPChtehETl6eoY4j56xM
         BaA+7BnvhMKrHvnrvZieML0jBa7jHzs3XshjkFGa3Gr70x2QpEgbPd6TzWANxEdqisT5
         b+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCX+kFcCYMxBEU4wRCZAsC5GEeRTWpG4B4tztZ9mxSPNhbJZ5qCyfUhZWNZTit/UFbhE1s6YBTE6qVQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2AnsvzbNK7Fygn4sPWA6Nybsu+H1TMvs3XKliFJQLIl3xBmHk
	umT5V2GNo52uA/eSijUI/0Fn3S/o510irW9n3QH96Jmu3d1G7mHy7YyD
X-Gm-Gg: ASbGnctczlGJgF8Hbx9qxZHokvdEpAcUHBkOFXlWOGeBcljV6r/WvIF6lMVTPP1cC6t
	F+v3AUEJmlNiekinM2OLXgbmGkmfOxOoG3cVduVjZJUekDexFh0c3gymEPeZajlLV2kDFLn2w13
	VBq1eMLZSf7yANyQSuJ+lMusEfxbIvB/y8eq92gKDOjX03Wqd7BYAZbJeZ5De5nK0Ne3ZzfOc5N
	qTLEJsyn/AvOEqoC2ZMz9YLRJrixE0D/pjhUVbBNHBbCv16537m4P2GzeNmo6Hz0jHZyjCxb8Bq
	cRS+F9PCRsgG5dEGGfBctX/2hOW2NJmw4EpwknWFrqbk07mrbi5kj+GPMMC8nF/9evgm1cul95r
	pCWaDyquqE5BKc10WJCbcLGcb0cxb4Kk0IGX9Brq+G6/3HfqVy6uWyZErKqcFRiDzzInt6yn1/Y
	lLHAAdCoXBW36vzfztFM1wCuDru3dD/9ZQkQptMlwGI+B2I3B8H0SMtY0SfBt4rSRktfpy
X-Google-Smtp-Source: AGHT+IHRieiPBGU6MC5P5jZHI6G/6PD4P6RVg3Iggx9u+yanu4koYZOv2T4MUr84z07ifr1PiVwzxA==
X-Received: by 2002:a17:907:3da4:b0:b6d:8da0:9a24 with SMTP id a640c23a62f3a-b703d2dc3fcmr322653366b.9.1761755631652;
        Wed, 29 Oct 2025 09:33:51 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6da1e2226fsm1067814666b.20.2025.10.29.09.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:50 -0700 (PDT)
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
Subject: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:33 +0100
Message-ID: <20251029163336.2785270-5-thierry.reding@gmail.com>
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

 drivers/clk/ingenic/tcu.c | 63 +++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index bc6a51da2072..8c6337d8e831 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -53,9 +53,9 @@ struct ingenic_tcu {
 	struct clk *clk;
 
 	struct clk_hw_onecell_data *clocks;
-};
 
-static struct ingenic_tcu *ingenic_tcu;
+	struct syscore syscore;
+};
 
 static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
 {
@@ -332,6 +332,29 @@ static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initcon
 	{ /* sentinel */ }
 };
 
+static int __maybe_unused tcu_pm_suspend(void *data)
+{
+	struct ingenic_tcu *tcu = data;
+
+	if (tcu->clk)
+		clk_disable(tcu->clk);
+
+	return 0;
+}
+
+static void __maybe_unused tcu_pm_resume(void *data)
+{
+	struct ingenic_tcu *tcu = data;
+
+	if (tcu->clk)
+		clk_enable(tcu->clk);
+}
+
+static const struct syscore_ops tcu_pm_ops __maybe_unused = {
+	.suspend = tcu_pm_suspend,
+	.resume = tcu_pm_resume,
+};
+
 static int __init ingenic_tcu_probe(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
@@ -430,7 +453,11 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 		goto err_unregister_ost_clock;
 	}
 
-	ingenic_tcu = tcu;
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		tcu->syscore.ops = &tcu_pm_ops;
+		tcu->syscore.data = tcu;
+		register_syscore(&tcu->syscore);
+	}
 
 	return 0;
 
@@ -455,42 +482,12 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 	return ret;
 }
 
-static int __maybe_unused tcu_pm_suspend(void *data)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_disable(tcu->clk);
-
-	return 0;
-}
-
-static void __maybe_unused tcu_pm_resume(void *data)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_enable(tcu->clk);
-}
-
-static const struct syscore_ops __maybe_unused tcu_pm_ops = {
-	.suspend = tcu_pm_suspend,
-	.resume = tcu_pm_resume,
-};
-
-static struct syscore __maybe_unused tcu_pm = {
-	.ops = &tcu_pm_ops,
-};
-
 static void __init ingenic_tcu_init(struct device_node *np)
 {
 	int ret = ingenic_tcu_probe(np);
 
 	if (ret)
 		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
-
-	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		register_syscore(&tcu_pm);
 }
 
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
-- 
2.51.0

