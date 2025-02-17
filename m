Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153A3225A49
	for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 16:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810253; cv=none; b=m3V616ANbLrODklQqZMgItmlx5kfvGWcBvuTFixwRmkffEkYY3qLHOv3QwVFcLYu8r4B/xoMCDGbfNzKkfDymxF0SWAbN9X6N2X4kNV1THD+PyTQoG1IGGJsNF8lcJiRdf7kypyHvn0gJZNSzSNQfhhrVQ69sNrHFQHobcQEPbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810253; c=relaxed/simple;
	bh=zE3UeHdwgOpQSnjKFq4GICu7rZN5tRJ5Y9xFvM16G0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJl+3IZkhN/uCfoRePNZ1XegWMZwpqy9+3s502RiCvur/RocDT8EkzqAo3GSKS6/KzYsPFPM7dkrBsJ81g/8Z9thm5kNd42S1uhrAid2XvVRv4Vnla23uynkmoHLoAxW5jlIMoFCUouIDlKWYKUICdCpw5h7+XBWoWvCpYW7JR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kTiqWcW7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTiqWcW7"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f2b7ce319so2611358f8f.2
        for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 08:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810249; x=1740415049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/Pliae2eQBpyDaB/rhM+Xrce+n5H7ftTZ7yML/5v4Q=;
        b=kTiqWcW7tWkcxch7Vji1l7Rfy9nF6b0mPItTY1YVHL0cda3x9FcGhmKpFMQgXqn9YQ
         Lk7Q7GjVPJARrSTyBuIU8kXGgkugcd3HriUTSAl4P6RNGXhbYhOI9F2H1y/pGngi7dZn
         rZw0eQNT+wLLWVYyZT5zB0X1Bu0+OU9ojPzSQlsYcK1EoXJFZl/MwEitMAQ41on6K5kx
         qMxhF3LxHq84hxfS+OREXbeNiF8DkSF4YvLdYdyXG0SiyWwxaKqhArugGdManfueybhf
         bDWMxeOGO/23WSMwkg1RhqeJWx2agxRZDA6McqTWGYejeLSExUWS2NMd2J/6srzNJ8YT
         nY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810249; x=1740415049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/Pliae2eQBpyDaB/rhM+Xrce+n5H7ftTZ7yML/5v4Q=;
        b=j3SZOILtd9ITO7sVUtiL4Etj1CVxQy+uunwUhlKDBjbOsXnft1m9TtpWESdhDNf8Vg
         1wtXpS0XxWBl13LrR1fRzcqQn2FllvSgbFGUX6+R8fuiSiU3BDp/Eo7hyCrwbkckbF63
         jlCtWuL1JmH5tJkoqnHlqgO8fomIZuRgmaqck3f5gaptfq0DKkVwLg7l8hLW/RF0KCjN
         sV0wPAWewf5dpQi1UkMOxprmaMpREW5zoGET6at+P2zWKf22KgY6LG32f/xfH0QI+2qK
         JIC/OyhAZQHS/byS61vzGYVs0fJBC5h38vJFhB3nSUp/4d2KVK1XGK0uiVKundOGpJ1y
         z2IA==
X-Forwarded-Encrypted: i=1; AJvYcCW3LDP1FMP0FbyV5GfQApl23Pm3qy4YGoe7KprvOZ/RnYOhXNMCdCPdctRLOWov5czOe22loiqFjz8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4AZW363bpXiP/wrYdEVoBgVZhQnuLc1+2IST/duh/tOSZMbtZ
	6bJmgXyZhvdS2vPFyBLfzLkHWJUUhO9cAfb4nNeA+2MPJT/nFl8u
X-Gm-Gg: ASbGnctjfYH6/rjfjhA4VmbIf+ae0ORxfoZzzWodxAYQnI8Awf6Ar749oIaLsQT1H98
	Bk9dR8/5IsFESiclWt8SV2GFSv3YWkWwQlNNydR15uQJ1tV56a5PxcBWr+HGZALNrhK9nfEkLjH
	Fb/7HVB87Djku1m66X1XHUrfv30fRLkPJAHN3z3ZAF8HsK61EgixD1K9r8DgbFoTQhp93/HK7/S
	oJ2Eu0DWmnsExQiYJmhLLy0uovm7K5vHrskFM4mn30KiAEO0OHngwqWB+872lOmQOsp3l3IArkh
	xsw+EFTiqdXN+CpGWBoDFPF4B7HXoynGFCPOO04kre0CzQG0bzstyjRd59VbKggiOc41uutFcTp
	xEMEtQ2A=
X-Google-Smtp-Source: AGHT+IEcmZoV9E3nZ+6g02c1M8tS19/XgVVrKGZ1S0RbQ0hvdrhxp+y24wkbvweGnlTFrgLbDmIhiQ==
X-Received: by 2002:a5d:6a0a:0:b0:38f:2e78:450c with SMTP id ffacd0b85a97d-38f33f2961cmr6950160f8f.19.1739810249186;
        Mon, 17 Feb 2025 08:37:29 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259fe1efsm12791371f8f.97.2025.02.17.08.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:28 -0800 (PST)
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
Subject: [PATCH 4/7] clk: ingenic: tcu: Embed syscore_ops in TCU context
Date: Mon, 17 Feb 2025 17:37:10 +0100
Message-ID: <20250217163713.211949-5-thierry.reding@gmail.com>
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
2.48.1

