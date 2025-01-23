Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A02135A6
	for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632327; cv=none; b=bq35CxFpbtDHeUj7P0ra7sDais2S3fke6dfYfdCHtOuSrY3TwZTOZsQjQpfh0eXTrPmy0GNbmiPj5KGXTXf2IP3sE5/j/jUmIQ/ojIAcJ93fVlD0/9VxKmY4SI70Sw3Yw0tqjxAuNIBOknGvVPST0j2Qlt1cM4XcmqcYK++X4ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632327; c=relaxed/simple;
	bh=WV84G/RB5+7f1rTZu4Rt6v1dVd1mWE1RlukKepVDMOg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ViPcygplG/5sdbvY8oApEPGSJ7xgFeVmQnfUvp2mGTtl62LNykYv4cNpE+HqWr943eYvLEwsTMFMvOtGQf8K2wRGi03fI33fSj0bJKntvi9ulLKzUQus/X2KzKIBfJYsmo26awAq4F2hAwJuOE6G+hWYQUk57Ub+O36s11oUQbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LNcj6cVH; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LNcj6cVH"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21669fd5c7cso12414195ad.3
        for <loongarch@lists.linux.dev>; Thu, 23 Jan 2025 03:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632325; x=1738237125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPQFhXLLMXODhvNoypMAGj1uR2YWHafKwP+IehwFe5U=;
        b=LNcj6cVH/55ezT8xcjeAh0eKfJFHROFaKcmV5NMf/LRJfBfebGNh1+CKbhMWj4Wlrj
         VqtJPc1YP7WPYAwTLMtEm1kaqZN2ovrMwH5NkA60HiyNuAwNw3ocPCP7IlJVCPoiTqTE
         GRhYQgGx11TzAKGi2o2xzNje3np826JZHkKolEkwTT6ZGio761iDZYHLXdSnkdmZKIlY
         HLGGWuMaVorq9Mg5rU+yv2yReOROgkWY6u/X5OZS5eBFUaadcn0ahZ3IK50Azui/PvlD
         8kvxLUCh+bIHfc8Z4JHJG/FgFnbMWKBsCLi0MuPJ69pVzgpOj/ZLfPfMpTPnNOQUlz4H
         OpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632325; x=1738237125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPQFhXLLMXODhvNoypMAGj1uR2YWHafKwP+IehwFe5U=;
        b=NbTdNKhbJOWZxBLyW0IGg4a9Znryz5oJZaPKn6nEbpdpoGaKcUvDjWmVancvqAEZpA
         do/sG/UZsp4lR1DhidjymK/wq+Q/E7sq97uSlUMAuNWcFR3ECFxHjFSgMPRX6b37OzK2
         9tW3Um5oEOJ6Zkzr3i3BsVbfSaDYhQODEnTXsuro8PJCg0I4XunTVjqDGn/nINgEk1v2
         davYMr12bWMEUKCclmM968mBmwMCopj4CYIIzjinredIYgrgmzCadmN9q27fcVJkg2O2
         vsJC/jJqW84QWBwhyBfgoJmyDBB5ScGFquEkQbncB+VbmQ/ew4ztOytsvkvCa0kypH46
         uWlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2MCOmyBs6yL6Bcix8wiEyPG/Bu2N1WGMLP47ux/5P9LyI2vuIUzVRTeDxuV8w+h8cjQ/YEboWQw8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzojm6ncaIwIWe8U7EHRvPy9Gzp0U0aYjc4hiXpojX9L9KA/Qlt
	6NDTlHbL4McGb/C2FlG57eH2sQ8RHe8+tNPI451ZzF9e/LX/d66UYi4jr3pQMoM=
X-Gm-Gg: ASbGnctS1LdWjLfKME1pqLe0cXeRc6yav5H56Yhg9HgClVGxSEXG3OCRLWruTWsyWVo
	mOLN7HFp2siJNWVTt5MMqbEJ3ExMF0cgBueWw5KhCwkjCq9III1btdfe/buszj12EJby+UPm8+F
	/ihNWKUa/q4WS+e2a92lpcEhS+YChaueyUQEEcLXD+lfCm6r6VWeg0g4JJ0YPXbabq+Jswce7Kx
	EgQjIuruYO/ZiL77KAd544CYmmDyKsC7ihgk9Htq5Ye/CZH7nyDlnWBngA0aDhyZ5Y5HAZ4mHP2
	3ozRX4I=
X-Google-Smtp-Source: AGHT+IGH1rgrIO+s+Y/sZ3xBZQHUbxqMwBuZRbD1wDrTeC9bj2qH2sxuniFd3GYQRJetgoOSm4ug5w==
X-Received: by 2002:a05:6a00:bd7:b0:72d:b2ed:8788 with SMTP id d2e1a72fcca58-72db2ed89dbmr24987717b3a.10.1737632324738;
        Thu, 23 Jan 2025 03:38:44 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabace1bdsm13291546b3a.171.2025.01.23.03.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:38:44 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH 13/33] cpufreq: loongson: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:49 +0530
Message-Id: <d7b219882feba7c7888a40e537b154e904508503.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cpufreq core handles this for basic attributes now, the drivers can
skip setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/loongson2_cpufreq.c | 1 -
 drivers/cpufreq/loongson3_cpufreq.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
index ed1a6dbad638..39a6c4315a60 100644
--- a/drivers/cpufreq/loongson2_cpufreq.c
+++ b/drivers/cpufreq/loongson2_cpufreq.c
@@ -91,7 +91,6 @@ static struct cpufreq_driver loongson2_cpufreq_driver = {
 	.verify = cpufreq_generic_frequency_table_verify,
 	.target_index = loongson2_cpufreq_target,
 	.get = cpufreq_generic_get,
-	.attr = cpufreq_generic_attr,
 };
 
 static const struct platform_device_id platform_device_ids[] = {
diff --git a/drivers/cpufreq/loongson3_cpufreq.c b/drivers/cpufreq/loongson3_cpufreq.c
index bd34bf0fafa5..ea516b939c44 100644
--- a/drivers/cpufreq/loongson3_cpufreq.c
+++ b/drivers/cpufreq/loongson3_cpufreq.c
@@ -337,7 +337,6 @@ static struct cpufreq_driver loongson3_cpufreq_driver = {
 	.offline = loongson3_cpufreq_cpu_offline,
 	.get = loongson3_cpufreq_get,
 	.target_index = loongson3_cpufreq_target,
-	.attr = cpufreq_generic_attr,
 	.verify = cpufreq_generic_frequency_table_verify,
 	.suspend = cpufreq_generic_suspend,
 };
-- 
2.31.1.272.g89b43f80a514

