Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0AD29E108
	for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845211; cv=none; b=gVccwe//kL3cRha1s7k/yN20iNUYK+iD7SbC18X7EoN3v0uQVugn/GhN0SfmdFC2gq5aCGSrTTua/H6/W5GJ7sKAmFcllk/ruoeEFDTiNCEPTPMWvpkbyCdj7nVyyCgX2ASD+0TrUeI4GP9GLp2KZMawWcb+Banv5/WdeEE9M4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845211; c=relaxed/simple;
	bh=lhF1+oDAAfZTQLsvxX1VmCxIOVKQmNCDXyIFJsn0eiM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uihtDvAPlJbOmaGjJ8ivtaq7ga/RM7XYZBsb4fYQzSFUo3N6+xYcHe7EDEVKMKgAVMTb4ldshPmOOiYHAVCoqx7sc4jTehjpH58IK8/AcS8DoJu7/TgndIvXqtSISQyGuske1fjrMUVpBdm+QZBktCinKB8wTx943T0RqbQctUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sp8ftVyR; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sp8ftVyR"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32b49ac6431so12065411fa.1
        for <loongarch@lists.linux.dev>; Wed, 25 Jun 2025 02:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845208; x=1751450008; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNdRW1IbQwaJLK3IU9ZGilulsvtFwP6FJhql802bOZE=;
        b=Sp8ftVyRLTI2hvAbKlWpzChDIegTjM79HphJp579I3fQ9wpgMj7Aqo+ECqJ40OhXww
         H6qTY7zsjI6QFkTRf1X21t9voD18lQNyPi37MrmlVgQasWG4yJ+VvoM9Fvu/+PCkMcAF
         6Dr/t66AKkULipVpOf735zNza8bnggJLKqBiBaCe4f5/1gg4zUrA4nC3cGny9tdS4K/j
         VhBYteCDH2e6pppBewbg6gC8isvato1ogDAKQ6Yhj3VcIHaNRo4NLovlNpPm5DiPQG5V
         +Rp500DAzpJV5tgp+eoRIDEVMbZxeoe5WqCVi6W2cHPsxH1agKViJoHjeV8qVkv8mkQK
         rXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845208; x=1751450008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNdRW1IbQwaJLK3IU9ZGilulsvtFwP6FJhql802bOZE=;
        b=w0PKu9qgQGMqBw+khoVminxSXtTzMgbHbkyEWyS1JYw2RAKkKCA/f4C8jncmUp0eu4
         zbpX4iIZcbHctF62Vq0Vo2ib8M7WXnoqeZT7jMFXrjRe1S5+g2ELtAebg1B/wR2u2hBg
         P4FIt8YfTPgLAwUijqiNeLHJWFqIozVQvSqSZZ6LoTTvgurf6ZRcLJGMVj6OoiPcFX83
         90WAI9KaTTGKGgCKl4b5RNZ9uXWL7fjZXkee6Iu3G8HiZzPbMQH3LYsxf9SzVTIx8DmB
         ZLSzgSKXwxBvB+23/J6NoHbYzSjofCVr7jPPpRLIN3EPCAvPMqK2Ulh7pkjdL+Kd1rC3
         rxkg==
X-Forwarded-Encrypted: i=1; AJvYcCWFwbSWFsqIbOTZGVYqWf2Pu1w6cXlE44IcbYKpiSLf3E4kkwt7DN8NXaB1o2X4XeMnJtMKwOdvbCE=@lists.linux.dev
X-Gm-Message-State: AOJu0YycnwS23RfO2IuCJV1Usstaad54zbx81vMygWHTvVJABAWfmts0
	HhhS339/E6rA4ubXlszLGw9nPsDyfqbhZlhGjkMZOI47Jlmv0psr80Fd
X-Gm-Gg: ASbGnctPDB8btzRpgazcbB3qtraq8bvLDQys90lOd6tU6bxhJrqcyU66UhiHeAVeMMh
	92cjk0rrNBecV49Dua57pXQZ3tnEoefIQHatobkJO/ICMTVPBS61uY+eryomX0uxymzJmAUcDcz
	Og6428fji1aL3KzxJermj3VszJYoN6E7b3ABHVBoTls3rzFjvcXthRxoER+H+cqjk1P8Vlczhcr
	gJJ/kmXzvBId7nAo7ErfHolAZNImV2KD04rfWYqNZLRZnuYP5TTBs55efjqPNSuAV57+aBK7+xI
	GqDBpn7J8KXxGZXscWyR7hSsAClPQiK8cYfQhHDqi+4lBZ7P1Ue5hq5m80v9B9eCF2Ui3DnpIYT
	/D1SL9LTP0QJ6p7fO/bVnLE+hdJlQhw==
X-Google-Smtp-Source: AGHT+IEEyG7BglU4Us5Yezwlbfk1A7iCiSut02wYI0QnYJbbPrBalxPgrrZo+Iohs0E8JQ9l3Ex35w==
X-Received: by 2002:a05:651c:31cf:b0:32b:33c7:e0c9 with SMTP id 38308e7fff4ca-32cc64b7c27mr7419481fa.16.1750845207836;
        Wed, 25 Jun 2025 02:53:27 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:27 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 7/9] kasan/x86: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:22 +0500
Message-Id: <20250625095224.118679-8-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625095224.118679-1-snovitoll@gmail.com>
References: <20250625095224.118679-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which enables the static flag
to mark generic KASAN initialized, otherwise it's an inline stub.
Also prints the banner from the single place.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/x86/mm/kasan_init_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 0539efd0d21..998b6010d6d 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -451,5 +451,5 @@ void __init kasan_init(void)
 	__flush_tlb_all();
 
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
-- 
2.34.1

