Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061431CF2AF
	for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 17:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724348618; cv=none; b=KpHxyOM4+8dkJvoDklETT6kd1TXbN0jwM9abO3lIRHtN4OH4AaGJuzxUVNRFbHC8oZ7FW015D65sdxA4emW30PXH0teTns4RBAcCwlvQu//N2T6PxYuIRYZs4rIGjUYdPphzTvmD55YA4s07eiRiTJBELgrHEDRt81IPNMCxuPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724348618; c=relaxed/simple;
	bh=zrg/IlnMUyssz1StuHquhO16krnEeXCPcrxCVtormZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dpwz/fWuQp1H5H4oANCsARIOJgLY8Anmlom6c8hBXiIHe8N78cal4OioJ+6B2/RFg/fCXuaRPxoO81JxN3K2Wg84GnMvbzK9SFOkqdoElslF8uDFOPpP9YzY7E2BlKjL41nskJrjE2m2qOiQWAgKhmy8qimCcVEwFLSB1EJM9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XT0mmVF/; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XT0mmVF/"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7143ae1b560so538120b3a.1
        for <loongarch@lists.linux.dev>; Thu, 22 Aug 2024 10:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724348616; x=1724953416; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NvCv6jeEaWhn1t3eF5O7vM5v2ll4kF+knLw1urWQdc=;
        b=XT0mmVF/t5cZMSl2D6uu8XGbNwHcw/iGRXW9VX2DUICIYfVl7TA7MMg/OBRMIuUDXh
         ReGKJxGrQnavid9+ZYJRF6dXicoLqCvPA1UbrgILJ7nVD8wfWJ8iva0eWwzaPfbfCfis
         juX/qSV76VPrY2E/Fic5mt5Zt714xfwuMCWm80EStxL0iFMn13/h5hvJjELb+md1o3vn
         gGZn43oNymUIIqMWYVkm3tYJmpNwxZVYwKYnmWTToMfGMArX2igW8w8eNh732Ohuqh6E
         ELd3mQuJIHfQ2Lx0nRekp2SjSMDrrtYk+Ww1e1QvOWxQjeZFPQp/vLzQamDDflr4hB9b
         nWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724348616; x=1724953416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NvCv6jeEaWhn1t3eF5O7vM5v2ll4kF+knLw1urWQdc=;
        b=WbmChVUb/4Jtvn9XMfK0DFtcDBDfxxylEX+cLjtLiqmMlvLt7KUJeOSMBGPgfW2gN6
         Ou+T5nGjlvC2Mf/XPY5uLgmD1Pfz+ryJKJiDdCrwkNuf2o8DJvzcMntVfiDFbc7s8DMz
         sXFalpbN3N9BC7IBFuIl/Q473rE8ssIhz/6tgGG1lsJcxMeZSydKAxoVNfpzYZlvxOfG
         d5V0sun1dVGUasuf5xrmIIiZLCPE9QsHRfuqNDBisvYwwcdNVhDZ+FzzBaMVPoEUmAKM
         xw/eUMoA6Y3rCcfbG63CeIXWDPjhNMFU4+l+QpTeZi/XqyRF62hjUlT/1cBXygmGFvsj
         vEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMc2A2cJU0lPmcciZa6Pjh88Wo2scUY8jy/M+NYsEF9OwFf4eFmuLj6jrubMRc8Z9vmnGhHYYR7MM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMcWvFV5vNcKryR96I8eIEm9l1Dm0/riWHLHiDWAgMBcLWoTlJ
	24HK5LU8ItlYtM7rjAY68J1dzSEW4CqrH+1q1JinLtl3lmBgfY3a
X-Google-Smtp-Source: AGHT+IFY7faoa1ysSNP/WTlIuc5cvUwL0iduNK27/aTo1Ui5+aFB0dzwQSjau/0u3AZ2vjSD7A4hzg==
X-Received: by 2002:a05:6a20:d04c:b0:1bd:2214:e92f with SMTP id adf61e73a8af0-1cad7f8daafmr8210064637.14.1724348616184;
        Thu, 22 Aug 2024 10:43:36 -0700 (PDT)
Received: from localhost ([103.156.242.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143430964fsm1647764b3a.150.2024.08.22.10.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 10:43:35 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Date: Fri, 23 Aug 2024 01:43:26 +0800
Subject: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-fix-riscv-rt_group_sched-v2-1-e4dbae24f7e1@gmail.com>
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
 linux-tegra@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1885;
 i=CoelacanthusHex@gmail.com; h=from:subject:message-id;
 bh=zrg/IlnMUyssz1StuHquhO16krnEeXCPcrxCVtormZo=;
 b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaccrDj6cdSh5rvkhA43VF5ie/BGZ8aZM6IH+r8Sia
 u1NErnCStc6SlkYxLgYZMUUWcR2Pn29rPTRh2W8JjNg5rAygQxh4OIUgIkEJTP8j35R0LfbpvUd
 1xaRRpYmh5N3lf8sPhhZfaL89dFXV1JWzmZkmLBztbxRUUjEvrpX0xSd53Jw9lcJmBeKL5h0U7r
 m3345dgD+6E2g
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp;
 fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863

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
2.46.0

