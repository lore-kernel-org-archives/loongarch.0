Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BBD335935
	for <loongarch@lists.linux.dev>; Wed, 17 Sep 2025 14:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120801; cv=none; b=Ugl2NAVu2HA5hmCaWM+1rm6v7gDNj1gGAidtI7RupduipEYB/Eyn1j1JeO10dhPCn04vdmuxM34/9w6Ihrdfzo8fyw4CJC1ExKejpDzzW9RyKOIkXUURCQq1bDcSLvuYMrZnVbH5UFPWK32aU75PdCW22W3azrZ53V2pCcy18wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120801; c=relaxed/simple;
	bh=PxhhoaB5lcx8LEXOrXuhKohfuq+vkQNdp6WOmHMDyAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFprMpjUU1QroOfveXOM2R1hd9HAanyw0CqTOED1j8Lwo5uTsn2AspIzLl9TI4sEg9s/FwMb4YF2eRCwArVgVFpp3RuOPgx9jplo+rjoX5UC6KGj4Q46uyNFJ97B36qWly/+p+MKsgM2NfXFKG39zkvpyIaTrZiHQCAywGpfEjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=hLOiRopi; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=hLOiRopi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hLOiRopi";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hLOiRopi"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 864A933840;
	Wed, 17 Sep 2025 14:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758120798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CkGwpAZoKfZ8aqTvI0ce79BqqWYUesKeBPkVp11Dtak=;
	b=hLOiRopiJyQsUAYRPncapDsPGsU4U2yFVmqY9A8qdfe/9DC6HI4ymA4GH7QXz1Snc1tL57
	IZW5+U+IcrVsVtp2VAeiGOUV8AwE8ScK3qbrB774fBT7vs/S0HOTG11jPCvDYIcMzdTfbL
	MjQJD6smdkc3JZcH10w33/KMgzE8BvA=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758120798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CkGwpAZoKfZ8aqTvI0ce79BqqWYUesKeBPkVp11Dtak=;
	b=hLOiRopiJyQsUAYRPncapDsPGsU4U2yFVmqY9A8qdfe/9DC6HI4ymA4GH7QXz1Snc1tL57
	IZW5+U+IcrVsVtp2VAeiGOUV8AwE8ScK3qbrB774fBT7vs/S0HOTG11jPCvDYIcMzdTfbL
	MjQJD6smdkc3JZcH10w33/KMgzE8BvA=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30A1E1368D;
	Wed, 17 Sep 2025 14:53:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /sNkCl7LymgqEwAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 17 Sep 2025 14:53:18 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	virtualization@lists.linux.dev,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v2 09/21] loongarch/paravirt: Use common code for paravirt_steal_clock()
Date: Wed, 17 Sep 2025 16:52:08 +0200
Message-ID: <20250917145220.31064-10-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917145220.31064-1-jgross@suse.com>
References: <20250917145220.31064-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.80

Remove the arch specific variant of paravirt_steal_clock() and use
the common one instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/loongarch/Kconfig                |  1 +
 arch/loongarch/include/asm/paravirt.h | 10 ----------
 arch/loongarch/kernel/paravirt.c      |  7 -------
 3 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index f0abc38c40ac..06bebad41c6f 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -678,6 +678,7 @@ source "kernel/livepatch/Kconfig"
 config PARAVIRT
 	bool "Enable paravirtualization code"
 	depends on AS_HAS_LVZ_EXTENSION
+	select HAVE_PV_STEAL_CLOCK_GEN
 	help
 	  This changes the kernel so it can modify itself when it is run
 	  under a hypervisor, potentially improving performance significantly
diff --git a/arch/loongarch/include/asm/paravirt.h b/arch/loongarch/include/asm/paravirt.h
index d219ea0d98ac..0111f0ad5f73 100644
--- a/arch/loongarch/include/asm/paravirt.h
+++ b/arch/loongarch/include/asm/paravirt.h
@@ -4,16 +4,6 @@
 
 #ifdef CONFIG_PARAVIRT
 
-#include <linux/static_call_types.h>
-
-u64 dummy_steal_clock(int cpu);
-DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
-
-static inline u64 paravirt_steal_clock(int cpu)
-{
-	return static_call(pv_steal_clock)(cpu);
-}
-
 int __init pv_ipi_init(void);
 int __init pv_time_init(void);
 int __init pv_spinlock_init(void);
diff --git a/arch/loongarch/kernel/paravirt.c b/arch/loongarch/kernel/paravirt.c
index 8caaa94fed1a..c5e526098c0b 100644
--- a/arch/loongarch/kernel/paravirt.c
+++ b/arch/loongarch/kernel/paravirt.c
@@ -13,13 +13,6 @@ static int has_steal_clock;
 static DEFINE_PER_CPU(struct kvm_steal_time, steal_time) __aligned(64);
 DEFINE_STATIC_KEY_FALSE(virt_spin_lock_key);
 
-static u64 native_steal_clock(int cpu)
-{
-	return 0;
-}
-
-DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
-
 static bool steal_acc = true;
 
 static int __init parse_no_stealacc(char *arg)
-- 
2.51.0

