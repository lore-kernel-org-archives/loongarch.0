Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675394;
	b=VIaaHcf9uG75tl0bUWe2iZRVzzBC/LIbK2u9YqOr9yoeu9rhw9nTM1DfGO+4gEcKSpM4
	 j3CCwCCbdHiA6BKqEvqxHDBJF7oR7wuYirUG9gfwZDqm5Y3L0jnFG4YpAkItt78JjY3ci
	 s300+TCcyssx3Ql1mPtVNaGNd6WbUu2vVJEi88WR6U0s+J+HMRiyTl4g15O54oKD9hrp+
	 lnLm3PzzQY+wm6I7Sa/OUDSd3eZc/rDz2hBOC098Wv1iGtCVwqkuxuQ87q0c/biYYTSGm
	 g9x2ZSUj4InzPiY/x8o0KCzhj0lP2J/kipyXb6hpxSSRIK+7nN04FYhUaDjd13coEGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=miuoSL/LBd8VdaEhsVpor+K2eCCoRMvUB9RQN3OlqTI=;
	b=fLPEn3C+Tp/YbEla2LUoZ30a/bIXDfyTjq8adKCQbCHUSvr7OkpVbZHtPOVrAfKiYXhC
	 fZx2UTdlcw/zQe3JNEum11poCXfEdT2JH8e2CGVOCb//FTB1Hesal74jpevN+63/a2TsI
	 3bJG0oXSZwOsRCuTn8WlQDUw7HWOFQi/8IPcyl2O+4zdAZBO4U+mx4RDz3o70OHORRwDh
	 ft15SMrp45s1L7APMDumN+m7Ns5WIifjfdYLZmIIvvwIQ3zYQBlxB1oho45OAlyu+KNLK
	 FypTZqVGmA8TXwBgmC7nrc/rSwbOFrtfm6Sl8e/MqJXVf2OoX3v9Il5yG0qWkxfZDSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9f7gxBi;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C6F606A88F
	for <loongarch@lists.linux.dev>; Sat, 14 Nov 2026 16:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38C6F606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M9f7gxBi
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so3154412e87.1
        for <loongarch@lists.linux.dev>; Sat, 14 Nov 2026 08:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675392; x=1795280192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=miuoSL/LBd8VdaEhsVpor+K2eCCoRMvUB9RQN3OlqTI=;
        b=M9f7gxBiRLBlImqN9Jkc4XcZXJPCQTrKhb1hA5IGc6qejsGz8WbYxngo+7qTSe3QFV
         HZA1VRBtj9RgyYNjKWoNlo4Lrh9yYKIMWDsxnENkxfcgx8twUdZgxEDKrhuVPphF9XQQ
         yXRIfRDg+KVzEv920mBBZHasjSNCLpNP7qSnhsoIg1luTjz/5VLOjaCOX7M5SmFujX6s
         r1IJJYNFPIson0Va37mAmKBZBbeH0kuh3GhnRhEuKxHLFdl2L05PmbpiMKsXEfLsiNx+
         rtf9Ag8n0veHI69XeanLqh3T4j9oTEuRRJn0n3mz5cuxm5DNWUy+n2LAZCOR0JTVX+kH
         a5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675392; x=1795280192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=miuoSL/LBd8VdaEhsVpor+K2eCCoRMvUB9RQN3OlqTI=;
        b=yJoXS5E4NaLMFsuEVwghaNHR2xN1lI8j/NhsYLl8VhpviZsFg4TmfzvPk3TDwPDcOv
         lH0/15VEix1Z5umXWTi+LZdOeF1ZvB0A+zF7+Y+PmZFrDPagLqDAPVbpn2OK2YgyIIyq
         Eb9z2L6ZX0bpk92fogeUpYRJkhThXE9M3vXpms052TMqyRX1M4gsc4/+CySvvKxs8THj
         Z4wDZZyXAeNnLbmSmjyUZINmLnsBcZrjUv2HGbh6fSJhUvef9u6bS6bfqqxzuSAjBLyt
         JWJ4CZqOrX9k3v7VT0ErlKgvmkgz0RdOQHpUgHtR0YDxWi1IhlCQ2mez9kNvhbA73Ep4
         Syew==
X-Forwarded-Encrypted: i=1; AL+hErEJlgcnVflwwawIAXUZdpTpfEKNOQK8P5CnPozAdf/+oXnEKSk9AUG/Yn9ESLw9ZTJKiBmkquJU8rw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8GSXjD+TpK9txFJ+F9eT8raFPX7+dVw0A8N6cynQ8eEF8PLc+0
	86D81QqpBFjlOE40Sv3+OhmorNcNkiX8mWxjb7zCj8odWbBx+aY2zUj7
X-Gm-Gg: AYBFou1zRG0OkGvE0DYSkjoAehFUrkkYppYWPv+sAmKIBCUQeLtpg8aINQx+G+bXOO2
	O+9jdrZC2ZEi6UZmLgmecVC3A9BHG2n/h4wnmSZELnseK1Ic+3SEGV5Gw/DG3SuEw+DD3kPqH4n
	ut322c8wFCtUyqJfMVYs6lo17wJRRwivdZ4U0uJ6ZXEs9ed6vwp0vPBT98T0taMGdRiTxQK6JxK
	KJUrChufaYi4R+C2vRpm9dFMv/uXsY3Ir0u8C1ROa9hrCpmLG6dtfltSFfjUpocUGz+7RNvY9P+
	DUgxfV2qF/+vgHZj2EUezt87GiwGXbG6mR+GkBpzyuCRSbt2CAHX9PY+SmBOHpvxaA9W31OSJxw
	XXsuOvjOp/2xw0U7sljw/84sFsSSK6H0KnwyMSnyGea0jBCjE9G7gs2Cb8Nx1Li0gO+pni0AYNX
	G7/Yggv2sgRz2pcXW1u77M0cv6PTR3YgAAa+4dhvTulOIzH054+s4Eew8rplv5wFjGApYLphGjD
	42Ud1LFE0lsQc9wUk+I/1ODs9gmdbI56ZvXX/fqJoYSqGJSYZAOHuAOhXsYj3Ot2e+cfFHiGDWe
	okIjSp7+WSkTZlctzsoOJSxxRZgzgHjj4L9rGGzR9RHZRmc2DDEbDZR6wGfsXgIS+QSFJDl7Iu/
	XNSa6vdfnkA==
X-Received: by 2002:ac2:51d5:0:b0:5bf:b93e:89f4 with SMTP id 2adb3069b0e04-5c1709fb9dbmr2101390e87.46.1794675391487;
        Sat, 14 Nov 2026 08:56:31 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:31 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH v3 02/14] loongarch: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:42 +0400
Message-ID: <20261114165612.368785-3-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257
Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/loongarch/include/asm/idle.h      | 2 +-
 arch/loongarch/include/asm/smp.h       | 4 ++--
 arch/loongarch/include/asm/switch_to.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/idle.h b/arch/loongarch/include/asm/idle.h
index f7f2b7dbf..9913191cb 100644
--- a/arch/loongarch/include/asm/idle.h
+++ b/arch/loongarch/include/asm/idle.h
@@ -4,6 +4,6 @@
 
 #include <linux/linkage.h>
 
-extern asmlinkage void __arch_cpu_idle(void);
+asmlinkage void __arch_cpu_idle(void);
 
 #endif /* __ASM_IDLE_H  */
diff --git a/arch/loongarch/include/asm/smp.h b/arch/loongarch/include/asm/smp.h
index dd1457065..c21a5b60e 100644
--- a/arch/loongarch/include/asm/smp.h
+++ b/arch/loongarch/include/asm/smp.h
@@ -87,8 +87,8 @@ struct secondary_data {
 };
 extern struct secondary_data cpuboot_data;
 
-extern asmlinkage void smpboot_entry(void);
-extern asmlinkage void start_secondary(void);
+asmlinkage void smpboot_entry(void);
+asmlinkage void start_secondary(void);
 
 extern void calculate_cpu_foreign_map(void);
 
diff --git a/arch/loongarch/include/asm/switch_to.h b/arch/loongarch/include/asm/switch_to.h
index ab9e0292c..aa5d3da68 100644
--- a/arch/loongarch/include/asm/switch_to.h
+++ b/arch/loongarch/include/asm/switch_to.h
@@ -21,7 +21,7 @@ struct task_struct;
  * This function is used whilst scheduling to save the context of prev & load
  * the context of next. Returns prev.
  */
-extern asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
+asmlinkage struct task_struct *__switch_to(struct task_struct *prev,
 			struct task_struct *next, void *sched_ra, void *sched_cfa);
 
 /*
-- 
2.56.1

