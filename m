Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9F21822DF
	for <loongarch@lists.linux.dev>; Thu, 30 May 2024 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717068017; cv=none; b=enQHRrE0HrUciziW74Nq7oYRaOh8B3UbQpxAFtZY4Zs1H8EKELYSIC4h9GEKJVIcinK0Vkvy9mWmDQTKFQ6dVii8ascxUyTpa58aCsJrF/C1+F5t/ozbQQFTxfzpVw5TOm9wQxP2TdnGq4xWDhSiosx2y2CWD6olQ+6ndXTwOD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717068017; c=relaxed/simple;
	bh=Y154zJjweZqXiEFejTlLKuxlmlIxiSlX1+quATRaPS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QLgQ6mc+0coUssB6jjksapSKSBzGsu9LGI6TxxlGqZb1z8nBNE9zQ6RNxJx6NPeSHB1UvVBO6thXazqK09fbxR2OQmb4dKZjwhGJLfl30JjnNr5Kyp9fm5YgUxKj+RfYkMHYEmwPBbm02+GloBMJvsu54oa42jak3Cmo3/ZroAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyOkUzoS; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyOkUzoS"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-1f47f07acd3so6793265ad.0
        for <loongarch@lists.linux.dev>; Thu, 30 May 2024 04:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068015; x=1717672815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dH4BG/CKSo6jMt/U3mBL2fbfMm4MpAzh5hyuRszV+t4=;
        b=eyOkUzoSmEFcDUAhRRDGOvcAiRTT1nrmsol97odmH2rBdgPT1EEczuRhXGBvvt9PQt
         3LxAcVg48kYbafgnF616aPS9iCQDFBrRR8DDfyCt1Bi37VkjdlFWiQMonEc68rsa9MOj
         qlGF/UcRqMaKSdfMQ1mPh2AVc/ZuBa1Aq81AJalk5L04NFhypAqWKVk9W3ogFErNcyOb
         yqvHXQ99Q2M0z+WQXpyzHvdkPy2jBcHtUC7WCjTTWlSDbKj9oRF8u+xG7hxcLUDP5o2I
         leF/nDeTlpm9LzctOU/TgcG1e/YvVQS2HKD+Z+gjS6z8QvJuJPQzpLjkDF8paZQk2G1Z
         vitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068015; x=1717672815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dH4BG/CKSo6jMt/U3mBL2fbfMm4MpAzh5hyuRszV+t4=;
        b=T+qx6pw3cd1kA7BvS6uOw1UC596uPY1ZkBBmfmgRe/eCZKRjZUz5+Fx/CCqxFFcYB/
         nqn7gSnLfxPweg1Oh0ig9G4OB35uhe0g2P5cSLEpp5KirtEE6DMS0g8bpKcpcsyRKEW5
         OjwUlPlR/U3sIa9e9oYhAx5SEVMD5Dcq3TJGW6uLw/Y0dAV37rqiTcn4t4Pj3LwNYT5U
         FRMcnc1z6Q+aPQYCcmGuHLSLGljdB1SvcJFS1OKmovUCOZV1gUx9ZFCJEZ76qGOzPGV4
         hp0leuZSZjNfV3/LPry0WoIN/Bbawq0m3uVKgpnu7gZx99G5bWfeBdIIG8nZZOBAS4Iq
         0sGw==
X-Forwarded-Encrypted: i=1; AJvYcCUR0k3qXQj1+kMuxj2NnF1FbzOY+5MW4GBRzC3VkzBVyutG/1SXl18kgGCI4RDNFUE6slW6ImEVtMJeOS779wr6sGmui9i41yKo
X-Gm-Message-State: AOJu0YymDIhYdTveefW0gC2d6StFINNau9JPl3mDwaFOHKYL4KG2I7Xk
	vkmaWqemV9PU/ZD/1Su/kXnOpKsw7Oho0Lpbh7ynOsYU7ViIaCDN
X-Google-Smtp-Source: AGHT+IG8jHeaxjvonyo+8k1nlUsHHhRggP/hzSY+HPghj9Yo3s6jnJryohh0teWJzBXwbeSfn/+xNg==
X-Received: by 2002:a17:902:ef45:b0:1f6:1a91:e744 with SMTP id d9443c01a7336-1f61a91e96fmr18511035ad.21.1717068015407;
        Thu, 30 May 2024 04:20:15 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f48bbbcaf0sm81594105ad.48.2024.05.30.04.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:15 -0700 (PDT)
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
Subject: [PATCH 4/6] powerpc: defconfig: drop RT_GROUP_SCHED=y from ppc6xx_defconfig
Date: Thu, 30 May 2024 19:19:52 +0800
Message-ID: <20240530111947.549474-12-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=CoelacanthusHex@gmail.com; h=from:subject; bh=Y154zJjweZqXiEFejTlLKuxlmlIxiSlX1+quATRaPS0=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJNwz83B+K5vRMSbg2N3g2v23ulidmG/9Zikz5N r1Q2vnFpk0dpSwMYlwMsmKKLGI7n75eVvrowzJekxkwc1iZQIYwcHEKwES4nzD89/SoEmo8dO8G n0eO7Aw1cZt90Zb+dnteRPD1pkVFLBEsZmT4umrj9jtvzS78ub1pD3/1w7Mzvl6+8T9jVc6dBXm cuVf72AEUHU7d
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
Content-Transfer-Encoding: 8bit

Commit 6e5f1537833a ("powerpc: Add a 6xx defconfig") said it was copied
from fedore's ppc32 defconfig, but at least since 2015-06-10, Fedora has
dropped this option.[1]

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

systemd also doesn't support it.[2]

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 66c7b28d7450..c06344db0eb3 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -12,7 +12,6 @@ CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_CGROUPS=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_USER_NS=y
-- 
2.45.1

