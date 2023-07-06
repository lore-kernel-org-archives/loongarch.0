Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7434428;
	Thu,  6 Jul 2023 10:48:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 83488204EB;
	Thu,  6 Jul 2023 10:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688640535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwwhn8JX/jaC7vprMJX0+rkxovL4+/4Sgyu5JA1iVnM=;
	b=0SL+mut39oD7upwmekC2cod5inLkF+A7wEKXL/i570Bc/EYE6SZSzIvC6lUDZ7XDs3cBPA
	E0iwHyZ/LV7xrlAbjP1iUe5gSdC2wrHdGMiYiOihAOxX2i1fFvJqA5vgUtE8m0aBKv5v4V
	t+4ye0+mlbONYj4OUIGNS0c8lbYJToM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688640535;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xwwhn8JX/jaC7vprMJX0+rkxovL4+/4Sgyu5JA1iVnM=;
	b=7bw7LXsdPK85ac+mMiOd0w5qarJyfZcL2cVBdd1EY/68L8JhY6THwbQLqkQugdZMOcI/eU
	2yfPqnbQo59xlpBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47CD41390F;
	Thu,  6 Jul 2023 10:48:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SBGqEBecpmSDAQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 10:48:55 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 3/4] sysfb: Do not include <linux/screen_info.h> from sysfb header
Date: Thu,  6 Jul 2023 12:42:16 +0200
Message-ID: <20230706104852.27451-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706104852.27451-1-tzimmermann@suse.de>
References: <20230706104852.27451-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header file <linux/sysfb.h> does not need anything from
<linux/screen_info.h>. Declare struct screen_info and remove
the include statements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
---
 include/linux/sysfb.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index c1ef5fc60a3c..19cb803dd5ec 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -9,7 +9,8 @@
 
 #include <linux/kernel.h>
 #include <linux/platform_data/simplefb.h>
-#include <linux/screen_info.h>
+
+struct screen_info;
 
 enum {
 	M_I17,		/* 17-Inch iMac */
-- 
2.41.0

