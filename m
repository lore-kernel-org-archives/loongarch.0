Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0622017335C
	for <loongarch@lists.linux.dev>; Thu, 30 May 2024 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068015; cv=none; b=P9JYJO7VRSY7PcB/1Ea4fsrUdoScQ7nFdzgD7fMXu5vnkmBQc297XMB0k7D6iVNFV2uIdbOTT+zIz00aHI7IWl3zmr/vn4Qb9MIESa1ZQfdysnZD1gvqHI0Dp6KvcG/S9h/O7ayx/3s0SlnMWr5j4JDYETCKT8Srml2lSJ0A+j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068015; c=relaxed/simple;
	bh=iuzxupRQlKvaCQIBiZ4xlf2r612WVp0v0y+1iZrYbx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHw/XjvkCmFYGn2axKp7kXidN4oGwMimHk+JmyVjFIMTIFwX7VV7oqCHN5saq4frihjINHClqYZ7Tk0jrHGW2G/zkSG5jeQrl/xMPfXpP4nByo9Uq9uDEel92C3X9Tz1PntipHmKdEZo+9RR3Tcq8mnFoM6Juu3patYOv5tCVes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgUQH29i; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgUQH29i"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-652fd0bb5e6so615802a12.0
        for <loongarch@lists.linux.dev>; Thu, 30 May 2024 04:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068013; x=1717672813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iS6/3rMP5XMaNOKzvqnjBVlN/YxRA0hOsUbIiKByQ6o=;
        b=SgUQH29ipw5Z9BAQbKQmfvuHfIvcAjQoEVGDQZ2XsY/2kec4Svd3bnN8JO4xAMPdjV
         RiTIyQVByjnBfPD7PJ9MoPOV1j2OtV0zolE20kYAcGndeJkrKw9aooyZzJG0tAeZm9X/
         nJVapePxFAHlae7RAhjVWZScX4CP32yNJOoJJjWP115ijHpt9lCzefWmP+iAJAV6fivz
         KkXcbUTxuE+tYMQXlvwbRxKfFJss9YDcCGtzm0ZRfymUr+7z3qD+qoAUIlJws9QLwlMs
         wcVBjUYBh4vCGZo7bKKHcqG4g5zQAapsCDYf4YcYzlhPq7prfFFauTReF4wDCa3EcYte
         Uq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068013; x=1717672813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iS6/3rMP5XMaNOKzvqnjBVlN/YxRA0hOsUbIiKByQ6o=;
        b=ay9U/sEIy9crNGHhO/OkYYUdEFLTt7HpOHLl92Ta/GRagui/+wl4BckD5ht+Vfhwqo
         7AbOAeElqqpliYz5sqh7D9eXPK0esfHaIi9tPIzNykL+5x4SfeTBTv14odqXHGkrRb5T
         GQpBdNEbRLx9MkVRU7NaMC69J/gRp1PlXwBYgNMWHOfTWfOVdGU+LIX0eUFTH5HpSY6p
         WD0C23zE2N+62/N0coYlsPQyEECCQPTQb8SRylwstGqn5Q89EYwR9JFiDBZNYKTFjGjj
         bFVOHlkanGQbH+t+S9eBKtO87Hucv5SWZCToW3lIkN8DNuqebVt+EonpAqzozaryodiH
         i37w==
X-Forwarded-Encrypted: i=1; AJvYcCVF3vxA/qwbMe3LkRgUGa3k0rVl506L+9JxoNSGGDvBjhLQV/DnsxBaLN9SnDhQ4Mq7qzmj+1PxiO5ETP2/cLPqf6BGlahiYkeX
X-Gm-Message-State: AOJu0YwuIBThMAnh47FVW9Ex7SWY6fypQvFQI7AiIqhvVesoxCXSnj4E
	DRHqz3JM9XyTQegOnyGNM1wUjQJQyu6E20wntn2G3gpvZ5aBQZfg
X-Google-Smtp-Source: AGHT+IEz4if+6nQ+0nx1w/27JH/n7YuyuluXY8+GolxtiPn58HNH1t1JZeRF1Dn7No9YQVVS74OoWg==
X-Received: by 2002:a05:6a21:9982:b0:1b0:111f:2b7f with SMTP id adf61e73a8af0-1b264645684mr2023903637.39.1717068013130;
        Thu, 30 May 2024 04:20:13 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7021feb0b7dsm2116952b3a.25.2024.05.30.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:12 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <anup@brainfault.org>,
	Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Sven Joachim <svenjoac@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Tony Lindgren <tony@atomide.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mykola Lysenko <mykolal@fb.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lennart Poettering <lennart@poettering.net>,
	Icenowy Zheng <uwu@icenowy.me>,
	Celeste Liu <CoelacanthusHex@gmail.com>
Subject: [PATCH 3/6] mips: defconfig: drop RT_GROUP_SCHED=y from generic/db1xxx/eyeq5
Date: Thu, 30 May 2024 19:19:51 +0800
Message-ID: <20240530111947.549474-11-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501; i=CoelacanthusHex@gmail.com; h=from:subject; bh=iuzxupRQlKvaCQIBiZ4xlf2r612WVp0v0y+1iZrYbx8=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJN5aHbSvetGXDI9/Lgg/2RZ0Pr9tZ2Zeh8l34s JFf/NkbX3s7SlkYxLgYZMUUWcR2Pn29rPTRh2W8JjNg5rAygQxh4OIUgIkc2cnw3+dB99H+ecua Oiy0mLQjDFasNi7dvfTwkdv38ytDfrqaLGRkOOx28cCrP0VHmn/UfmB7LhiTWCzOvmna5ka3YIu yCes1WADtNVCT
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
Content-Transfer-Encoding: 8bit

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[1]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.[2]

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/mips/configs/db1xxx_defconfig  | 1 -
 arch/mips/configs/eyeq5_defconfig   | 1 -
 arch/mips/configs/generic_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/mips/configs/db1xxx_defconfig b/arch/mips/configs/db1xxx_defconfig
index b2d9253ff786..6eff21ff15d5 100644
--- a/arch/mips/configs/db1xxx_defconfig
+++ b/arch/mips/configs/db1xxx_defconfig
@@ -12,7 +12,6 @@ CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_defconfig
index c35c29a4d479..3794707c9522 100644
--- a/arch/mips/configs/eyeq5_defconfig
+++ b/arch/mips/configs/eyeq5_defconfig
@@ -8,7 +8,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
diff --git a/arch/mips/configs/generic_defconfig b/arch/mips/configs/generic_defconfig
index 071e2205c7ed..fa916407bdd4 100644
--- a/arch/mips/configs/generic_defconfig
+++ b/arch/mips/configs/generic_defconfig
@@ -5,7 +5,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
-- 
2.45.1

