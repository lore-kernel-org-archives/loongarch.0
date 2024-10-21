Received: from mail-m10152.netease.com (mail-m10152.netease.com [154.81.10.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DA71D1F7A
	for <loongarch@lists.linux.dev>; Mon, 21 Oct 2024 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729512518; cv=none; b=XnhWSXJ8Ax4awinEtDk02o7c9qt7UC2+QNJd3ZIxXObrmRxM3da6xaSzQHNrL8SpYoIxOKC8p1lHFumZhXAdRdNWN6aPdtPga5qyWpYOVRCjlpQhst8LMq7rnPMjh1SJiARiPV4ugTGux//CQNjLVtc5EO3ltTjvGUpHmqf5/jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729512518; c=relaxed/simple;
	bh=eBy+1pHDUakEaBzmlWB3O7XV/d39UOFRn8W2Wd6N7FE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u83ExyxAGjuPWyoEYQ5kQI+RtMvUvFQgghWu3z+IQ/pDJFjetEIl8UkHflXkj/K20bcrU87ZG8GbhpkEmypf1UUh1ULLMEP4ST26HEpet5vSvvPM1iSdo2Jan9qZRzeXYzUnUwqVup8pWbEpXhJANuIuBJISdzhPKAgadF22Ss0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=RxuhRLGw; arc=none smtp.client-ip=154.81.10.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="RxuhRLGw"
DKIM-Signature: a=rsa-sha256;
	b=RxuhRLGw5zQS/R7x9bdSmOFOJtmhe5VgLplB2YQF/7vkqpE4L44he5hHF8DuZe4gz1kOg4I3VgRabAmAcUeuHHvpirQercDSt8I9GckXr9Ox296N9TEKwP/WP7yUztq4gIN93kyuFFLRELwzkVFN3061cY8+c2dqQ8SpjIe0s1E=; s=default; c=relaxed/relaxed; d=cqsoftware.com.cn; v=1;
	bh=5s5k9vwNDhRDtUfWiCYBAoLO/or+qI+c7fwlQH7sXOU=;
	h=date:mime-version:subject:message-id:from;
Received: from localhost.localdomain (unknown [123.149.3.175])
	by smtp.qiye.163.com (Hmail) with ESMTPA id A4C0F46081B;
	Mon, 21 Oct 2024 18:51:48 +0800 (CST)
From: Yanteng Si <siyanteng@cqsoftware.com.cn>
To: chenhuacai@kernel.org
Cc: kernel@xen0n.name,
	jiaxun.yang@flygoat.com,
	maobibo@loongson.cn,
	mengdewei@cqsoftware.com.cn,
	loongarch@lists.linux.dev,
	Yanteng Si <siyanteng@cqsoftware.com.cn>
Subject: [PATCH] LoongArch: Using the Exception return address instead of the ERA
Date: Mon, 21 Oct 2024 18:51:39 +0800
Message-ID: <20241021105139.50087-1-siyanteng@cqsoftware.com.cn>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTx9LVklMGktOGR5OHx9KGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUhVSk9CVUhVSkxOWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg++
X-HM-Tid: 0a92aeb45d7403aekunma4c0f46081b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nwg6Ayo4LDIjMS5JNR83NR5K
	Ck4KFBxVSlVKTElCTktMQktCTUxPVTMWGhIXVQgSAhoVDx4VHDsYCggUHQ8MGgkeVRgUFlUYFUVZ
	V1kSC1lBWUpJSFVKT0JVSFVKTE5ZV1kIAVlBSkNISzcG

The information contained in the comment for LOONGARCH_CSR_ERA is even
less informative than the macro itself, which can cause confusion for
junior developers. Let's use the full English term.

Signed-off-by: Yanteng Si <siyanteng@cqsoftware.com.cn>
---
 arch/loongarch/include/asm/loongarch.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 26542413a5b0..64ad277e096e 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -250,7 +250,7 @@
 #define  CSR_ESTAT_IS_WIDTH		15
 #define  CSR_ESTAT_IS			(_ULCAST_(0x7fff) << CSR_ESTAT_IS_SHIFT)
 
-#define LOONGARCH_CSR_ERA		0x6	/* ERA */
+#define LOONGARCH_CSR_ERA		0x6	/* Exception return address */
 
 #define LOONGARCH_CSR_BADV		0x7	/* Bad virtual address */
 
-- 
2.47.0

