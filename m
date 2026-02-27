Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6B138A71C
	for <loongarch@lists.linux.dev>; Fri, 27 Feb 2026 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772174686; cv=none; b=s4JDStKVtyPSdSildx9Y1+iTjaz7wni+O/V6PdWFxfsobysgEICpGXfPP57Vn6S7KurvEU+K24FUvuvyyf10uHvPprF1AQYa6UUq2GSNTGcHoblDkO1KpKMGaIoLGtmvp1HPnLGYhLjy/r9cosnUYhb5ThLLMw3+PkW3wzE61WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772174686; c=relaxed/simple;
	bh=ZA1UJGWYD01ZyfFBKenlmw61nBxgQh2zO5BzGQCW3/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QJ1JQTFt4DprgMAgt4pUtteU6+zedTJJwO5Wi8t85EpZPFBPlQxEQThz5CCX0M51QzAwyMp0/kZN4qOcPfPiKltm8dSX7AFUSp48XhOmarEaDeryKr3paBvCS0JjmeuQzIEzcqKy3NVyZ/DRs+yS+m3hOJ6SEmWwP3IdGJdI7LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gPO8bsbX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0rOwespI; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gPO8bsbX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0rOwespI"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSXoXgD5yJIajfhr67akWUt2bY9n+zCrk3h+dssSjCs=;
	b=gPO8bsbX2j5pl3+0WQBzSu5zAII6ivXIaw3RktNv3T1snJK//8ViSgk/FSVD2hDd9j9ysr
	B1bxTes2qn5R8L8xhfroQPEX0VodOvldUO+LVdBsZicSmZa12+RGDjsLD9JPo958FuRs4y
	6M6W0ge8+QlTDN2RH6H9ukvja4fuMAzRy26PjhpXHIbaLdNp18SeKsmRGreMp8iDrjtZ36
	6i05guUb3fVT412K/F0xnCSROVcDIJTmtb7cUtBQ8StdKxS1XL7cjPhG66PITQLrTgyKJF
	tguXygrmdxrfub6WJZgsrnnzewChBThOMRXJldwUCXzPOA5Ug8ESwSGC1NaunA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSXoXgD5yJIajfhr67akWUt2bY9n+zCrk3h+dssSjCs=;
	b=0rOwespIHMPRabYF7luWoTUNp23NVUZgYhbSHbaf/sHV/Zu6ERaXcTcrIs+1kdBlWfCM6b
	VfBKdZcuOKz/V4Cg==
Date: Fri, 27 Feb 2026 07:44:30 +0100
Subject: [PATCH v2 04/15] powerpc/vdso/gettimeofday: Explicitly include
 vdso/time32.h
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-4-35d60acf7410@linutronix.de>
References: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
In-Reply-To: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=856;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZA1UJGWYD01ZyfFBKenlmw61nBxgQh2zO5BzGQCW3/I=;
 b=1TEGpURP99ld8FLPX/3v0rsq45TqqBc12m+p2OErKaencbWyxel0L2MdRiIfvqBXpvSVx4KLS
 hm7MSWrtG0yBi015CNXoPonMQtaW526wKMGNITtIy89L9oupjEmAtlG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The usage of 'struct old_timespec32' requires vdso/time32.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index 8ea397e26ad0..a853f853da6c 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -8,6 +8,7 @@
 #include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <uapi/linux/time.h>
+#include <vdso/time32.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1
 

-- 
2.53.0

