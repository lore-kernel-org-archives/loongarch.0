Received: from mail-m49211.qiye.163.com (mail-m49211.qiye.163.com [45.254.49.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43982E4271
	for <loongarch@lists.linux.dev>; Fri, 25 Jul 2025 10:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753440107; cv=none; b=UiQ+svZmnAUq0LRiQjeYeeANA+YDJSzDA5C/FX2/ZLUpvQhC+DEVTBlAV0tMPq+ut1G9+zdNGdWcdXGirHgkFw5ftrdzLjX9r448i3wRsKtjMUAwm1gozFG2tRSVFLrAPdpTRGckeNz8zDdwJgC0cVw2GUeN4MX8OQl9ZQONJxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753440107; c=relaxed/simple;
	bh=1vbxAAExUSchHvlLUOW5iVTIwrqOEjIPtieLi0+jq0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1Q7vA12vVlqs9PsY+gR+X258sEBs5NmhUxV6RPfGSOnnGvUHtJV67lry7CNBIHmsLkNo60RYUehOAApjfS6eXaHUp0iZ99KbXcL745SCT9OHe0cj4X2JoJCe86wxITU+iCkF73Itr58FaSUeT79OwRvgF6Jn8gWhg8zHwMmNMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=cwS8hPRY; arc=none smtp.client-ip=45.254.49.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="cwS8hPRY"
Received: from fedora (unknown [123.149.0.135])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d429d39f;
	Fri, 25 Jul 2025 18:36:25 +0800 (GMT+08:00)
From: Yanteng Si <siyanteng@cqsoftware.com.cn>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	yijun@loongson.cn,
	loongarch@lists.linux.dev,
	Yanteng Si <siyanteng@cqsoftware.com.cn>
Subject: [PATCH] LoongArch: CSR: Complete KSave registers definition
Date: Fri, 25 Jul 2025 18:36:24 +0800
Message-ID: <20250725103624.69247-1-siyanteng@cqsoftware.com.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a984127d2e809d0kunmccdf28922da9f2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCH05IVkMZSkpPTkoeS08fTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVSk9CVUtVSkhOWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=cwS8hPRYGzTKo68BJ7be28z3rT5NUZeegN64VB1ezDiUIo8zgqkumfXAfMtdQ8g8RyUSpK7y7wk7wnSZo30SvhgCR2Y9TfDl0MU9yNRl5K1uNmG1zmLNU48p9fJezf/NWkjng0bqphz45Wwko5O3A0WLTED+Tdj6/xMcGjHD+Jk=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=9xywI/IMePEKsyHKYKjIdD9k1xyFW2wD3nF7u9KR9Nc=;
	h=date:mime-version:subject:message-id:from;
X-HMAIL-Slblob-Mailprops: v1_kTakW7JjryuX/AmUDtQem47Z52fK+j1LWbpW6afoOeN+YgjM11cnKSwn63sNx7clOjSwjl1DVFF5GhG9Lx3EtUUhpOl9T77/vr5tACyOmzkY83QAFrGlDU9NsVDCfwV5g3jwwLMLA8qQ6ZQ0VO4fqm85P5Pxed5jzjuwXLBHqQtlwKQa53b/O6Sa0nWv6+kAq+e9rhynN7B/1U0mpsVhZANe1ZTKbJBrMP3BAWa79oFKEPymWUee/bdIZF6VFLRBNWqpL0EGYts4XITP3E+IsA==

According to the "LoongArch Reference Manual Volume 1: Basic
Architecture", the KSave registers (SAVE0-SAVE15) are defined
in section 7.4.16 "Data Save (SAVE)" and listed in Table 7-1
"Control and Status Registers Overview". These registers occupy
CSR addresses 0x30 to 0x3F, with 16 registers in total.

This patch complete the definitions of KS9 to KS15 to match the
architecture specification.

Signed-off-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
---
 arch/loongarch/include/asm/loongarch.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index a0994d226eff..09dfd7eb406e 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -451,6 +451,13 @@
 #define LOONGARCH_CSR_KS6		0x36
 #define LOONGARCH_CSR_KS7		0x37
 #define LOONGARCH_CSR_KS8		0x38
+#define LOONGARCH_CSR_KS9		0x39
+#define LOONGARCH_CSR_KS10		0x3a
+#define LOONGARCH_CSR_KS11		0x3b
+#define LOONGARCH_CSR_KS12		0x3c
+#define LOONGARCH_CSR_KS13		0x3d
+#define LOONGARCH_CSR_KS14		0x3e
+#define LOONGARCH_CSR_KS15		0x3f
 
 /* Exception allocated KS0, KS1 and KS2 statically */
 #define EXCEPTION_KS0			LOONGARCH_CSR_KS0
-- 
2.50.1

