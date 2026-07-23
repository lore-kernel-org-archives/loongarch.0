Received: from relay2-g.mailbaby.net (relay2-g.mailbaby.net [68.168.211.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C8543CE7B
	for <loongarch@lists.linux.dev>; Thu, 23 Jul 2026 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.168.211.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809557; cv=none; b=uvqh/ST8G8zcxVTVLiSbz7hTV1ojU7F2a16dfQctxoGKhSF8qoTiJiUMpEGsAGyu9qxyIViBGRK2Uocz7Hj3XSowhFITZ8d1EydiuZIOnaHEJPaNYE/dG2Wq57yCfo7e8j7AsOJtAfuLjW0FwnhRkyNitdxewAOB52T6FLXfOH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809557; c=relaxed/simple;
	bh=FBLCbbYxVg9bN2I/QJieY7weejpM20hbOF4DGCBW0Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HjR3tcfFoZoye2z9ZiIIqdBMA3mAkxeMAWwNzTXXzq1JoGcgxYoiEEEeEmEimONHZsmlTQ5Ntl58oMCXl9Ue9i//XKf0OTDzw39oyFsPCl0HLXQIq1YbGu1vlj5xvbVsDwxaWCL+N1i6fcynnFNbRzO+eVdaPGrAv4iGlbO2Jvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b=eAVzlLI+; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=tRZKOONG; arc=none smtp.client-ip=68.168.211.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b="eAVzlLI+";
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="tRZKOONG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=A81Ouq2PDfiZ94aINMnRYhsDKQkNXOpshNpqe6HlYN4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding:feedback-id;
 b=eAVzlLI+5tnOQePzC6i8NeLk5jXqTn+IUq+RRQhUz/rm8EUufcGLoiVXjPyglHwcIhxhoMntY
 p8FeFn4eWpCCt4VE5qc2TYqIqK8MyUZB1UG9IhwIsCCqY+zN7jCFTqi8wD8x46IPF0i9+r5UOvg
 f+u+Yf6Alsot/MR4yNfxGaY=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb86144)
 by relay2-g.mailbaby.net (MailBabyMTA) with ESMTPSA id 19f8eeba604000520b.001
 for <loongarch@lists.linux.dev>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Jul 2026 12:20:35 +0000
X-Zone-Loop: f9fd86bbb5a899ea6d6badac2da3c1384b8146836432
X-MB-ID: mb86144
X-SPF: pass
Feedback-ID: mb86144:19f8ee:587f4d465843594778405947455d:mbaby
X-MAILBABY-ORIGIN: PASS
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id A29DB200C0
	for <loongarch@lists.linux.dev>; Thu, 23 Jul 2026 12:20:26 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 0012C3E904;
	Thu, 23 Jul 2026 12:20:18 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 5EE1940085;
	Thu, 23 Jul 2026 12:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1784809217; bh=FBLCbbYxVg9bN2I/QJieY7weejpM20hbOF4DGCBW0Xg=;
	h=From:To:Cc:Subject:Date:From;
	b=tRZKOONGOPZek3mTUraSJC73qRgKKIY+BnHU4QHz8qOgQ2XJfMGqXpXOjF2cXfrBq
	 eCsboL4oTYaJa2jzVWquZqf7WhaY9JW7DLZnEYupOVLPhHnlm7w1sC75MYmuOltjMz
	 aVP7LqYGUS3c/yCIu1JrAzwnoK1lh8LOIssoZEQ0=
Received: from liushuyu-p15 (unknown [111.4.16.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id E221040AAA;
	Thu, 23 Jul 2026 12:20:13 +0000 (UTC)
From: Zixing Liu <liushuyu@aosc.io>
To: linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	WANG Xuerui <kernel@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Kexy Biscuit <kexybiscuit@aosc.io>,
	Mingcong Bai <jeffbai@aosc.io>,
	loongarch@lists.linux.dev,
	Zixing Liu <liushuyu@aosc.io>,
	stable@vger.kernel.org
Subject: [PATCH v2] platform/loongarch: laptop: explicitly reset the bl_powered state when resuming
Date: Thu, 23 Jul 2026 20:18:39 +0800
Message-ID: <20260723121840.1120953-2-liushuyu@aosc.io>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5EE1940085
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.20 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.10)[aosc.io:s=default];
	R_SPF_ALLOW(-0.10)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	LOCAL_OUTBOUND(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[aosc.io,quarantine];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[aosc.io:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[]

On EAECIS NL60R with EC firmware version 1.11, resuming from S3 has a very
high chance (>= 90%) of causing the EC to lose the previous backlight
power state. When this happens, the laptop resumes normally from S3, but
the backlight remains off (when shining on the screen with a flash light,
we can see the screen contents are updating normally).

Since there is no generic way to query the EC's backlight state on
Loongson laptop platforms, assume the worst-case scenario and restart the
backlight power inside the kernel each time the system resumes.

Cc: stable@vger.kernel.org
Fixes: 53c762b47f72 ("platform/loongarch: laptop: Add backlight power control support")
Signed-off-by: Zixing Liu <liushuyu@aosc.io>
---
Changes in v2:
- Move bl_powered reset logic to loongson_hotkey_suspend.
- Link to v1: https://lore.kernel.org/loongarch/20260722044457.1333404-1-liushuyu@aosc.io/

---
 drivers/platform/loongarch/loongson-laptop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
index 61b18ac206c9..dc8142f4fa95 100644
--- a/drivers/platform/loongarch/loongson-laptop.c
+++ b/drivers/platform/loongarch/loongson-laptop.c
@@ -189,6 +189,7 @@ static int __init setup_acpi_notify(struct generic_sub_driver *sub_driver)
 
 static int loongson_hotkey_suspend(struct device *dev)
 {
+	bl_powered = false;
 	return 0;
 }
 
-- 
2.55.0

