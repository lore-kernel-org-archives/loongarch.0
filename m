Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E852E091B
	for <loongarch@lists.linux.dev>; Thu,  4 Jun 2026 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780584626; cv=none; b=Vxf3WUlUmiU4P+qmKX6zWse6U6Jg2Itozmbdvk3YPYYXcZ/N7OpvCAsk/RXv6IwtVuDd2ZGu4SooEKI1D/xsafPJah3JKeTebyoHIKG3thbcv643vlo3IYmPelE+Wf3C8rnbkbF/kxb1K+2J0AC1490AgLCBrkUSc18x3nMFzog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780584626; c=relaxed/simple;
	bh=O7mcYl/AWRWHA8/lKlpN9lRECj0GjCnkexsAR0FxcJs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mif4tVc0RgrMF+OZ7PB++xboSMTYtXZguXqcN7ZUMLkD8h9gtDdXMa2xN9MW87K1CMMhQIcylxiSwU89tSVEEoexUZNR0txfvDPsSwqNisDVRBZlM/woEHsP/fuQi2pSUOooVXBSvsFQ2yinFHiYmWhxnuVy+Qn+p9fmVaVvN70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=D6nZbSck; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="D6nZbSck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780584613; x=1781189413; i=markus.elfring@web.de;
	bh=wmrekNNU+BAo8JH1uJ1XmO25MRj1GsER/eV0HCibJwc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D6nZbSck5BVT+ee9GT0TgQ69Ecsl1NQvt71iI21OFfYsnsfUPuxR5lX6Xtisy+K9
	 jMzARjPV+NCElWueh66ClgIb9TZH6fBwASSmkvn5apOFowfs9e6g6GITfJW74Yppz
	 SFMGJ9Yf5jhG+q3lWwqouN7bS5gO21D75tSJX5mvSG5hZjHrwqmKr5vcw9wdsJnDb
	 UzEiMUe8ZtdEJTt2S/NUrpB6FLKUjXios7TpQBtq8H/P3cHOPP0Z035NQX4Qz/yMe
	 7CWl/j5MLdpWQIFRAvL+N1nJCQAPCqNFjZnQwm97Msm1dD1//wmMQm25R2rc73baM
	 YJJGgipx1ub6FwEZ1g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MXocY-1wlkTJ2hBs-00Px8X; Thu, 04
 Jun 2026 16:50:13 +0200
Message-ID: <03fe7a3c-3d59-4fd1-a125-2d11b2b5390f@web.de>
Date: Thu, 4 Jun 2026 16:50:11 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/3] LoongArch: Simplify data output in show_cpuinfo()
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
X-Provags-ID: V03:K1:QMmqniSq1UnYcZXZ8rYas71Sd6arxh3PcvhOIcyktsOekkXtFHw
 6FyOjyexUQkMuLrxTFo+jlwjyx+yDd0iMucy8hDI+tzcRiCGLQJZBcrS1Abn2awgSL3rkaS
 LR06vzX5HwK5ZxDCPCl/Jj3zjjrOrAhQ+2DCG1or1rC4xwe/QofephNO3UAcKQyKbEIHiDW
 Pp8mMFzzaKrmbFlmi7Kiw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/evoWkXqoAc=;iyLQ4PDRyZXeTV4LVhrcXIYTy/r
 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
 qGK5VWdkmMSElRwt0W4tfNr4jAd1nQVcy9ta3mO

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 16:02:59 +0200

Move the specification for a line break from a seq_puts() call
to a seq_printf() call.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/loongarch/kernel/proc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/proc.c b/arch/loongarch/kernel/proc.c
index d4ce5b585453..cc1b7a96bb0f 100644
=2D-- a/arch/loongarch/kernel/proc.c
+++ b/arch/loongarch/kernel/proc.c
@@ -94,9 +94,8 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " lbt_arm");
 	if (cpu_has_lbt_mips)
 		seq_puts(m, " lbt_mips");
-	seq_puts(m, "\n");
=20
-	seq_printf(m, "Hardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
+	seq_printf(m, "\nHardware Watchpoint\t: %s", str_yes_no(cpu_has_watch));
 	if (cpu_has_watch) {
 		seq_printf(m, ", iwatch count: %d, dwatch count: %d",
 		      cpu_data[n].watch_ireg_count, cpu_data[n].watch_dreg_count);
=2D-=20
2.54.0

