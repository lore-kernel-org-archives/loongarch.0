Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7CD219A73
	for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737709112; cv=none; b=uC34zYCceXFUuZn4lEwz/6bwpHKB0zFFMbDOtcu5pZPCvKeJLj20Cx3AS6sgkIZ03PVAMqbNba8zKTvOqN+8L+zBnovRYGuAIK86WF5mJIncnuUCkWBfUr20SJ5BP4P0oAJCci6lGya8ojPK3KzKwv51vlHjSlbd66KFOWOF2p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737709112; c=relaxed/simple;
	bh=fNI4UdDtZI4AVcTD8TnjHEnynSXd6Y+lcwnBOlUgb0k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KBNTsyaVw3uE4q55GMbiosx1CfZDsfoO05WiYaPnQk7BNFgnahMtgRUZxwmPOAPVl+vWUX8TSQBX2prvEQnALYApqwNGVwe9Ko7PvN/7zeYb+1Kx3SeAbT3pTV125ucBfC4ecchMziTLHyULctb7662glkTL0G/oNNcwoi2AL4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fl8KJaLS; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fl8KJaLS"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2164b1f05caso31538445ad.3
        for <loongarch@lists.linux.dev>; Fri, 24 Jan 2025 00:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737709110; x=1738313910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=;
        b=fl8KJaLSkukCZWh8Lbwpcw9AhU+hg5HeRWFD+Oq+HKwFRjb03fkdJ75TJP5VBqyy0V
         7f4uhxbmFmajSJiyaryDLlfb4yIWR08WE4zAGD/q3VhDz5Z1gVrw8LXPnC4nSeudtcc9
         j9LYSXSxwBJ1g3fyF+/KS7aUfoDF0b5iBPJapnfRXBrJ+VbyehVIInH4Ke/c/s27DTgl
         yaR9/EfjWu9AagB40/NlpkqsZh1tHbHRqylEdzx7Y5N36EAwYakj8lxwyiojdMhImTWt
         01UF1weCSyzKRXJyPNoIzPk9vU5h/IbNcfTl1FQOUHJdIiqBONuzQZTsxwM99SzwfVto
         MrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737709110; x=1738313910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4AqRX4jgpQUQupuoQFqpmYTbRVzBhfX6O9GAy7aKKQ=;
        b=CxpkGE3WiLcu3BrkcIs2A+2LNBj+FDwEN0fsOaCOYZngPp51esqYIMGkR+WfAMJIjE
         sH1ijxUja0fuVkjatA6tOSYhhyqOJx8ztkta0gvtA7WQzgaAI5akfNApwDq+oKeG5HXj
         Wsh+0/LMVwErUfD01Hg8uI62ebPsOvJYum0hsM+Pu4YIoPJ6FlvpbZza39lfdOYbUg9T
         SvqPXfocowqSkUyxLFbU/EdjL1ChmRIBP2R0b2MzQ/qh5TKTNcFeFaTYYnRLjXXZXRy4
         Ip/PPuw7al1foLb6CDgvrzUDLq2yKeSDQcqOpiAC5+AM8ZxdjPhjo1ABQxflif6T18jw
         PmvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZOHnBep85VNauzGOEX7yfxgqbxyaGLY8xa1+CTlb3r1XD+JKx658kGfeVpkCajKNryNkHzdQQZKs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/G6sc++7DgxgbWJmaZRWF/B9l8YKvp1e9XsSQ1TgNoMp9SzSY
	P3OKB6vZhKj0dIY8md9apJWYgJOa+WfuYIcKP6Qp3qwzelnbjMvq7iO0yHBiEL8=
X-Gm-Gg: ASbGncs/duOPHAltmIx3w7kok6Bg3qmfYvxDGn/S908xRHmgjoEOne82OHCbHLL7eKl
	RlLquWk9/v+adLGnYd++ewJCGtUnl5PnF4JnsGX3StzKRSvh481OQIg+HNLfCcUy/duBDceGw0+
	FO5VXruArT7haqnD3J76JEKwaO9JMcqKTn6SvwS/uuaT1z60kpgivjzT5ksXv6x9gqmZeQJ1VF8
	mAUkzPo965KomCR3Q2CkfTsQ39xCV0yaMsZnEJpQCGeI9Ta7Myh+ZwXYWzILfrBQQFTT6KlXEeE
	IxljZfY=
X-Google-Smtp-Source: AGHT+IGaLv3P86dnfhfsz8clY+KvPxRH7m/1Pd0NzNkAaLxjGYIDOwn76y4qMRrSSuP3v13w1OIdqA==
X-Received: by 2002:a17:903:320e:b0:217:9172:2ce1 with SMTP id d9443c01a7336-21c35544407mr480084755ad.22.1737709110054;
        Fri, 24 Jan 2025 00:58:30 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9e1b2sm11621015ad.17.2025.01.24.00.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 00:58:29 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Cristian Marussi <cristian.marussi@arm.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Hector Martin <marcan@marcan.st>,
	Huacai Chen <chenhuacai@kernel.org>,
	Huang Rui <ray.huang@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	arm-scmi@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev
Subject: [PATCH 00/15] cpufreq: simplify boost handling
Date: Fri, 24 Jan 2025 14:28:04 +0530
Message-Id: <cover.1737707712.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

The boost feature can be controlled at two levels currently, driver
level (applies to all policies) and per-policy.

Currently most of the drivers enables driver level boost support from the
per-policy ->init() callback, which isn't really efficient as that gets called
for each policy and then there is online/offline path too where this gets done
unnecessarily.

Also it is possible to have a scenario where not all cpufreq policies support
boost frequencies. And letting sysfs (or other parts of the kernel) enable boost
feature for that policy isn't correct.

Simplify and cleanup handling of boost to solve these issues.

Pushed here:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/boost

Rebased over few dependencies from PM tree, will push to the arm-cpufreq tree
after merge window is closed.

Viresh Kumar (15):
  cpufreq: staticize cpufreq_boost_trigger_state()
  cpufreq: Export cpufreq_boost_set_sw()
  cpufreq: Introduce policy->boost_supported flag
  cpufreq: acpi: Set policy->boost_supported
  cpufreq: amd: Set policy->boost_supported
  cpufreq: cppc: Set policy->boost_supported
  cpufreq: Restrict enabling boost on policies with no boost frequencies
  cpufreq: apple: Set .set_boost directly
  cpufreq: loongson: Set .set_boost directly
  cpufreq: powernv: Set .set_boost directly
  cpufreq: scmi: Set .set_boost directly
  cpufreq: dt: Set .set_boost directly
  cpufreq: qcom: Set .set_boost directly
  cpufreq: staticize policy_has_boost_freq()
  cpufreq: Remove cpufreq_enable_boost_support()

 drivers/cpufreq/acpi-cpufreq.c      |  3 +++
 drivers/cpufreq/amd-pstate.c        |  4 ++--
 drivers/cpufreq/apple-soc-cpufreq.c | 10 +---------
 drivers/cpufreq/cppc_cpufreq.c      |  9 +--------
 drivers/cpufreq/cpufreq-dt.c        | 14 +-------------
 drivers/cpufreq/cpufreq.c           | 30 ++++++++++++-----------------
 drivers/cpufreq/freq_table.c        |  7 +++++--
 drivers/cpufreq/loongson3_cpufreq.c | 10 +---------
 drivers/cpufreq/powernv-cpufreq.c   |  5 +----
 drivers/cpufreq/qcom-cpufreq-hw.c   |  7 +------
 drivers/cpufreq/scmi-cpufreq.c      | 11 +----------
 include/linux/cpufreq.h             | 20 ++++++-------------
 12 files changed, 35 insertions(+), 95 deletions(-)

-- 
2.31.1.272.g89b43f80a514

