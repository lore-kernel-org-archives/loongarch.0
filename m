Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D7F3002B9
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584753; cv=none; b=QX4hxjLUS2JH31YsYNn/nbds2v2TiIp7Z+KFXUZe82YaR/Lw6i0Yx77EtBMpiP/2gKcX1gFaH3X3xOJvcKIuqW3oqrwBaaWj37ChnbmEmE+l7JjC7AvZpQB5Y0cwv9trUdx+yyDl22YUgs1Kr4GtnwH7FTsvKW9wOp/l7CIOKpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584753; c=relaxed/simple;
	bh=HC/bCcPm92UYYhfX5I6Ro+Tuzt8xgIXRNr18EYzLw7o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=legH6/IsiEOH2+2kQP6G6BJLVUuRdl+i3wWawA5A7CBK6Ahu60MqlvaB27rNny5gVQQml3JRltUohP8+RtQR7v65mLwByNWjzY8zr/M9ZPx09V0s+aU5Z85LcySKYB7ONrFF8l/cMFtngGDeZ8GdgjUiIBruUpcCgop1wwaMdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=kQp9y9FV; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="kQp9y9FV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780584719; x=1781189519; i=markus.elfring@web.de;
	bh=W4oIBjrN+XTlUmnrdLQ3lwaTgZZSEKPpTG337cjqbOM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kQp9y9FVvHSexqKKy9e6bGP68rxp6DCqKmfsRbM8QCQXgJpyFqtbqT1nLB/jRKbw
	 eIWeR7sKcVbIBDu+zhzfAuGzjDKzxHtHlbZ34/vlFHCVnrU3Mc1ujCnGNWDsCcbnj
	 c+XNuNW49eWvA5cankQv00Es5eA012E7EwpqDpwl6WuQR/imDPPgTEagop3/YN4in
	 oHIDj5e83vgX5sc4cjOjjn3sSqAqPf6HXG+Let2MLcH/z6LRHy4vmC+cFOoYCnBX8
	 I//cpU6TxSY1sGQqTc/5cfbKu1exmOlO1bUwk54Jp0RjE7/z1BhYnV0/fMNNFTbPX
	 WQIF8RW446G5Q3DW4Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MjBRn-1x9QGA1aKr-00oT0q; Thu, 04
 Jun 2026 16:51:59 +0200
Message-ID: <b01a6836-87a7-479a-90a8-3542e8d1b9eb@web.de>
Date: Thu, 4 Jun 2026 16:51:57 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] LoongArch: Delete unnecessary braces in show_cpuinfo()
From: Markus Elfring <Markus.Elfring@web.de>
To: loongarch@lists.linux.dev, George Guo <dongtai.guo@linux.dev>,
 Hengqi Chen <hengqi.chen@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Wang Xuerui <kernel@xen0n.name>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <c36cab4c-0a91-4802-8693-a6ae3cee65b1@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <c36cab4c-0a91-4802-8693-a6ae3cee65b1@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NnvLYjQ8nv8rCbqCcurKqdXGvnB0NPrXZky/FFgw93G9PraTbvG
 Qj0R/3/cDhNw33bAz3CdY4dJfqBE4uBmAQZ5WqeR7CEUeAJ8C4Uq0ObUQ6zQb0hXfB+cLbc
 JaDd1kcZdBPZf5iS0F1nM9cQnXcMUYb1LHw/oiP7Hj/KUJ5bHf8UI5iPHqPXjosVbLOH1T8
 FubndcIt6b4CiXtE3J+vA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mG+iDfMOJgQ=;8Bu8h5WRLXhPr1wXKqAD5L6rtTU
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 16:16:43 +0200

Do not use curly brackets at one source code place
where a single statement should be sufficient.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/loongarch/kernel/proc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index cc1b7a96bb0f..bc1cd400025c 100644
=2D-- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -96,10 +96,9 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " lbt_mips");
=20
 	seq_printf(m, "\nHardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
-	if (cpu_has_watch) {
+	if (cpu_has_watch)
 		seq_printf(m, ", iwatch count: %d, dwatch count: %d",
 		      cpu_data[n].watch_ireg_count, cpu_data[n].watch_dreg_count);
-	}
=20
 	seq_puts(m, "\n\n");
=20
=2D-=20
2.54.0

