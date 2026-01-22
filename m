Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455034657D7
	for <loongarch@lists.linux.dev>; Thu, 22 Jan 2026 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769079475; cv=none; b=Q3Zdlu/qq9FPk/yJRBr6j7PJzxco9EWt31VVE8H01zTQiv+LJiKyqmvTQao4b0FI8CHEOZUuCI+zRTZIf75QQHV8F3rrgqWMX+kK87a1srhhFBhvHlcOOVxYZf6q1bP3BXlo7T5UwojrnXtNDWNMf4XGPu8KYfc7z2GDQPpl3Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769079475; c=relaxed/simple;
	bh=0pf25QAYefSQR4VWamuqFfUc4Om5IWSa+2laY27CsaY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NE4RaxVEI+5MYRd58C5T3aYELYXGYvx6mVH/ZmKrG/WzClFvA7ExAGkNSn4V4+eJQCt3nIOnbWsP3f9W49kOEMC6ky975acS27yQtTOt3y/MokUnQN8T1CIOtPV0f6HR/x3zoVYCQown2Obk8AEuY4kToPNCUUNsMpNHLyI/cJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gq/WkHNV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t6gy5+sf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gq/WkHNV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t6gy5+sf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gq/WkHNV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t6gy5+sf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gq/WkHNV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t6gy5+sf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 132AD336B4;
	Thu, 22 Jan 2026 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769079471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oqgXrTxuNR0u24JtY6uiYo+O6M6j7KIBhbmiRaouNHk=;
	b=gq/WkHNVWzdgCMggh/ci43nhtVOoXmcRWxgZb2J6HmWtwEa89dLolxRIz7fGD7RWVkXaeq
	dSKuPaS0GVD8mxKTHCO1mXIX8OIF6g/p9GUKKFOF5w8DpKqfPGSZcWD6UD3bbi3ZQtpMI2
	kYLz1S6/SvHVJelJMqWC3zJMx/Z/Gtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769079471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oqgXrTxuNR0u24JtY6uiYo+O6M6j7KIBhbmiRaouNHk=;
	b=t6gy5+sfuRn5JyC7L662WCMI6G8x3gqT0RSEE+Q7cxaREhsb4pdCVfJdCYEbZ2VHoZKC0u
	ozqREUARCgfmnsDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769079471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oqgXrTxuNR0u24JtY6uiYo+O6M6j7KIBhbmiRaouNHk=;
	b=gq/WkHNVWzdgCMggh/ci43nhtVOoXmcRWxgZb2J6HmWtwEa89dLolxRIz7fGD7RWVkXaeq
	dSKuPaS0GVD8mxKTHCO1mXIX8OIF6g/p9GUKKFOF5w8DpKqfPGSZcWD6UD3bbi3ZQtpMI2
	kYLz1S6/SvHVJelJMqWC3zJMx/Z/Gtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769079471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oqgXrTxuNR0u24JtY6uiYo+O6M6j7KIBhbmiRaouNHk=;
	b=t6gy5+sfuRn5JyC7L662WCMI6G8x3gqT0RSEE+Q7cxaREhsb4pdCVfJdCYEbZ2VHoZKC0u
	ozqREUARCgfmnsDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A479F1395E;
	Thu, 22 Jan 2026 10:57:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DNtUJa4CcmnPLwAAD6G6ig
	(envelope-from <clopez@suse.de>); Thu, 22 Jan 2026 10:57:50 +0000
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>
To: chenhuacai@kernel.org,
	loongarch@lists.linux.dev
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <clopez@suse.de>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] loongarch/kgdb: use IS_ERR_PCPU() macro
Date: Thu, 22 Jan 2026 11:56:36 +0100
Message-ID: <20260122105636.89985-2-clopez@suse.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.74
X-Spamd-Result: default: False [-2.74 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MIXED_CHARSET(0.56)[subject];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Level: 
X-Spam-Flag: NO

In a759e37fb467 ("err.h: add ERR_PTR_PCPU(), PTR_ERR_PCPU() and
IS_ERR_PCPU() macros"), specialized macros were added to check an error
within a __percpu pointer, so use them instead of manually casting
with __force, like all other users of register_wide_hw_breakpoint().

Signed-off-by: Carlos López <clopez@suse.de>
---
 arch/loongarch/kernel/kgdb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/kgdb.c b/arch/loongarch/kernel/kgdb.c
index 7be5b4c0c900..17664a6043b1 100644
--- a/arch/loongarch/kernel/kgdb.c
+++ b/arch/loongarch/kernel/kgdb.c
@@ -697,7 +697,7 @@ void kgdb_arch_late(void)
 			continue;
 
 		breakinfo[i].pev = register_wide_hw_breakpoint(&attr, NULL, NULL);
-		if (IS_ERR((void * __force)breakinfo[i].pev)) {
+		if (IS_ERR_PCPU(breakinfo[i].pev)) {
 			pr_err("kgdb: Could not allocate hw breakpoints.\n");
 			breakinfo[i].pev = NULL;
 			return;

base-commit: a66191c590b3b58eaff05d2277971f854772bd5b
-- 
2.51.0

