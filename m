Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02177350D57
	for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 16:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755642; cv=none; b=hz6scT6ZJ8zJRkvS722OchN0OYAAOZXI/INXPWLLoGqZhHukZacFWETAuAoZSDFRMFOjKJeUpoGVf3aeK71i21tV6smazN6PkLYVLad0iwg0EgWDTGtrbIGLRuVLlJf7TEpJLpaJbVlWRwSkJKY2IwV+EJE9vxe1WjVZaoQa5Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755642; c=relaxed/simple;
	bh=1X730H41akqVRCdUivi5jsHS02y7Sh1RLu5JYxa09ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFaiE0+CHC4pmQaUVYCnmvr1NvV2erkMtNf6act0fcyorrAt0or4sbkxayxAZpg6w+lO9qfBpEVM7iPgcBhtCTewYx20J8xafjMbsMWouK9q+3aq095kqJCiBqjzkEu+lCQMtaLRe7tUE3OncCq3PT4LOlIryaJlKPDF74aVIXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQdfLcoN; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQdfLcoN"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-63c1a0d6315so13906777a12.1
        for <loongarch@lists.linux.dev>; Wed, 29 Oct 2025 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755638; x=1762360438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkaU4JsM1D+JY4wiuorXEjJy2zEEfje0oExQGt/PLrU=;
        b=DQdfLcoNC8L351NR5b/CbPT9qG0GyC22gr/eJNFB9qIeE/IFevSd7M6BjMWMW7civq
         KMXOwQCq58as01dPR1SsP39l6SAygjCa6BJ+F8JHSX/IgVKYeX+C72wUm3euSKOPez+8
         34fk4xKt7C0CsgrsQKnp/dSQL1ZJiPojdHU1XyUumQUUqAVVv9zgWkM6jilv/lkVhseH
         86QrmgAmOeEmYIHDTz9wrqfhdXIhqoN4e0tB4XdglbdDvd2dHnA8giTXenxBc/zwrI5P
         kN8jAmEsCfC+y2mAZoqmwjQp88+kr+C+7hpIYHU9I0cCpMaElE2ONJJ1H2Dy6jV7CUd/
         Fw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755638; x=1762360438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkaU4JsM1D+JY4wiuorXEjJy2zEEfje0oExQGt/PLrU=;
        b=rfMk30tozE9myu3N6o3PYvdWpX0cFLon6VSFgRyQGxgwfElOAjPg4pE+eKQlrWUqP2
         Sn4kcVsvAoprggcS1OK5PLHsiuEZCUlmVchK2qfUCbJ1dxJsnG4u7zVNs/yxl/BByuDN
         uthQOViuZ9nPOgwueUaGXmaBK8y51r4rVj+baPgUz/jkydHE5rxhPfAySeSBmBAUbOvZ
         cmp4/aMOWMbn2l+99Dlr6XO8FG59vbv3JcQNTW5Dxnbv3G4KHJNWLQR9D4I9bh87yKPr
         dI2T0fUtAoljzCuU7KSM+yNSYd5xsNROvYntfDS2m6hqv1x4WNT4UeRaFrG+8fha5p3X
         yFtw==
X-Forwarded-Encrypted: i=1; AJvYcCVG8Sf7THYXyJc85kG1zOny1wqs1h9d/qii8v/NBoUFIloS24hJx9jd0a/Tj4SY8mtir+r6jKrBJkI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEs6GhgVFyRMeNfaLPpj/gwgt/iRBpffI1cT1HaDwJoVPwP6Jg
	roaPUtIVJhEG3Nf6rWTI7tED09aDFQxl6zkVPWcKAzDtZGbQkkXMm61S
X-Gm-Gg: ASbGncuHkW4L0NREv2b8mdigEyjbIcFHgazOgJBrSvw/KoABWHSU2+JHZ/aRv2nZb90
	gYnJWUsYwzdHnYDn9kNIkBMWa5A1t+YfVlgVT5TK5trgjpT3wLCkbRfHUgh8we+8hiC6wxTO9yG
	5CO60hC89CRwdHlm3cfnhAFLY+9xJJqBljhY7gcWVEcIE1zJqo3LWgy5Cj0Ll+WsdVEsBltjn0N
	OFyLFZwdrPpdSzB3kYWXyk76xpvWYryvxjWkN4eASZAPv/m998k4ptSyNjzLIaxZKDWAuBHZW2n
	p2lNpfqgAiqy2Q+dOIIJdH74NHJDYvy8d8lXVRian5b7KC+X9SZ1cRxtd8Ee2nMXYFu11Z+RhzR
	1Ob4k+b872f2JfjVo1kWtc6M9ql+gbHqoJwkHpOd+tG753Qm2NS+O3rooarv4DAYTo02/F7o1rl
	KDT8+v/VHevkPsLowvfVyKahh7GFfQTId+9KOnZL6JIVTayyDuFE0/AEHIU+RMYK8UfeUr
X-Google-Smtp-Source: AGHT+IHnWRqBehOWBCyuY7cscNzDJLcQ8Q1/xskpkrSKjJiOMcliraM9J9uBI/ZGi7u/t3zd09QFLA==
X-Received: by 2002:a05:6402:e9b:b0:634:544b:a740 with SMTP id 4fb4d7f45d1cf-64044255cf2mr2554809a12.22.1761755638150;
        Wed, 29 Oct 2025 09:33:58 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63e86c6d7d3sm12474615a12.27.2025.10.29.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:56 -0700 (PDT)
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
Subject: [PATCH v3 7/7] soc/tegra: pmc: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:36 +0100
Message-ID: <20251029163336.2785270-8-thierry.reding@gmail.com>
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

 drivers/soc/tegra/pmc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f57e5a4b4d96..6e0ae0ede263 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3150,6 +3150,7 @@ static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int
 
 static void tegra186_pmc_wake_syscore_resume(void *data)
 {
+	struct tegra_pmc *pmc = data;
 	u32 status, mask;
 	unsigned int i;
 
@@ -3163,6 +3164,8 @@ static void tegra186_pmc_wake_syscore_resume(void *data)
 
 static int tegra186_pmc_wake_syscore_suspend(void *data)
 {
+	struct tegra_pmc *pmc = data;
+
 	wke_read_sw_wake_status(pmc);
 
 	/* flip the wakeup trigger for dual-edge triggered pads
@@ -3836,6 +3839,7 @@ static const struct tegra_pmc_regs tegra186_pmc_regs = {
 static void tegra186_pmc_init(struct tegra_pmc *pmc)
 {
 	pmc->syscore.ops = &tegra186_pmc_wake_syscore_ops;
+	pmc->syscore.data = pmc;
 	register_syscore(&pmc->syscore);
 }
 
-- 
2.51.0

