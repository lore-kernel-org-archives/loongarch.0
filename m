Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB23191BE
	for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 07:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764227385; cv=none; b=UOERhwWvuWW14IxK+cx+nEQi3YCdV/uEUjmuHPtcYnz5RoVmpmN6RIk7oW/iIaNl4ObR+OSOzkY1K2/A65XU5WNdRD9JMlkrV9pKfs0qVkJ/wAVli2/n2b+sI/pTzYj0A+qie3OGu1RYCB8cHHlUW1LThshuWmFos4sN/LAb5B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764227385; c=relaxed/simple;
	bh=XGu6RJs1JFwMPXoCMhGZ7SIVYBnLqGWNO1r5nuF9HsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYkG+PM+psTi7SQJJIj/puVouHGprH/5y8GuZtThZFnsRxKvHYBvq7fAb2V7uj3dc8JSYV2XXxkv4Onr1KiAYC8YO5s/fWYG2us3piHeiQbOkhhG3cFkTrfCGEjcHbbqU12tnNNY2s19Z1ENms47ipwgkDhbrZ8JKmjup6rP2Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=IWuyTpc0; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=IWuyTpc0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="IWuyTpc0";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="IWuyTpc0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3496D5BCCF;
	Thu, 27 Nov 2025 07:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764227382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMnh9mLgK/olDi/H2M6R9TAn1UXfgP+pVLdP3+vB540=;
	b=IWuyTpc0YZw8l4d8NixfhcfUwEzrNpoRiif+QgoK6phlWV8sfxktnjR5lTyK4+e4ZmcgEy
	8AdmhDmXOsq81/8e2pwG/WH8EmgqcKmpjOHzGmpoKX8tLxFEPK7LygNWx5k/iWFvcTaH3d
	NGzVpxDTS+3W+FxWfoEHi3LMXssM1Ck=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764227382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cMnh9mLgK/olDi/H2M6R9TAn1UXfgP+pVLdP3+vB540=;
	b=IWuyTpc0YZw8l4d8NixfhcfUwEzrNpoRiif+QgoK6phlWV8sfxktnjR5lTyK4+e4ZmcgEy
	8AdmhDmXOsq81/8e2pwG/WH8EmgqcKmpjOHzGmpoKX8tLxFEPK7LygNWx5k/iWFvcTaH3d
	NGzVpxDTS+3W+FxWfoEHi3LMXssM1Ck=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF4E03EA63;
	Thu, 27 Nov 2025 07:09:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LiEmMTX5J2kjXQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 27 Nov 2025 07:09:41 +0000
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
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Bibo Mao <maobibo@loongson.cn>
Subject: [PATCH v4 09/21] loongarch/paravirt: Use common code for paravirt_steal_clock()
Date: Thu, 27 Nov 2025 08:08:32 +0100
Message-ID: <20251127070844.21919-10-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127070844.21919-1-jgross@suse.com>
References: <20251127070844.21919-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_ALL(0.00)[]

Remove the arch specific variant of paravirt_steal_clock() and use
the common one instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/Kconfig                |  1 +
 arch/loongarch/include/asm/paravirt.h | 10 ----------
 arch/loongarch/kernel/paravirt.c      |  7 -------
 3 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 5b1116733d88..030fd487567c 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -682,6 +682,7 @@ source "kernel/livepatch/Kconfig"
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

