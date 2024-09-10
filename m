Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBE619415D
	for <loongarch@lists.linux.dev>; Tue, 10 Sep 2024 12:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972692; cv=none; b=twEEiQ3rzmu/DOa6HuT1QpR8324o1XIcOSj2LintuhpLBCafdml896QM/EOg0NCTiMsNgW4G7tmBPDNVbclOMpuYhPTZR6059gR3REPeOTgo2vAzRZoI2gslBMFcnQbCyql935Xiaf9fVFEjPLQbE1ncwjNGmpflyorqBNdMXF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972692; c=relaxed/simple;
	bh=KOEEs/y0FGCkb+klP+KV9yU4iwr2GAi37Ho3J9O83lo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wayw5PzdHqZfbiGA/ogIg/jJInyiOftsA4QJ63mqcoSdYzDokySg1LYpZZaVqq9L6xMXrHrEf8E2SVp/s1HNIrpAtpx+YaWHdjnSeAQ7aEc0kbHLDNEktyg3MhOM1cl5WPMVlIM5xGgNAvaxozUiBjU7hEZyBygnxVD2DG5+mLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+0VnvVh; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+0VnvVh"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-2d8818337a5so4652787a91.1
        for <loongarch@lists.linux.dev>; Tue, 10 Sep 2024 05:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972691; x=1726577491; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwvRv3wJIDozdKt4626HoR6j934EORaOhOiizGhVlEQ=;
        b=B+0VnvVhcJlOYtJlfAclFwXWsG5jWOAr20RIN2HKjYqiBQ+DQNedQZL2BRU/Vb+oPa
         mRJGn6woEmCxW6HcestqTWathUsRRUmUV+e2Jv0ZJi8hSzXN+bZ2vKTB+yLR5lNRGlJo
         oo1fJ58i3WwHdYx0APrYgxhXOsIYHrcXTvw8TFN2/gZ1bwiX94Xb7UdqPxoSoIiZd0q0
         qJVsk1eCVBU/Fr95Z5he4MeMktwP9vTIDYSSumoMoiiKMPdDgRI8SumnJGLmfl7UpEIy
         SKIP9WePqS/8JRJs4Z24c9XOUnx55qZ4kKGYXml36s0kBXMAmXf1XWBPaCG8Z6bNVdcj
         CtRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972691; x=1726577491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwvRv3wJIDozdKt4626HoR6j934EORaOhOiizGhVlEQ=;
        b=RpcDe9psk+nKcTN4vic4wx7OCEp3O9dCJy+zdElK/wzaGXRWPmD1ZDRS1/GwMijZSV
         8NlFM+OTYouwRX56nLcQjorydi8+L5+O3A3mLzhVIr7nJrXLJvLXfwW2xSo/jWs4KTPr
         ZDQkdgR6/KsXncr3420GyJHWzsC2QriBzgKMUtKmdpBFPqSeXaRG9CzXDyhxHYFKpt/t
         XIlYrs3pKWu4ZN1sQRwfF0e0ynV8Riue7kv56R9X2ik1ww1kHPv+q5Fsn14YAyxrtp0m
         zfw99ua4DnQTcvqqN/g0zWx870laOGJVOAy2YFZZEYziCvr/L+M+RfldTGjuH7yZR0Ol
         JjNg==
X-Forwarded-Encrypted: i=1; AJvYcCUJWHFwN17QnPBvh0tbl2NoaUOYcAnT8Y5VzJHdmhZ1MCVf5p1x8QWGjfk9GHnOJOia0iApfJQ+CDU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeLEqL20jvIu1/hM10mVwJNqmCBx0z2gmQp+ZY+wEufKPjqnLC
	KZVsT0TsGpG1qd9vtOrhVFjlXyab9BYe/3rolj0tuyaon3FDh4w8
X-Google-Smtp-Source: AGHT+IGroNxXPo2q0iinhOTGCE7e5d5prqrWOJ0qJja22FenNOZ6SsoWGZUouzQvScBqrLr4XaHpcw==
X-Received: by 2002:a17:90a:9e4:b0:2c9:7343:71f1 with SMTP id 98e67ed59e1d1-2db671d9d58mr4299989a91.14.1725972690657;
        Tue, 10 Sep 2024 05:51:30 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db044f37dasm6265325a91.34.2024.09.10.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:51:30 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Tue, 10 Sep 2024 20:51:10 +0800
Subject: [PATCH v3 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-fix-riscv-rt_group_sched-v3-4-486e75e5ae6d@gmail.com>
References: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
In-Reply-To: <20240910-fix-riscv-rt_group_sched-v3-0-486e75e5ae6d@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Tony Lindgren <tony@atomide.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rpi-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=KOEEs/y0FGCkb+klP+KV9yU4iwr2GAi37Ho3J9O83lo=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ8cjir6+kzR+lXemlktLKMwjd0/+nsN053LZ/95b
 tR0LFP2z+0oZWEQ42KQFVNkEdv59PWy0kcflvGazICZw8oEMoSBi1MAJrKZg5HhTsqW+5GH5+f+
 PfjZ/6VgcMRh1595TKq7D4cys8gH9mkpMTKsn7GpjoXF8dtcKaszT4L+POBuC/yTIPtRKmja47U
 cUz7zAQA0aEnq
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863

Commit 673ce00c5d6c ("ARM: omap2plus_defconfig: Add support for distros
with systemd") said it's because of recommendation from systemd. But
systemd changed their recommendation later.[1]

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[2]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.

[1]: https://github.com/systemd/systemd/commit/f4e74be1856b3ac058acbf1be321c31d5299f69f
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700

Tested-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/arm/configs/bcm2835_defconfig   | 1 -
 arch/arm/configs/omap2plus_defconfig | 1 -
 arch/arm/configs/tegra_defconfig     | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index b5f0bd8dd536990a0726e73a6855d25c1286a768..27dc3bf6b124c2012b7a1a768f2f900f49903cd1 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -7,7 +7,6 @@ CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
 CONFIG_LOG_BUF_SHIFT=18
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 3a166c2f02bd80634fee3bd8c4579fdbad84ccfa..9cb265c8d4144ea9a41f02640dbc8a06b710323b 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -13,7 +13,6 @@ CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
 CONFIG_CGROUP_DEVICE=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index d2a094ad360cefefbc3bd35226c5d23eadce42c1..3a9bda2bf422b14085c60b39a2c3df86fe0994bb 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -6,7 +6,6 @@ CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_DEBUG=y

-- 
2.46.0

