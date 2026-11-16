Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839253;
	b=cJmA0qsgiELeHu9vcwQecUWeHrAqhoA/mXuafrlgQUUj2Qlz7qfEmUe8q9F8v86uIq6R
	 eYQwh+OkGEv4TDWhE6O4jYpPylxsBUcZcFd5DJll/1++UE+XipWIZHbTCKdT47Gf2MsWa
	 ZHv8rMbYstE9LW/83GDYsYlvbXweVjN8TutrkGuUOF80vRA48/ty1a4QBSLHG1sF3TlSH
	 WEzC5/18nS49JyAGAuyXA74sNwi08v0K5bITs9bugJKhP77vNDj8kWqsQNyIkCpzbovE/
	 0oVESX3vwDO32qG9WNw4CrDrRqIL36PrBNqM7DQBb8qFWB+8JD8lTjUu6CtTO2b7awg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=GDmEcRmMyOcax5mKICmpAsSQPFvmFrhuIcwUrIgFdio=;
	b=leditOp6Ecxteasn+TEZdMctxbj37zt6CUpwlxIptLFVP/Vr652E5aEMO86P61PMJ64O
	 7xNf/EPFcKMl6E9DX6YsjyPpjgMmOrYeJj5c9+TJdZm51pdC++wAvOA9czxDu8rFjbiU0
	 nmKz/imUKBwye/mR97vDWtaaagNDITyO/5Fh5SdjjfzQcMfI9qJGYFCoYWWxXBA7TJ1xx
	 XvUn3kON0UsPqWuuq51jK2QmqdqwWzexqwKX5ix9YCcUzmGcy7QbLKDZxKSLKfnuoO4Or
	 TRycREkJ6gFP0zPP51ijNaqidpH+wlvnkOsz9rXNrk2pZ50t5yCYD6JISu5CUmeKbkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=khj6EStp;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C10606A32C
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8C10606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=khj6EStp
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0461e040so3108089f8f.0
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839251; x=1795444051; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDmEcRmMyOcax5mKICmpAsSQPFvmFrhuIcwUrIgFdio=;
        b=khj6EStpWIgbgcj5qmXkNn38OFyVojVPnOy8hZewnTyCgFSmGhhWWavo5/IEqMmRzw
         erUkpw426tXdIIT6hsZtONYVZ88wzASdnDyHU6ucR1ekD1o8VSldjqrFWX+LlAiZoPl2
         mQh2cby0qrlv0pil6OvToQ8/gSztYG0d4Fhv/PHMSfp48efEa6MCH2Ic58tlCiUhU+fU
         ka57vOaTn+wMd+YzomYS/zVOXqWG8j2AelLJrp45DZyLAXb6TJZxX4X6m9AWvpGO61rg
         dJtkfgTZi4x28G+a88QqN1Uj/Dv/fIIKcmKIwxMA+PanrIaC8zuky+kRVMcvJ1++bwPl
         2PLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839251; x=1795444051;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDmEcRmMyOcax5mKICmpAsSQPFvmFrhuIcwUrIgFdio=;
        b=E2n2syDVwbWNpJhQXYxwQpPT2EQTDZeKNFkzXiSGgVASC7WLzfLaf6cPk4v2j7XusD
         YjxCWSI3qQMiAk6HllwzS+0Qeisv1CcN12PT6mB9nOMtEdrkc7rUhy/fIVUyUOYD3ac1
         UQtPiebPZ8RVe+pxB3QRqPYAuNXZFfPEMnnMlxiyYMidhzXG7BvEiqEsm/xBuG7MZzg5
         Vu27Fo9G+0g4imr6fnFIpap3RWIi+cIBANHua4oVRhS2nruZpomGTVF8sUY7VDd+D6cv
         U0kzmRmUpsQPg9pA5sltl7VK9MJmNLRusytbGp1nqBv/fGiU+38E6pwfGHM+KJzY+il6
         vt/A==
X-Forwarded-Encrypted: i=1; AL+hErFnazg6H+xvzr4kB/WshZ/1slPmNDiMz/ujPSDQlXT8L24qwojT4WWu8SaAmCQSBekJGUjqacR9YYo=@lists.linux.dev
X-Gm-Message-State: APuU4Z82Y8e+enZ9+EWL0PKnPdUzYXRikKObVmFmDHDHvhlbEFXyhKBd
	hmiXNAe+qSoFyO9CaD3mCGlFecqHxHG6/t7HQah01/BYJJX8w/I1rZbiBKZ4OWctGw9Wj0kP0g=
	=
X-Received: from wrbdj11.prod.google.com ([2002:a05:6000:b0b:b0:493:1d71:a33b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:608:b0:488:7dc6:4e9
 with SMTP id ffacd0b85a97d-49c70ed8e94mr25114870f8f.10.1794839250838; Mon, 16
 Nov 2026 06:27:30 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:34 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284; i=ardb@kernel.org;
 h=from:subject; bh=pQuS5NqxIFj4wbVklTtBdnUPtGLjNWkfYhwihjrAl7M=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30IKV0rIFvb3+jhJvjwtvPt+/VykrMM5e7MOqiDD5J
 z4biho6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwETuWzL8d11y4WaaBftmeZMD
 53wZtqg9KLJ+1VZUrtITZ9u4o7zpACPD8ueZbzxnF72pm3I965OyuWpdZ0F03u3v0v87Z+lIPG7 lBQA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-32-ardb+git@google.com>
Subject: [PATCH v3 15/15] Revert "efi: earlycon: Reprobe after parsing config tables"
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This reverts commit 8b3a149db461d3286d1e211112de3b44ccaeaf71.

That commit added logic to probe the EFI framebuffer earlycon again after
the EFI configuration tables have been parsed, as the primary display
information may not have been available yet when the earlycon= early
parameter was processed.

Now that only ARM uses a configuration table to pass the primary display
information to the core kernel, and the EFI framebuffer earlycon is not
supported on ARM, the reprobe logic no longer has any callers. So revert
it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/earlycon.c | 16 +++-------------
 include/linux/efi.h             |  1 -
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/firmware/efi/earlycon.c b/drivers/firmware/efi/earlycon.c
index 3d060d59968c..997f69ce46cb 100644
--- a/drivers/firmware/efi/earlycon.c
+++ b/drivers/firmware/efi/earlycon.c
@@ -216,14 +216,6 @@ efi_earlycon_write(struct console *con, const char *str, unsigned int num)
 	}
 }
 
-static bool __initdata fb_probed;
-
-void __init efi_earlycon_reprobe(void)
-{
-	if (fb_probed)
-		setup_earlycon("efifb");
-}
-
 static int __init efi_earlycon_setup(struct earlycon_device *device,
 				     const char *opt)
 {
@@ -231,17 +223,15 @@ static int __init efi_earlycon_setup(struct earlycon_device *device,
 	u16 xres, yres;
 	u32 i;
 
-	fb_wb = opt && !strcmp(opt, "ram");
-
-	if (si->orig_video_isVGA != VIDEO_TYPE_EFI) {
-		fb_probed = true;
+	if (si->orig_video_isVGA != VIDEO_TYPE_EFI)
 		return -ENODEV;
-	}
 
 	fb_base = si->lfb_base;
 	if (si->capabilities & VIDEO_CAPABILITY_64BIT_BASE)
 		fb_base |= (u64)si->ext_lfb_base << 32;
 
+	fb_wb = opt && !strcmp(opt, "ram");
+
 	xres = si->lfb_width;
 	yres = si->lfb_height;
 
diff --git a/include/linux/efi.h b/include/linux/efi.h
index cc1df1577d5f..4a809c6ae724 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -719,7 +719,6 @@ efi_guid_to_str(const efi_guid_t *guid, char *out)
 }
 
 extern void efi_init (void);
-extern void efi_earlycon_reprobe(void);
 #ifdef CONFIG_EFI
 extern void efi_enter_virtual_mode (void);	/* switch EFI to virtual mode, if possible */
 #else
-- 
2.56.0.611.g1030f0b940-goog

