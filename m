Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452F748C;
	Thu,  6 Jul 2023 10:49:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A3C55229D2;
	Thu,  6 Jul 2023 10:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688640534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fdccDL/2gY7MVJiBv6HySUTnssAS/IzsINY4DdaHR98=;
	b=JbOuQ1uwS33lIYSEo7DM5MmTaKIf3b9IswyTcs7QkzZWJc6QWcbxBmJ5KecJmO0ils47LG
	/d44K6KDFcilxC5HynwVQXejSUpPTmvu1ZJOJobmRQDvlgWhAwCHUobMjZLVC0++mcMnYy
	Xp0WpMu3EXcCgzErT41Rli4VGyF1PdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688640534;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fdccDL/2gY7MVJiBv6HySUTnssAS/IzsINY4DdaHR98=;
	b=hOkVUUyhDO2O4Nr6IRJY3NuSB8KrmNGHLH8kdbGf/sAYqgtxcLKvyQfKqEWMaIVVjmAEtC
	A4jOjqtLkXIiE3Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69D6B138EE;
	Thu,  6 Jul 2023 10:48:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aeThGBacpmSDAQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 10:48:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	suijingfeng@loongson.cn,
	arnd@arndb.de
Cc: linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/4] Remove unnecessary includes of <linux/screen_info.h>
Date: Thu,  6 Jul 2023 12:42:13 +0200
Message-ID: <20230706104852.27451-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(was: arch,fbdev: Move screen_info into arch/)

Remove include statements of <linux/screen_info.h> The patches have
been reviewed as part of the patchset at [1]. Patch 1 has a fix to make
it build on loongarch. 

v2:
	* update loongarch

[1] https://patchwork.freedesktop.org/series/120010/#rev1

Thomas Zimmermann (4):
  efi: Do not include <linux/screen_info.h> from EFI header
  fbdev/sm712fb: Do not include <linux/screen_info.h>
  sysfb: Do not include <linux/screen_info.h> from sysfb header
  staging/sm750fb: Do not include <linux/screen_info.h>

 arch/arm/kernel/efi.c                         | 2 ++
 arch/arm64/kernel/efi.c                       | 1 +
 arch/loongarch/kernel/efi.c                   | 1 +
 drivers/firmware/efi/libstub/efi-stub-entry.c | 2 ++
 drivers/firmware/efi/libstub/screen_info.c    | 2 ++
 drivers/staging/sm750fb/sm750.c               | 1 -
 drivers/staging/sm750fb/sm750_accel.c         | 1 -
 drivers/staging/sm750fb/sm750_cursor.c        | 1 -
 drivers/staging/sm750fb/sm750_hw.c            | 1 -
 drivers/video/fbdev/sm712fb.c                 | 9 +++++++--
 include/linux/efi.h                           | 3 ++-
 include/linux/sysfb.h                         | 3 ++-
 12 files changed, 19 insertions(+), 8 deletions(-)

-- 
2.41.0

