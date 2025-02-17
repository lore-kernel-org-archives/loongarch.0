Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F0F226549
	for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 16:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739810258; cv=none; b=YCUxUJQhOo1332vJIjBJXHAovJsRYkpKi0yoiFXGNzzOFPdVm63x/58HT5pECR29dN67PPRBCt6Xm86v5ZJoAt3S4Lnt91Hjy6/7BkoqaVaz0c6SbHn6ueje2wIWMrQpSvp0z+Y5rrzFIQEgW8qQcOQ5dTm5R3zOjbHEECk0T7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739810258; c=relaxed/simple;
	bh=u6waITdVDCY6g9EHT0QMDOQubhyZX/Ph56utqfGWkrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgEd7FiOp0Sm3cGLME8WpBNSqMtEufWJJwI7C00jnfGnSkBQzjPiAqlmV6iIcErSI337mOaKxpgMtD9CzsYLgC515CzNKNgDLXUghELAzi2IU4zhlka6cML99f1T0Svo3l6Zpht1vEH9fdsXVO7YmRnlAyc1vwrCCK3Pv+jZzqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFdkZvE+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFdkZvE+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so2743393f8f.0
        for <loongarch@lists.linux.dev>; Mon, 17 Feb 2025 08:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810255; x=1740415055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcpOOuxQgTIkODYzKhCUSbyWoJK/c0mt1V0DRu+9cfQ=;
        b=kFdkZvE+lzpclwcNbPB//tLD16i4XHKAkane8Rq7gKxMDerPbt5mkOGjF3Ol40ALzq
         L1cMMTRSsr7nNML40vruYCLKdcEO+4OijIqNGp980z7ewuEWQh+2zAUJ0RNAOFQZ8M8T
         qtvJOOlc6pUPXkjKhsYd5ga+qxfnH4kUaLm6gqnxE4Lu7xOiyO7u8sTlzEaFVY6pp7C8
         LY6s9EA4kh1bgQjxqblKJXAn6e585wcEVXCTuq3qb6D/24Gr1Fl/PT0qG1c7oXLkmRuU
         DXBETNewY6fQkuz3MJUAE2mxEF4VSkBa6rfuPdeJx0gVNWsnjiWOTd1iaADPFri6+1Ji
         9ATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810255; x=1740415055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcpOOuxQgTIkODYzKhCUSbyWoJK/c0mt1V0DRu+9cfQ=;
        b=lfFbSCo7E7wqS71nGf8H/ZrgIDo3ONxQ6DM6oCVX4XNUsYQLfGEQy4mBGZeF8EkAI+
         4PhBFIqI9nKqWbxARrWfC2ZE4UAQ2MTE78HKJiAZHR81Ri3646v87MNsp+0/zN4KE3OB
         0hlu+IEbPO4CN81LOJ3YOpsUITwp9a1YNF4RyiHUBK+hE+C/nZcXVnXwIMeFtNlm5N4/
         dBWpinJ3Ih/sfR34019e9m9CCGF+3n4VcbmH5a94zLO6mJpFOSuuJ3rp5FrVpBGh12tV
         c7R2KYpshLgYdir3HemjCn72C6sK40/SDMc84IHHPE8qPK2GbO90mAyi8eAvS1J9MxTO
         0dCw==
X-Forwarded-Encrypted: i=1; AJvYcCWJzY8LB8vsUb+egddjpKEbenHfJEVMgargPwzcJ5dsCGOTLRthWHPLktOidYUh4NyuHqVs8jvYP5o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCKENK3AnnhOU1NePS5xItGgRVHgpczdPIZjZ1QESCMxs3E8EL
	RzGSDf/Xdjm/qcef+a+yTfqZN5B0yS1wA9CFu6u5ddLUjVZ+kAkU
X-Gm-Gg: ASbGncsu7Bi4u7Utawf185bEPKNyJiFvMwAAwcX8e5eLNmfwDPNG+ZHRJej9GE69yZq
	vR+4mdHmeNSkkWLKwNgDKfqa23rocCaZ+FEq/V302kV6QYxFme7DXmHgFBzSaztenuWHA4zokYD
	SkaoU6fMb6GpWpmien4C8IVjvvbwr9QR9cIfJZPMV5QuE8g780k8CrBYxdIiB11vLKyjdLJdysV
	nec5rpA2XxEOm2zHwvnPH92R1XJ6e7hNxlmFH7VPBeh9Um7dmH/vAPh8SWgZCNqg3BFsoWJEAu4
	ZITGWjm1pyVDw4xMwbTvucb4wkbNun/CXU0Yqr45VoyqS9wLF6y+mO3ODjw+7OK8eIBz2cNj6w8
	epHqWmHg=
X-Google-Smtp-Source: AGHT+IHfk4fhCYlLR37pJBvXWtv75DWNoeEDbdc68Ccdk3uRnLzXu0R2uoxz3Sfrv9nYBkbSbSFitQ==
X-Received: by 2002:a05:6000:4007:b0:38f:2b59:b550 with SMTP id ffacd0b85a97d-38f34167df2mr8240262f8f.50.1739810255313;
        Mon, 17 Feb 2025 08:37:35 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f2591570esm12881221f8f.59.2025.02.17.08.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:34 -0800 (PST)
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
Subject: [PATCH 7/7] soc/tegra: pmc: Derive PMC context from syscore ops
Date: Mon, 17 Feb 2025 17:37:13 +0100
Message-ID: <20250217163713.211949-8-thierry.reding@gmail.com>
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

Rather than relying on a global variable, make use of the fact that the
syscore ops are embedded in the PMC context and can be obtained via
container_of().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6a3923e1c792..ea26c2651497 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3143,6 +3143,7 @@ static void tegra186_pmc_process_wake_events(struct tegra_pmc *pmc, unsigned int
 
 static void tegra186_pmc_wake_syscore_resume(struct syscore_ops *ops)
 {
+	struct tegra_pmc *pmc = container_of(ops, struct tegra_pmc, syscore);
 	u32 status, mask;
 	unsigned int i;
 
@@ -3156,6 +3157,8 @@ static void tegra186_pmc_wake_syscore_resume(struct syscore_ops *ops)
 
 static int tegra186_pmc_wake_syscore_suspend(struct syscore_ops *ops)
 {
+	struct tegra_pmc *pmc = container_of(ops, struct tegra_pmc, syscore);
+
 	wke_read_sw_wake_status(pmc);
 
 	/* flip the wakeup trigger for dual-edge triggered pads
-- 
2.48.1

