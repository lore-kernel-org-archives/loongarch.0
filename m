Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794269024;
	b=YZbMWHpCp2Yz8zFJ6BWzy/Ph5n8pSLxuWnoVxUj+5UTp0wJU9GQfs2HHCtVA7eJrL6oe
	 dH36A8DwWIzQ/1BNm4YE8gAFdo/xXsvt6ioNGOb1BvKd4PKsax2vqMefryp3RiXOYRUgT
	 Hh7Fvc6NI66QrFt7r63G5SKDe+Eq7MLZnhoTj5sRDy+9m+F8aI7+oIO8n+uVvtRHKyWSO
	 AdvUXeDnHJr9ApvMo7nmbw4o98dL6D/lN68tssk7hj1MNqPP3Lc1BT9LvPLEeu3UnyJr2
	 iR/1g3vL55yriEKO0uaLiD9ppAfjTADj3GJQiWwmDVPRzmxAAm9AHzCn/MK4z51fuzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794269024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MqapBShL7E9HAwIcfwxW3ioInnC6a/75KJwMddESkz0=;
	b=ZQhr5Mtc3dfaF7MYp41upqFlmtorFlHOTMAAJXjZm1XLGpRImvUhEhfSchMXV87VodmH
	 CPh+GKTeKVl5lLyaRGK8RXdzxAsW/5W0leeQzKipe8qGDX1O7qG3O+rtkPOklsYUPHCa3
	 Ae0Ug9u2JFMS2Td2tMuEq9qDr4JTO6JfteLbsna+UvtjsQoadgrf5uzH708sl5+rLhk+N
	 rwzLSrADWAiqVUx6fjv6eRFkZLLDVbBHY+Lj2mFAJIQMejdtoN7QLhwwpsCtOLrfEXfL9
	 dmat5DOoUrdfDMwwyFCTZpHYlk6A57R0o/81twyDli3Ey7Qmjf7idvhy3g53X9Lsh3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yy+YcXPi;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCDE60A2609
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 00:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFCDE60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yy+YcXPi
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6de1fd5f572so546601eaf.3
        for <loongarch@lists.linux.dev>; Mon, 09 Nov 2026 16:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794269023; x=1794873823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqapBShL7E9HAwIcfwxW3ioInnC6a/75KJwMddESkz0=;
        b=Yy+YcXPiqjw/q+9QEvHjV58COsApuLwkHPZVreQMDdKqF487JCHhRXgZkOFbMXu0sg
         6jHdtTcZvcTJQVc2oSNfUgRDvnPqyKPASC0YaSjiMv/fQPhsQIdKRNsddZ7rdmDL2YTR
         j02gwqLvvH9uIpy32zWeqESh4hNl0Ke75s4viyhqJoTI2y2jJleN8XyMZjXf9uThWuQD
         fON9qvYpafocFLEni7NWLI3SgU5io7gMm62sJoGVn95MXuRp6wber4b860lXgSkLvsDw
         BDOsKOBs++XhZJApmT2utYx/790sje5o4rYLHHDz9RLf71QiwKuadSqj2FZg92bF/cc4
         VOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794269023; x=1794873823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqapBShL7E9HAwIcfwxW3ioInnC6a/75KJwMddESkz0=;
        b=zqoqlV+vUiYWXzSi4f7AaI5u2VoT1yhAzYAaWjWhJ439SWLZ8jGGUQSWJwh5q+Q29S
         Tsxfw4wEvrs4rPVLcWOvQmzWdv6hnquYAPs4aMfyctc0/qrahQcw/xjARy2Fjs4MCZEu
         35F7oXO1S8m8WhhtrSxRNOyERjUfuSrxy1GI0gvrzqcm/FzgaCaB/pGZmcoH19UamHs4
         //ofX6QY2b3isgBueUgIMvXpufShGJVpdG4OST2Y9+ItpKPsoSua7sOT64yl0uZXbgEY
         WkJk3H5PRhpNHq04xjGHgIUeTGeDgTX+hrYmXrqw61RnyLi/BP0aZSAWFPjyyGIyE9zd
         yCCA==
X-Forwarded-Encrypted: i=1; AL+hErFhv+nvIr/e7F7kF/ruRuhkL0CF3cwFTCGOgOOIyCBnVjKjT95xEz6r7Z470Eh1GSv83woYTA3hAVY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+/MjfYFALtvOW4A0beWM2gzfMz0kFaeQkvLiYj2Y782HzJ8oVG
	3FAqQUaaPfD/HyiTPvHTl0RyWq9wu5prb0K298lhowsQb+i9cbmXi0o6
X-Gm-Gg: AYBFou0IEcgPQf4oJ4x2H3watd1KOQWkQSyTzmqybsdgsBvIl3Trq0jtc7iwyAYv8HS
	ply34mkoD+K7WflgZwuZUwUpwGiuBORsBT7WUaXgSYG0YmjF26liblEsasfPmajytwkNYc+VWGQ
	WuyLl/4TIvlE6hfQeMJYhQVGXLyNRV74c2WWDSGoFK/KhTM5W8mr4BIfCmMkWn1AW+OOaI+zvbp
	7sDgjjbkTun7BQ1zGF/ymZ1RYrIb2SUcaI/ZX7Z2c4fRt1yJz0KdpqdZat2nVKNBS+PMOpO4HqM
	KxQCdkCxBwXWfoqrxrsa5Uj0Z3HszDy3GnjDuUHLvc4TNIDBoiycOJY7YafHwKZPZG4tepFNNqr
	oIanQvWhni3zmlGAOcsSXjcf+a5BPluPEVjxthrNuY9VWafX5VGFbh1nmCnCpHKmiPcwitHhu1r
	a3x7la2gk0rUyVGKuEo6ulXkpWXGLGYBMWM8U5sEgi6LVaiOEcqaDSt1oQXz+0ZkYBrS/CkiSF0
	JeY/nIJ2URqHg704ojUud/pHa49da1CQjclsE4njRuxCz0enn9cZKzoI3Df0lXIXGabkAomDBDO
	Qs2qlcoZz5NDDUB2HbgoXyus9DN/mzgw0jmNp/CDDtU=
X-Received: by 2002:a05:6820:60f:b0:6f5:a96d:cbb with SMTP id 006d021491bc7-718a644c319mr420980eaf.45.1794269022914;
        Mon, 09 Nov 2026 16:03:42 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa03dbeasm513036eaf.12.2026.11.09.16.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:03:41 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: jpoimboe@kernel.org,
	peterz@infradead.org
Cc: yangtiezhu@loongson.cn,
	chenhuacai@kernel.org,
	alexandre.chartre@oracle.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH 1/3] objtool/x86: Move the cfi->regs access after the NULL check
Date: Mon,  9 Nov 2026 18:02:53 -0600
Message-Id: <20261110000255.1720945-2-lzsx618@gmail.com>
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

init_orc_entry() takes &cfi->regs[CFI_BP] before it checks whether cfi
is NULL, and a NULL cfi is an expected case: the comment right below
says it happens for unreachable nops/traps and for
STACK_FRAME_NON_STANDARD functions.

Forming a member address through a NULL pointer is undefined behaviour,
and since the dereference comes first the compiler is free to assume
cfi != NULL and drop the check that follows.  An x86_64 defconfig build
of v7.4-rc2 with objtool built with -fsanitize=undefined hits it in
every objtool run, on vmlinux.o and on each module, all through
orc_create():

  arch/x86/orc.c:11:18: runtime error: member access within null pointer of type 'struct cfi_state'
    #0 init_orc_entry arch/x86/orc.c:11
    #1 orc_create tools/objtool/orc_gen.c:72
    #2 check tools/objtool/check.c:4939

Take the address only after the NULL check.  Running objtool with and
without this patch on the same defconfig vmlinux.o gives byte-identical
output.

The report was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: 8b946cc38e06 ("objtool: Introduce CFI hash")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 tools/objtool/arch/x86/orc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/arch/x86/orc.c b/tools/objtool/arch/x86/orc.c
index eff078ecc945..b688afcc4ffc 100644
--- a/tools/objtool/arch/x86/orc.c
+++ b/tools/objtool/arch/x86/orc.c
@@ -8,7 +8,7 @@
 
 int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruction *insn)
 {
-	struct cfi_reg *bp = &cfi->regs[CFI_BP];
+	struct cfi_reg *bp;
 
 	memset(orc, 0, sizeof(*orc));
 
@@ -22,6 +22,8 @@ int init_orc_entry(struct orc_entry *orc, struct cfi_state *cfi, struct instruct
 		return 0;
 	}
 
+	bp = &cfi->regs[CFI_BP];
+
 	switch (cfi->type) {
 	case UNWIND_HINT_TYPE_UNDEFINED:
 		orc->type = ORC_TYPE_UNDEFINED;
-- 
2.34.1

