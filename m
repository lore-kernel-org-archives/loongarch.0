Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EA52E4247
	for <loongarch@lists.linux.dev>; Tue, 28 Apr 2026 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777362688; cv=none; b=fIlvYZ/qutgL/wWWSMTEOBKe10sFXqK94bh6NCFQkDbIPqAOzmLiZYn6652Ryc0zoKGy7ecJW+ObTm6/em9vL20s0pTYuSM7XkreJgf4lv+yEDslh13pMvRZ+c9pv9YI6Lq71Qa/lD5y4Cm9jUcv9nOyBh3wivADtVZRIfX1KrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777362688; c=relaxed/simple;
	bh=TSG/mjg3OQcnYnI66O8M617HmP1F7TtHf5BKtqlnZe4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t4cWuUVxZlyKy/fmhLLjTESlR26g1h+tfpfHd4Law8vRJ19hTQxJqQcLhBm2QWoUCwfggdTSt+CO27EUZ35bIu3DzBipMi/oR/nz5RxjtbEWwnQjSxTDPm5ehWy1Ej++zgNmBb8uffyRJE/29QxdzdWsTWfduMNA6Pwqbrn1CME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=LHTueoHJ; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="LHTueoHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777362671;
	bh=esn1w1xSuPNActXQjBbdDcYEH/LV+nrYtog8alya+CA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=LHTueoHJvi7ZKEQXdXrppinwSMqcG2o1ZMo9MBq7h/YGN9MujSxi4OWy8K2HOujhN
	 tyOd+puuVgQB1VxYoe5VQU3pyHZctlfax4IhFslIqcDLjD4atF2vWXmy2srIHjCj+m
	 nof8sfmkTpA/KkLP5js2YCQ61//lp57+/d0wIXPA=
X-QQ-mid: zesmtpsz4t1777362655t4d017ead
X-QQ-Originating-IP: Ic05fLQQzXVJSzSVXJmq643gJO/9aqC81XiTfC1stoc=
Received: from localhost.localdomain ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Apr 2026 15:50:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9375297750607630471
EX-QQ-RecipientCnt: 5
From: Qiang Ma <maqianga@uniontech.com>
To: chenhuacai@kernel.org,
	kernel@xen0n.name
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Qiang Ma <maqianga@uniontech.com>
Subject: [PATCH] LoongArch: Remove the definition of cpu_has_perf
Date: Tue, 28 Apr 2026 15:50:50 +0800
Message-Id: <20260428075050.2280852-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N0Y11OQjfoyD5bZ7i9VPla2n/a6yUte5LiTUuXYkqgMwI1GCAHn8Nx3D
	SWCycpYQRwjI4kt9zt58QBqKZO74CHblWVRjxQr6+6eV4AGfw4bb4d8c3QiotHbxP2h8w5x
	St10/ryrQRSA7nNWzKlvc7Fdmx/TMAQkzvQQO3y/mSmK9m0tr6jtX9S/2jLpurfyRmbCADK
	9MfNRGyPZ7pFpbYPJGdUvQx6szLG0nsJSWlQFhSv8U+mPlkNrhuyQlRDhz8gOkdaklICDY1
	hKbp4HHq29Ir1FJS4VrAlOATjd6rVLfWNvVTbpJn0QJu0aPH22b+g4IvohYoDzfsNi7Vzk8
	eD7WKwNUlAumViGt1knPq7Jl2g7XirJ4lS20AUmi6s3nRnaqwPcdKXcW4xjJLL8Hxp7XP1+
	97gySFKwhImjQV4F9+bIGlPsk+PQApDJHqKsp3UQ5e2F8O/Yd7oJaqM9YZNbHM5KlY9dsYd
	k7UFnBC0QSRsuPIDqfDfCFEV9YDvGVrvHJjprOCYzpn8DuZTLVa9Ub//pJtJA3qgnIV8BTP
	3mBq71hi9myZ2WWOHgRYGcnupQDzJIEk6Y62X0OnogEUEjopigpEUJWQw/PZJfxD9sXfWM7
	MFrCvCmVBCRr5xNbx02U9C4pMDeAN7ajpRVZ9u3Ljsc6rJQdlPpT4YBaO4ea7TMnZQKwKWf
	rHHiNkT+PJgZD5jxy15LqunrhiohpodlsstYMC/oUhqEtq/nLVZm9GfFS7p16RnCz0kCr7w
	NhhRgQBcneo3y01aCpjQqTWvkjyXck7RTV9dZsc0uAgUepMz8EXlw8Ob25i59IQNlCyz/qj
	E9mik8fwqL2p+ykNEuI0Eq5JoQSirgDsSno3pjm+CB2iJ9NuBPW0h1pbF0CCC0NLJgoIEzZ
	mQDQDnw1By6BQ948vRMW2fdLdqKw0fh5ayvmgqNdfIim0hnoifeeATtoA9Ct459NMkYqDMx
	LSQR4xQObswTqrEXF4RIVjCuquKfbIsj/LLGUtz/mOdYFIF3/C3usFxp0PlgbR+pwjUDsQP
	r4UItTvf1BCedAZSXSYbyrsm3Crovk7DsPcwq0vj3YkLU1swjLMCp7UdQztoneQnmGRY5xN
	g==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

The "cpu_has_perf" has not been used, so, remove it.

Fixes: f2ac457a6138 ("LoongArch: Add CPU definition headers")

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 arch/loongarch/include/asm/cpu-features.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/include/asm/cpu-features.h b/arch/loongarch/include/asm/cpu-features.h
index 62059c5551b9..fa549b7b0626 100644
--- a/arch/loongarch/include/asm/cpu-features.h
+++ b/arch/loongarch/include/asm/cpu-features.h
@@ -58,7 +58,6 @@
 #define cpu_has_extioi		cpu_opt(LOONGARCH_CPU_EXTIOI)
 #define cpu_has_prefetch	cpu_opt(LOONGARCH_CPU_PREFETCH)
 #define cpu_has_pmp		cpu_opt(LOONGARCH_CPU_PMP)
-#define cpu_has_perf		cpu_opt(LOONGARCH_CPU_PMP)
 #define cpu_has_scalefreq	cpu_opt(LOONGARCH_CPU_SCALEFREQ)
 #define cpu_has_flatmode	cpu_opt(LOONGARCH_CPU_FLATMODE)
 #define cpu_has_eiodecode	cpu_opt(LOONGARCH_CPU_EIODECODE)
-- 
2.20.1

