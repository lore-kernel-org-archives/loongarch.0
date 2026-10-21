Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571556;
	b=GTD4qOqufSDOYkKke9phgqni4nLCstlXNaeIAARLw3Td29XTOMGdKk5JAHKlxo9UIWP5
	 Mo741mWXIYssbavAy/Voj6mfL0CEw4s69DPb1KybFNq5KeMr8+5ynfJSsA7OQjGl8qDWH
	 rGgmgO8oj+i7WWUBFMRDv2iQD+9lPWt84d73yMYqiyto9yvBbrY460L/EZfZDZASFqygO
	 ZQbcRQnyR/QkvAcZpNi7GZHnrt013SinaupMByw8sbs5Ed2YQ3UNiE3moTegLmgWn85qn
	 IOaeQ2CzN0ClyfaZUXDDU0RhgwYclu4EFQZX57VqKoEDOmd50fzT1u60tU2ZaUDrblQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
	b=XOfal2M5txusW46dMCIX71zSyYRZIoFJHkYTrKYYyk1lI9CJ42IdybTXLf+ZLCHCPXJA
	 N45YNvg30mr9bHnDMht35Nu66u0flpwGbfL6kQsqP+kdzxDeLca7+tsTDY09x0E1cJWX8
	 4WvwNdoDy0W2VIq761DMrnO78uTqc5WE7GThqTj96oAFqAhJA3hb+E2hIVIapmvDL6/qu
	 8nin3ZUEYn4/JkzdHHt65uC/CpKJ8y1XkzkImZMlp5aYDVZdZ52Fovm7JwFYrl1VWyVeI
	 BOIV5Omfe5htOZqYbZuIgVR2qPa5GjctpXLiGn5x2LvFbPIzSCFatcUh02Oga86bpLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bc8ZhHVu;
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35E2606A31B
	for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 08:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A35E2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bc8ZhHVu
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cd66d7e32baso44507a12.0
        for <loongarch@lists.linux.dev>; Wed, 21 Oct 2026 01:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571555; x=1793176355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=bc8ZhHVua1M5CQ73QCiRBB0i3DOOLo6vRVKPaPQ1I4If3jejdRmgPd7aRtxM4By9Bw
         IyrrJQsXbv0dADCeOxU7rDrST3L+YhJa6GfoO9yxqjpTjk4dfiekwsnox8v6KUnqyWA5
         qO01zX8xTJ2J4b9RSLyLRfwEBWFq9TisIhiehmj5Nkuc90fxOJ5FdrRStTRTYBbkLz49
         jVu+Z/qvlcYtKikDoMp3rLl/VriolzrWBdRskRh7M43i7O6kQIz2c45OdEfR21BifD/C
         6Vp776pe8QGEpoVRiXJ/48EOI/N6GcmyspcH436pugwsceBFDk064WnqROMoTivH2DhH
         9Z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571555; x=1793176355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKmXp2d3TpfvxuGqVqHnwKm3WEcWPeyk8O3QNAPgerw=;
        b=DzEcOnxHCHD5eihCgy3QgNAYtMZgYMfixLwyELqV5DXTrd0BW8agNieGwRmyOW8M9l
         b4mke56NVBJht30CKj7G0qXzed9H6RopxtcMQCKcHjUTvcP6qVFbgEDp5255mePUJtCz
         HT31x1JUq7TZsEAVtmUFOqX7got1YmpTMIj7vf+2syI5X13jmOWfGEVjjndUHeFFMZ2g
         5GpgrVroD5PRyOwRn3v+GmWMz1xbZx0M8BVFXZUEaOofZU7fOcVS76FCUXCnhLx8SXvo
         PNB/kguUGQKw8sMvBEt5Qap4RnZRK5sE8jj1vf9UfhxEHCrmpA37l3pdFD8Ck0119HWT
         xiKg==
X-Forwarded-Encrypted: i=1; AKwUvBwMmj9r9UBIkluvguNd0e+zpEFXkw+r1LPX/ClWsR27ehh7AitYy70z8qrPPN3OR7Km8jMoTBa0ydc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJWyh1EC/n9fo9AiLv1rrBZG0twmF+cZ0EkV7VRn0phfWcPHWx7
	+xkvV5W9gUzN29+wRoThQb1QO30Uz57yWHA1qLsCUHMe6DdvKhi+VeQg
X-Gm-Gg: AYBFou0xejzycVa/MVhur4aKELgexRTBHYyKc95sVakjd94w0BxXsXlaP21TMKQ5A73
	dK64C4tusXhcnHGve7Pw/uw0BpsmHzVPstJ/gieUCsgKuA0c5p1B10tdEuxYblFnL1X+B9RO5FE
	+VcS+wIeu4mXxdgqriTCuW6uqRHr7RC2Pk9kK2FZVTXzRSjTSNuH7PvKSgFE41aYrbzQ7fRGU0V
	fKylLLVDdZMGK39t6zypTE5nZwPy7cWEgWXUo6BJFuRhJqXAz9B2Z8z+hl+ePLs46MVgRGvidqB
	5Z/YzQPpRAacqZokavppZZR2qyDQKDwPFCeKYwmtMy2lIsuS749HjzgLpti+eAx5Ft3wJgKGv5E
	V0KzShNBGzNpGZauo3hTEGtbbet3PCmeDFs80V/AOuHqLX3dbF+w4AK+9QlAmMVeXPCtDLGkF9J
	Nu8EXHbhvDZJGMW5RlLASuH0Rc0K4zPEq+LyfhEYsKswMXHCMsleauW62Sff8msjDx7VXcbT4a+
	MtXD0dkz8pBL9XZg/YOvB7URAK1csmpHvDf7cQpKflgip+Bwctixxwr3r+3Aav8ZqsQ
X-Received: by 2002:a05:6a00:1786:b0:89f:3f60:cd81 with SMTP id d2e1a72fcca58-8a089d539cdmr1130152b3a.51.1792571555108;
        Wed, 21 Oct 2026 01:32:35 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:32:33 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v9 8/8] crash_core: skip MEMBLOCK_NODUMP regions when building vmcore ELF header
Date: Wed, 21 Oct 2026 16:30:11 +0800
Message-ID: <20261021083011.2170525-9-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
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

From: Wandun Chen <chenwandun@lixiang.com>

Reserve regions (for GPU, DSP, ...) carry no data useful for crash
analysis. Exclude MEMBLOCK_NODUMP regions from the vmcore ELF header to
reduce vmcore size and capture time. crash_should_skip_region() now also
returns true for MEMBLOCK_NODUMP.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Baoquan He <baoquan.he@linux.dev>
---
 kernel/crash_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index e161c8b65e00..0e2ddc933b22 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -283,10 +283,10 @@ static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
 }
 
 #ifdef CONFIG_ARCH_KEEP_MEMBLOCK
-/* Exclude NOMAP regions from the vmcore. */
+/* Exclude NOMAP and NODUMP regions from the vmcore. */
 static bool crash_should_skip_region(struct memblock_region *reg)
 {
-	return memblock_is_nomap(reg);
+	return memblock_is_nomap(reg) || memblock_is_nodump(reg);
 }
 
 unsigned int __weak arch_get_system_nr_ranges(void)
-- 
2.43.0

