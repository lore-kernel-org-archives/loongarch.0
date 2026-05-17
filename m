Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB0020CCDC
	for <loongarch@lists.linux.dev>; Sun, 17 May 2026 03:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778987691; cv=none; b=oam8VUowECXVf3NvPfDYeSTX6he/Du1aYlqbIpwwBv3ZiQGHFnV7Ck0kfnnUHhx+dsUSDcgWR3xo0RjQrW6afN/GhHB1ZMDs+lcvkqawJ+dqwMb6DDbQxAhMl5S2SVNxPKBkW+E3WUS9PytIe4wM+JHik+NHgNrY8ITHSDeoj1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778987691; c=relaxed/simple;
	bh=ri/eJlHC7UN2zyssXhADK+SFuDdKeaElhRa8H7tTz+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KovDDqkj4GEVfTFI1koLgzzbumY7jLxya7w9z4weUvRc8CaEdd4HgmtQ9sJywQKzwOB8R/D1VlDB+AOjFrLdyxkibmDlsfCuWZKjGzx9po5ONKLT3Ph6i3UGNSELRmIwjsjGkmZzDua7M/JEfPRqTgHg3P+aRVUnBSgZX0Qdszg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H++ysfyt; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H++ysfyt"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso1116900eec.0
        for <loongarch@lists.linux.dev>; Sat, 16 May 2026 20:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778987689; x=1779592489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hfq3wqL8gmrW8nePp5k7jramHiXYMDBLkPO5KDqKpBo=;
        b=H++ysfytx8N7c1Wha3Zicd6GXqPH+L94MG2CEuKqM5xKUGR/0PsH23n80t03m9roLt
         CzOS8OUN93ZOd0lEG1fKO5WA7/1iqqxD+2SVHTHJ2kqF6hKBjvVfia/U1SGIbaO2n7ol
         wQRxIhNwLbdgzVD/smmtguTejtZSBZ654/nCcx7ELzeV6G4Iq5pZCbJgKMNh5DjXLtSD
         LmY/up0h8BfsoY8MjVsd4/mhp4C6X1WdrRkyDPqBDFXcYrKIiHDHhLXrn9qQVGg2u4CP
         c99ymLEAVEzGiMZL6kxGsm3Ekh7pK498YO4KM7FG/XEi67fkqzGRM2jYg1JmF3VIxVJY
         robg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778987689; x=1779592489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hfq3wqL8gmrW8nePp5k7jramHiXYMDBLkPO5KDqKpBo=;
        b=SEnEVKgs2vSOimq/1ClRuwpk2TyjYvIdfzJkoczjWW9QxbHybVav7C00Z9IEo+6X6N
         bPmRXbRQZgTrxV/Y2fCBBIs+edvL/wHFiUyrXBR/bJsvyR3y0BjpXKwpUxOMvZjHVR3L
         BEFXudUfk/9WUANywzrO0V7z6hV+pJDUDEWnhZiBrnqDkW8Y0HjAjg99UIOS4qqOLS6E
         UA4QRNw4gms+5O8eyCWyCjsK5pZY4EQLVQ3DJXAAizDeZc+TwXy41SjRGaam0f2XmmQo
         JZO5ki9cHmR8fMuaMMav7Tr9fB2brajwlJG+8Lsh0mxfg2q+bHUSKE6PrZj6v8B0fVVh
         TlWQ==
X-Gm-Message-State: AOJu0Yzs6znzxrH5fKYV/vtgVZ5eRP8gWaM9IkncGGuk0Qm/wWwGTSUx
	Yutyo0hXqFlZh0xHgthkX75Ys7DQsM4q6q9d3ptCIgAFmn0KytPWwMuoEbjM8iEdFFk=
X-Gm-Gg: Acq92OFICQ0ufhoSkLY0t4NrvpC56gA0n0lxvocLlEboinKFZd+Wyi90EWr7M0o1+Z0
	4Wj6Tja8bmr5JMzi2XllkgeX4LwMiUKr67yk3cosQRAVM4ebyV7lbjm+KLaUQrhW+BL6QfpD9IO
	qq5JtjdBxEGVN1bUZ5E/7aCiC5dJngcKxhJ6tJSCQ32EyQmrbTLcyzRhb592VsbBgcfG2AcSiu5
	hrrW8ZZnyeMJyFoTCfw44C+I9uhHOLpq2BzuRlJZ7vGN9cd2LHWw5yRj4sxcpegmBjTNxefX8m7
	3aW2oY1bxPjPe1mdfeJJYUFMKxsOnDgRpzEBaCnDRr/pJDcaVvQlzFSLPGWdVXM5hqct08LMTEK
	e3k+izMJeW/4ePezTG2ypz1HPzdr1jBO1i5EWTTuVoEBdU1OWvwwTiyVmptzdEK5UFUCViL+cZq
	/dvxz4m3Vxt8aZw2Q+0GOHHirKa1T9T2RujjXyAlJr8iveu97uezWo5072ui3iRjMCJ+wsowAe1
	sff6d71OTHF0wuSDLHzSEDxOdkkp2w96iRa6TNrh3g0xpjrOEFy/TwXOboDA1CNYETonD4Ta+RZ
	lVAEKsjVMnaynNZlUA==
X-Received: by 2002:a05:7300:fb83:b0:2de:cc07:e8b with SMTP id 5a478bee46e88-3039818afa7mr4753610eec.1.1778987688926;
        Sat, 16 May 2026 20:14:48 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea78sm10868372eec.6.2026.05.16.20.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 20:14:48 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: loongarch@lists.linux.dev,
	linux-crypto@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH] LoongArch: Remove unused arch/loongarch/crypto directory
Date: Sat, 16 May 2026 20:14:26 -0700
Message-ID: <20260517031430.102984-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All LoongArch crypto code was moved to arch/loongarch/lib in
commit 72f51a4f4b07 ("loongarch/crc32: expose CRC32 functions through
lib"). However, arch/loongarch/crypto still contains stub Kconfig and
Makefile files. Remove these unnecessary files.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/loongarch/Makefile        | 2 --
 arch/loongarch/crypto/Kconfig  | 5 -----
 arch/loongarch/crypto/Makefile | 4 ----
 crypto/Kconfig                 | 3 ---
 4 files changed, 14 deletions(-)
 delete mode 100644 arch/loongarch/crypto/Kconfig
 delete mode 100644 arch/loongarch/crypto/Makefile

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 54fcfa1eac1f..4b22f95aaafb 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -197,8 +197,6 @@ endif
 libs-y += arch/loongarch/lib/
 libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a
 
-drivers-y		+= arch/loongarch/crypto/
-
 # suspend and hibernation support
 drivers-$(CONFIG_PM)	+= arch/loongarch/power/
 
diff --git a/arch/loongarch/crypto/Kconfig b/arch/loongarch/crypto/Kconfig
deleted file mode 100644
index a0270b3e5b30..000000000000
--- a/arch/loongarch/crypto/Kconfig
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-
-menu "Accelerated Cryptographic Algorithms for CPU (loongarch)"
-
-endmenu
diff --git a/arch/loongarch/crypto/Makefile b/arch/loongarch/crypto/Makefile
deleted file mode 100644
index ba83755dde2b..000000000000
--- a/arch/loongarch/crypto/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for LoongArch crypto files..
-#
diff --git a/crypto/Kconfig b/crypto/Kconfig
index 103d1f58cb7c..62221507f2b9 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1361,9 +1361,6 @@ endif
 if ARM64
 source "arch/arm64/crypto/Kconfig"
 endif
-if LOONGARCH
-source "arch/loongarch/crypto/Kconfig"
-endif
 if MIPS
 source "arch/mips/crypto/Kconfig"
 endif
-- 
2.43.0

