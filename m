Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C5221C198
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 08:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737709145; cv=none; b=DcmmecZMo/tb1EZmd9dqgFgTnzjdW4p0LNGoeocPDYI3fz64+66J9R/Aycml/g+0LyJRPt1MADKQUEldURjA/IO+6M/JNkR7+mYvzsQTjPoowN9svO8nrcXNp+UiZaMZzQReESSkhuiHKSWH0/k7BsEZeZ4dlLW6YDHmPJCqLH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737709145; c=relaxed/simple;
	bh=DNyXYLNqnDGTpYMMmN2+u7aiSbjZBEJB+HjmmWjpP64=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=er4EIrdpxXgk0J0GwmkQl9uOWMUc/XhQx8KHSk6oiYxQmo9b2wVzke0wmW2Eu1Ikn+jhAYKk5kjQ44+uxNF3moVFKHEc+ew+baNQaQwjT1mEHoCicu1zIGEa0MMfmL9E7hdbTYcNU0Wk1cOQBkmHZ9/7mN0Xj6QfUSTF74SFXk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gZwZhskG; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZwZhskG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2156e078563so25914095ad.2
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 00:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737709143; x=1738313943; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlxTGa2NoXf0U2Bhx3PIAC2y2IpE66IWBZ2zi6Nlb6w=;
        b=gZwZhskGKSI0ONYPfHFt1umoYaA5OGm1FT8woVuiaqtnqmzy9FO17oBhRXqQiMAv6u
         ZlxicTDvMuGVaAkUZU4ctSvGhQqSTzwRU/z54TmLOi48C4TzYs5vBZz/Y0Vvsbl7RamL
         Mun5OuoKUlhxXls3XoT4WjzQcwWQi7tO37w8kmj1VeciM+NbkmqeI/aDN203KuSd9hcG
         RFkW2Ov8phRQop6PEVnBL4RlW7bOK9frvZXFdi7J5drGiHL3DAJ5MQ7wAPd4ON4qVKP2
         RR9DugdFfP7pHwJnV74zySZgvYFgciDtSWDZ3ucGVvn76Na9tneGlAAWfH1SXawxcWeS
         N+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709143; x=1738313943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlxTGa2NoXf0U2Bhx3PIAC2y2IpE66IWBZ2zi6Nlb6w=;
        b=jr7Kwk1gVzSuy1j4pGO1frSF9PaCR645SpomDwEeMOba/y+kAc1RY6UzhQszsIKc1e
         GVh07am1onV6EZ3BGngRnNNJfHRnWLPIvTHI/IUXW3jU+qLlNAhVpThkFfzd//qgiqMX
         kwmf4CqD88l/HDArDm2er0iY/oG1HZ+yb//+6SAutfVsoY8kl5eoSwzC+JLS84BwHPA1
         Up2LzX4UAIVjugH5I9hUzbZe5SmwRHCHEcS0Wy9aU4vHgmesK2/6cojgUreIEwOyObRB
         jsz2Nzrf5FWxqsq35Zc06DFU1kwkNDk5dLsYnaRAUi/cggXBJ8wYlli5per5SlLUq+RC
         7jjA==
X-Forwarded-Encrypted: i=1; AJvYcCUmQpWIbwJDLDr44Bc+8TpA0xuMyT6999HI/Y9MH/qOxbYMMaK9TAicyXjmqJKDC0h8aEcXfxOISoA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4c1NaSnAWgxOeoLmikBQfnKJk8o2sill76Qqhszl0/YnvWMQv
	YOrZ7ly49bkz0C40QQKSZWr6u1XET97oq7/FKlRBMgDoY3D/+MrvOxCfktBwOCo=
X-Gm-Gg: ASbGncv6PBJVYydEXQ+ckidGNJgSaBxi7GO6V7o1sMD0EWDA720wn9LQM/ksbK0FP7k
	tIQrcYra1Cem951EzsUtNdbvx+tVNOu1XzPKWWeGLuieuzNwBR2LOf8eiE32rrLdAy3g2Yb6NIf
	V1c7AFKT/ATub0g/0f66Uc9z9/V/8Yh1r5WQmyNwaGnlPJ2uMNlUYDmZMveQsyCyJiT/quopH4W
	dtwzLZp+ZDkYFqIbXdGOmsIyvmjTc6d3D5fYyCU/Km5cJOJwaJKniOo1ZO+AHiUlZKDQ+Gzg69D
	uJMqYII=
X-Google-Smtp-Source: AGHT+IEIQFAd+nDcE1KZztHOLcwIZcsISxikWrtqikmaVDwNIDlSGV8IHx2h7CCPFEPGAtyydYzt+A==
X-Received: by 2002:a05:6a00:4c0a:b0:725:e015:9082 with SMTP id d2e1a72fcca58-72daf92bee2mr36684993b3a.5.1737709141450;
        Fri, 24 Jan 2025 00:59:01 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78e3cesm1322652b3a.168.2025.01.24.00.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:59:00 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/15] cpufreq: loongson: Set .set_boost directly
Date: Fri, 24 Jan 2025 14:28:13 +0530
Message-Id: <0cef4a792391f50463fb1e72a96645e34eafbc89.1737707712.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737707712.git.viresh.kumar@linaro.org>
References: <cover.1737707712.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The boost feature can be controlled at two levels currently, driver
level (applies to all policies) and per-policy.

Currently the driver enables driver level boost support from the
per-policy ->init() callback, which isn't really efficient as that gets
called for each policy and then there is online/offline path too where
this gets done unnecessarily.

Instead set the .set_boost field directly and always enable the boost
support. If a policy doesn't support boost feature, the core will not
enable it for that policy.

Keep the initial state of driver level boost to disabled and let the
user enable it if required as ideally the boost frequencies must be used
only when really required.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/loongson3_cpufreq.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/cpufreq/loongson3_cpufreq.c b/drivers/cpufreq/loongson3_cpufreq.c
index ea516b939c44..1e8715ea1b77 100644
--- a/drivers/cpufreq/loongson3_cpufreq.c
+++ b/drivers/cpufreq/loongson3_cpufreq.c
@@ -299,15 +299,6 @@ static int loongson3_cpufreq_cpu_init(struct cpufreq_policy *policy)
 			per_cpu(freq_data, i) = per_cpu(freq_data, cpu);
 	}
 
-	if (policy_has_boost_freq(policy)) {
-		ret = cpufreq_enable_boost_support();
-		if (ret < 0) {
-			pr_warn("cpufreq: Failed to enable boost: %d\n", ret);
-			return ret;
-		}
-		loongson3_cpufreq_driver.boost_enabled = true;
-	}
-
 	return 0;
 }
 
@@ -338,6 +329,7 @@ static struct cpufreq_driver loongson3_cpufreq_driver = {
 	.get = loongson3_cpufreq_get,
 	.target_index = loongson3_cpufreq_target,
 	.verify = cpufreq_generic_frequency_table_verify,
+	.set_boost = cpufreq_boost_set_sw,
 	.suspend = cpufreq_generic_suspend,
 };
 
-- 
2.31.1.272.g89b43f80a514

