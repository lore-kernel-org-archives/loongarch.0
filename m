Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839236;
	b=oL449V7XUE58Z8i588Iy3filqpLoFl8kwIUwKq2/opmN5JE/4VwkbNnGysovmotxX8Du
	 ddwpBJaoJvB3nHvzRWMt1vMME3515yD3221ZvlvtPr/m8mQhETodCdZLm7OqHxj1kQQN/
	 iX6UxIZ5AjazqB8cHiNk9SwmojkgNSoyKU29aDvL/2mSJdCcnhZu0NLCrSIzbjgGj2o74
	 UUb5hxTDk1muhfaSYOBcb7UtJePWc894IRsO84mnPCtpQ4NHjIW6ohlgk3oOA6IEqQe+O
	 Bz+6eaCztKGxO/4+4bi50jFpjyP0wm4GAgKbDbxxzqq+1zUgr90h5tfHUULkHFVlD4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Ys9OiBJUlo0yeYgXBzy5BjlTE2/m4y7kU18rGSki1UU=;
	b=XdxnHAdr0pKhbWExUweTmeQ7d2XBLHp9CScN78iC/uUDKlP2gbDzqGCXA7WNfXsSLAh3
	 J9/ampotGABL1dPj+sQOZK/QS7c2cCvetDGieZZ8yK1OmttKVPpQWgbJIEkgJYjKibymp
	 Cwj22AJ9VXaIaLItQYzxyLM+btJNA2cudftdc0dk59BwqsYaqqCc737B9EnEmSYF4Nm+K
	 /vV6qnpcjWFI3rRhiu3oHVoERJRVAgA9qkwMWpvXPBSdzFxkI5zkWVRB7KOrG1SXKAK8c
	 dfvYJ2C4M/G/8whNYsG8DQTW5DOcxPHiJqdW5neCAqp8MFxdTTbuJwG0omBiJIhlpng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lCp1O25I;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DAF606A337
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 14:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DAF606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lCp1O25I
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49febef74e3so27685335e9.0
        for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 06:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839235; x=1795444035; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ys9OiBJUlo0yeYgXBzy5BjlTE2/m4y7kU18rGSki1UU=;
        b=lCp1O25IOIPdGCJ5eYYbv11VPHZr2Ss/HtlymIYsdZtKJH6QZ3SlPzo2UcbHpKqoLn
         JqTxX8WKIyhm7rFnBMygRmd4Jig+B/SdaUW7fM9F63/ZeVD95xAO+O84NypfUdSjg0SL
         qBa0NBOQxFX8FMsH/3jsfBT0CLLOIyWsbPs6Vhp3PqxRm93O0Mq/be90ivWA7Cyg6u67
         vT0FBGCDwY24YrWhVIXRFo2tTx+uiMp1L58Pkr6Bt46HrDFfj3K6++agmujiY2u2ho5A
         coyYQsflOkn+8hIlcqbN5b+uyLx7COKM2pF2uyWstvca3WOJptO8iYhEd1teoibDr8aB
         NPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839235; x=1795444035;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ys9OiBJUlo0yeYgXBzy5BjlTE2/m4y7kU18rGSki1UU=;
        b=qouBz1AKDzUrqk4ezqoZmUGy8NR8RDOPesHN0RLLZvK9jfQcA/IucAwmQ7N/WmOEr2
         avb0at6IDjedRp/04VtYRoeRWXyz596xwaRCmXcWLprMLzoHhUj1Deec7vCBhiaJ8Skz
         ueiHh3eVzKeMryEv0SRODB3uzn2SU3MRzUgUVDKjyzpoXJ+OsSscD22vQqSn47j1XdaL
         QgycBYjFM08yn3voGMp+D8VnqAZ+1xJiXBzQx0MEk/tznSMEZ32gFvMnLL1RiPkMh2HN
         MJcWHEetKepAGSud+LNZN/GovdFaQgkEa+j1sF81cJxbD6B/gh4qqRJh3WgauPWQlT++
         zYWA==
X-Forwarded-Encrypted: i=1; AL+hErHv4grYj+vgcxE3UkwpFgywMw/llUV+2RqQ4SZNA8vVdhU/KHRb5OX0mIULIz94SvoVLK4XISQ+K/U=@lists.linux.dev
X-Gm-Message-State: APuU4Z/nV7XPiQpsrR8dDk+j9213bEOoBv7lzyhuqVoyQddIXlNguxzp
	CKw5D0HhthXeGJtfyftZ5RX8rkc/87lP6QkmH20fyNzhx9TvlK//HbafLkQ8xGC9c0WQskQVqw=
	=
X-Received: from wrbdt8.prod.google.com ([2002:a05:6000:d08:b0:48c:4566:c9eb])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6a0d:b0:4b9:f90b:1c4d
 with SMTP id 5b1f17b1804b1-4bb4e2d5f2bmr239377595e9.5.1794839234339; Mon, 16
 Nov 2026 06:27:14 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:21 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=ardb@kernel.org;
 h=from:subject; bh=mmsq8s70dc7bNFJDZXgqjzymvtzE/nNvMalQITqcOTw=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu3UJ9vcdyFG2nWGW/zz3w2eSlTsfeBxTOhJUZZb6ctf
 Vhnf+hjRykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiI4SSG/z7r9Rf6bZwfUfP4
 kLHJCjYONxfmqZofN0xSXf/nxdmg0BqGv/IeFg0uLJvZl19WUD+yJqV1hbSMkWSL2P5b2xdw7/x oygwA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-19-ardb+git@google.com>
Subject: [PATCH v3 02/15] riscv: Use _stext not _text to denote the start of
 kernel code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

On RISC-V, _text and _stext currently refer to the same location, i.e.,
the start of the .text output section, which follows the image header
(.head.text) emitted by HEAD_TEXT_SECTION. _start is the symbol that
refers to the actual start of the image.

On other architectures such as arm64, _text refers to the start of the
image, and _stext to the start of the kernel code, and generic code
(such as the EFI stub) may start relying on this distinction.

So switch the only user of _text in arch/riscv, i.e., the "Kernel code"
resource that is exposed via /proc/iomem (and from which the "Kernel
image" resource inherits its start address), over to _stext. This is a
no-op given that both symbols currently resolve to the same address, but
it permits _text to be moved to the start of the image, making it an
alias of _start.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index d79f99b86033..e6112d424fde 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -91,7 +91,7 @@ static int __init add_kernel_resources(void)
 	 * child nodes.
 	 */
 
-	code_res.start = __pa_symbol(_text);
+	code_res.start = __pa_symbol(_stext);
 	code_res.end = __pa_symbol(_etext) - 1;
 	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
 
-- 
2.56.0.611.g1030f0b940-goog

