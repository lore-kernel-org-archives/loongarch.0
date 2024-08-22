Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5D61D04B2
	for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348625; cv=none; b=ZvUg+E/+zj2+B27s0Sycn1lDItT69LEwVQig3BVwgk9uxSsa5mccYkbunl2D9c+77tFOMl/OS96Cr8Rt4Tvt3WVVwX17dP0Et2iX1qvgon6h5ejm16NeW+Jjygrc+z1mEDY94+NzaGMJMcMlNSDUKTOIXiHQlU7JA88Eb4newo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348625; c=relaxed/simple;
	bh=NFJyZNClpVUHx0Z3NXNiq6kpWDX+CueV3L4clx5uBrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6V1ibN1t3kWRO0O7oBVMJakrPbH/LrigBqUjQK2oHLaIR1uQwYFaUCefuUwV1UUeCG4fIlKBJaNa5F8o1tF3aUeWGzhCEClSPhwnc3xce4+mOaAMD9p+1akOQp4RYptkpiceVD2GaqwvAsqgbtmJTqwPNKQqoOMJ/3UPgzj8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcFNVdGk; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcFNVdGk"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7141b04e7b5so726463b3a.2
        for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348624; x=1724953424; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flQt4FT94ocjxfYVsDsgAIXjhRxl01ohtqmqMtZp6jc=;
        b=CcFNVdGkikLVxPsrL+t2ecRwxziZCA5oZF7l4fWLiUIZjwwopC2rLWhbaIemPt/zgo
         2e9OW5wkoumS470L5D3MHkxWTqZYzk2X7Pn/KTl2HTeIjmwodjw6wnxVUG6nddwVM9sT
         ef/231BDsTia0b+rjCvt21h0UDJRaEFh6CUER80tIHfXeF0hfrtmSSTJdvMS8JxmqsR7
         LRuZ3Wbw+f8MEpEIJGvVMmKGl5njCiBLSYZzBHlZdz5cz7uLvFHlwzLzd4yoPmaIY2TJ
         /t4SJx+kPxQhim0oPUs4ZK0pQQF6r2dPhIh8vQsm0abjbRL4M6wq7dCa38bjz/MigP/I
         SHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348624; x=1724953424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flQt4FT94ocjxfYVsDsgAIXjhRxl01ohtqmqMtZp6jc=;
        b=YPLDp1Wu5YGgUjf2jEAyFUqcwfyLP4Q0np3p5Dyp5T30v8qxLjijOuvEmJ3C1NfjtM
         l+4nd/dIMe9Ubo/Pm2gS83DX4gGcuYCtRFA37E3saj37RzhM4VBG/UZao5Js/WFacrwf
         yOZLe87fjXG3QEKbtYNl04rc4aexBUgEkt9yOGKE9cjgYSSc/JqXwUcRXySkawNmfKJQ
         PMvWPzwhRfNPhqOzjII0OMHLbV/z7IFJ/6/cqeCuxeY0mzml2Zp1Mtb0mNiTryI9cx63
         dtch4h254HR3TjB1AiWVTwi1SiPU22W7ijsDIIYEquBCuE5Sh9gSCLf2hkRpjgFyZFoq
         pr9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKa2I1RQsJ3PjF6WSbAZmKfZyJ/Zg5B4zmjP89KjkV/axPcaPnxLj9kvQ5dHGSvqa50ueUkmuu3b0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6FCS6+eZNTaC0bv1qyi6PMhdZqZI9/dalgWGQdUmOpCeCefwG
	z592u4iGwQRh7SWlkuS2Ytb+nJ5qVkhkLLLLNMvmWqOJdTx1SjhM
X-Google-Smtp-Source: AGHT+IFGkELVvNa0lI1frVFe6EWSijWeT2NndQtVRkhY3tXIvi6/Nr7KdOgUntuymQnVsLZZV1NHsQ==
X-Received: by 2002:a05:6a20:cfa4:b0:1c4:9c27:77a5 with SMTP id adf61e73a8af0-1cad7fb3fd0mr7479354637.31.1724348623824;
        Thu, 22 Aug 2024 10:43:43 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434af17ebsm1583180b3a.3.2024.08.22.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:43 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 01:43:29 +0800
Subject: [PATCH v2 4/4] arm: defconfig: drop RT_GROUP_SCHED=y from
 bcm2835/tegra/omap2plus
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-4-e4dbae24f7e1@gmail.com>
References: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
In-Reply-To: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
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
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=NFJyZNClpVUHx0Z3NXNiq6kpWDX+CueV3L4clx5uBrg=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccrDivyM1yYePqvmKhQXbdc0o4/M99VH9rqbjfrd
 C2704FIwfKOUhYGMS4GWTFFFrGdT18vK330YRmvyQyYOaxMIEMYuDgF4CKcjAwdc84dWeL8XvrP
 oXWq2Tvq7x9Qlrtz8PpheXWhu2maxd+PMfyvY/2cPcnsqtDXK2v61hZlLJVe4rPDPnSvlHrjhGk
 +FpHMAC41TKg=
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
index b5f0bd8dd536..27dc3bf6b124 100644
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
index 3a166c2f02bd..9cb265c8d414 100644
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
index d2a094ad360c..3a9bda2bf422 100644
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

