Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A7817E462
	for <loongarch@lists.linux.dev>; Thu, 30 May 2024 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068010; cv=none; b=SzRS+w7RFUK7JKGaldxk5XUCSM8lv9/OCnp+eTk/BgtjH2pffNCMYNQn9PF4+KfufdXb8y9BZCrQl6VCYJHprXTC7Iiu49IVZrF8UyLvY/jySGMdJsvaOdQ9pWJFFr3oF4eh4e+cE8h4TMeazoSdXSvai1oA49hggKP5vr25vE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068010; c=relaxed/simple;
	bh=FEk4ZichD7CqTRAppezRH+4H9dhTF4GYT9EUDpibpAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIhI6kK42UP72chyF2ZmDnTjfBQ1E0LMTlR18l8zuQ+uI3QgFyyOvfNVg1O6JBtpHmc9HjdkJmzOPc75GiThKUUefEwT11+fdaMZlKzIOiv6+0dtqaIjCTwTh/iB6Y0EuLNhG3RwUE6zLNalZrlIJCGLq7dwfWNLD7Ku9k0Dn6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLrCyGyf; arc=none smtp.client-ip=209.85.166.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLrCyGyf"
Received: by mail-il1-f193.google.com with SMTP id e9e14a558f8ab-3737b27dc95so2853475ab.0
        for <loongarch@lists.linux.dev>; Thu, 30 May 2024 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068007; x=1717672807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMLg5P8GKaZTkgjzD8R/QqO0sSQDVLJa6m0BArXde/g=;
        b=QLrCyGyfyiq9PTxKappUo2fbGhitTEAKoTTYJCmZycrSfUQAp0qVtKD19a6dyH1o51
         F9Qq7j++aQn9KTjUh2qdH19+I4/yyK9LqvUnW6DLeAQMa6Pos7dy4VWYZyfwZtGQzjs3
         UfcDTEZuy1VgvTKLjd1hOfWEI/tZ5Kkzk8+rBRssG+pmTafrGD6UXDAuU6/ynDcRW+Ma
         zcS0tet75WCWmXSh6WSizl0y66A1tZfgZ1pfVXqLxfOs6LW4hqjg0aPn1o0VsJXSlOZB
         uZd0DJ3t3YsvQMGz/a5q4GMZsxvC/NZiKl2E5QWJ0jNLT+Wya3jGfHY+wdaAcr1iHGL7
         4JHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068007; x=1717672807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMLg5P8GKaZTkgjzD8R/QqO0sSQDVLJa6m0BArXde/g=;
        b=ahC7ev1+spRM+G3/ecDptEKDvks5X6S/pRK0EV32WDVOxs4EUUKrtDxP+ycvLpuicP
         CToqRiBaViNTmAjlYFvrxTLJAQVMBX3sLgjJjA09vbXla5qXWPlnK6b4JVYLbeG8Qedd
         Af8qNjOhDbQ2t9io0g7Wf+17srtyRV3v/GMCXMRShUgTtozOzRQezZtZuMhmK4y6eSW8
         Pa3XmRAGvjyQg4HKcU9Z9Hg9x6ZhvpIPiFOGy+c2GrqWeLF00lD+5phygVdDL4ivlEJ8
         PirSgG/LRhsdiYpli8bfCkoDwSKGa2d9mi8Ekbbdt+1fk7f77qf9fTb9raTLBRjW4Q0s
         8AuA==
X-Forwarded-Encrypted: i=1; AJvYcCXh01tsovnESfmzsF8qWBNCIaJ/K1FEpzz+tzMhi5kdLyxEhm6wGQzgNq5/8mrEzT2wimFmR4CJYdrf3mokxQVV7UzIsRt0Eyrn
X-Gm-Message-State: AOJu0YzrPaWvIdcl3fBNTFCH1gfAl9fdVL5NhpraktJ/i8IpDZA0g+yj
	4PhmmVcVvC0s19F5RSHqAKJQtOE4Ivs4OWBUgmm8elZMcghI8vwg
X-Google-Smtp-Source: AGHT+IFxgfGuk4WvYoxrChp+N4lQDR0Si7/7Vlzjuk7wpmJrGZ30ttsy31urG1IDYNTmVV6Zs/i1hQ==
X-Received: by 2002:a05:6e02:b27:b0:374:6472:d923 with SMTP id e9e14a558f8ab-3747deba9demr23632145ab.0.1717068007160;
        Thu, 30 May 2024 04:20:07 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6822198a7e3sm10550697a12.34.2024.05.30.04.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:06 -0700 (PDT)
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
Subject: [PATCH 1/6] riscv: defconfig: drop RT_GROUP_SCHED=y
Date: Thu, 30 May 2024 19:19:49 +0800
Message-ID: <20240530111947.549474-9-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883; i=CoelacanthusHex@gmail.com; h=from:subject; bh=FEk4ZichD7CqTRAppezRH+4H9dhTF4GYT9EUDpibpAE=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJ16rP/zv78xijc+SbFuluq7KoDVxfdGb3ntmwV 4b5b/rJ87kdpSwMYlwMsmKKLGI7n75eVvrowzJekxkwc1iZQIYwcHEKwERiuRj+FyWbH5kg7nGC bXudX8b5SVrfDn7ffNohZmU9l4bwcat4U4b/tfNS9VctvP7+NI+h5NrpGpcrHCr9as+x9XPYVM9 LOc3JBwDwgkw9
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
Content-Transfer-Encoding: 8bit

Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
introduced it because of Docker, but Docker has removed this requirement
since [1] (2023-04-19).

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
support it.[3]

[1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 12dc8c73a8ac..de85c3ab261e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_HUGETLB=y
-- 
2.45.1

