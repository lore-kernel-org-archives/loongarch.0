Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB30472081
	for <loongarch@lists.linux.dev>; Tue, 15 Sep 2026 08:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460460; cv=none; b=AeaQ9PV/cV5yTuoY2yDFmqHU+I7AJzql/qM79MAj4/TSZVkWLfvGcORoW9LRLoXA/t/s5ZZ9nw445yntclOdQmq9u3ZCFspsSpb/tLUPFDHEFTNnPeKl5W9K2fk1r8nP+wPkG0QG7S21LRBEA24WvX7ReZ2WeZNGWRtjJtZG1W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460460; c=relaxed/simple;
	bh=z7dasmw4/Yd5J5NMYLIKQKAVayxIH5dLlb/JPMHBnRA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hPLVc5/LhY1cxJpEE/yySI7PmytijcHr1wkajmCG6gENP+6tkZNxatTmJgf/4e0Pawqz3ioQefilyLoAbi7Je7MwuXlC0CxhlaMG+UYtadVF26P50euA3kFDqjpgJmoYfHlf3rI+XagNYTbirLLlwmkb4+dsMBOlc8czfoyenpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jdKUL4X8; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jdKUL4X8"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc73f47bdcso54169675ad.3
        for <loongarch@lists.linux.dev>; Tue, 15 Sep 2026 01:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789460408; x=1790065208; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jabuqrMs8PQTYoTuRH1Tce2jM5ZfyHhnXojFxmEofr0=;
        b=jdKUL4X8rs6dom2maRuppMfoEa1hG8lZs7ztyGFFDIn9AyZtWivabJBUsy/VDZkQMe
         n1Q4zerUfxeXaW5SKYXCKMf+gqwL8UXBnE0hPY3qPnYFFxVJafm9BJRelcAWcsd8DNVd
         iVLhVBRQ49kWfpPsLqi98kzSLVuwvHInu75VutCaH9V6G57sRXPgAslpyLwEvqMVihaC
         hYV61mv0F456XnchxbVulUPVDfm42yJm1qMDGc9paLDF7tkmOLwqBTJnbQ+pM6YlppUj
         mMBaKyj7lSTMgRSb+sAG2bPb2WN3lymLTtiJm4MleogVEuSg1BdjUD3SQ5+hPwQt6w4H
         wvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460408; x=1790065208;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jabuqrMs8PQTYoTuRH1Tce2jM5ZfyHhnXojFxmEofr0=;
        b=ajdbtHKv8rNtu+KbfFphczQGW77hmFOxnHHoMv771YNs8BdkGhBY3JU3AypTGknr8X
         0xBD+wNt5PKpGtrAhoNi1ifwQ1n0yVwqQ4QGuq8ldCUU0d6ew+8z/fPb7WvCD8OrJfrz
         iFQhX/aNvO4g0932LvJf1NYB84CJ7k24vX81enFRrxeUnXCvnaDMdrBmMibz9qdZIas7
         A6173eef1RetGV7zfjP5AsrBrXkwvhxKJBzn0+S6/rth2QfD2YNvqj1bJamOSA/v3OTJ
         lDyA0qUu1tvzB19kQkfADp0ifsOAspzAyDPTPHcBSoHI7aMRr4NwpwiPtbzU3QlBUJ78
         fnsA==
X-Forwarded-Encrypted: i=1; AKwUvBz2H9ZudE4Ekl83Gq5p/7QR4U+FEj2VycBB9pDQkLlxm3BXbSH9MfaUOpwJ7v3OnfV5+Pn584Qgw/E=@lists.linux.dev
X-Gm-Message-State: AFuF++nWpjpV9DYpZobxZen2K3OyBuWpIdnntSXtQxkFtUVMfBPCBYEd
	9d4eTOYeyDHNHM4+2aLPZ0nvvuPVViivy6ger6pvW8in1b170wnIKyg1xRkzPGWArcD2y4ls5FX
	h
X-Received: from plde9.prod.google.com ([2002:a17:902:d389:b0:2db:820a:9228])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f786:b0:2dd:4070:8f5
 with SMTP id d9443c01a7336-2dd6c758602mr148465515ad.21.1789460407562; Tue, 15
 Sep 2026 01:20:07 -0700 (PDT)
Date: Tue, 15 Sep 2026 08:18:32 +0000
In-Reply-To: <20260915081910.4142719-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260915081910.4142719-16-morbo@google.com>
Subject: [PATCH 15/28] orangefs: Use seq_buf for debug help string generation
From: Bill Wendling <morbo@google.com>
To: linux-kernel@vger.kernel.org
Cc: Bill Wendling <morbo@google.com>, codemender-patching+linux@google.com, 
	Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Tony Luck <tony.luck@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Schwarzott <zzam@gentoo.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>, 
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>, 
	Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Kanglong Wang <wangkanglong@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Qiang Ma <maqianga@uniontech.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Ard Biesheuvel <ardb@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Thorsten Blum <blum@kernel.org>, Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lyude Paul <lyude@redhat.com>, 
	Ashutosh Desai <ashutoshdesai993@gmail.com>, Imre Deak <imre.deak@intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>, 
	Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Cryolitia PukNgae <cryolitia@uniontech.com>, Jiaming Zhang <r772577952@gmail.com>, 
	Will Porter <mrwillporter@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, 
	"=?UTF-8?q?C=C3=A1ssio=20Gabriel?=" <cassiogabrielcontato@gmail.com>, Rong Zhang <i@rong.moe>, 
	Arun Raghavan <arunr@valvesoftware.com>, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-edac@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, devicetree@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-nfs@vger.kernel.org, 
	devel@lists.orangefs.org, linux-hardening@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

orangefs_prepare_debugfs_help_string() constructs the debugfs help text in
a dynamically allocated buffer using repeated strlcat() calls across
keyword loops, rescanning the buffer on every append.

In preparation for removing the deprecated strlcat() API[1], use struct
seq_buf to build the help string. This tracks the write position across
the loops, allows formatting each keyword line with a single
seq_buf_printf() call, and checks for truncation via
seq_buf_has_overflowed().

Additionally, replace the final strlcat() call that copies the completed
string into debug_help_string with strscpy().

Link: https://github.com/KSPP/linux/issues/370 [1]
Cc: codemender-patching+linux@google.com
Assisted-by: Gemini:gemini-2.0-flash-exp [shell_command_run, editor_update_=
file]
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Russell King <linux@armlinux.org.uk>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Schwarzott <zzam@gentoo.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Anil Gurumurthy <anil.gurumurthy@qlogic.com>
Cc: Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
Cc: "Martin K. Petersen" <mkp@kernel.org>
Cc: Trond Myklebust <trondmy@kernel.org>
Cc: Anna Schumaker <anna@kernel.org>
Cc: Mike Marshall <hubcap@omnibond.com>
Cc: Martin Brandenburg <martin@omnibond.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: Simon Horman <horms@kernel.org>
Cc: Chuck Lever <cel@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>
Cc: NeilBrown <neil@brown.name>
Cc: Olga Kornievskaia <okorniev@redhat.com>
Cc: Dai Ngo <Dai.Ngo@oracle.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Kanglong Wang <wangkanglong@loongson.cn>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Qiang Ma <maqianga@uniontech.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Breno Leitao <leitao@debian.org>
Cc: Thorsten Blum <blum@kernel.org>
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ashutosh Desai <ashutoshdesai993@gmail.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Johannes Berg <johannes.berg@intel.com>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: Jiaming Zhang <r772577952@gmail.com>
Cc: Will Porter <mrwillporter@gmail.com>
Cc: Cen Zhang <zzzccc427@gmail.com>
Cc: "C=C3=A1ssio Gabriel" <cassiogabrielcontato@gmail.com>
Cc: Rong Zhang <i@rong.moe>
Cc: Arun Raghavan <arunr@valvesoftware.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-edac@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-input@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org
Cc: linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev
Cc: brcm80211-dev-list.pdl@broadcom.com
Cc: devicetree@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-nfs@vger.kernel.org
Cc: devel@lists.orangefs.org
Cc: linux-hardening@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
 fs/orangefs/orangefs-debugfs.c | 36 +++++++++++++---------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.=
c
index 9f94919a6bc6..6e2f9887eab4 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -37,6 +37,7 @@
  */
 #include <linux/debugfs.h>
 #include <linux/slab.h>
+#include <linux/seq_buf.h>
=20
 #include <linux/uaccess.h>
=20
@@ -623,10 +624,10 @@ int orangefs_prepare_debugfs_help_string(int at_boot)
 	char *client_title =3D "Client Debug Keywords:\n";
 	char *kernel_title =3D "Kernel Debug Keywords:\n";
 	size_t string_size =3D  DEBUG_HELP_STRING_SIZE;
-	size_t result_size;
 	size_t i;
 	char *new;
 	int rc =3D -EINVAL;
+	struct seq_buf s;
=20
 	gossip_debug(GOSSIP_UTILS_DEBUG, "%s: start\n", __func__);
=20
@@ -640,17 +641,14 @@ int orangefs_prepare_debugfs_help_string(int at_boot)
 		goto out;
 	}
=20
+	seq_buf_init(&s, new, string_size);
+
 	/*
-	 * strlcat(dst, src, size) will append at most
-	 * "size - strlen(dst) - 1" bytes of src onto dst,
-	 * null terminating the result, and return the total
-	 * length of the string it tried to create.
-	 *
 	 * We'll just plow through here building our new debug
-	 * help string and let strlcat take care of assuring that
+	 * help string and let seq_buf take care of assuring that
 	 * dst doesn't overflow.
 	 */
-	strlcat(new, client_title, string_size);
+	seq_buf_puts(&s, client_title);
=20
 	if (!at_boot) {
=20
@@ -665,24 +663,18 @@ int orangefs_prepare_debugfs_help_string(int at_boot)
 			goto out;
 		}
=20
-		for (i =3D 0; i < cdm_element_count; i++) {
-			strlcat(new, "\t", string_size);
-			strlcat(new, cdm_array[i].keyword, string_size);
-			strlcat(new, "\n", string_size);
-		}
+		for (i =3D 0; i < cdm_element_count; i++)
+			seq_buf_printf(&s, "\t%s\n", cdm_array[i].keyword);
 	}
=20
-	strlcat(new, "\n", string_size);
-	strlcat(new, kernel_title, string_size);
+	seq_buf_puts(&s, "\n");
+	seq_buf_puts(&s, kernel_title);
=20
-	for (i =3D 0; i < num_kmod_keyword_mask_map; i++) {
-		strlcat(new, "\t", string_size);
-		strlcat(new, s_kmod_keyword_mask_map[i].keyword, string_size);
-		result_size =3D strlcat(new, "\n", string_size);
-	}
+	for (i =3D 0; i < num_kmod_keyword_mask_map; i++)
+		seq_buf_printf(&s, "\t%s\n", s_kmod_keyword_mask_map[i].keyword);
=20
 	/* See if we tried to put too many bytes into "new"... */
-	if (result_size >=3D string_size) {
+	if (seq_buf_has_overflowed(&s)) {
 		kfree(new);
 		goto out;
 	}
@@ -692,7 +684,7 @@ int orangefs_prepare_debugfs_help_string(int at_boot)
 	} else {
 		mutex_lock(&orangefs_help_file_lock);
 		memset(debug_help_string, 0, DEBUG_HELP_STRING_SIZE);
-		strlcat(debug_help_string, new, string_size);
+		strscpy(debug_help_string, new, DEBUG_HELP_STRING_SIZE);
 		mutex_unlock(&orangefs_help_file_lock);
 		kfree(new);
 	}
--=20
2.55.0.1032.g73a4cd73de-goog

