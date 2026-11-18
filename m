Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026112;
	b=oel5E8gWSFmF44/YQrgOim3+EfAqq1rEog4xzjDyQVcCpP/0zvvEwa1KEK6Kn1z+2q6c
	 0r9JrlCO5uL+diD8T4MGmOcYSXa1qE3vTR9rhqN3tywS0jPUSk+0LhqICg68xIbV7wbw5
	 YHG53Q6xqZy2rb4535niRI4QO2VQVnsur3KlVAX7zykZZ8rXQemSHUjihh6P7jcMvEMfo
	 gprDudm34h/j9JsX3TlymgUIZkyyqbC8Tkd5rhleCZAae9G6dXFT4qik4SRoeGK5PcX0c
	 X87PEIkuWf0rLE7DDUWpC3FyrjS3leKflr/OI9e3pFiAF7hTmK3izGQkK6fxa/1knhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=OIsEMXco2ZhYz3ZqDjy8jJcFD62W77oBBUIsxaXAIKQ=;
	b=H2hrRaB1GKT2C1J3xI+kLE+qnPRyX91YUiJW0SAllVaGC6qNpnVDrYMbBxDQUE658fVa
	 /ThynOnzE/lcOwezL4/CnLWD/HlLNk/6bb1at9EtVCMWIN3P4bqZ7wXqL+afEXvMBFvQ7
	 Ck5os4BvoI2QoSVDYt1kA8ooLOhGnDMeks4Sa8Juz0gt6tcbRua1nrxUAyQUtWmbZMuyH
	 8Hg60K4aZLEoXP9NgIJP1E+Y1QB1RfZ7CVoOHJasBgLGm9a0LK9o+QqnEhNMYIqBlPWQb
	 OflNdfV3iYD4fjG+zO5cSwC5WzwtCs2WU44mqkKsreV1YetRgkMfhdw7gk4pZWOpsHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z5DsyQa0;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F24606A330
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F24606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z5DsyQa0
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a4654add56so10876145e9.2
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026111; x=1795630911; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIsEMXco2ZhYz3ZqDjy8jJcFD62W77oBBUIsxaXAIKQ=;
        b=Z5DsyQa099ADRisByPpwoeSHBmzli5OuhKKa7ItjPniQN68wVx+gyU6Xm7wItIazGC
         ScFgiqqXOamv0/iLEGPYGYqgTUAWcf3jGDPy79v5zg3PLUZIHGcX4dD4rDBfS3ymoqHn
         6exXVnhWQVrkcUM/IxgA+Bzz3C6ocP/X9Ka6H469sMgiGNxSLkDUJG2Z976prcSXVMvr
         79vlOZhO9pHS5uoEo9FZTxfXCWoMYrRmErGRt6d40TrJGe+1C/fHiXxCeAk2CfqFAVyP
         5elzeKowKolTJqL8rmsWFYepD9SqAnJ27Mos4fAqHlVoKLhO4IvIwfkiRuKqJjjc7YiG
         RsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026111; x=1795630911;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIsEMXco2ZhYz3ZqDjy8jJcFD62W77oBBUIsxaXAIKQ=;
        b=BB+NKzrRQJJPSLCLtAT7CoFTsY+BTa8iZpXk1QSPct2twT9p1ACW+HslAqodYpAGDx
         B3nh72+oQ41lSSxbXSVZdN2UA8H/F8DUvC6DMERNsOMtLpqb4EIiIY3HyOKUpKRMVBcv
         geQq/t4HjTitr5b7sLoCDt2D9DQTQI2cPeFCgIhWtglXaHeOL4Igedt0jQgobxJK17Yl
         HGGr5Mn5Tl+BuuaFdIXqYC8X7EB04UHelR3dVlfo/jiHljMvTv39lH/3ymzFIYJBJq5o
         JXD79Esw4YJCGLyEisFbHMpFflKQZu93O9LaNObhla+cmWB5mrHxDYAR1x3jd1yAVi8t
         sSaA==
X-Forwarded-Encrypted: i=1; AL+hErG/JtlGv2Z7Wrp2KyZ3FFQVOfSFkGQ4awp6C/KYeAaFvC5u7wqqfk8vFWhfo1Xa347fhKF8kjjuZqM=@lists.linux.dev
X-Gm-Message-State: APuU4Z84u5NzZIFd4GFTmEPacb11jx4DH+fUro5M/jtfhQ+cIyfp2+i0
	WY+B5mKud+czd7G/weFYQMWW/Xlje20BVSSL3jdzAcN+C885lJ27hqksQWUiVZnYi22B60IJ/w=
	=
X-Received: from wmbju10.prod.google.com ([2002:a05:600c:56ca:b0:4a3:5dec:ff72])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b6d:b0:4a7:6425:c274
 with SMTP id 5b1f17b1804b1-4bb7d6d1d71mr71002175e9.2.1795026110241; Wed, 18
 Nov 2026 10:21:50 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:09 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576; i=ardb@kernel.org;
 h=from:subject; bh=tNN7kvvvqrlVm6V6P5FGp3YhgkjQslREMs9fj1wtyFY=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm2n9dqmF22tvpj8prrwkcChNKiwqKunG9i7vLGkGk
 5VvOHM7SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEScZBj+mf9ey6hv/kNuk4P6
 Ua3fjPfW6spdF5s465ttrbKUheWZyQx/JTOspZ0caqaxyXeG69ewGNybOWHKr0bNpV0dTc9kUzb zAQA=
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-24-ardb+git@google.com>
Subject: [PATCH v4 03/19] riscv: Make _text point to the start of the kernel image
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

On RISC-V, _text currently refers to the start of the .text output
section, which is placed after the image header (.head.text), and is
therefore equal to _stext. On other architectures such as arm64, _text
refers to the start of the image, and is used as such by generic code,
e.g., to describe the kernel mapping in /proc/kcore and in the ELF
headers of the vmcore, and by the EFI stub.

Now that arch/riscv no longer uses _text to refer to the start of the
kernel code, move it to the start of the image so that it is equal to
_start, and the distinction between _text and _stext is the same as on
other architectures.

This also means that the image header is no longer omitted from the
/proc/kcore and vmcore kernel text mappings. Other users of _text, such
as kallsyms and ftrace, only use it as a reference point to calculate
relative offsets, and are not affected by this change.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1f4f8496941a..9849a3e4d102 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -28,11 +28,11 @@ SECTIONS
 	/* Beginning of code and text segment */
 	. = LOAD_OFFSET;
 	_start = .;
+	_text = .;
 	HEAD_TEXT_SECTION
 	. = ALIGN(PAGE_SIZE);
 
 	.text : {
-		_text = .;
 		_stext = .;
 		TEXT_TEXT
 		SCHED_TEXT
-- 
2.56.1.708.g77570a6a1d-goog

