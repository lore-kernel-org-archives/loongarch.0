Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84471448E0
	for <loongarch@lists.linux.dev>; Thu,  9 Apr 2026 07:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775720140; cv=none; b=blMC3ftl6AxrU8PEXi1bd038D4TUf8We/yFoFPiYyxrUrdu+Mz92AomUBNlboMnGjyuhFDaY978BvQ7Ru3AUKgnLbkmbj95I6wj3pp3xypRrA6dWUCUDlI1eAe0AvtpNgT+frY8ONPPjoqKxV2v0HZNYUOz5YQvspQwxNnCldW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775720140; c=relaxed/simple;
	bh=QoWUvFtNoGUxS3RmYeNuSEVzvQ4/4HBC0CHrtc+H4tI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DluM7GeNbTUjFrfcvmBaswloxjND87lmCLZDKQajApx+ovrbvfD+F5RTVDzU3Nu+jwCRlWp/j/jquV3ZR+VPh7mpYpFr7hnLFITcnGBAES8cFOF4UcoU2B/9tqMH1RhHimx9bBHbX5+yPibz1nzOYToiWdcdW/uJahu+9QLyXNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=pass smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: esmtpsz11t1775720111t6523f6dc
X-QQ-Originating-IP: gBnlYnR4IOzJcN0IjyWtfmQG/upQKBUk2LOFPj/O8jI=
Received: from arch ( [175.11.89.206])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 09 Apr 2026 15:35:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9876962171585567140
From: Luo Qiu <luoqiu@kylinsec.com.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] loongarch: stackprotector: Use get_random_canary() for stack canary init
Date: Thu,  9 Apr 2026 15:33:56 +0800
Message-ID: <599CB656808E9EE5+20260409073356.1476812-1-luoqiu@kylinsec.com.cn>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OPHbpUvlYj5kHki3B3Zvox6keez6w+wbD+GQzJpSgIrGUfRI0n9OFaRS
	cZaZDIsKTkpajp+ox0Won2w4c1Nzba2+FRCQtWu4Fp5fq6iDdFbTsdKYPUgllKmfEIAbt1Q
	joIserbyTfReAKFRNcr4gbngAw5ZYn8NjDhTQXtuPW8nAzSzyJ1zxZN1Lz6RzbKUuvUUGTq
	aUDPQnquxA4yoQCP3aXKhDAEe2Iz5fTCZyZNGb6+fLWiH6eiVEB6r/DHM0hiRllzHyVDwsr
	KRolCicKiXqeyPoDU3hl3ctXi/AzgLGoX/stJ7ExKCBNd1g/3X/Lvcxyf9hD44js3LlmKt5
	NZ1uLJnOLAP02Zbu1Tay+NGWEMOONR7tKMuY/GpxDkHOlMxw0aAgOoZXgcFNlNzh90sHyI3
	EmITKbykUNJZY0/gljHLlhS77dUrVln+gw0+LfFzOdTb4vTY61mUUUebGhT8mAtvrcr6QzC
	mMGKZbASxzQs+bAs1cSlD2nlgx1O7CkhdPo8aZjcWZvPLhtvdbTX9VVGi0wCypxkPX15Cjj
	RXC61nYFtPdl+ByOnrQV9d8GlfhKUJ6omuXSSa5OxJU7ynbckZ7Nt4O+pQp9pkSUwFmmUcT
	hpoLRzRAzpCxXalQJFq+ogeMy1o9RW2c4kyj/sTmxjRcciggTzphXSzWCALlmHzi0Jt/Jmq
	AYsy0uKzFekrh7bkECgIquDDYqgy3rIhlIw8wIB4FFPXXedCr9cplk0rNwFz+t+vTwHbwrK
	wmhySsDUrZC1FDhB16Yex0sbaengncMSr81A6l9UzU8Ims/L3PAGkZIVM8AtXFpvtqyLcQp
	2YnY4wbb8Wb1ushdFNkhoCqU6tZVzjAsY7gedzy+7HPNWe/GCSjH3ZxVB5HFwkDq75rhawQ
	P2V0C0tcD5ei81JIkyqRnhy31KkM0WP2T2Bp9MRa5t9FLp44kv13TJSwFlghdWfziZ+8K+t
	4yWivkqMhY7gS2m7Gh7n0VQa6DYQMM7q6ttnUkE8SSFPcVQTapLxskN3l/3WK6U4Is3gEMM
	/oQrQp73wv7Ks2XSZE
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

Replace the custom stack canary initialization with the
get_random_canary() helper, following the pattern established in commit
622754e84b10 ("stackprotector: actually use get_random_canary()").

Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
---
 arch/loongarch/include/asm/stackprotector.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/loongarch/include/asm/stackprotector.h b/arch/loongarch/include/asm/stackprotector.h
index a1a965751a7b..42f6c3f69115 100644
--- a/arch/loongarch/include/asm/stackprotector.h
+++ b/arch/loongarch/include/asm/stackprotector.h
@@ -12,9 +12,6 @@
 #ifndef _ASM_STACKPROTECTOR_H
 #define _ASM_STACKPROTECTOR_H
 
-#include <linux/random.h>
-#include <linux/version.h>
-
 extern unsigned long __stack_chk_guard;
 
 /*
@@ -25,11 +22,7 @@ extern unsigned long __stack_chk_guard;
  */
 static __always_inline void boot_init_stack_canary(void)
 {
-	unsigned long canary;
-
-	/* Try to get a semi random initial value. */
-	get_random_bytes(&canary, sizeof(canary));
-	canary ^= LINUX_VERSION_CODE;
+	unsigned long canary = get_random_canary();
 
 	current->stack_canary = canary;
 	__stack_chk_guard = current->stack_canary;
-- 
2.53.0

