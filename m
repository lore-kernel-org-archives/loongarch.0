Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6C0192D96
	for <loongarch@lists.linux.dev>; Tue, 10 Sep 2024 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725972690; cv=none; b=ZXGWmHrxJqSPYmtJLyZiVZTDvoJ5LHbc6eRdfKHcbSTurlAwTJv1L9tF2wJCYiS19fTxWskseeaTsmFyNp2q+KXmGpjWW8wcRmAvEe+nxweHKQ+w5gcmhSI+Vxd0PhhvE3MVh0eBqyydV89TAvqUdv+f74j+hTcn8G78GD1fUZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725972690; c=relaxed/simple;
	bh=i4dMYbikEhftIrSd1gq7tvjKJfStRheJwUa1Cpif+Lw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MfOuh3+BcBba/belhg2Az/k02Y/tqKDQtKERpoA0rWt13yMNVjZZEBGt3dZ+iYOnz67QIHWtNNx+HUX5TB7Q1ykKbOk1wq7eL6Fz/t8DP8scKTnTPpA0aKXD55C1wca5JD0rtYj0f8cSzaDyL0KGg23J2vnddcFqdb2CMEcfyU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFm2YEnJ; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFm2YEnJ"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-718f28f77f4so717542b3a.1
        for <loongarch@lists.linux.dev>; Tue, 10 Sep 2024 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972688; x=1726577488; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bAopf7ujBU/05x/Zo+oSjXvUJSVgeIkGsnSfUiFe/M=;
        b=WFm2YEnJH9CdrnsZpKXZ5TWtasTfBdJMApiwyVYhWlCS3/RirdNJtpe4FIVx/ElN3O
         Qphtuwerf5Zt6tCYjEz85w1bzT6xBgnIFh+E+S7gtbZ2lW4lGuG1gZi5//X+Ve54e/Ym
         makv36c68oF/ZEeWjB6QamZj7Gb508KS3vVY/j107Z4vD1YWKNbSpIHHLh0NwI1G5yBD
         JMvn7LvjkW+9MV9YzUoG7qSnm9R0xetuaO/HIGHhRHeABS1GKd6aWAiWnIwYyW0qTCzw
         PXdWfGpe3CEva8b3Fc4qG03RCXjxlILa+3HkJ4QuZXPn+eZ2dYHzAwEnoWwES9mvCSCw
         GwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972688; x=1726577488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bAopf7ujBU/05x/Zo+oSjXvUJSVgeIkGsnSfUiFe/M=;
        b=TmYKE/bssQalBdUbU+q0cZ+X9f3IZ7fsqywpdEkqSK8uDMnAudo/J3h10SZmHu6C7Z
         vE2lWHfX2q/9YG4Pi2nKqCpwrtEModCz7UV7Qs6Pwc412J0vZnmM7HbN8RXETCni9l8E
         3rQYp0GaPp5JTpzedAq8xr89HMaonwz3bgAFwfVuS/gZ1YHs0E3vcQMPNiskj2ECh36j
         TGJOqwSGFEdEoSvBxyfElxHRLuQbpXJVoOXBNSZiTQ6n4ya9zgBVfzBEBfA1e3RFzYWg
         gLJY6OpAzLfZ7QzNudrco7UOjPAG1sHDc9+QskD/UQddi4E7OYGRbUB9p17Rswb+Zh4k
         dihA==
X-Forwarded-Encrypted: i=1; AJvYcCW2n2wLzrtQaKdJf6/33SMiBpcF1zYgq0C+GrEUNzDXw+gWVvgpANyVyVjV11E5B27SIaiH9kn02UQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHS+92fv5Iy1n9WrcF4rMXsZw2Yxp+0su8bLhtYBqNWHP5nKKx
	ETcP0JuXj2zGl0v5P2g72WbEsYtJsblU/zhP4RptNpPn9j1GupCl
X-Google-Smtp-Source: AGHT+IHgHbCzgcyX/yq2/aN5BrFUKFDAFGLiltGw+vmIZ7aKbx1Z6fmvlBgd0wE3EiRb5/sbMP7HqA==
X-Received: by 2002:a05:6a21:150c:b0:1ca:981:8e4e with SMTP id adf61e73a8af0-1cf5e096a13mr901315637.3.1725972687795;
        Tue, 10 Sep 2024 05:51:27 -0700 (PDT)
Received: from localhost ([212.107.28.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db04966b75sm6317071a91.36.2024.09.10.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:51:27 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Tue, 10 Sep 2024 20:51:09 +0800
Subject: [PATCH v3 3/4] sh: defconfig: drop RT_GROUP_SCHED=y from
 sdk7786/urquell
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240910-fix-riscv-rt_group_sched-v3-3-486e75e5ae6d@gmail.com>
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
 linux-tegra@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=i4dMYbikEhftIrSd1gq7tvjKJfStRheJwUa1Cpif+Lw=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaQ8cjhgVSl/QKw754HE9X+Szg08Pp2726RsspZo1s
 cuehoW11HeUsjCIcTHIiimyiO18+npZ6aMPy3hNZsDMYWUCGcLAxSkAE5EsZGSYdUDWq+zSzrNb
 uf2nMx3iy3m2PDCA48XSy62/naf1Wu9cwvBXwMtR5NxLTpaWCzuFXEqvq6VyxJlzXj0uYqrOt+/
 TP1EOAFFySKE=
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

Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/sh/configs/sdk7786_defconfig | 1 -
 arch/sh/configs/urquell_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index 7b427c17fbfecb24d63e717023aad19ce1c953e8..3599b1683593b865d863800eb84b3f8f89d3d57e 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -17,7 +17,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_CGROUP=y
 CONFIG_RELAY=y
 CONFIG_NAMESPACES=y
diff --git a/arch/sh/configs/urquell_defconfig b/arch/sh/configs/urquell_defconfig
index 00ef62133b04ded8d0b4221f11e0adafde99d386..9cf4a719001ea5ef4b031c1bbbf8098e8af5a2b2 100644
--- a/arch/sh/configs/urquell_defconfig
+++ b/arch/sh/configs/urquell_defconfig
@@ -15,7 +15,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y

-- 
2.46.0

