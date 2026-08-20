Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F4744212E
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 12:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230192; cv=none; b=aMlAq5Rijj9Shkhq3mnT36Zf0OEr0/UITPzD/PY/srK3Yv2+xreQ9h86e1NwmnzFI9L+81KJ85U0m8mp75w+D1H67gw+k44gvxUQ8p7vjTCdy7Ki6X3d+mieuG8+4I1KrWeeH835B5kpcLicGzWRyk7r4e+nzMJZnwtzqOl4FwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230192; c=relaxed/simple;
	bh=KGnT4QFKPDO8M5NS2h9toBVamg6N1j8I2dq2/3m9SpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EDgZ5Z4ar+YAZHfjKwhHkfJzy0Tv/XQPUrfszMotYd++e1AnqhHyxaJKc5OfXzPsYdRG+rGokSkhqRPGp/ApiBSzJk+l/YVQVkXJfFO0YAcGCoZ5aPxWIjOqBYF44CoZtcuJeFYQMjVePU11Fs9q6NrbNRr0CgA+KfW7196lV9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=BeleO76a; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=lKkwTSij; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="BeleO76a";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="lKkwTSij"
Received: from kunlun.suse.cz (unknown [IPv6:2a07:de40:b306:2000::2])
	by smtp-out1.suse.de (Postfix) with ESMTP id 00E1185041;
	Thu, 20 Aug 2026 12:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787230183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2E9RW/Br6W/RKw7ZkdLYYwbK+Tqb4KRJ+S80k3ypLNo=;
	b=BeleO76arBFrXY2bnzF+66KHNfInyud++cir2HrBFE+LIuc3fLa9Tqv30N5uv/BhvcHwIG
	H+XVHc9SEoNtEGD4iFy4zMvKQ9hrej4MOiqtUD2R5L+T9Rh5CFrCDzz96Rqwu/gJb1P2Sb
	LuG3CWj9bNNK3Cj8TKXMA2y+CLJ7I0c=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=lKkwTSij
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1787230179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2E9RW/Br6W/RKw7ZkdLYYwbK+Tqb4KRJ+S80k3ypLNo=;
	b=lKkwTSijcbNGbJcJZth7892+xj5bADW8BZDiQnCJreRvyywc7m+WZ8r1sZfNYoWdcJ336a
	3azESJve5L48ytYNxZVdBHo6DjfN0hS0hFDTMdDDB1zZVd7p+KCcfEvIw+JvrcduQkSzYE
	H5iOd4Aqk5wWDaegz2Sxj45WjAOspCI=
From: Anthony Iliopoulos <ailiop@suse.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: remove unused setup_profiling_timer function
Date: Thu, 20 Aug 2026 14:49:31 +0200
Message-ID: <20260820124933.144476-1-ailiop@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [16.69 / 50.00];
	SPAM_FLAG(5.00)[];
	NEURAL_SPAM_LONG(3.50)[1.000];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_SPAM_SHORT(3.00)[0.999];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[kunlun.suse.cz];
	R_MISSING_CHARSET(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[kunlun.suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DIRECT_TO_MX(0.00)[git-send-email 2.55.0];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email,suse.com:dkim];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b306:2000::2:from];
	DKIM_TRACE(0.00)[suse.com:+]
X-Spam-Score: 16.69
X-Spam-Level: ****************
X-Spamd-Bar: ++++++++++++++++
X-Rspamd-Queue-Id: 00E1185041
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: YES
X-Rspamd-Action: add header
X-Spam: Yes

setup_profiling_timer() is not used by any code at this point. Since a
default weak implementation exists, there is no need to keep this
arch-specific definition around. Remove it along with the now-redundant
profile header includes.

Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
---
 arch/loongarch/kernel/smp.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index d4b5d1b6bb01..11f54837f56c 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -14,7 +14,6 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq_work.h>
-#include <linux/profile.h>
 #include <linux/seq_file.h>
 #include <linux/smp.h>
 #include <linux/threads.h>
@@ -716,13 +715,6 @@ void smp_send_stop(void)
 	smp_call_function(stop_this_cpu, NULL, 0);
 }
 
-#ifdef CONFIG_PROFILING
-int setup_profiling_timer(unsigned int multiplier)
-{
-	return 0;
-}
-#endif
-
 static void flush_tlb_all_ipi(void *info)
 {
 	local_flush_tlb_all();
-- 
2.55.0

