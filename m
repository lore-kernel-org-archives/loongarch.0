Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A991CFEBD
	for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 17:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348620; cv=none; b=D+t2DWdHvziI8NyBIAeNA8QZIdOgoHTtScLRqTMxeomclz/S5KhTjsWcWCe8Iaqq1QgX81pRoju7pUqVxzBqBD3UXj7PgzeaXE8jHGToCNycsR6ftUGuB+Rp21PP/yMEi8S4fa1YRgb7TaWNN+ECt/LZRbxrmCr0vj6xzLtRkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348620; c=relaxed/simple;
	bh=BD75Xt3LZKpr2Q5IcAd6LQbXDWkdD5S9pnl1NWkD0aY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0Jz/3dkU3RcB5BIXjbcnKx3PoZFfEae31/iBqM/EvTiYurDvC+Ej/xgZJU/GcLRUK7UBkzsW/RtrQpRjblGxDhNaoUL2c57NojmnAk4vcImUF7IZvX4lgKeJ/axER0OAs2bV7doVj2OicFX34XCk8wb1NG0ASNKeu/WZ5YuOqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZiQ2z4p; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZiQ2z4p"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2025031eb60so9382045ad.3
        for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348619; x=1724953419; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naTDf2Yfagd090z1pfb9ctw1MuISnW6ZHr9QkxmSD9w=;
        b=VZiQ2z4pvPRzkQEew9Jw1dWpkawUWVhhwbrJ0zcU6SIjIdW7xcdJgYooPxXx5P2Smx
         eF6WU1BvuOvFrjUr8BXx24knUJD5EmRf53KNKurMqtx4HvduixWXIXDeznigqa6Ko6BE
         HgFpzD38cxZxONFuimXyBx/eCH8wVJbJVYclcdirvyRvopEzSgF5OorvKkZmMXeB0AQ5
         K2sg4r8TKxS6XAZZljhcSSEvTDKbGXxE3IfBgJAPfakaI/e3ZmcvoWDusoF+B0waio6B
         +najZezL6kvBx76dcbqNjTBhF73D4mDT9Nr6xLVjMyaGeMVh6IUU/XB568Us90NphiC/
         gTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348619; x=1724953419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naTDf2Yfagd090z1pfb9ctw1MuISnW6ZHr9QkxmSD9w=;
        b=tldRGxMBMk9DXa7k7AoRSURoRheq6/9dRRvzgDk8gRy6M+YQ1ESWC+lOFjZKi1vcSX
         jbkKS6gouv+VeDRdvQBGnDyWPXDP/P2c23BHO06a2zv3FgqTU6TtZGiiOqPzyjo5zXFM
         ksM/rbn7f5M0LCI8n9nBb76G4hw+psVkjISriHksjstz3M0JkpYwmNl50r0Q9f5h2uXf
         ZrmQ3iU6Clj7SxdaWehDzquZWP28IYu1ErKO/OsNL+HApWdVMI1IHlb4ecWqgoffHOHE
         ofGOGmJW3cWcxoqP8n6DobMkrNn3tVo475zehioGdenWA4gfJ/FcSSv1lXdrBCgbdduS
         ClOA==
X-Forwarded-Encrypted: i=1; AJvYcCW3mkYWpX+VFa1GoUqaJd0A/Q4WzWSFy18K8U3mzQh1zcoY5q4IJxJ23kRxdxcKWOql/sRk8uAEPVo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvAoBX1XGb01cetljH6VNcD+TfG9RDHAMWpr6hG0HSVupH9Drk
	wePObU2ePN1cXyzcaQLjYGKUtV5iefOV2m5e793HD+StWEtMauBD
X-Google-Smtp-Source: AGHT+IE8Wv2mi92FmXr0EVETbptIN+dts38PH1ZrQUIYcAnqCM0iFwVebSqZvsivRqmBz2JSK5Lz5A==
X-Received: by 2002:a17:902:c408:b0:1fc:3600:5cd7 with SMTP id d9443c01a7336-20367af0b9amr84139415ad.10.1724348618612;
        Thu, 22 Aug 2024 10:43:38 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855664a7sm15365755ad.15.2024.08.22.10.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:38 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 01:43:27 +0800
Subject: [PATCH v2 2/4] loongarch: defconfig: drop RT_GROUP_SCHED=y
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-2-e4dbae24f7e1@gmail.com>
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
 linux-tegra@vger.kernel.org, Xi Ruoyao <xry111@xry111.site>, 
 Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=BD75Xt3LZKpr2Q5IcAd6LQbXDWkdD5S9pnl1NWkD0aY=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccrDq7cWv9HKpm1gp9XuSSxq8t74rLzH8Iuc9/9Z
 V6+kdfkhV1HKQuDGBeDrJgii9jOp6+XlT76sIzXZAbMHFYmkCEMXJwCMBH5fob/mZs/PD5ma8Hx
 8F7zO+Gcfce/RpUvkP7W1qScI/C0aYLCVYb/pR2XVnbPdNm4oDwvfcO+zZx8fjqb7h2UvJJdVsM
 b5lHKCADITk6N
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863

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

Reviewed-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/loongarch/configs/loongson3_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index b4252c357c8e..4d93adb3f1a2 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -23,7 +23,6 @@ CONFIG_NUMA_BALANCING=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_RDMA=y
 CONFIG_CGROUP_FREEZER=y

-- 
2.46.0

