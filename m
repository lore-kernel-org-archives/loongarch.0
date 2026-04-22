Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0E5372EDB
	for <loongarch@lists.linux.dev>; Wed, 22 Apr 2026 07:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776843920; cv=none; b=L1SxkE9DiB2Fzd8vl1V6cYRAp8Z/Yqq0EcqupadcuCxaYnYNqpdzIoLuBuOTgM2+a1ZWVfnQfiZjIOIbmirgggsAK78i1sT2dW3hOHd8QxOKjbe4iQ8f88N/Jcu6CyC6ckHxo5xdEuOlCa/x91jmPxij2J4RvXK0wZEPEVlFaFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776843920; c=relaxed/simple;
	bh=9n+kGFDCUAI2oVsDOLiljIgRBuHErHdE5+lB1yJo880=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dfUgUQcWIFfrzI0tB9/Ta9OhiGxN1ShTe4jIccjQNb6oMXOjMeXm35VBiovO6VU+Tifjtemo/cBKPKzA7gTKDysdmr5CKV7OyLGHNKwYg6TX3h+ceITxHQK54B11b7PtU+plEnO34sV3g66+YPP/e6IPAN9GIYbVKDrpVJbIcI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UDXicEBt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8uLYcbIJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UDXicEBt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8uLYcbIJ"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776843915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fGZi1OfhYcx0jHsSgr3PB+M6Ux+Iq3Y6s/sdiIk3dcA=;
	b=UDXicEBtAL+yCmOf0LjykzyXxfiD38x7r1oK29v0s68UgqMQXbhNnboK3Vo/D8yprq32mi
	nq6Fdps7PXuDtAbHXRIgxsVqOa/87yFPuRKCZacJHNjTLlV4QqXuR4gnZAY3SkVcVM8ivA
	5TR/fzET4qb70t8OZ+70Az1d7DlHO60kSFtADBGNKVgM5Ua+Gtga34KabZssUpcN0H+4jV
	hxYzExLu5eWhtaXEvT2v5AVY66RwF5xWwEpG1iiZbyqwfRxiRBl+dDiIqOkqvcWxfNl0OX
	QsqXqninWFNz9ppW2rwVrdJLtZXxxZ7DbdVNthqvfBnGj9Qg5kjHmSVOWavpQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776843915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fGZi1OfhYcx0jHsSgr3PB+M6Ux+Iq3Y6s/sdiIk3dcA=;
	b=8uLYcbIJ5rnuaUUh/m4aolMSak0PgBYFOSefVJY06zYmuYqQ4x/GwuC9Rj8ng+OuRTb31Z
	0nrS++HxliVqWeBw==
Date: Wed, 22 Apr 2026 09:45:15 +0200
Subject: [PATCH] LoongArch: vDSO: Drop custom __arch_vdso_hres_capable()
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260422-vdso-loongarch-cleanup-v1-1-1fef08f07614@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAzAviI9W5hFFP2KeBhb1YJ0sqEIY393e
 AwkyZA4CieYmwyRH0kStELXNuAOqzuj+MpAhgbTE+HjU8AzBN1tdAe6k63eF/puYDPyRNWBGl+
 RN3n/8bKW8gEcrkIHaAAAAA==
X-Change-ID: 20260422-vdso-loongarch-cleanup-d16e07e92422
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776843915; l=1033;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=9n+kGFDCUAI2oVsDOLiljIgRBuHErHdE5+lB1yJo880=;
 b=1vS+RZWFoA2+xpt7wWgyhUDiitcXGjv1VxDqCuGfOLTYV1h44Wbs5mRro2dlxA+G5K291up7B
 Pv7zDMo+BQiAi3+jzYrKJTQCD9PDBfyLznO/AILcvZJ9nyo69oleSMm
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The custom definition is identical to the generic fallback one.

Remove it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/include/asm/vdso/gettimeofday.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/loongarch/include/asm/vdso/gettimeofday.h b/arch/loongarch/include/asm/vdso/gettimeofday.h
index bae76767c693..18ba403e1ed9 100644
--- a/arch/loongarch/include/asm/vdso/gettimeofday.h
+++ b/arch/loongarch/include/asm/vdso/gettimeofday.h
@@ -85,12 +85,6 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	return count;
 }
 
-static inline bool loongarch_vdso_hres_capable(void)
-{
-	return true;
-}
-#define __arch_vdso_hres_capable loongarch_vdso_hres_capable
-
 #endif /* CONFIG_GENERIC_GETTIMEOFDAY */
 
 #endif /* !__ASSEMBLER__ */

---
base-commit: 6596a02b207886e9e00bb0161c7fd59fea53c081
change-id: 20260422-vdso-loongarch-cleanup-d16e07e92422

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

