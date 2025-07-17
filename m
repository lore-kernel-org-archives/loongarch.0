Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3423B29DB78
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 10:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752748385; cv=none; b=ihCDVAKE+cSgCeLeJ+NkDFQfwHGzUBZCpp9Ww1Wc3NL8PD9v169Z+lkP6JOXCDbHFXEPYM+sgextkcCmZu8cJuTbCKCUOx/+saUwTQJjwJPRfBG4imbGY3haicL325nbXqEdsuUgShvo1mSz1rxCgWkoyNDbRu0c2TdC2pSi2Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752748385; c=relaxed/simple;
	bh=Q1EP3fcNvNx8PjpgFAFaM/WAmgg9+NrPEMcfSO1OfvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfFKh0hJzZCRVJDWUIOzjMjBoe3C7zxfp7CPmBl5CEmahF18aHVZ390pAD0BM87c+3UIrQnEKEyuSxHxEP0CQhOnOx8s6TPVngykibcBrmjxa6t6BHKtsTCavFPa9OefXgiynJpeT8XkLXY+GsgFMtZM7iZnebJ4JRAXckeuUZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4WhFMjO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4WhFMjO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so761388f8f.0
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 03:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748383; x=1753353183; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hAdkFjzlZ96J9ZvADDEOxzZCwxKXpOY5bpgjR9cuyI=;
        b=g4WhFMjOWaCJwPzjnH5gE9/5P/gIFijCiE9LPqqLUi+h1AfIGeUUFSf/jzDRz3DkE8
         CH1vfWgsnRn+kDML0UeAx50IOf/tf5J2sEMYVKgSt8lGiiTJ5rIfe85+ZfKKx0cDwEzO
         4Q+i1BRmMt6zbuXht86N+35DHhdwZ9jb3bhS1g7cn2gnfJE+X5o7SRlZLYxmXU4FHU39
         DSniSjzvGGrZQIqxs+6TRUwP0xPeZKQil7XC4RNGJvoMbwNZy9Y6G98FuQFgOA0XzSos
         rk//v+4UngoTVKiUaeCjLkaJgjsvFm26C+ih4qAxPLui1XEZj+JdPdzwNOQMGxSJjGh3
         86bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748383; x=1753353183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5hAdkFjzlZ96J9ZvADDEOxzZCwxKXpOY5bpgjR9cuyI=;
        b=gXBeI7ybAiopI4mSrXW4oXGjmDYcgXjgZDttdLwL8p2pEUyIaYoCoRuYEDN07zQFEi
         sWvRSK1C04cb+vJEV1zFfZhvjh5tSSN/RDBmHpDw7N4QvnWzS44UmHBK+oJrnOaS8IqU
         mMvBat4vnkHPuPp4GNwQZq1kgcdyN0EkBx9M82Fc+3LbyPOP8z4g9P3if6yb/a/Yah+O
         MqAE01urwVi5bBFfWu6WI/yJ/SZnMUm/MvUctJSQlp+30n204Dd+PLY0pjRBeWYpZcwr
         PpqGnSvgB8wsPnwdLX71VhTKOsb3Go1p0ZhzN/LUeKo2LJQlNiqtbj9wEqZykQp6Ngcf
         Xw8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6Qr+w0Zrp1GVZ0aUztLDvcP43engrpcPU8ePjkoycsXYhgPJGAK1yRtXeli7VgqYve0PxjoxmIEw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdABT3Ct+JuUWVAhJTgvXuAPgRWj4Jj/LUCVGiDzlPEKWj50pO
	B4gvjMoFF5eVVPvioAGHO5AGHAYJFQlYjn4Eylr5t7dIteBObcwjHBEclgU7Bg==
X-Gm-Gg: ASbGnctcWUXa25HtlIhRaYFsRpj6jQAwLoTdhw/UvudOlgX33Q4mL/nsTuW2kk2vbtB
	WelpkRokMUUCt67wYNmEHL9aygMTVwZ2ai0QNEMUwCZ1yjfDJLS105C9h8+501KmrnO4Y+sZfIA
	yFCkiyjWOyQ/XNGsA7UBlhM3ai/WOmqaFhhBJ2PyyOzk1rpvELt4ro2e0d/R/Fi41ksRtqxRIi2
	fvr8LtxMjbu6a+urSa4290d52oTL7C/8ZdUffi02WjwNxnpnaLrN5Jd2G2ki5fzw7eJu7qCXnYc
	HxG7FmOP5AaLl4EHUsybXFGBqVF5YeI4tV1qudI2tAmo88PNbEzLMfCd0Tuy/+0Web0fTaWcVeQ
	wZnHSTtq5HWNvq/Kmnk9a4vqtDEs7JhIFKoBDH6WTHqc/r1/dj0m3+fyAOLWmtMCrefD8XJOsnV
	RsoczNYoFistmn3V17GAtCxSwl
X-Google-Smtp-Source: AGHT+IEqfCFpIQcuogdtVlks+s7mtGT9PHZg7lN5UDyP9j1DEHEgnDRrYCSmStX9iLPaLpOJf76oyg==
X-Received: by 2002:a05:6000:1ac9:b0:3b6:d7c:f4ce with SMTP id ffacd0b85a97d-3b60dd88801mr5936545f8f.54.1752748382518;
        Thu, 17 Jul 2025 03:33:02 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b612db7060sm2629613f8f.52.2025.07.17.03.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:33:01 -0700 (PDT)
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
Subject: [PATCH v2 7/7] soc/tegra: pmc: Derive PMC context from syscore ops
Date: Thu, 17 Jul 2025 12:32:41 +0200
Message-ID: <20250717103241.2806798-8-thierry.reding@gmail.com>
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

Rather than relying on a global variable, make use of the fact that the
syscore ops are embedded in the PMC context and can be obtained via
container_of().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 455e55cbd2cc..a5c179636a69 100644
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
2.50.0

