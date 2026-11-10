Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269027;
	b=oNODNz6w8snCroFKoEdyuC+s1hFCY482YK4TbvNP+7bPmyu8F17Al1qn3Rcc/t+nhqeD
	 RNE8DEyim4wcFpDthQODdoh9MouoEENyjLgvI/sC1XCTti1gOi/bkyywaSd/l2VmDBZvh
	 ZSIchau4m3lsg6GFtVUXSFE6tZRF02zXEilg+WMbn7tAalkQu+BdNEaKoEwPrNSDrPhSD
	 Qiwh4Yzvu/CUr8ZZiXWMjocs82C+eEgRKA7v3vHMTNKMTMFvhzJ+QUjTsUu3lGASmLP5f
	 MS4V/YN4CXtoeo88BMONwABL6tbP2m54Ips5NHn8MB5IpMJ79wMvs3FDn8J6fE7A+Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qRWx6M+jYkJMNyYGPB8wr4U/904x6/bZv7J2hXdrjm0=;
	b=dku0ctHFXkaSr8O8mVuAgRcEHc2WEpg/f9bj9JsnwBcxnjOY/49G+ctfraKL0lNDzKCs
	 3PsvmUATASduTLazit8J00wYENJJSyZ9VWLVOI7NlMB92auCmTfgzMBhTeydHahoP3wVX
	 dsyfz9qMhrBU0CNdjMjK0CtOX+qS6/2uXJyncyI5rVLzr2tB1DjwtFsxgxrDC7GEAF/6A
	 siuIUnVrJHfgC2vvsggNflGgLcocnU29HLgCaJDxrpcmCb/1HH40g7VWfrbutxRoQiOSv
	 XAPBmyAu2yVtksanYI0zm/pJi7SgM0P6yiNPvueFOa2qPCGZzY5qaB5gDFXeKCAdZtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rs+cRvyq;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98D960A2623
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 00:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B98D960A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rs+cRvyq
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6ddef424972so1275929eaf.3
        for <loongarch@lists.linux.dev>; Mon, 09 Nov 2026 16:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269026; x=1794873826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qRWx6M+jYkJMNyYGPB8wr4U/904x6/bZv7J2hXdrjm0=;
        b=Rs+cRvyqUjAjZfm/Q2iHkfLQjAOEjzWedq8xWyvVwVFXmBrIqQ+292Vq5HVE1d/ohE
         fcVkAaQ49kEHRW+77uNrn0x1MDh1rWRvIh4Sc6c1YMnpNx3rR8jo3U7NITl5NNXJmAvx
         QMRu9mBfXluxk6oXx8q5u5LjAU+wV/9IL/TlePC6d0d29pQzrfm7bIbKK1jfWdBGY0PZ
         zy2lz+r05z+Hu/qfIc0DqyVww9693OPVuwlffqfh2YhAqZZUrc58yOMw+38boibKu9Qx
         dIm/9SJ4Ub+LtjrnycsBY249ergEUYKdCB88WOtleLUS6GvfqhkUNdg/2MCUMYAKy4nJ
         6hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269026; x=1794873826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qRWx6M+jYkJMNyYGPB8wr4U/904x6/bZv7J2hXdrjm0=;
        b=nRsELpdf0+g5oJvRc2sP8tNZzwEHNLBdQx98eMtHoDLCI+KKGzDZ4UzUg/ZxP0RrQD
         V7jwC0eggVlPBMUD7iplRUWc8lgQhZ0uADRDoPGGwOrkqQ4JaTUyaOhF3yMAvEb765qq
         1BAKrasnflYfy3D6dB7zxgIL2DwQuBU4Sr5OqEJVilA85PcRssLAPDOGz7z+R8cr1xIR
         /SD8/O4Mw09ohXwNFI7CgtUgDvhYUTy9ATdAPt+P8ejtxm6AEkz/SWDg9m/jIJ7xmOyG
         9fFtMjaeiJ23QVQRJmV1miizMI4UxhZLa/aaCLLv8AH2DZk05YU8awDPwTNC7Cl7NveP
         UK9A==
X-Forwarded-Encrypted: i=1; AL+hErFVEoM3MlHgwIkS2imIXxcT7OAftkS2B6r82g5gZmu185q1FSwwtn/6sCqrxHkGXzUbskLK0Y2R+WA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9IZfSpcbKdE9aTbCnd5t1U2isQpSsdI4DYOB5Bb2yGsgrYOTvh
	knumzQw3juh5zFyKe8/WlBmAM0Re7xffs12S+ieYh0l+KI+A+tItz03M
X-Gm-Gg: AYBFou0891krR7x9BfZBoYhEB2fWoufOspvprEdI7+LGLkBddtJSkIyjRNojXy1sgKf
	RF7DtI5Bv0RrC/lzLqQfSVv1DRKRr8Z0GOfDPDtEscgSWj03SRiDTaEth69dJ0rM2X5wwjiiV+H
	IIgNwnSZxc0Li8FSJxNEBYbdeMfK2WuC56uWMZwZvbh4RX+uYOk/M2NxLbRnjtq4mrp7LTdXjON
	0z3M6fs3uEKRAUanfQTNKcx7wMq8oMIWCcqeVC0JSscvyhxK0ZoAZJhZs0mG4Ad0oT+Yq0hSO/u
	SiIJY92XAyQmuwsAEz7wIsy0PVwMCCBiUORCS1tcEhGPlEF6N+Gtf2IWRaS7pJ/N751A4dj7Qqz
	epRWQaB9Krn+Rp8paMQYHohzsUCVoms9lU1WpsGe9alZXXHfdtI6muJrpLqE8KSiJkyfoH+Brge
	MwIpnNEKmp4Zz25qw1Cil1n/YWuz8HYMHhPIs045XOVZE2tjqSguKusZbykWRoxXmBgsYsJqa5w
	MozRnaLFe7hDXx0Yt8rXl7boCgAqCVIpl1JW6HqAYnyItRAWNhB6LMVfIvt3sHJMcRFV8JF6qVK
	0MWBn0DpZUCXB8b8ucdpuxM636BXHt+eOblVFR7NwAxemVuK/rn1dD7dWFd58hwc
X-Received: by 2002:a05:6820:248c:b0:70b:9808:a78f with SMTP id 006d021491bc7-718a5a5b6aemr331840eaf.51.1794269025678;
        Mon, 09 Nov 2026 16:03:45 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa03dbeasm513036eaf.12.2026.11.09.16.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:03:44 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: yangtiezhu@loongson.cn,
	chenhuacai@kernel.org,
	alexandre.chartre@oracle.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 2/3] objtool/LoongArch: Move the cfi->regs access after the NULL check
Date: Mon,  9 Nov 2026 18:02:54 -0600
Message-Id: <20261110000255.1720945-3-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000255.1720945-1-lzsx618@gmail.com>
References: <20261110000255.1720945-1-lzsx618@gmail.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_orc_entry() takes &cfi->regs[CFI_FP] and &cfi->regs[CFI_RA] before
it checks whether cfi is NULL, although a NULL cfi is an expected case
(unreachable nops/traps and STACK_FRAME_NON_STANDARD functions, as the
comment right below says).

Forming a member address through a NULL pointer is undefined behaviour,
and it lets the compiler assume cfi != NULL and drop the check that
follows.  The x86 copy of this function has the same problem, and UBSan
reports it there on every defconfig build.

Take the addresses only after the NULL check.

The report was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: 3c7266cd7bc5 ("objtool/LoongArch: Enable orc to be built")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 tools/objtool/arch/loongarch/orc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/arch/loongarch/orc.c b/tools/objtool/arch/loongarch/orc.c
index ffd3a3c858ae..960b59d5e566 100644
--- a/tools/objtool/arch/loongarch/orc.c
+++ b/tools/objtool/arch/loongarch/orc.c
@@ -8,8 +8,7 @@
 
 int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruction *insn)
 {
-	struct cfi_reg *fp = &cfi->regs[CFI_FP];
-	struct cfi_reg *ra = &cfi->regs[CFI_RA];
+	struct cfi_reg *fp, *ra;
 
 	memset(orc, 0, sizeof(*orc));
 
@@ -23,6 +22,9 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruct
 		return 0;
 	}
 
+	fp = &cfi->regs[CFI_FP];
+	ra = &cfi->regs[CFI_RA];
+
 	switch (cfi->type) {
 	case UNWIND_HINT_TYPE_UNDEFINED:
 		orc->type = ORC_TYPE_UNDEFINED;
-- 
2.34.1

