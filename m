Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428452;
	b=qSDLZPn94YgvgpmKua7nehyVKCd4o2jvTDT7NV1Ke+rPtbZ+6uDnEJw8hTKnYxW/pWB0
	 Q9Cxq+uFiDXJ6aSsXphLO+HP4sO/Cv4gC1JWDhpIu5bGUz+w9izZTN/Ksaxl6kM7PJpEE
	 Q6eFWuKWEVx+VijaolFrEvLvVnnGP9G4djvtrBxZDT4s90pgvSZJGJEwCG3Di6Z/qO5Fq
	 25PGT0JBgUKNXAaf1cRX2ZjMVJb9KUHPq+zSm6uMNPCwbDSpMH4nyD2AL9ZBCH3ICNH3y
	 lCMt0pijz3b4KbhTEzmWm4zMDQZKb5g24Mti8zi7LlRjBv42ilR0RGubcNgQoiPiWqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YNXr1cJRDxjFRtGHo1Yw8wGLJl2y+mtXfW9P9FUgeCE=;
	b=JXG79rHbcvE/V536hPheytEZGiBI6bJIy32aS9lPMZ+29joyLDeZkvnTZ4ptavynpFm3
	 3o5oAjvPHh8sQh1BYzALNM9NIK/AcNki50Btg1RjMfFp+a1qBkKGGqAj2XdB21FWbhujq
	 MX6biI2H9HXiKJrwPg5yAjRrG7AEW8M7ONxl9z64er/yEkjcB9JgpgvMJpKa1YEG0BaFE
	 /snAjz3ENbH4T8m1c/zj8Qllxnuy+Ld6UQ6jdFuxN1l0X8Bg0v/2R+bsDgRrPv/3ykV9K
	 LIrzgugaSXCd5yDA2uxd/K2yUU22BBdbeFbgMKjk8/QjdYYTztyJVtKFPdRa/r5ksKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vLnWJXsC;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B6B606A31A
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 10:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B6B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vLnWJXsC
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2869791c88.1
        for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 02:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795428451; x=1796033251; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNXr1cJRDxjFRtGHo1Yw8wGLJl2y+mtXfW9P9FUgeCE=;
        b=vLnWJXsCNISrtigDKVDYfqxJ+fvpnpdYnRxJGzoVwtTa2KX0oWfug8ueCi3ieR2Or+
         SsbcAF8ug7+SesJMFf0tnS5l03T3vk1ZphSPHu4BuaJyGR6vOTATbsRllr4IaYuMMlW5
         iHwFDznyFJWSjUmEcuifTE13Xm5utX9gwpfuXgip0gKCzZvO3/oK8WMb4F3QXL53Y1IP
         oa6nziTV0U72P91iggMO+e74ko+zwj3jGFSs4nJUqUDhWdfUEEQCtaE3o6KtYMHI6zNQ
         ietwQzyc295pq1wKPAYBXE5g2cOK4CsyB5kMDqgdCreMMKN25rkemrXFVj2mAOpVeubX
         ht6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428451; x=1796033251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNXr1cJRDxjFRtGHo1Yw8wGLJl2y+mtXfW9P9FUgeCE=;
        b=EZ+9ryPPC06ozPmn8wnHuMJB//vlr2EHlQfR3TRQQytjD9rPvrQmbkcgxQ1nfxGL34
         vEMMoWwdcveliKRErIFwSxavmiKbgRBN8rpbIFnhNKXa0xyzh1iuZJ2DXKrgkrd//5RH
         vG8xv47rqWKxM+LjMnIj3TAnHYaWnIQ0B22/zjSF78yu6Skx15R+kvbLN33QbChd4q8k
         2czTiI5pq7xsHpBRCHsw1VLeEs4WxadLVYRXasvLvZ+64hgc91K8yeRaK9nLKdgAhuCr
         H9XN/XpFaFscdhAlE1DyhfsSToVgPL7sb9Bnrq3VXISKzcP2cFCow9mTFyFJdqgQ5n7B
         rYjA==
X-Forwarded-Encrypted: i=1; AL+hErE6JVaZBpDZXmbj8SCs1D3NpQQXfHtvJ8Np7XRoCZB8fx+rbRTr8eGxEEm5VHwJSqKEEXs7sZFcUPw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+O3SBAy1jpfVT10HQc5gBrbKIkKGO6UPBfaOL+BCTvRgPOzsHS
	hZ8QB8AhgpOSexJgtrmLvcJyZFLWlKAAZIxcdrk0ufBfxWgZapPI3OlW
X-Gm-Gg: AZFdTZeuV4kiDEMTkSvHruzMUWcpbY4BXB3mdDwRN5OKErV8MJ8X015sY8PAr7fm3ey
	2QfxmtkqnDHtyHoh2Q62JK7q8viJD5eSHbtw8AjLHZJgpzg/hgZLZk9aHLX5epjg4Ioz5Jlp8Tq
	kzuZ6Nr1V+5oV8K4IcRaxXO4562TT/ajd9Id3/4mlfHlfecxQBvGJyvBNlz8aDOWCPfpyYdnw5f
	kR7xzqMpvfK99ilEiDijxYaTpFcm8Kl+HBzC20xpog8QF+bZS4pGpzjdncyhHBpDpBaYoUsgoK3
	I6o7Z9Va1qjG4zJLXJn5Jl6v61Ji2MyvyHYmDYVRLU8+phuyvnKrgf7qCxdmPqSHGS/ORzgxxJM
	oHVqBSNMsms8pidB/mXkFJVVzT92nINY8+4BtgfoaOTTML218xwoyw1k/dmwiUztwikjFktWh1U
	eLlKejHNe9a2ntdnLiAbrulpCcYNiQCxRdo8On8mz/yF2rNaT06PsU7yGRKPx7Y7Mm+FQSf2BIu
	e2Y50Egt++JXz81mxdV+ydqVH+xor8u8mU+r68r4/G2KvH1rr1QfbdUF9/wP6UhpDd5ZHzJFcdw
	uoHV53H+nQD7mDW2YqtCckzdMwElfnmxlZVym7/MaA==
X-Received: by 2002:a05:7022:ea8d:b0:1ae:59d6:91d7 with SMTP id a92af1059eb24-1b5568eebafmr10409997c88.40.1795428450986;
        Mon, 23 Nov 2026 02:07:30 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm37650054eec.21.2026.11.23.02.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:07:30 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Song Gao <gaosong@loongson.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] MAINTAINERS: Add the LoongArch KVM selftests directory
Date: Mon, 23 Nov 2026 15:37:00 +0530
Message-ID: <20261123100701.1679376-2-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123100701.1679376-1-gokul02k@gmail.com>
References: <20261123100701.1679376-1-gokul02k@gmail.com>
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

The KVM/LoongArch entry covers tools/testing/selftests/kvm/*/loongarch/
and lib/loongarch/, but not tools/testing/selftests/kvm/loongarch/,
where the tests themselves live. The */loongarch/ pattern needs a
directory between kvm/ and loongarch/, so it does not match it.

As a result get_maintainer.pl omits the LoongArch KVM maintainers and
loongarch@lists.linux.dev for patches to those tests. arm64, riscv, s390
and x86 each list both forms.

Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..fed2245b979f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14327,6 +14327,7 @@ F:	arch/loongarch/include/uapi/asm/kvm*
 F:	arch/loongarch/kvm/
 F:	tools/testing/selftests/kvm/*/loongarch/
 F:	tools/testing/selftests/kvm/lib/loongarch/
+F:	tools/testing/selftests/kvm/loongarch/
 
 KERNEL VIRTUAL MACHINE FOR MIPS (KVM/mips)
 M:	Huacai Chen <chenhuacai@kernel.org>
-- 
2.54.0


