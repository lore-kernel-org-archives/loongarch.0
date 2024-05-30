Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFD833991
	for <loongarch@lists.linux.dev>; Thu, 30 May 2024 11:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068007; cv=none; b=DrGce+4pXfaTDe1wZzOgcn6k984ORub47Nr8JX+Lb++zT3vR/A3A+53owC2NGkRGKmq+M6mok7YPzTRK/6jrgzS8RvrE1Z5aRfZeN6JxgxvokgZ3+6LIqm7IlDn7BU+JGfjm53LdniceDToUUOc/DeHUwQ1u1zmWBQwoJJTKEIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068007; c=relaxed/simple;
	bh=YDOl/Eq4EU32U8REOXA1aLCIyDHNFvkWJvOdwbcP7JA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gSNyaZY5UfMtt2iyZ8vwLv/yvsUp8OnY96/YHI7yL7NQgMjXDRBNMcQX+kDGZv692jN4FRqFu2cY3cIx5nheC7BiX1RG+tMsk8/KpFZvvnbEhvPZ22RvbgivS/8cB7HDOVNMqsPV1h439SuCZYlW0vnrvaDQTcdTmfeNz89ERNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCWwjuV8; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCWwjuV8"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-1f44b51b367so4777335ad.1
        for <loongarch@lists.linux.dev>; Thu, 30 May 2024 04:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068005; x=1717672805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z8dJKE69s5+86iqiKT1v7IFgnofzj53z+mkIUUuty68=;
        b=lCWwjuV8PB5PiCHF5crem0E7A4lmAVdbbRsPaPYqKVLG/gLGa2n/PVfw4rOUQOig+3
         5Us777LC7M2KqKlyyWy7MEOpPz2OpJ1LwbtcmGF/MBHgdvIFnVdOSGmJktDoH+Pknm+C
         U/C9WqRiRvH6BNpSlnDZmJsIDP0gU07BU4WXSUbIM02xlKy0X80erI+d1bbHSA4aBnd0
         ScCLlIRGyx3D0YQEVG6W5i0l4xvCn8Dg/mAZa4SKaDx2FWWw9YBKyrlSXHiWHHfzf1AG
         Lo3nzy+N0d5jPZYPYzWN26TPqOhzoMQ2Q+8AjT+aRm3fSikmWSASv2RFfBdnJIdM8ACm
         TcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068005; x=1717672805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8dJKE69s5+86iqiKT1v7IFgnofzj53z+mkIUUuty68=;
        b=k6bHWUTAvK/6MzxZWEUGdR1IEmoAe3Vme6WkpP4prQ7XHRNfr9lQA4IbApcnUuOJQN
         jQamDdmba7F4SeU7Q+85vhtYyEibZnmfOpk/dz5hvpena4r6WNCROdRJgJ+4CS/+nLTC
         z4CDTqNeG7zvvy0br2GCmkPQ9m50+032VYoRT12OdhTiwNP5oLKYGWBpVYzbdiTYhjnG
         4bg/4QCKm9P/97UmkACFzJWmKt8K9P0fbzUCDxbNHFSps8jQ3aJaRsP4k22atvFBWpax
         wHazpM/8A0Q0bdEayqkpNGQEliZAnazMEw9AymtSZS7HJJhOiIg79qFP4rGbPSpPzv/8
         w8SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkDWE8AIug59YbeiPeR3VlbbDOMMLI8spEyXondRrOtbtTG02GMDAEx2Px7xHDVv+S0HmfaXcsDOLnmML+Fc+VwjSwogMhClmM
X-Gm-Message-State: AOJu0YyPF+ZsMGw8oNJZu70HHcE3L7gvXGRBCWup40FY5iyGDoSs5Z5n
	M7tfIGgU7pOV3XUEz67LNWi14UIdKe5/yOn+omggEHkTB+m1d1dW
X-Google-Smtp-Source: AGHT+IHnnxtV+JRyOSR711uh0rY3WubRdOsfI4Q80RTI+mV/CYp9f7gUkptu0Yhyjwe8jY0JUuOaAA==
X-Received: by 2002:a17:903:22cb:b0:1f3:50e7:36db with SMTP id d9443c01a7336-1f6199310f7mr20627105ad.48.1717068004916;
        Thu, 30 May 2024 04:20:04 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c754d20sm116341765ad.32.2024.05.30.04.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:04 -0700 (PDT)
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
Subject: [PATCH 0/6] defconfig: drop RT_GROUP_SCHED=y
Date: Thu, 30 May 2024 19:19:48 +0800
Message-ID: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2134; i=CoelacanthusHex@gmail.com; h=from:subject; bh=YDOl/Eq4EU32U8REOXA1aLCIyDHNFvkWJvOdwbcP7JA=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJlycx/Wu4/Y1tQ+K7zVu27px3o+2Lk2ztb/Ozp zgqUpTP2XztKGVhEONikBVTZBHb+fT1stJHH5bxmsyAmcPKBDKEgYtTACbycj7DP527VsIyk9XS 03fzz7u7fEfWj2MbLsg93Phzuu9s68m3tf0Y/jtvNfKVfy57aprVB27vy3ZWNnJqNsYHao9/4hZ SOJ4dzggA3yZObA==
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

I leave tools/testing/selftests/bpf/config.{s390x,aarch64} untouched because
I don't whether bpf testing requires it.

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383


Celeste Liu (6):
  riscv: defconfig: drop RT_GROUP_SCHED=y
  loongarch: defconfig: drop RT_GROUP_SCHED=y
  mips: defconfig: drop RT_GROUP_SCHED=y from generic/db1xxx/eyeq5
  powerpc: defconfig: drop RT_GROUP_SCHED=y from ppc6xx_defconfig
  sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
  arm: defconfig: drop RT_GROUP_SCHED=y from bcm2855/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/mips/configs/db1xxx_defconfig         | 1 -
 arch/mips/configs/eyeq5_defconfig          | 1 -
 arch/mips/configs/generic_defconfig        | 1 -
 arch/powerpc/configs/ppc6xx_defconfig      | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 11 files changed, 11 deletions(-)

-- 
2.45.1

